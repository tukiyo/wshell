<script>
var tab_num = 0;

function execute(command, quoted_command) {
    $.ajax({
        url: "execute?command="+quoted_command
    }).then(
        function(data, status, xhr) {
            make_tab(data, "run", command);
        }
    );
}

function qiita(word) {
    window.open("http://qiita.com/search?q="+word);
}

function input_qiita_tag(tag) {
    var input_qiita=$('input[accesskey=q]');
    input_qiita.val('tag:'+tag+' ');
    input_qiita.focus();
}

function alc(word) {
    $.ajax({
        url: "alc?word="+word
    }).then(
        function(data, status, xhr) {
            make_tab(data, "alc", word);
        }
    );
}

function phpmanual(word) {
    $.ajax({
        url: "phpmanual?word="+word
    }).then(
        function(data, status, xhr) {
            make_tab(data, "phpmanual", word);
        }
    );
}

function docs_python_jp(word) {
    $.ajax({
        url: "docs_python_jp?word="+word
    }).then(
        function(data, status, xhr) {
            make_tab(data, "docs_python_jp", word);
        }
    );
}


function remove_tab(tab_num) {
    $("#tab"+tab_num).remove();
}
function show_first_tab() {
    $("a[data-toggle=tab]:first").tab("show");
}

function make_tab(data,a_title,tab_title){
    tab_num++;
    var tab_name = '<li>';
    tab_name+= '<i onclick="remove_tab('+tab_num+'); $(this).parent().remove(); show_first_tab();" class="icon-trash"></i>';
    tab_name+= '<a href="#tab'+tab_num+'" data-toggle="tab" title="'+a_title+'">'+tab_title+'</a>';
    tab_name+= '</li>';
    $("#nav-tabs").prepend(tab_name)
        $("#tab-content").prepend('<div class="tab-pane active" id="tab'+tab_num+'">'+data+'</div>');
    show_first_tab();
    SyntaxHighlighter.highlight();
}

$(document).ready(function(){
    $("input[accesskey=a]").focus();
    $("input.command").keydown(function(e){
        //press enter
        if(e.keyCode == 13) {
            $(this).next().click();
        }
    });
});
</script>
