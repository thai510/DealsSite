// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults


$(function () {

   $('.secondServicePage').hide();
   $('.thirdServicePage').hide();
   $('#prevServicePage').hide();
   $('#nextServicePage').show();
   $('#new_service').validate( {
     errorPlacement: function(error,element) {
       error.appendTo( element.parent("td").under("td") );}
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

$('#user_submit').live("click", function() { 
   $('#new_user').validate();
   validateSignUp();
   $('#new_user').validate(); 
});

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

function validateSignUp(){
 $("#user_name").rules("add",{required:true});
 $("#user_email").rules("add",{required:true, email:true,
   /* checks uniqueness of email, will have to work on this */
    /* remote:"/users/check_email"*/
   });
 $("#user_password").rules("add",{required:true, minlength: 6, maxlength:20});
 $("#user_password_confirmation").rules("add",{required:true,
    equalTo:"#user_password"});
 $("#user_zipcode").rules("add", {required:true,digits:true, minlength: 5, maxlength: 5});
 $("#user_industry_ids_").rules("add", {required:true});


  //custom messages for sign up validation
}
