#!/usr/bin/perl

print "Content-type: text/html\n\n<hr><form name=bottom>";

($a)=($ENV{DOCUMENT_NAME}=~/s(\d+)\.shtml/);

$prev=$a-1;
$next=$a+1;

if($prev>0) {
print <<END1;
<a href="s${prev}.shtml"
onMouseOver="document.bottom.prev.src='prev-green.gif'"
onMouseOut="document.bottom.prev.src='prev.gif'">
<img src="prev.gif" width=31 height=42 border=0 name=prev align=left></a>
END1
}
if($next<=20) {
print <<END2;
<a href="s${next}.shtml"
onMouseOver="document.bottom.next.src='next-red.gif'"
onMouseOut="document.bottom.next.src='next.gif'">
<img src="next.gif" width=31 height=42 border=0 name=next align=right></a>
END2
}

print <<ENDIT;

<h3 align=center>Slide $a</h3>
<p align=center>

<a href="http://www.cs.jhu.edu/~dshaw/">David Shaw</a> - <a
href="mailto:dshaw@cs.jhu.edu"><i>dshaw@cs.jhu.edu</i></a>

</form>
ENDIT
