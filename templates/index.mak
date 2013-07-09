<%!import urllib%>
<%include file="header.inc"/>

<ul> <li><a href='execute?command=' target="execute">execute page</a></li> </ul>
<ul>${makeli("iframe",command="http://www.makotemplates.org/")}</ul>

<h3>examples</h3>
<ul>
<%
commands=[
    "cat /proc/cpuinfo",
    "ps -ef",
    "netstat -anp | grep :",
    "ifconfig -a | grep inet",
    "hostname; free -m; df -h; lastlog",
    "dpkg -l",
]
%>
% for command in commands:
    ${makeli("execute", command)}
% endfor
</ul>

<%def name="makeli(path, command)">
    <li><a href='${path}?command=${urllib.quote(command)}' target="${path}">${command}</a></li>
</%def>

<%include file="footer.inc"/>
