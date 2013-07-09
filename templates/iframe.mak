<%include file="header.inc"/>

<form action=/iframe method=GET>
    <input type="text" name="url" value="${url.decode('utf-8')}">
    <input type="submit" value="access">
</form>

${contents.decode('utf-8')}

<%include file="footer.inc"/>
