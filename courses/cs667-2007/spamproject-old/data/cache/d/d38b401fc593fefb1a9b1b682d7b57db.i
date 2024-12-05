a:55:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1;}i:3;a:3:{i:0;s:12:"section_edit";i:1;a:4:{i:0;i:-1;i:1;i:0;i:2;i:1;i:3;s:0:"";}i:2;i:1;}i:4;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"Graphs";i:1;i:2;i:2;i:1;}i:2;i:1;}i:5;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:1;}i:6;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:19;}i:7;a:3:{i:0;s:13:"internalmedia";i:1;a:7:{i:0;s:15:"path.length.png";i:1;s:0:"";i:2;N;i:3;s:3:"450";i:4;N;i:5;s:5:"cache";i:6;s:7:"details";}i:2;i:20;}i:8;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:44;}i:9;a:3:{i:0;s:13:"internalmedia";i:1;a:7:{i:0;s:16:"path.length2.png";i:1;s:0:"";i:2;N;i:3;s:3:"450";i:4;N;i:5;s:5:"cache";i:6;s:7:"details";}i:2;i:45;}i:10;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:70;}i:11;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:72;}i:12;a:3:{i:0;s:12:"section_edit";i:1;a:4:{i:0;i:1;i:1;i:71;i:2;i:2;i:3;s:6:"Graphs";}i:2;i:72;}i:13;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:5:"Howto";i:1;i:2;i:2;i:72;}i:2;i:72;}i:14;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:72;}i:15;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:89;}i:16;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:89;}i:17;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:89;}i:18;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:29:" generate the smtp_path file:";}i:2;i:93;}i:19;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:122;}i:20;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:122;}i:21;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:122;}i:22;a:3:{i:0;s:4:"code";i:1;a:2:{i:0;s:89:"
time ./smtp_path.py /storage/projects/spamproject/snapshot.5/messages.log > smtp_path.5
";i:1;N;}i:2;i:128;}i:23;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:225;}i:24;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:225;}i:25;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:225;}i:26;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:57:" extract the IP addresses from marked and unmarked inbox:";}i:2;i:229;}i:27;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:286;}i:28;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:286;}i:29;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:286;}i:30;a:3:{i:0;s:4:"code";i:1;a:2:{i:0;s:125:"
./extract_ip.py yair_spam_unmarked smtp_path.5 > out.unmarked.5
./extract_ip.py yair_spam_marked smtp_path.5 > out.marked.5
";i:1;N;}i:2;i:292;}i:31;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:425;}i:32;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:425;}i:33;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:425;}i:34;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:73:" reduce local.log to the interval covered by marked and unmarked inboxes:";}i:2;i:429;}i:35;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:502;}i:36;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:502;}i:37;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:502;}i:38;a:3:{i:0;s:4:"code";i:1;a:2:{i:0;s:83:"
./split_local.py local.log yair_spam_marked yair_spam_unmarked > local.log.yair.5
";i:1;N;}i:2;i:508;}i:39;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:599;}i:40;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:599;}i:41;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:599;}i:42;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:46:" extract the IP addresses of nonspam messages:";}i:2;i:603;}i:43;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:649;}i:44;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:649;}i:45;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:649;}i:46;a:3:{i:0;s:4:"code";i:1;a:2:{i:0;s:88:"
./extract_yair_nonspam.py yair_spam_all.5 local.log.yair.5 smtp_path.5 > out.nonspam.5
";i:1;N;}i:2;i:655;}i:47;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:753;}i:48;a:3:{i:0;s:12:"section_edit";i:1;a:4:{i:0;i:72;i:1;i:752;i:2;i:2;i:3;s:5:"Howto";}i:2;i:753;}i:49;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:4:"Data";i:1;i:2;i:2;i:753;}i:2;i:753;}i:50;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:753;}i:51;a:3:{i:0;s:4:"code";i:1;a:2:{i:0;s:1223:"
[ralucam@sky1 trunk]$ ./smtp_histogram.py out.marked.5 smtp_path.5 
0       0        0.00
1       5087    45.41
2       4463    39.84
3       1308    11.68
4       224      2.00
5       95       0.85
6       26       0.23
[ralucam@sky1 trunk]$ ./smtp_histogram.py out.unmarked.5 smtp_path.5 
0       0        0.00
1       135     11.55
2       718     61.42
3       219     18.73
4       55       4.70
5       30       2.57
6       9        0.77
7       1        0.09
8       0        0.00
9       0        0.00
10      0        0.00
11      2        0.17
[ralucam@sky1 trunk]$ ./smtp_histogram.py out.nonspam.5 smtp_path.5 
0       0        0.00
1       48       5.81
2       210     25.42
3       240     29.06
4       53       6.42
5       154     18.64
6       50       6.05
7       21       2.54
8       5        0.61
9       7        0.85
10      26       3.15
11      12       1.45
[ralucam@sky1 trunk]$ ./smtp_histogram.py out.allspam.5 smtp_path.5 
0       0        0.00
1       5222    42.21
2       5181    41.88
3       1527    12.34
4       279      2.26
5       125      1.01
6       35       0.28
7       1        0.01
8       0        0.00
9       0        0.00
10      0        0.00
11      2        0.02
";i:1;N;}i:2;i:775;}i:52;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2006;}i:53;a:3:{i:0;s:12:"section_edit";i:1;a:4:{i:0;i:753;i:1;i:0;i:2;i:2;i:3;s:4:"Data";}i:2;i:2006;}i:54;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:2006;}}