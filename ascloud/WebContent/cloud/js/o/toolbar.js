$(function() {
    //all hover and click logic for buttons
$(".astrosage-button:not(.ui-toolbar-disabled)")
		.hover(
			function() {
$(this).addClass("ui-toolbar-hover");
			},
			function() {
			$(this).removeClass("ui-toolbar-hover");
			}
		)
		.mousedown(function() {
			$(this).parents('.astrosage-buttonset:first').find(".astrosage-button .ui-toolbar-active").removeClass("ui-toolbar-active");
			if ($(this).is('.ui-toolbar-active .astrosage-button-toggleable, .astrosage-buttonset-multi .ui-toolbar-active')) { $(this).removeClass("ui-toolbar-active"); }
			else { $(this).addClass("ui-toolbar-active"); }
		})
		.mouseup(function() {
		if (!$(this).is('.astrosage-button-toggleable, .astrosage-buttonset-single .astrosage-button, .astrosage-buttonset-multi .astrosage-button')) {
		    $(this).removeClass("ui-toolbar-active");
		    }
		});
});