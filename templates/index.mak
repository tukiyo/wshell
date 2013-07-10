<%!import urllib%>

<%include file="header.inc"/>
<%include file="header_hilighter.inc"/>
<%include file="index.js"/>

<style>
input[type="text"] {
    height:25px;
}
span {
    cursor:pointer;
}
</style>

<section class="row">
<div class="well span3">
<ul class="nav nav-list">

    <li class="nav-header">qiita(q)
        <span onclick="input_qiita_tag('python');">python</span>
        <span onclick="input_qiita_tag('php');">php</span>
        <span onclick="input_qiita_tag('linux');">linux</span>
        <span onclick="input_qiita_tag('shellscript');">shellscript</span>
    </li>
    <li>
        <div class="input-append">
        <input type="text" class="span2 command" placeholder="(q)iita" accesskey="q"/>
        <button class="btn" type="button" onclick='var word=$(this).prev().val(); qiita(word, word);'><i class="icon-search"></i></button>
        </div>
    </li>

    <li class="nav-header">alc(a)</li>
    <li>
        <div class="input-append">
        <input type="text" class="span2 command" placeholder="(a)lc" accesskey="a"/>
        <button class="btn" type="button" onclick='var word=$(this).prev().val(); alc(word, word);'><i class="icon-search"></i></button>
        </div>
    </li>

    <li class="nav-header">docs.python.jp(y)</li>
    <li>
        <div class="input-append">
        <input type="text" class="span2 command" placeholder="p(y)thon" accesskey="y"/>
        <button class="btn" type="button" onclick='var word=$(this).prev().val(); docs_python_jp(word, word);'><i class="icon-search"></i></button>
        </div>
    </li>

    <li class="nav-header">phpmanual(p)</li>
    <li>
        <div class="input-append">
        <input type="text" class="span2 command" placeholder="(p)hpmanual" accesskey="p"/>
        <button class="btn" type="button" onclick='var word=$(this).prev().val(); phpmanual(word, word);'><i class="icon-search"></i></button>
        </div>
    </li>

    <li class="nav-header">execute(c)</li>
    <li>
        <div class="input-append">
        <input type="text" class="span2 command" placeholder="(c)ommmand" accesskey="c"/>
        <button class="btn" type="button" onclick='var word=$(this).prev().val(); execute(word, word);'><i class="icon-fire"></i></button>
        </div>
    </li>
    
    <li class="nav-header">apt-cache search</li>
    <li>
        <div class="input-append">
        <input type="text" class="span2 command" placeholder="apt-cache search"/>
        <button class="btn" type="button" onclick='var word="apt-cache search "+$(this).prev().val(); execute(word, word);'><i class="icon-search"></i></button>
        </div>
    </li>

    <li class="nav-header">pip search</li>
    <li>
        <div class="input-append">
        <input type="text" class="span2 command" placeholder="pip search"/>
        <button class="btn" type="button" onclick='var word="pip search "+$(this).prev().val(); execute(word, word);'><i class="icon-search"></i></button>
        </div>
    </li>

    <li class="nav-header">documents</li>
    <li><a target="documents" href='http://www.makotemplates.org'>www.makotemplates.org</a></li>
    <li><a target="documents" href='http://docs.makotemplates.org/en/latest/genindex.html'>docs.makotemplates.org</a></li>
    <li><a target="documents" href='http://docs.pylonsproject.org/projects/pyramid/en/latest/genindex.html'>docs.pylonsproject.org</a></li>
    <li><a target="documents" href='http://twitter.github.io/bootstrap/base-css.html'>bootstrap base-css</a></li>
    <li><a target="documents" href='http://twitter.github.io/bootstrap/components.html'>bootstrap components</a></li>
    <li class="nav-header">execute examples</li>
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
    "git log",
    "git status",
]
%>
% for command in commands:
    ${makeli("execute", command)}
% endfor
<%doc>
    ${makeli("alc", "japanese")}
</%doc>
</ul>
</div><!-- end .well -->

<section class="span11">
<div class="tabbable">
    <ul id="nav-tabs" class="nav nav-tabs">
    </ul>
    <div id="tab-content" class="tab-content">
    </div>
</div>
</section>

</section>

<%def name="makeli(path, command)">
    % if path=="alc":
    <li><a onclick="alc('${command}','${urllib.quote(command)}'); return false;" />${command}</a></li>
    % else:
    <li><a onclick="execute('${command}','${urllib.quote(command)}'); return false;" />${command}</a></li>
    % endif
</%def>

<%include file="footer.inc"/>
