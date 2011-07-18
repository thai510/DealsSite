// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(".icheckbox :checkbox").click( function () {
   var id = 
   var showOrHide = false;
   if ($(this).is(':checked')) {
     showOrHide = true;}
   else {
     showOrHide = false;}
   $(".scheckbox").toggle(showOrHide);
});

