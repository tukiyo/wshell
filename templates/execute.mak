<html>
<head>
    <meta charset='utf-8'>
    <script type="text/javascript" src="static/SyntaxHighlighter/scripts/shCore.js"></script>
    <script type="text/javascript" src="static/SyntaxHighlighter/scripts/shBrushBash.js"></script>
    <link type="text/css" rel="stylesheet" href="static/SyntaxHighlighter/styles/shCore.css" />
    <link type="text/css" rel="stylesheet" href="static/SyntaxHighlighter/styles/shThemeDefault.css"/>
    <script type="text/javascript" src="static/jquery/jquery.js"></script>
    <style>
    * {
        font-size:small;
    }
    </style>
    <script type="text/javascript">
    <!--
    $(function(){
        $("input[name=command]").focus();
        SyntaxHighlighter.all();
    });
    -->
    </script>
</head>
<body>

<form action=/execute method=GET onload=this.focus();>
<input name="command" value="${command_str.decode('utf-8')}">
<input type="submit" value="execute">
</form>
<pre class="brush: shell; ruler: true;">${command_result.decode('utf-8')}</pre>

</body>
</html>
