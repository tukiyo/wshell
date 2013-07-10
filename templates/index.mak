<%!import urllib%>

<%include file="header.inc"/>
<%include file="header_hilighter.inc"/>
<%include file="index.js"/>

<style>
input[type="text"] {
    height:30px;
}
</style>

<section class="span3">
<div class="well">
<ul class="nav nav-list">
    <li class="nav-header">execute</li>
    <li>
        <div class="input-append">
        <input type="text" class="span2" placeholder="(c)ommmand" id="command" accesskey="c"/>
        <button class="btn" type="button" id="btn_run"
            onclick='execute($("#command").val(), $("#command").val());'>run</button>
        </div>
    </li>
    <li class="nav-header">alc</li>
    <li>
        <div class="input-append">
        <input type="text" class="span2" placeholder="(a)lc" id="alc" accesskey="a"/>
        <button class="btn" type="button" id="btn_look"
            onclick='alc($("#alc").val(), $("#alc").val());'>look</button>
        </div>
    </li>
    <li class="nav-header">documents</li>
    <li><a href='http://www.makotemplates.org'>www.makotemplates.org</a></li>
    <li><a href='http://docs.makotemplates.org/en/latest/genindex.html'>docs.makotemplates.org</a></li>
    <li><a href='http://docs.pylonsproject.org/projects/pyramid/en/latest/genindex.html'>docs.pylonsproject.org</a></li>
    <li><a href='http://twitter.github.io/bootstrap/base-css.html'>bootstrap base-css</a></li>
    <li><a href='http://twitter.github.io/bootstrap/components.html'>bootstrap components</a></li>
    <li class="nav-header">examples</li>
<%
commands=[
    "cat /proc/cpuinfo",
    "netstat -anp | grep :",
    "ifconfig -a | grep inet",
    "hostname; free -m; df -h; lastlog",
    "dpkg -l",
    "lspci",
    "lsusb",
    "ps -ef",
    "pstree",
    "cat /etc/fstab",
    "cat /etc/passwd",
    "cat /etc/group",
    "man -k sh",
    "stat -f .",
    "printenv",
]
%>
% for command in commands:
    ${makeli("execute", command)}
% endfor
<%doc>
    ${makeli("alc", "japanese")}
</%doc>
</ul>
</div>
</section>

<%def name="makeli(path, command)">
    % if path=="alc":
    <li><a onclick="alc('${command}','${urllib.quote(command)}'); return false;" />${command}</a></li>
    % else:
    <li><a onclick="execute('${command}','${urllib.quote(command)}'); return false;" />${command}</a></li>
    % endif
</%def>

<section class="span9">
<div class="tabbable">
    <ul id="nav-tabs" class="nav nav-tabs">
    </ul>
    <div id="tab-content" class="tab-content">
    </div>
</div>
</section>

<%include file="footer.inc"/>
