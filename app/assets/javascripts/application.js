// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require icheck
//= require select2
//= require_tree .

$(document).ready(function()
{
	$( "#dropdown" ).select2({
		theme: "bootstrap"
	});

	$('input').iCheck({
		checkboxClass: 'icheckbox_square-purple',
		radioClass: 'iradio_square-purple',
    increaseArea: '70%' // optional
});

	$('input').on('ifChanged', function(event){
		var element = this;
		window.location.href = "/todos/" + element.id + "+" + (element.checked);
	});
	var flag=true;
	$("#parentNewTodo").hide();
	$("#showTC").click(function()
	{
		if(flag==true)
		{
			$("#parentNewTodo").show();
			flag=!flag;
		}
		else
		{
			$("#parentNewTodo").hide();
			flag=!flag;
		}
	});
	$("#cancel").click(function(){$("#parentNewTodo").hide(); flag=!flag;});

	$("#SBMButton").click(function(){
		var element = this; 
		while (element = element.parentNode) {
			if (typeof element.submit == 'function') {
				element.submit(); break; 
			}
		}
	});
	//	$("#ok").click(function(){$("#parentNewTodo").hide();});
});
