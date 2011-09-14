// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults


/* validate sign up page */

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
    $('.rightSideLayout').hide();
    $('#additionalRSL').hide();
    $('#offer_title').hide();
    $('#offer_photo').hide();
    $('#offer_value').hide();
    $('#offer_price').hide();
    $('#offer_description').hide();
    $('#additional_offer_description').hide();



    $('#db_step_one_offer_title').focus( function ()  {
      $('#offer_photo').hide();
      $('#offer_photo_label').css('color','white');
      $('#offer_title').show();
      $('#offer_title_label').css('color','#8cc63f');
      $('.rightSideLayout').show();
      $('#additionalRSL').hide();
    });

    $('#db_step_one_offer_title').focusout( function ()  {
      $('#offer_title').hide();
      $('#offer_title_label').css('color','white');
      $('.rightSideLayout').hide();
      $('#additionalRSL').hide();
    });

    $('#db_step_one_offer_photo').focus( function ()  {
      $('#offer_photo').fadeIn();
      $('#offer_photo_label').css('color','#8cc63f');
      $('.rightSideLayout').show();
      $('#additionalRSL').hide();
    });
    //needed to also add on click because for some reason focus
    // doesn't work click file_fields
    $('#db_step_one_offer_photo').live("click", function ()  {
      $('#offer_photo').fadeIn();
      $('#offer_photo_label').css('color','#8cc63f');
      $('.rightSideLayout').show();
      $('#additionalRSL').hide();
    });
    
    $('#db_step_one_coupon').live("click", function () {
      checkCoupon();
    });

    $('#db_step_one_offer_value').focus( function ()  {
      $('#offer_photo').hide();
      $('#offer_photo_label').css('color','white');
      $('#offer_value').show();
      $('#offer_value_label').css('color','#8cc63f');
      $('.rightSideLayout').show();
      $('#additionalRSL').hide();
    });
    $('#db_step_one_offer_value').focusout( function ()  {
      $('#offer_value').hide();
      $('#offer_value_label').css('color','white');
      $('.rightSideLayout').hide();
      $('#additionalRSL').hide();
    });

    $('#db_step_one_offer_price').focus( function ()  {
      $('#offer_photo').hide();
      $('#offer_photo_label').css('color','white');
      $('#offer_price').show();
      $('#offer_price_label').css('color','#8cc63f');
      $('.rightSideLayout').show();
      $('#additionalRSL').hide();
    });
    $('#db_step_one_offer_price').focusout( function ()  {
      $('#offer_price').hide();
      $('#offer_price_label').css('color','white');
      $('.rightSideLayout').hide();
      $('#additionalRSL').hide();
    });

    $('#db_step_one_offer_description').focus( function ()  {
      $('#offer_photo').hide();
      $('#offer_photo_label').css('color','white');
      $('#additionalRSL').show();
      $('.rightSideLayout').show();
      $('#offer_description').show();
      $('#additional_offer_description').show();
      $('#offer_description_label').css('color','#8cc63f');
    });
    $('#db_step_one_offer_description').focusout( function ()  {
      $('#offer_description').hide();
      $('#additional_offer_description').hide();
      $('#offer_description_label').css('color','white');
      $('.rightSideLayout').hide();
      $('#additionalRSL').hide();
    });

  $.validator.addMethod('lessThan', function(value) {
    var offerValue = $('#db_step_one_offer_value').val();
    return (parseFloat(value) < offerValue);
  },'');

  $('#new_db_step_one').validate( {
     errorPlacement: function(error,element) {
       error.appendTo(element.closest("td").next('td'));
     },
    rules: {
      "db_step_one[offer_photo]":{accept:true},
      "db_step_one[offer_title]":{required:true},
      "db_step_one[offer_value]":{required:true, min: 0, number:true},
      "db_step_one[offer_price]":{required:true, min: 0, number:true,lessThan:true},
      "db_step_one[offer_description]":{required:true}},

    messages: {
      "db_step_one[offer_photo]":{accept:""},
      "db_step_one[offer_title]":{required:""},
      "db_step_one[offer_value]":{number:"",min:"",required:""},
      "db_step_one[offer_price]":{number:"",min:"",required:"",lessThan:''},
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
      "db_step_one[offer_value]":{required:true, min: 0, number:true},
      "db_step_one[offer_price]":{required:true, min: 0, number:true,lessThan:true},
      "db_step_one[offer_description]":{required:true}},

    messages: {
      "db_step_one[offer_photo]":{accept:"",required:""},
      "db_step_one[offer_title]":{required:""},
      "db_step_one[offer_value]":{number:"",min:"",required:""},
      "db_step_one[offer_price]":{number:"",min:"",required:"",lessThan:''},
      "db_step_one[offer_description]":{required:""}
    }
  });

  $("#db_step_one_offer_photo").change(function () {
    $("#db_step_one_offer_photo").blur().focus();
  });

  checkCoupon();

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

//deal builder step 2 javascript
//validations and tool tip generation
$(document).ready(function () {
  if($('#new_db_step_two').is(':visible') || $('.edit_db_step_two').is(':visible'))
  {

      
    if ($('div.fields').filter(':visible').size() == 5) { 
      $('form a.add_nested_fields').hide();
    }
      $('.rightSideLayout').show();
      $('#locations').show();

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

//fun code written for dynamicly adding validations
//to dynamic forms, not in use atm
function validateAddresses(){
     $('input[name$="[address]"]').each(function() {
        //alert('#' + $(this).attr('id'));
        //this takes care of adding location button adding separate
        //input fields, these should not be checked by validations
        if(!(/new_locations/i.test($(this).attr('id'))) && !($(this).is(':hidden'))) {
          $('#' + $(this).attr('id')).rules("add",{
            required:true,
            messages: {
              required:''
            }
            });
        }
     });
}

function removeAddresses(){
     $('input[name$="[address]"]').each(function() {
        if(!(/new_locations/i.test($(this).attr('id'))) && $(this).is(':hidden')) {
          $('#' + $(this).attr('id')).rules("remove","required");
        }
     });
}

function validateCities(){
     $('input[name$="[city]"]').each(function() {
        //alert('#' + $(this).attr('id'));
        if(!(/new_locations/i.test($(this).attr('id'))) && !($(this).is(':hidden'))) {
          $('#' + $(this).attr('id')).rules("add",{
            required:true,
            messages: {
              required:''
            }
            });
        }
     });
}

function removeCities(){
     $('input[name$="[city]"]').each(function() {
        if(!(/new_locations/i.test($(this).attr('id'))) && $(this).is(':hidden')) {
          $('#' + $(this).attr('id')).rules("remove","required");
        }
     });
}

function validateStates(){
     $('select[name$="[state]"]').each(function() {
        //alert('#' + $(this).attr('id'));
        if(!(/new_locations/i.test($(this).attr('id'))) && !($(this).is(':hidden'))) {
          $('#' + $(this).attr('id')).rules("add",{
            required:true,
            messages: {
              required:''
            }
            });
        }
     });
}

function removeStates(){
     $('select[name$="[state]"]').each(function() {
        if(!(/new_locations/i.test($(this).attr('id'))) && $(this).is(':hidden')) {
          $('#' + $(this).attr('id')).rules("remove","required");
        }
     });
}

function validateZips(){
     $('input[name$="[zip]"]').each(function() {
        //alert('#' + $(this).attr('id'));
        if(!(/new_locations/i.test($(this).attr('id'))) && !($(this).is('hidden'))) {
          $('#' + $(this).attr('id')).rules("add",{
            required:true,
            minlength:5,
            maxlength:5,
            digits:true,
            messages: {
              required:'',
              minlength:'',
              maxlength:'',
              digits:''
            }
            });
         }
     });
}

function removeZips(){
     $('input[name$="[zip]"]').each(function() {
        if(!(/new_locations/i.test($(this).attr('id'))) && $(this).is(':hidden')) {
          $('#' + $(this).attr('id')).rules("remove","required");
        }
     });
}


//validations and tool tips for deal builder step 3
$(document).ready(function () {
  if($('#new_db_step_three').is(':visible') || $('.edit_db_step_three').is(':visible'))
  {
  $('.rightSideLayout').hide();
  $('#standard_restrictions').hide();
  $('#optional_restrictions').hide();
  $('#voucher_length').hide();

  $('#db_step_three_standard_restriction_ids_').live("click",function () {
    $('.rightSideLayout').show();
    $('#standard_restrictions').show();
    $('#standard_restriction_label').css('color','#8cc63f');
  });

  $('#db_step_three_voucher_length').focus(function () {
    $('#standard_restrictions').hide();
    $('#voucher_length').show();
    $('.rightSideLayout').show();
    $('#standard_restriction_label').css('color','white');
    $('#voucher_length_label').css('color','#8cc63f');
  });

  $('#db_step_three_voucher_length').focusout(function () {
    $('#voucher_length').hide();
    $('.rightSideLayout').hide();
    $('#voucher_length_label').css('color','white');
  });

  $('#db_step_three_optional_restriction').focus(function () {
    $('#standard_restrictions').hide();
    $('#standard_restriction_label').css('color','white');
    $('#optional_restrictions').show();
    $('.rightSideLayout').show();
  });

  $('#db_step_three_optional_restriction').focusout(function () {
    $('#optional_restrictions').hide();
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
    $('.rightSideLayout').hide();
    $('#max_vouchers_to_sell').hide();
    $('#length_of_deal').hide();

    $('#db_publish_max_vouchers_to_sell').focusout(function () {
      $('.rightSideLayout').hide();
      $('#max_vouchers_to_sell').hide();
      $('#max_vouchers_to_sell_label').css('color','white');
    });

    $('#db_publish_max_vouchers_to_sell').focus(function () {
      $('.rightSideLayout').show();
      $('#max_vouchers_to_sell').show();
      $('#max_vouchers_to_sell_label').css('color','#8cc63f');
    });

    $('#db_publish_length_of_deal').focus(function () {
      $('.rightSideLayout').show();
      $('#length_of_deal').show();
      $('#length_of_deal_label').css('color','#8cc63f');
    });

    $('#db_publish_length_of_deal').focusout(function () {
      $('.rightSideLayout').hide();
      $('#length_of_deal').hide();
      $('#length_of_deal_label').css('color','white');
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
  $('.rightSideLayout').hide();
  $('#incentive_ideas').hide();
  $('#optional_incentives').hide();

  $('#db_step_four_incentive_idea_ids_').focus(function () {
    $('#optional_incentives').hide();
    $('#incentive_ideas').show();
    $('.rightSideLayout').show();
  });

  $('#db_step_four_incentive_idea_ids_').live("click", function () {
    $('#optional_incentives').hide();
    $('#incentive_ideas').show();
    $('.rightSideLayout').show();
  });

  $('#db_step_four_optional_incentive').focus(function () {
    $('#incentive_ideas').hide();
    $('#optional_incentives').show();
    $('.rightSideLayout').show();
  });
 
  $('#new_db_step_four').validate( {
     errorPlacement: function(error,element) {
         error.appendTo(element.closest('tr').prev('tr').last('td'));
     },
    rules: {
      "db_step_four[incentive_idea_ids][]":{required:true,minlength:1}
    }, 
    messages : {
      "db_step_four[incentive_idea_ids][]":{required:"",minlength:""}
    }
  });

  $('.edit_db_step_four').validate( {
     errorPlacement: function(error,element) {
         error.appendTo(element.closest('tr').prev('tr').last('td'));
     },
    rules: {
      "db_step_four[incentive_idea_ids][]":{required:true,minlength:1}
    }, 
    messages : {
      "db_step_four[incentive_idea_ids][]":{required:"",minlength:""}
    }
  });
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
    $('#company_logo_label').css('color','#8cc63f');
    $('.rightSideLayout').show();
  });

  $('#db_step_zero_business_name').focus( function () {
    $('#company_logo').hide();
    $('.rightSideLayout').hide();
    $('#company_logo_label').css('color','white');
    $('#business_name_label').css('color','#8cc63f');
  });

  $('#db_step_zero_business_name').focusout( function () {
    $('#business_name_label').css('color','white');
  });

  $('#db_step_zero_website').focus( function () {
    $('#company_logo').hide();
    $('.rightSideLayout').hide();
    $('#company_logo_label').css('color','white');
    $('#business_website_label').css('color','#8cc63f');
  });

  $('#db_step_zero_website').focusout( function () {
    $('#business_website_label').css('color','white');
  });

  $('#db_step_zero_business_description').focus( function () {
    $('#company_logo').hide();
    $('#company_logo_label').css('color','white');
    $('#business_description_label').css('color','#8cc63f');
    $('.rightSideLayout').show();
    $('#business_description').show();
  });

  $('#db_step_zero_business_description').focusout( function () {
    $('#business_description_label').css('color','white');
    $('.rightSideLayout').hide();
    $('#business_description').hide();
  });

  $('#db_step_zero_phone_number').focus( function () {
    $('#company_logo').hide();
    $('#company_logo_label').css('color','white');
    $('#phone_number_label').css('color','#8cc63f');
    $('.rightSideLayout').show();
    $('#phone_number').show();
  });

  $('#db_step_zero_phone_number').focusout( function () {
    $('#phone_number_label').css('color','white');
    $('.rightSideLayout').hide();
    $('#phone_number').hide();
  });

  $('#db_step_zero_industry').focus( function ()  {
    $('#company_logo').hide();
    $('#company_logo_label').css('color','white');
    $('#industry_label').css('color','#8cc63f');
    $('.rightSideLayout').show();
    $('#industry').show();
  });

  $('#db_step_zero_industry').focusout( function ()  {
    $('#industry').hide();
    $('#industry_label').css('color','white');
    $('.rightSideLayout').hide()
  });

  $('#db_step_zero_company_logo').live("click", function () {
    $('#company_logo_label').css('color','#8cc63f');
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
