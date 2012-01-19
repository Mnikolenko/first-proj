$("#all_comments").html("<%= escape_javascript(render(:partial => 'comment')) %>")
$("form textarea#text").val("")
