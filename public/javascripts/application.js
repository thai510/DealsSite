// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults


$(function () {

   $('.secondServicePage').hide();
   $('.thirdServicePage').hide();
   $('#prevServicePage').hide();
   $('#nextServicePage').show();
  $('#nextServicePage').live("click", function() {

        if ($('.firstServicePage').is(':visible')) {
           $('.firstServicePage').hide();
           $('.secondServicePage').fadeIn();
           $('#prevServicePage').show();
         }
        else if ($('.secondServicePage').is(':visible')) {
           $('.secondServicePage').hide();
           $('#nextServicePage').hide();
           $('.thirdServicePage').fadeIn();
        }

   });

  $('#prevServicePage').live("click", function() {

        if ($('.secondServicePage').is(':visible')) {
           $('.secondServicePage').hide();
           $('#prevServicePage').hide();
           $('.firstServicePage').fadeIn();
           $('#nextServicePage').show();
         }
        else if ($('.thirdServicePage').is(':visible')) {
           $('.thirdServicePage').hide();
           $('.secondServicePage').fadeIn();
           $('#nextServicePage').show();
        }

   });
  

});  
