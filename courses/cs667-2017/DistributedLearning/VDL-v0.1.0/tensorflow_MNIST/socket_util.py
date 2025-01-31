'''
Socket utility class for MNIST Tensorflow distributed learning via peer-to-peer multicast

Author: Yuan Jing Vincent Yan (vyan1@jhu.edu)
'''
import sys
import socket
import struct
import params
import time
import threading


class SockListenThread(threading.Thread):
    """
    Thread class that listens for socket message receiving. It terminates when stop() is called.
    """

    def __init__(self, sock, self_IP, inc_msg_q, num_peers, ret_val):
        super(SockListenThread, self).__init__()
        self.sock = sock
        self.self_IP = self_IP
        self.inc_msg_q = inc_msg_q
        self.num_peers = num_peers
        self.ret_val = ret_val
        self.rcv_msg_num = 0
        self.params.VERBOSE_LVL = params.VERBOSE_LVL
        self._stop = threading.Event()
        self.daemon = True # Make the daemon = True, so that I can kill this program with ctrl-c

    def run(self):
        while not self.stopped():
            if self.params.VERBOSE_LVL >= 3:
                print "Entering recv cycle..."
            self.rcv_msg_num = socket_recv_chucked_data(self.sock, self.self_IP, self.inc_msg_q, self.num_peers, self.rcv_msg_num, self.params.VERBOSE_LVL)
        # thread terminating
        time.sleep(1)
        if self.params.VERBOSE_LVL >= 3:
            print "Entering final recv cycle..."
        self.rcv_msg_num = socket_recv_chucked_data(self.sock, self.self_IP, self.inc_msg_q, self.num_peers, self.rcv_msg_num, self.params.VERBOSE_LVL)
        self.ret_val.put(self.rcv_msg_num)
    
    def stop(self):
        self._stop.set()

    def stopped(self):
        return self._stop.isSet()

        
def set_up_start_mcast():
    '''
    Set up the network for start_mcast program
    '''
    
    # UDP setup
    sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    sock.bind( ('', params.START_MCAST_PORT_NUM) )
    
    mcast_destination = (params.MCAST_ADDR, params.PEER_PORT_NUM)
    
    return (sock, mcast_destination)

def set_up_UDP_mcast_peer():
    '''
    Set up the network for UDP multicast peer
    @return Tuple of (the socket, the IP address of self, destination multicast address)
    '''

    # UDP setup
    self_IP = socket.gethostbyname(socket.gethostname())
    sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    sock.bind( ('', params.PEER_PORT_NUM) )

    # mulitcast setup
    mcast_destination = (params.MCAST_ADDR, params.PEER_PORT_NUM)
    mcast_group = socket.inet_aton(params.MCAST_ADDR)
    mreq = struct.pack('4sL', mcast_group, socket.INADDR_ANY)
    sock.setsockopt(socket.IPPROTO_IP, socket.IP_ADD_MEMBERSHIP, mreq)
    
    return (sock, self_IP, mcast_destination)


def close_UDP_mcast_peer(sock):
    '''
    Close the UDP multicast peer
    @params sock The socket to close
    '''
    sock.close()

def await_signal(sock, content, timeout_val):
    '''
    Blocks and waits for a specific signal packet, which might contain payload data
    @param sock The socket to use
    @param content Content of the signal
    @param timeout_val Timeout value for waiting for the signal, or None if no timeout
    @param The received signal packet, or None if timed out
    '''
    print('Waiting for signal ' + content + '...')
    try:
        sock.settimeout(timeout_val)
        signal = sock.recvfrom(len(content))[0]
    except socket.timeout:
        if params.VERBOSE_LVL >= 2:
            print('await signal ' + content + ' timed out')
        return None
    
    sock.settimeout(None)
    assert(signal[:len(content)] == content)
    print('Signal received.')
    return signal
    
    
def await_start_mcast(sock):
    '''
    Blocks and waits for start_mcast signal
    @param sock The socket to use
    '''
    await_signal(sock, params.START_MCAST_SIGNAL, None)
    

def socket_send_data_chucks(sock, data, mcast_destination, msg_sent):
    '''
    Send a data string, fragmented as chucks, to a multicast address
    @params sock The socket to use
    @params data The data string
    @params mcast_destination Destination multicast address
    @param msg_sent Total number of messages sent before this call
    @return Total number of messages sent after this call
    '''
    
    # Send tag "Arnold" followed by data length
    sock.sendto(params.PACKET_SIZE_TAG + str(len(data)), mcast_destination)
    msg_sent += 1
    
    for i in xrange(0, sys.getsizeof(data), params.MAX_PACKET_SIZE):
        time.sleep(params.CHUNK_SEND_INTERVAL)
        data_chuck = data[i : i + params.MAX_PACKET_SIZE]
        sock.sendto(data_chuck, mcast_destination)
        msg_sent += 1

    return msg_sent

def socket_recv_chucked_data(sock, self_IP, queue, num_peers, rcv_msg_num, params.VERBOSE_LVL = 1):
    '''
    Let the socket receive chucked data with a given total length. Retry receiving if packets
    are incomplete, but return null if timeout. Ignore packets sent by self
    @params sock The socket to use
    @param self_IP The IP address of self
    @param queue The queue to store the original data
    @param num_peers Number of mulitcast peers
    @param rcv_msg_num Total number of messages received from other peers before this call
    @param params.VERBOSE_LVL The level of verboseness (extent of debug messages)
    @return Total number of messages received from other peers after this call
    '''
    
    addr_dict = {}  # IP_addr   -> [data_remaining, recovering_data]
                    # 10.1.1.13 -> [4, "Hello W"]
    
    sock.settimeout(params.SOCK_TIMEOUT_VAL)
    queue_cnt = 0
    try:
        while queue_cnt < num_peers - 1:  # until received message from all other peers
            msg, (addr, port) = sock.recvfrom(params.MAX_PACKET_SIZE)
            rcv_msg_num += 1
            if addr == self_IP:
                rcv_msg_num -= 1
                continue
            elif addr not in addr_dict  or  addr_dict[addr][0] == 0:
                # if no "Arnold":
                if msg[0 : params.LEN_PACKET_SIZE_TAG] != params.PACKET_SIZE_TAG:
                    if params.VERBOSE_LVL >= 2:
                        print('Warning: received fragment without head fragment')
                    continue
                else:
                    data_len = int(msg[params.LEN_PACKET_SIZE_TAG :])
                    addr_dict[addr] = [data_len, '']
                    if params.VERBOSE_LVL >= 2:
                        print('received head fragment')
            else:
                # if "Arnold":
                if msg[0 : params.LEN_PACKET_SIZE_TAG] == params.PACKET_SIZE_TAG:
                    data_len = int(msg[params.LEN_PACKET_SIZE_TAG :])
                    addr_dict[addr] = [data_len, '']
                    if params.VERBOSE_LVL >= 2:
                        print('Warning: Received head fragment without completing previous packet')
                else:
                    addr_dict[addr][0] -= len(msg)
                    addr_dict[addr][1] += msg
                    if params.VERBOSE_LVL >= 2:
                        sys.stdout.write('.')
                    if addr_dict[addr][0] == 0:
                        queue.put(addr_dict[addr][1])
                        queue_cnt += 1
                        addr_dict[addr] = [0, '']
                        if params.VERBOSE_LVL >= 2:
                            print('Full packet received; adding to queue')
    except socket.timeout:
        if params.VERBOSE_LVL >= 2:
            print('socket_recv_chucked_data timed out')
        return rcv_msg_num
    
    return rcv_msg_num
