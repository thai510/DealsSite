// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults


$(function () {

   $('.secondServicePage').hide();
   $('.thirdServicePage').hide();
   $('#prevServicePage').hide();
   $('#nextServicePage').show();
   $('#new_service').validate( {
     errorPlacement: function(error,element) {
       offset = element.offset();
       error.insertBefore(element);
       error.css('position', 'absolute');
       error.css('left', offset.left);
        error.css('top', offset.top + element.outerHeight());
     }
   });//must call at least once before using valid()
  $('#nextServicePage').live("click", function() {

        if ($('.firstServicePage').is(':visible')) {
           validateServicePage1();
           //check first page validations, if valid move to next page
           if ($('#new_service').valid()) {
             $('.firstServicePage').hide();
             $('.secondServicePage').fadeIn();
             $('#prevServicePage').show();
           }
         }
            
        else if ($('.secondServicePage').is(':visible')) {
           validateServicePage2(); 
           if ($('#new_service').valid()) {
             $('.secondServicePage').hide();
             $('#nextServicePage').hide();
             $('.thirdServicePage').fadeIn();
             validateServicePage3();
             }
           }
   });

  $('#prevServicePage').live("click", function() {

        if ($('.secondServicePage').is(':visible')) {
           removeValidatePage2();
           //moving to previous page so remove all validations for current page
           $('.secondServicePage').hide();
           $('#prevServicePage').hide();
           $('.firstServicePage').fadeIn();
           $('#nextServicePage').show();
         }
        else if ($('.thirdServicePage').is(':visible')) {
           removeValidatePage3();
           $('.thirdServicePage').hide();
           $('.secondServicePage').fadeIn();
           $('#nextServicePage').show();
        }

   });

});  

function validateServicePage1(){
   $("#service_deal_site_name").rules("add", {required: true});
   $("#service_contact_name").rules("add", {required: true});
   $("#service_deal_site_name").rules("add",{required:true});
   $("#service_contact_email").rules("add",{required: true});
   $("#service_contact_phone").rules("add",{required:true});
   $("#service_product_name").rules("add", {required: true});
   $("#service_locations_served").rules("add", {required: true}); 
   $("#service_industries_served").rules("add", {required: true});
}

function validateServicePage2(){
   $("#service_minimum_required_discount").rules("add",{required:true});
   $("#service_revenue_share").rules("add",{required:true});
   $("#service_minimum_number_of_vouchers").rules("add",{required:true});
   $("#service_payment_terms").rules("add",{required:true});
}

function validateServicePage3(){
   $("#service_time_length_standard_promo").rules("add",{required:true});
   $("#service_quantity_credit_card_fee").rules("add",{required:true});
   $("#service_payer_credit_card_fee").rules("add",{required:true});
   $("#service_restrictions").rules("add",{required:true});
}


function removeValidatePage2(){
   $("#service_minimum_required_discount").rules("remove","required");
   $("#service_revenue_share").rules("remove","required");
   $("#service_minimum_number_of_vouchers").rules("remove","required");
   $("#service_payment_terms").rules("remove","required");
}

function removeValidatePage3(){
   $("#service_time_length_standard_promo").rules("remove","required");
   $("#service_quantity_credit_card_fee").rules("remove","required");
   $("#service_payer_credit_card_fee").rules("remove","required");
   $("#service_restrictions").rules("remove","required");
}



/* validate sign up page */


$(function () {

  if($('.industryBlindDown').is(':visible')) {
    $('.industryCheckboxes').hide();
    $('.industryBlindUp').hide();
    $('.industryBlindDown').live("click", function() {
      $('.industryBlindDown').hide();
      $('.industryCheckboxes').fadeIn(); 
      $('.industryBlindUp').fadeIn();
    });
  }

    $('.industryBlindUp').live("click", function() {
      $('.industryBlindUp').hide();
      $('.industryCheckboxes').hide();
      $('.industryBlindDown').fadeIn();
    });
});

$(document).ready(function () {
//$('#user_submit').live("click", function() { 
   $('#new_user').validate( {
     errorPlacement: function(error,element) {
       error.appendTo(element.closest("tr").next('tr'));
     },
     rules: {
       "user[name]":{required:true},
       "user[email]":{required:true,email:true,remote:"/users/check_email"},
       "user[password]":{required:true,minlength: 6, maxlength: 20},
       "user[password_confirmation]":{required:true, equalTo:"#user_password"}},

     messages: {
       "user[email]":{remote:"Email already taken", email:"Invalid Email"},
       "user[password_confirmation]":{equalTo:"Must match password"},
       "user[password]":{minlength:"Must be at least 6 characters",
                         maxlength:"Must be at most 20 characters"}
     }
   });
});
//functions for step one of deal builder
//includes validations and tool tip code
$(document).ready(function () {
  $('#business_name').hide();
  $('#company_logo').hide();
  $('#offer_title').hide();
  $('#offer_photo').hide();
  $('#industry').hide();
  $('#offer_value').hide();
  $('#offer_price').hide();
  $('#offer_description').hide();

  $('#db_step_one_business_name').focus( function () {
    $('#offer_title').hide();
    $('#offer_photo').hide();
    $('#industry').hide();
    $('#offer_value').hide();
    $('#offer_price').hide();
    $('#offer_description').hide();
    $('#company_logo').hide();
    $('#business_name').fadeIn();
  });

  $('#db_step_one_company_logo').focus( function () {
    $('#offer_photo').hide();
    $('#industry').hide();
    $('#offer_value').hide();
    $('#offer_price').hide();
    $('#offer_description').hide();
    $('#business_name').hide();
    $('#offer_title').hide();
    $('#company_logo').fadeIn();
  });

  $('#db_step_one_company_logo').live("click", function () {
    $('#offer_photo').hide();
    $('#industry').hide();
    $('#offer_value').hide();
    $('#offer_price').hide();
    $('#offer_description').hide();
    $('#business_name').hide();
    $('#offer_title').hide();
    $('#company_logo').fadeIn();
  });

  $('#db_step_one_offer_title').focus( function ()  {
    $('#offer_photo').hide();
    $('#industry').hide();
    $('#offer_value').hide();
    $('#offer_price').hide();
    $('#offer_description').hide();
    $('#company_logo').hide();
    $('#business_name').hide();
    $('#offer_title').fadeIn();
  });

  $('#db_step_one_offer_photo').focus( function ()  {
    $('#industry').hide();
    $('#offer_value').hide();
    $('#offer_price').hide();
    $('#offer_description').hide();
    $('#company_logo').hide();
    $('#business_name').hide();
    $('#offer_title').hide();
    $('#offer_photo').fadeIn();
  });
  //needed to also add on click because for some reason focus
  // doesn't work click file_fields
  $('#db_step_one_offer_photo').live("click", function ()  {
    $('#industry').hide();
    $('#offer_value').hide();
    $('#offer_price').hide();
    $('#offer_description').hide();
    $('#company_logo').hide();
    $('#business_name').hide();
    $('#offer_title').hide();
    $('#offer_photo').fadeIn();
  });

  $('#db_step_one_industry').focus( function ()  {
    $('#offer_value').hide();
    $('#offer_price').hide();
    $('#offer_description').hide();
    $('#company_logo').hide();
    $('#business_name').hide();
    $('#offer_title').hide();
    $('#offer_photo').hide();
    $('#industry').fadeIn();
  });

  $('#db_step_one_offer_value').focus( function ()  {
    $('#offer_price').hide();
    $('#offer_description').hide();
    $('#company_logo').hide();
    $('#business_name').hide();
    $('#offer_title').hide();
    $('#offer_photo').hide();
    $('#industry').hide();
    $('#offer_value').fadeIn();
  });

  $('#db_step_one_offer_price').focus( function ()  {
    $('#offer_description').hide();
    $('#company_logo').hide();
    $('#business_name').hide();
    $('#offer_title').hide();
    $('#offer_photo').hide();
    $('#industry').hide();
    $('#offer_value').hide();
    $('#offer_price').fadeIn();
  });

  $('#db_step_one_offer_description').focus( function ()  {
    $('#company_logo').hide();
    $('#business_name').hide();
    $('#offer_title').hide();
    $('#offer_photo').hide();
    $('#industry').hide();
    $('#offer_value').hide();
    $('#offer_price').hide();
    $('#offer_description').fadeIn();
  });

  $('#new_db_step_one').validate( {
     errorPlacement: function(error,element) {
       error.appendTo(element.closest("td").next('td'));
     },
    rules: {
      "db_step_one[business_name]":{required:true},
      "db_step_one[company_logo]":{required:true, accept:true},
      "db_step_one[offer_photo]":{accept:true},
      "db_step_one[offer_title]":{required:true},
      "db_step_one[industry]":{required:true},
      "db_step_one[offer_price]":{required:true, min: 0, number:true},
      "db_step_one[offer_value]":{required:true, min: 0, number:true},
      "db_step_one[offer_description]":{required:true}},

    messages: {
      "db_step_one[company_logo]":{accept:"Png, gif, or jpeg only"},
      "db_step_one[offer_photo]":{accept:"Png, gif, or jpeg only"},
      "db_step_one[offer_price]":{number:"Numbers only",min:"Must be at least 0"},
      "db_step_one[offer_value]":{number:"Numbers only",min:"Must be at least 0"}
    }
  });
  $("#db_step_one_offer_photo").change(function () {
    $("#db_step_one_offer_photo").blur().focus();
  });
  $("#db_step_one_company_logo").change(function () {
    $("#db_step_one_company_logo").blur().focus();
  });
});
//deal builder step 2 javascript
//validations and tool tip generation
$(document).ready(function () {
  $('#offer_launch_date').hide();
  $('#locations').hide();

  $('#db_step_two_offer_launch_date').focus(function () {  
    $('#locations').hide();
    $('#offer_launch_date').fadeIn();
  });

  $('#db_step_two_location_ids_').focus(function () {  
    $('#offer_launch_date').hide();
    $('#locations').fadeIn();
  });

  $('#db_step_two_location_ids_').live("click", function () {  
    $('#offer_launch_date').hide();
    $('#locations').fadeIn();
  });

  $('#db_step_two_offer_launch_date').datepicker({showAnim:'slideDown',
                                                  showOn:'button',
                                                  buttonImage: "../images/theme/calendar.gif",
			                          buttonImageOnly: true});
  $('#new_db_step_two').validate( {
     errorPlacement: function(error,element) {
       offset = element.offset();
       if(element.is('input:checkbox')) {
         error.appendTo(element.closest('tr').prev('tr').last('td'));
       }
       else {
         error.appendTo(element.closest('td').next('td'));
       }
     },
     rules : {
       "db_step_two[offer_launch_date]":{required:true},
       "db_step_two[location_ids][]":{required:true,minlength:1}
     }
  });
});
