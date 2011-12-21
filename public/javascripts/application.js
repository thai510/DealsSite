// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults


/* validate sign up page */

$(document).ready(function () {
//$('#user_submit').live("click", function() { 
   $('#new_user').validate( {
     errorPlacement: function(error,element) {
       error.appendTo(element.closest('div').next('div'));
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
//makes the current blue circle fade in and out
$(document).ready(function() {
 $('.progressBar').bind('fade-cycle', function() {
    $('.currentProgress').fadeOut('slow', function() {
          $('.currentProgress').fadeIn('slow', function() {
            $(this).trigger('fade-cycle');
            });
    });
});
  $('.progressBar').each(function(index, elem) {
    setTimeout(function() {
        $(elem).trigger('fade-cycle');
    }, index * 250);
  });
});


$(document).ready(function () {
});
//functions for step one of deal builder
//includes validations and tool tip code
$(document).ready(function () {
  if($('#new_db_step_one').is(':visible') || $('.edit_db_step_one').is(':visible'))
  {

    $('#db_step_one_offer_title').focus( function ()  {
      $('#offer_photo').hide();
      $('#offer_title').show();
      $('#offer_title_label').css('text-decoration','underline');
      $('#offer_photo_label').css('text-decoration','none');
      $('.rightSideLayout').show();
      $('#additionalRSL').hide();
    });

    $('#db_step_one_offer_title').focusout( function ()  {
      $('#offer_title').hide();
      $('#offer_title_label').css('text-decoration','none');
      $('.rightSideLayout').hide();
      $('#additionalRSL').hide();
    });

    $('#db_step_one_offer_photo').focus( function ()  {
      $('#offer_photo').fadeIn();
      $('#offer_photo_label').css('text-decoration','underline');
      $('.rightSideLayout').show();
      $('#additionalRSL').hide();
    });
    //needed to also add on click because for some reason focus
    // doesn't work click file_fields
    $('#dbOnePhotoInfoButton').live("click", function ()  {
      $('#offer_photo').fadeIn();
      $('#offer_photo_label').css('text-decoration','underline');
      $('.rightSideLayout').show();
      $('#additionalRSL').hide();
    });

    
   /* $('#db_step_one_coupon').live("click", function () {
      checkCoupon();
    });*/

    $('#db_step_one_offer_value').focus( function ()  {
      $('#offer_photo').hide();
      $('#offer_value').show();
      $('#offer_value_label').css('text-decoration','underline');
      $('#offer_photo_label').css('text-decoration','none');
      $('.rightSideLayout').show();
      $('#additionalRSL').hide();
    });
    $('#db_step_one_offer_value').focusout( function ()  {
      $('#offer_value').hide();
      $('#offer_value_label').css('text-decoration','none');
      $('.rightSideLayout').hide();
      $('#additionalRSL').hide();
    });

    $('#db_step_one_offer_price').focus( function ()  {
      $('#offer_photo').hide();
      $('#offer_price').show();
      $('#offer_price_label').css('text-decoration','underline');
      $('#offer_photo_label').css('text-decoration','none');
      $('.rightSideLayout').show();
      $('#additionalRSL').hide();
    });
    $('#db_step_one_offer_price').focusout( function ()  {
      $('#offer_price').hide();
      $('#offer_price_label').css('text-decoration','none');
      $('.rightSideLayout').hide();
      $('#additionalRSL').hide();
    });

    $('#db_step_one_offer_description').focus( function ()  {
      $('#offer_photo').hide();
      $('#additionalRSL').show();
      $('.rightSideLayout').show();
      $('#offer_description').show();
      $('#offer_photo_label').css('text-decoration','none');
      $('#additional_offer_description').show();
      $('#offer_description_label').css('text-decoration','underline');
    });
    $('#db_step_one_offer_description').focusout( function ()  {
      $('#offer_description').hide();
      $('#additional_offer_description').hide();
      $('#offer_description_label').css('text-decoration','none');
      $('.rightSideLayout').hide();
      $('#additionalRSL').hide();
    });

  $.validator.addMethod('greaterThan', function(value) {
    var offerPrice = $('#db_step_one_offer_price').val();
    return (parseFloat(value) > offerPrice);
  },'');

  $('#new_db_step_one').validate( {
     errorPlacement: function(error,element) {
       error.appendTo(element.closest("td").next('td'));
     },
    rules: {
      "db_step_one[offer_photo]":{accept:true},
      "db_step_one[offer_title]":{required:true},
      "db_step_one[offer_price]":{required:true, min: 0, number:true},
      "db_step_one[offer_value]":{required:true, min: 0, number:true,greaterThan:true},
      "db_step_one[offer_description]":{required:true}},

    messages: {
      "db_step_one[offer_photo]":{accept:""},
      "db_step_one[offer_title]":{required:""},
      "db_step_one[offer_price]":{number:"",min:"",required:""},
      "db_step_one[offer_value]":{number:"",min:"",required:"",greaterThan:''},
      "db_step_one[offer_description]":{required:""}
    }
  });

  $('.edit_db_step_one').validate( {
     errorPlacement: function(error,element) {
       error.appendTo(element.closest("td").next('td'));
     },
    rules: {
      "db_step_one[offer_photo]":{accept:true},
      "db_step_one[offer_title]":{required:true},
      "db_step_one[offer_price]":{required:true, min: 0, number:true},
      "db_step_one[offer_value]":{required:true, min: 0, number:true,greaterThan:true},
      "db_step_one[offer_description]":{required:true}},

    messages: {
      "db_step_one[offer_photo]":{accept:"",required:""},
      "db_step_one[offer_title]":{required:""},
      "db_step_one[offer_price]":{number:"",min:"",required:""},
      "db_step_one[offer_value]":{number:"",min:"",required:"",greaterThan:''},
      "db_step_one[offer_description]":{required:""}
    }
  });

  $("#db_step_one_offer_photo").change(function () {
    $("#db_step_one_offer_photo").blur().focus();
  });

  //checkCoupon();

 }
});
//handles coupon checkbox validations and
//functionality
function checkCoupon() {
    if ($('#db_step_one_coupon').prop('checked')) {
       $('#db_step_one_offer_value').rules("remove");
       $('#db_step_one_offer_price').rules("remove");
       $('input#db_step_one_offer_value').hide(); 
       $('input#db_step_one_offer_price').hide(); 
       $('label[for="db_step_one_offer_value"]').hide(); 
       $('label[for="db_step_one_offer_price"]').hide(); 
      }
      else {  
       $('#db_step_one_offer_value').rules("add",{required:true,
                                                  min:0,
                                                  number:true});
       $('#db_step_one_offer_price').rules("add",{required:true,
                                                  min:0,
                                                  number:true,
                                                  lessThan:true});
       $('input#db_step_one_offer_value').show(); 
       $('input#db_step_one_offer_price').show(); 
       $('label[for="db_step_one_offer_value"]').show(); 
       $('label[for="db_step_one_offer_price"]').show(); 
      }
}

function checkFbShare() {
  if ($('#db_step_four_fb_incentive').prop('checked')) {
    $('#db_step_four_fb_incentive_text').rules("add",{required:true});
    $('#db_step_four_fb_incentive_text').show();
    $('textarea#db_step_four_fb_incentive_text').removeAttr("disabled"); 
    $("#post_code").removeAttr("disabled");

  }
  else {
    $('#db_step_four_fb_incentive_text').rules("remove");
    $('textarea#db_step_four_fb_incentive_text').attr("disabled","true"); 
  }
}

//deal builder step 2 javascript
//validations and tool tip generation
$(document).ready(function () {
  if($('#new_db_step_two').is(':visible') || $('.edit_db_step_two').is(':visible'))
  {

      
      $('.rightSideLayout').show();
      $('#locations').show();

		$('#db_step_two_locations_attributes_0_address').focus( function ()  {
      $('#address_label').css('text-decoration','underline');
      $('.rightSideLayout').show();
    });
		$('#db_step_two_locations_attributes_0_address').focusout( function ()  {
      $('#address_label').css('text-decoration','none');
      $('.rightSideLayout').show();
    });

		$('#db_step_two_locations_attributes_0_city').focus( function ()  {
      $('#city_label').css('text-decoration','underline');
      $('.rightSideLayout').show();
    });

		$('#db_step_two_locations_attributes_0_city').focusout( function ()  {
      $('#city_label').css('text-decoration','none');
      $('.rightSideLayout').show();
    });

		$('#db_step_two_locations_attributes_0_state').focus( function ()  {
      $('#state_label').css('text-decoration','underline');
      $('.rightSideLayout').show();
    });
		$('#db_step_two_locations_attributes_0_state').focusout( function ()  {
      $('#state_label').css('text-decoration','none');
      $('.rightSideLayout').show();
    });

		$('#db_step_two_locations_attributes_0_zip').focus( function ()  {
      $('#zip_label').css('text-decoration','underline');
      $('.rightSideLayout').show();
    });
		$('#db_step_two_locations_attributes_0_zip').focusout( function ()  {
      $('#zip_label').css('text-decoration','none');
      $('.rightSideLayout').show();
    });
    //format for calendar
    /*$('#db_step_two_offer_launch_date').datepicker({showAnim:'slideDown',
                                                  showOn:'button',
                                                  buttonImage: "/images/theme/calendar.gif",
			                          buttonImageOnly: true});*/


  $('#new_db_step_two').validate( {
     /*errorPlacement: function(error,element) {
         error.appendTo($(element).closest('tr').last('td'));
     }*/
     rules: {
       'db_step_two[locations_attributes][0][address]':{required:true},
       'db_step_two[locations_attributes][0][city]':{required:true},
       'db_step_two[locations_attributes][0][state]':{required:true},
       'db_step_two[locations_attributes][0][zip]':{required:true, minlength:5,maxlength:5,digits:true}
     },
     messages: {
       'db_step_two[locations_attributes][0][address]':{required:''},
       'db_step_two[locations_attributes][0][city]':{required:''},
       'db_step_two[locations_attributes][0][state]':{required:''},
       'db_step_two[locations_attributes][0][zip]':{required:'', minlength:'',maxlength:'',digits:''}
     }
  });

  $('.edit_db_step_two').validate( {
    rules: {
       'db_step_two[locations_attributes][0][address]':{required:true},
       'db_step_two[locations_attributes][0][city]':{required:true},
       'db_step_two[locations_attributes][0][state]':{required:true},
       'db_step_two[locations_attributes][0][zip]':{required:true, minlength:5,maxlength:5,digits:true}
    },
    messages: {
       'db_step_two[locations_attributes][0][address]':{required:''},
       'db_step_two[locations_attributes][0][city]':{required:''},
       'db_step_two[locations_attributes][0][state]':{required:''},
       'db_step_two[locations_attributes][0][zip]':{required:'', minlength:'',maxlength:'',digits:''}
    }
  });
  }
});

//validations and tool tips for deal builder step 3
$(document).ready(function () {
  if($('#new_db_step_three').is(':visible') || $('.edit_db_step_three').is(':visible'))
  {

  $('#db_step_three_standard_restriction_ids_').live("click",function () {
    $('.rightSideLayout').show();
    $('#standard_restrictions').show();
    $('#standard_restriction_label').css('text-decoration','underline');
  });

$('#dbThreeStandardRestrictionButton').live("click",function () {
    $('.rightSideLayout').show();
    $('#standard_restrictions').show();
    $('#standard_restriction_label').css('text-decoration','underline');
  });

  $('#db_step_three_voucher_length').focus(function () {
    $('#standard_restrictions').hide();
    $('#voucher_length').show();
    $('.rightSideLayout').show();
    $('#voucher_length_label').css('text-decoration','underline');
  });

  $('#db_step_three_voucher_length').focusout(function () {
    $('#voucher_length').hide();
    $('.rightSideLayout').hide();
    $('#voucher_length_label').css('text-decoration','none');
  });

  $('#db_step_three_optional_restriction').focus(function () {
    $('#standard_restrictions').hide();
    $('#optional_restrictions').show();
    $('#optional_restrictions_label').css('text-decoration','underline');
    $('.rightSideLayout').show();
  });

  $('#db_step_three_optional_restriction').focusout(function () {
    $('#optional_restrictions').hide();
    $('#optional_restrictions_label').css('text-decoration','none');
    $('.rightSideLayout').hide();
  });

  $('#new_db_step_three').validate( {
    errorPlacement: function(error,element) {
      if($(element).is(':checkbox')) {
        error.appendTo(element.closest('tr').prev('tr'));
      }
      else {
       error.appendTo(element.closest("td").next('td'));
      }
    },
    rules: {
      "db_step_three[standard_restriction_ids][]":{required:true,minlength:1},
      "db_step_three[voucher_length]":{required:true}
    },
    messages: {
     "db_step_three[standard_restriction_ids][]":{required:"",minlength:""}, 
      "db_step_three[voucher_length]":{required:""}
    } 
  });
  $('.edit_db_step_three').validate( {
    errorPlacement: function(error,element) {
      if($(element).is(':checkbox')) {
        error.appendTo(element.closest('tr').prev('tr'));
      }
      else {
        error.appendTo(element.closest('td').next('td'));
      }
    },
    rules: {
      "db_step_three[standard_restriction_ids][]":{required:true,minlength:1},
      "db_step_three[voucher_length]":{required:true}
    },
    messages: {
     "db_step_three[standard_restriction_ids][]":{required:"",minlength:""}, 
      "db_step_three[voucher_length]":{required:""}
    } 
  });
  }
});
$(document).ready(function () {
  if($('#new_db_publish').is(':visible')) {

    $('#db_publish_max_vouchers_to_sell').focusout(function () {
      $('.rightSideLayout').hide();
      $('#max_vouchers_to_sell').hide();
      $('#max_vouchers_to_sell_label').css('text-decoration','none');
    });

    $('#db_publish_max_vouchers_to_sell').focus(function () {
      $('.rightSideLayout').show();
      $('#max_vouchers_to_sell').show();
      $('#max_vouchers_to_sell_label').css('text-decoration','underline');
    });

    $('#db_publish_length_of_deal').focus(function () {
      $('.rightSideLayout').show();
      $('#length_of_deal').show();
      $('#length_of_deal_label').css('text-decoration','underline');
    });

    $('#db_publish_length_of_deal').focusout(function () {
      $('.rightSideLayout').hide();
      $('#length_of_deal').hide();
      $('#length_of_deal_label').css('text-decoration','none');
    });
    
    $('#new_db_publish').validate( {
      rules : {
        'db_publish[max_vouchers_to_sell]':{required:true,min:0,digits:true},
        'db_publish[length_of_deal]':{required:true,min:0,digits:true}
      },
      messages : {
        'db_publish[max_vouchers_to_sell]':{required:"",min:"",digits:""},
        'db_publish[length_of_deal]':{required:"",min:"",digits:""}
      }
    });
  }
});
$(document).ready(function () {
  if($('#new_db_step_four').is(':visible') || $('.edit_db_step_four').is(':visible'))
  {

    $('#db_step_four_fb_incentive').live("click", function () {
      checkFbShare();
    });
    $('#dbFourFBInfoButton').live("click", function () {
      $('#fb_incentive').show();
      $('.rightSideLayout').show();
    });

  $('#db_step_four_optional_incentive').focus(function () {
    $('#optional_incentives').show();
    $('.rightSideLayout').show();
    $('#fb_incentive').hide();
    $('#optional_incentives_label').css('text-decoration','underline');
  });

  $('#db_step_four_optional_incentive').focusout(function () {
    $('#optional_incentives').hide();
    $('#optional_incentives_label').css('text-decoration','none');
    $('.rightSideLayout').hide();
  });
 
  $('#new_db_step_four').validate( {
     errorPlacement: function(error,element) {
       error.appendTo(element.closest("td").next('td'));
     },
    rules: {
      "db_step_four[fb_incentive_text]":{required:true}
    }, 
    messages : {
      "db_step_four[fb_incentive_text]":{required:""}
    }
  });

  $('.edit_db_step_four').validate( {
     errorPlacement: function(error,element) {
       error.appendTo(element.closest("td").next('td'));
     },
    rules: {
      "db_step_four[fb_incentive_text]":{required:true}
    }, 
    messages : {
      "db_step_four[fb_incentive_text]":{required:""}
    }
  });

      checkFbShare();
  }
});



//code for db_step_zero
$(document).ready(function () {

  if($('#new_db_step_zero').is(':visible') || $('.edit_db_step_zero').is(':visible')) {
    $('.rightSideLayout').hide();
    $('#industry').hide();
    $('#business_description').hide();
    $('#phone_number').hide();
    $('#business_logo').hide();
    $('#business_website').hide();

  $('#db_step_zero_company_logo').focus( function () {
    $('#company_logo').show();
    $('#company_logo_label').css('text-decoration','underline');
    $('.rightSideLayout').show();
  });

  $('#db_step_zero_business_name').focus( function () {
    $('#company_logo').hide();
    $('.rightSideLayout').hide();
    $('#business_name_label').css('text-decoration','underline');
  });

  $('#db_step_zero_business_name').focusout( function () {
    $('#business_name_label').css('text-decoration','none');
  });

  $('#db_step_zero_website').focus( function () {
    $('#company_logo').hide();
    $('.rightSideLayout').hide();
    $('#company_logo_label').css('text-decoration','none');
    $('#business_website_label').css('text-decoration','underline');
  });

  $('#db_step_zero_website').focusout( function () {
    $('#business_website_label').css('text-decoration','none');
  });

  $('#db_step_zero_business_description').focus( function () {
    $('#company_logo').hide();
    $('#company_logo_label').css('text-decoration','none');
    $('#business_description_label').css('text-decoration','underline');
    $('.rightSideLayout').show();
    $('#business_description').show();
  });

  $('#db_step_zero_business_description').focusout( function () {
    $('#business_description_label').css('text-decoration','none');
    $('.rightSideLayout').hide();
    $('#business_description').hide();
  });

  $('#db_step_zero_phone_number').focus( function () {
    $('#company_logo').hide();
    $('#company_logo_label').css('text-decoration','none');
    $('#phone_number_label').css('text-decoration','underline');
    $('.rightSideLayout').show();
    $('#phone_number').show();
  });

  $('#db_step_zero_phone_number').focusout( function () {
    $('#phone_number_label').css('text-decoration','none');
    $('.rightSideLayout').hide();
    $('#phone_number').hide();
  });

  $('#db_step_zero_industry').focus( function ()  {
    $('#company_logo').hide();
    $('#company_logo_label').css('text-decoration','none');
    $('#industry_label').css('text-decoration','underline');
    $('.rightSideLayout').show();
    $('#industry').show();
  });

  $('#db_step_zero_industry').focusout( function ()  {
    $('#industry').hide();
    $('#industry_label').css('text-decoration','none');
    $('.rightSideLayout').hide()
  });

  $('#db_step_zero_company_logo').live("click", function () {
    $('#company_logo_label').css('text-decoration','underline');
    $('.rightSideLayout').show();
    $('#company_logo').show();
  });

  //validations
  $('#new_db_step_zero').validate({
    rules: {
      "db_step_zero[business_name]":{required:true},
      "db_step_zero[business_description]":{required:true},
      "db_step_zero[company_logo]":{ accept:true},
      "db_step_zero[industry]":{required:true},
      "db_step_zero[phone_number]":{required:true,minlength:10,maxlength:10,digits:true}
    },
    messages: {
        "db_step_zero[company_logo]":{accept:""},
        "db_step_zero[industry]":{required:""},
        "db_step_zero[business_name]":{required:""},
        "db_step_zero[business_description]":{required:""},
        "db_step_zero[phone_number]":{required:"",minlength:"",maxlength:"",digits:""}
    }
  });  

  $('.edit_db_step_zero').validate({
    rules: {
      "db_step_zero[business_name]":{required:true},
      "db_step_zero[business_description]":{required:true},
      "db_step_zero[company_logo]":{ accept:true},
      "db_step_zero[industry]":{required:true},
      "db_step_zero[phone_number]":{required:true,minlength:10,maxlength:10,digits:true}
    },
    messages: {
        "db_step_zero[company_logo]":{accept:""},
        "db_step_zero[industry]":{required:""},
        "db_step_zero[business_name]":{required:""},
        "db_step_zero[business_description]":{required:""},
        "db_step_zero[phone_number]":{required:"",minlength:"",maxlength:"",digits:""}
    }
  });  
 }
});
$(document).ready(function () {
//voucher index javascript

    $('.oneVoucherViewOff').live("click", function() {
      var id = $(this).attr('id');
      var pattern = (/[0-9]+/);
      var voucher = id.match(pattern);
      $('div#offerInfo'+voucher).slideDown("slow");
      $('div#oneVoucherView'+voucher).removeClass('oneVoucherViewOff');
      $('div#oneVoucherView'+voucher).addClass('oneVoucherViewOn');
      console.log(voucher);
    });

    $('.oneVoucherViewOn').live("click", function() {
      var id = $(this).attr('id');
      var pattern = (/[0-9]+/);
      var voucher = id.match(pattern);
      $('div#oneVoucherView'+voucher).removeClass('oneVoucherViewOn');
      $('div#oneVoucherView'+voucher).addClass('oneVoucherViewOff');
      $('div#offerInfo'+voucher).slideUp("slow");
    });

    $('.twoOfferInfoButtonOff').live("click", function() {
      var id = $(this).attr('id');
      var pattern = (/[0-9]+/);
      var voucher = id.match(pattern);
      $('div#offerInfoOneContainer'+voucher).hide();
      $('div#offerInfoThreeContainer'+voucher).hide();
      $('div#offerInfoFourContainer'+voucher).hide();
      $('div#offerInfoPubContainer'+voucher).hide();
      $('div#offerInfoTwoContainer'+voucher).show();
      $('div#oneOfferInfoButton'+voucher).removeClass('oneOfferInfoButtonOn');
      $('div#oneOfferInfoButton'+voucher).addClass('oneOfferInfoButtonOff');

      $('div#threeOfferInfoButton'+voucher).removeClass('threeOfferInfoButtonOn');
      $('div#threeOfferInfoButton'+voucher).addClass('threeOfferInfoButtonOff');

      $('div#fourOfferInfoButton'+voucher).removeClass('fourOfferInfoButtonOn');
      $('div#fourOfferInfoButton'+voucher).addClass('fourOfferInfoButtonOff');

      $('div#pubOfferInfoButton'+voucher).removeClass('pubOfferInfoButtonOn');
      $('div#pubOfferInfoButton'+voucher).addClass('pubOfferInfoButtonOff');

      $('div#twoOfferInfoButton'+voucher).removeClass('twoOfferInfoButtonOff');
      $('div#twoOfferInfoButton'+voucher).addClass('twoOfferInfoButtonOn');
    });

    $('.oneOfferInfoButtonOff').live("click", function() {
      var id = $(this).attr('id');
      var pattern = (/[0-9]+/);
      var voucher = id.match(pattern);
      $('div#offerInfoTwoContainer'+voucher).hide();
      $('div#offerInfoThreeContainer'+voucher).hide();
      $('div#offerInfoFourContainer'+voucher).hide();
      $('div#offerInfoPubContainer'+voucher).hide();
      $('div#offerInfoOneContainer'+voucher).show();
      $('div#twoOfferInfoButton'+voucher).removeClass('twoOfferInfoButtonOn');
      $('div#twoOfferInfoButton'+voucher).addClass('twoOfferInfoButtonOff');

      $('div#threeOfferInfoButton'+voucher).removeClass('threeOfferInfoButtonOn');
      $('div#threeOfferInfoButton'+voucher).addClass('threeOfferInfoButtonOff');

      $('div#fourOfferInfoButton'+voucher).removeClass('fourOfferInfoButtonOn');
      $('div#fourOfferInfoButton'+voucher).addClass('fourOfferInfoButtonOff');

      $('div#pubOfferInfoButton'+voucher).removeClass('pubOfferInfoButtonOn');
      $('div#pubOfferInfoButton'+voucher).addClass('pubOfferInfoButtonOff');

      $('div#oneOfferInfoButton'+voucher).removeClass('oneOfferInfoButtonOff');
      $('div#oneOfferInfoButton'+voucher).addClass('oneOfferInfoButtonOn');
    });

    $('.threeOfferInfoButtonOff').live("click", function() {
      var id = $(this).attr('id');
      var pattern = (/[0-9]+/);
      var voucher = id.match(pattern);
      $('div#offerInfoTwoContainer'+voucher).hide();
      $('div#offerInfoOneContainer'+voucher).hide();
      $('div#offerInfoFourContainer'+voucher).hide();
      $('div#offerInfoPubContainer'+voucher).hide();
      $('div#offerInfoThreeContainer'+voucher).show();
      $('div#twoOfferInfoButton'+voucher).removeClass('twoOfferInfoButtonOn');
      $('div#twoOfferInfoButton'+voucher).addClass('twoOfferInfoButtonOff');

      $('div#oneOfferInfoButton'+voucher).removeClass('oneOfferInfoButtonOn');
      $('div#oneOfferInfoButton'+voucher).addClass('oneOfferInfoButtonOff');

      $('div#fourOfferInfoButton'+voucher).removeClass('fourOfferInfoButtonOn');
      $('div#fourOfferInfoButton'+voucher).addClass('fourOfferInfoButtonOff');

      $('div#pubOfferInfoButton'+voucher).removeClass('pubOfferInfoButtonOn');
      $('div#pubOfferInfoButton'+voucher).addClass('pubOfferInfoButtonOff');

      $('div#threeOfferInfoButton'+voucher).removeClass('threeOfferInfoButtonOff');
      $('div#threeOfferInfoButton'+voucher).addClass('threeOfferInfoButtonOn');
    });

    $('.fourOfferInfoButtonOff').live("click", function() {
      var id = $(this).attr('id');
      var pattern = (/[0-9]+/);
      var voucher = id.match(pattern);
      $('div#offerInfoTwoContainer'+voucher).hide();
      $('div#offerInfoOneContainer'+voucher).hide();
      $('div#offerInfoThreeContainer'+voucher).hide();
      $('div#offerInfoPubContainer'+voucher).hide();
      $('div#offerInfoFourContainer'+voucher).show();
      $('div#twoOfferInfoButton'+voucher).removeClass('twoOfferInfoButtonOn');
      $('div#twoOfferInfoButton'+voucher).addClass('twoOfferInfoButtonOff');

      $('div#oneOfferInfoButton'+voucher).removeClass('oneOfferInfoButtonOn');
      $('div#oneOfferInfoButton'+voucher).addClass('oneOfferInfoButtonOff');

      $('div#threeOfferInfoButton'+voucher).removeClass('threeOfferInfoButtonOn');
      $('div#threeOfferInfoButton'+voucher).addClass('threeOfferInfoButtonOff');

      $('div#pubOfferInfoButton'+voucher).removeClass('pubOfferInfoButtonOn');
      $('div#pubOfferInfoButton'+voucher).addClass('pubOfferInfoButtonOff');

      $('div#fourOfferInfoButton'+voucher).removeClass('fourOfferInfoButtonOff');
      $('div#fourOfferInfoButton'+voucher).addClass('fourOfferInfoButtonOn');
    });

    $('.pubOfferInfoButtonOff').live("click", function() {
      var id = $(this).attr('id');
      var pattern = (/[0-9]+/);
      var voucher = id.match(pattern);
      $('div#offerInfoTwoContainer'+voucher).hide();
      $('div#offerInfoOneContainer'+voucher).hide();
      $('div#offerInfoThreeContainer'+voucher).hide();
      $('div#offerInfoFourContainer'+voucher).hide();
      $('div#offerInfoPubContainer'+voucher).show();
      $('div#twoOfferInfoButton'+voucher).removeClass('twoOfferInfoButtonOn');
      $('div#twoOfferInfoButton'+voucher).addClass('twoOfferInfoButtonOff');

      $('div#oneOfferInfoButton'+voucher).removeClass('oneOfferInfoButtonOn');
      $('div#oneOfferInfoButton'+voucher).addClass('oneOfferInfoButtonOff');

      $('div#threeOfferInfoButton'+voucher).removeClass('threeOfferInfoButtonOn');
      $('div#threeOfferInfoButton'+voucher).addClass('threeOfferInfoButtonOff');

      $('div#fourOfferInfoButton'+voucher).removeClass('fourOfferInfoButtonOn');
      $('div#fourOfferInfoButton'+voucher).addClass('fourOfferInfoButtonOff');

      $('div#pubOfferInfoButton'+voucher).removeClass('pubOfferInfoButtonOff');
      $('div#pubOfferInfoButton'+voucher).addClass('pubOfferInfoButtonOn');
    });
    $('div#showRVouchersContainer').live("click", function() {
      $('div#showRVouchersContainer').removeClass("showRVouchersContainerNotOn");
      $('div#showRVouchersContainer').addClass("showRVouchersContainerOn");
      $('div#showUVouchersContainer').removeClass("showUVouchersContainerOn");
      $('div#showUVouchersContainer').addClass("showUVouchersContainerNotOn");
      $('div#showAllVouchersContainer').removeClass("showAllVouchersContainerOn");
      $('div#showAllVouchersContainer').addClass("showAllVouchersContainerNotOn");
      $('div#voucherRedeemLocContainer').removeClass("voucherRedeemAllColor");
      $('div#voucherRedeemLocContainer').removeClass("voucherRedeemUColor");
      $('div#voucherRedeemLocContainer').addClass("voucherRedeemRColor");
      $('div.unredeemedVouchers').hide();
      $('div.redeemedVouchers').show();
    });

    $('div#showUVouchersContainer').live("click", function() {
      $('div#showUVouchersContainer').removeClass("showUVouchersContainerNotOn");
      $('div#showUVouchersContainer').addClass("showUVouchersContainerOn");
      $('div#showRVouchersContainer').removeClass("showRVouchersContainerOn");
      $('div#showRVouchersContainer').addClass("showRVouchersContainerNotOn");
      $('div#showAllVouchersContainer').removeClass("showAllVouchersContainerOn");
      $('div#showAllVouchersContainer').addClass("showAllVouchersContainerNotOn");
      $('div#voucherRedeemLocContainer').removeClass("voucherRedeemAllColor");
      $('div#voucherRedeemLocContainer').removeClass("voucherRedeemRColor");
      $('div#voucherRedeemLocContainer').addClass("voucherRedeemUColor");
      $('div.redeemedVouchers').hide();
      $('div.unredeemedVouchers').show();
    });

    $('div#showAllVouchersContainer').live("click", function() {
      $('div#showAllVouchersContainer').removeClass("showAllVouchersContainerNotOn");
      $('div#showAllVouchersContainer').addClass("showAllVouchersContainerOn");
      $('div#showRVouchersContainer').removeClass("showRVouchersContainerOn");
      $('div#showRVouchersContainer').addClass("showRVouchersContainerNotOn");
      $('div#showUVouchersContainer').removeClass("showUVouchersContainerOn");
      $('div#showUVouchersContainer').addClass("showUVouchersContainerNotOn");
      $('div#voucherRedeemLocContainer').removeClass("voucherRedeemAllColor");
      $('div#voucherRedeemLocContainer').removeClass("voucherRedeemUColor");
      $('div#voucherRedeemLocContainer').addClass("voucherRedeemAllColor");
      $('div.redeemedVouchers').show();
      $('div.unredeemedVouchers').show();
    });

});
$(document).ready(function () {
    $('div#moreOfferViewLink').live("click", function() {
      $('div#restOfDealBuilders').slideDown('slow', function() {
      });
      $('div#moreOfferViewLink').hide();
      $('div#hideOfferViewLink').show();
    });

    $('div#hideOfferViewLink').live("click", function() {
      $('div#restOfDealBuilders').slideUp('slow', function() {
      });
      $('div#hideOfferViewLink').hide();
      $('div#moreOfferViewLink').show();
    });
});

$(document).ready(function () {
    $('div#moreLiveOfferViewLink').live("click", function() {
      $('div#restOfLiveOffers').slideDown('slow', function() {
      });
      $('div#moreLiveOfferViewLink').hide();
      $('div#hideLiveOfferViewLink').show();
    });

    $('div#hideLiveOfferViewLink').live("click", function() {
      $('div#restOfLiveOffers').slideUp('slow', function() {
      });
      $('div#hideLiveOfferViewLink').hide();
      $('div#moreLiveOfferViewLink').show();
    });
});
$(document).ready(function () {
  if($('.show_deal_builder').is(':visible'))
  {

     $('.dbShowTwo').hide();
     $('.dbShowThree').hide();
     $('.dbShowFour').hide();

    $('div.dbClickOne').live("click",function() {
      $('.dbShowTwo').hide();
      $('.dbShowThree').hide();
      $('.dbShowFour').hide();
      $('.dbShowOne').show();
    });

    $('div.dbClickTwo').live("click",function() {
      $('.dbShowThree').hide();
      $('.dbShowFour').hide();
      $('.dbShowOne').hide();
      $('.dbShowTwo').show();
    });

    $('div.dbClickThree').live("click",function() {
      $('.dbShowTwo').hide();
      $('.dbShowFour').hide();
      $('.dbShowOne').hide();
      $('.dbShowThree').show();
    });

    $('div.dbClickFour').live("click",function() {
      $('.dbShowTwo').hide();
      $('.dbShowThree').hide();
      $('.dbShowOne').hide();
      $('.dbShowFour').show();
    });
  }
});



var newWindowSize = 'width=600,height=400,scrollbars=yes'
function openNewWindow(url,windowName)
{
  window.open(url,windowName,newWindowSize);
}
$(document).ready( function() {
  $('a.linkToNewWindow').live("click", function (event) {
    var link = $(this).attr('href');

    var windowName = 'offerglass.com';

    window.open(link,windowName,newWindowSize);

    event.preventDefault();
  });
});
