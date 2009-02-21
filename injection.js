// code to run on the google page

$('#b').val('When you search, I will know.');

var original_form_action = $('#gpSearchForm').attr('action');

$('#gpSearchForm').attr('action', 'javascript:override(); return false;');
$('#b').click(function() { override(); return false; });

function override() {
	$('input[name=q]').blur();
	window.location = 'jstest://'+$("input[name=q]").val();
}

function do_original() {
	$('#gpSearchForm').attr('action', original_form_action);
	$('#gpSearchForm').submit();
}