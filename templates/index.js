<script>
var tab_num = 0;

function execute(command, quoted_command) {
    $.ajax({
        url: "execute?command="+quoted_command,
    }).then(
        function(data, status, xhr) {
            make_tab(data, "run", command);
        }
    );
}
function alc(word) {
    $.ajax({
        url: "alc?word="+word,
    }).then(
        function(data, status, xhr) {
            make_tab(data, "alc", word);
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
    $("#command").focus();
    $("#command").keydown(function(e){
        //press enter
        if(e.keyCode == 13) {
            $("#btn_run").click();
        }
    });
    $("#alc").keydown(function(e){
        //press enter
        if(e.keyCode == 13) {
            $("#btn_look").click();
        }
    });
});
</script>
