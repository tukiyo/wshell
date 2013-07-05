<html>
<head>
    <meta charset='utf-8'>
    <script type="text/javascript" src="static/jquery/jquery.js"></script>
    <style>
    * {
        //font-size:small;
    }
    </style>
    <script type="text/javascript">
    <!--
    $(function(){
    });
    -->
    </script>
</head>
<body>

<ul>
<li> <a href='/execute?command='>execute page</a> </li>
</ul>

<h3>examples</h3>
<ul>
<li> <a href='/execute?command=cat /proc/cpuinfo'>cat /proc/cpuinfo</a> </li>
<li> <a href='/execute?command=ps -ef '>ps -ef</a> </li>
<li> <a href='/execute?command=netstat -anp'>netstat -anp</a> </li>
<li> <a href='/execute?command=ifconfig -a'>ifconfig -a</a> </li>
<li> <a href='/execute?command=ifconfig -a | grep inet'>ifconfig -a | grep inet</a> </li>
<li> <a href='/execute?command=hostname'>hostname</a> </li>
<li> <a href='/execute?command=free -m'>free -m</a> </li>
<li> <a href='/execute?command=cat /etc/issue'>cat /etc/issue</a> </li>
<li> <a href='/execute?command=dpkg -l'>dpkg -l</a> </li>
<li> <a href='/execute?command=rpm -qal'>rpm -qal</a> </li>
</ul>

</body>
</html>
