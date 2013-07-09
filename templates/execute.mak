<%include file="header.inc"/>
<script><%include file="execute.js"/></script>

<form action=/execute method=GET onload=this.focus();>
<input type="text" name="command" value="${command_str.decode('utf-8')}">
<input type="submit" value="execute">
</form>
<pre class="brush: shell; ruler: true;">${command_result.decode('utf-8')}</pre>

<%include file="footer.inc"/>
