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
      $('#offer_title').fadeIn();
      $('#offer_title_label').css('color','#8cc63f');
      $('.rightSideLayout').fadeIn();
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
      $('.rightSideLayout').fadeIn();
      $('#additionalRSL').hide();
    });
    //needed to also add on click because for some reason focus
    // doesn't work click file_fields
    $('#db_step_one_offer_photo').live("click", function ()  {
      $('#offer_photo').fadeIn();
      $('#offer_photo_label').css('color','#8cc63f');
      $('.rightSideLayout').fadeIn();
      $('#additionalRSL').hide();
    });


    $('#db_step_one_offer_value').focus( function ()  {
      $('#offer_photo').hide();
      $('#offer_photo_label').css('color','white');
      $('#offer_value').fadeIn();
      $('#offer_value_label').css('color','#8cc63f');
      $('.rightSideLayout').fadeIn();
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
      $('#offer_price').fadeIn();
      $('#offer_price_label').css('color','#8cc63f');
      $('.rightSideLayout').fadeIn();
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
      $('.rightSideLayout').fadeIn();
      $('#offer_description').fadeIn();
      $('#additional_offer_description').fadeIn();
      $('#offer_description_label').css('color','#8cc63f');
    });
    $('#db_step_one_offer_description').focusout( function ()  {
      $('#offer_description').hide();
      $('#additional_offer_description').hide();
      $('#offer_description_label').css('color','white');
      $('.rightSideLayout').hide();
      $('#additionalRSL').hide();
    });

  $('#new_db_step_one').validate( {
     errorPlacement: function(error,element) {
       error.appendTo(element.closest("td").next('td'));
     },
    rules: {
      "db_step_one[offer_photo]":{accept:true},
      "db_step_one[offer_title]":{required:true},
      "db_step_one[offer_price]":{required:true, min: 0, number:true},
      "db_step_one[offer_value]":{required:true, min: 0, number:true},
      "db_step_one[offer_description]":{required:true}},

    messages: {
      "db_step_one[offer_photo]":{accept:"",required:""},
      "db_step_one[offer_title]":{required:""},
      "db_step_one[offer_price]":{number:"",min:"",required:""},
      "db_step_one[offer_value]":{number:"",min:"",required:""},
      "db_step_one[offer_description]":{required:""}
    }
  });
  $("#db_step_one_offer_photo").change(function () {
    $("#db_step_one_offer_photo").blur().focus();
  });
 }
});
//deal builder step 2 javascript
//validations and tool tip generation
$(document).ready(function () {
  if($('#new_db_step_two').is(':visible') || $('.edit_db_step_two').is(':visible'))
  {

      
    if ($('div.fields').filter(':visible').size() == 5) { 
      $('form a.add_nested_fields').hide();
    }
      $('.rightSideLayout').fadeIn();
      $('#locations').fadeIn();

    //format for calendar
    /*$('#db_step_two_offer_launch_date').datepicker({showAnim:'slideDown',
                                                  showOn:'button',
                                                  buttonImage: "/images/theme/calendar.gif",
			                          buttonImageOnly: true});*/
  $('#new_db_step_two').validate( {
     errorPlacement: function(error,element) {
         error.appendTo($('#errorLocation').closest('td').next('td'));
     },
     rules : {
       'db_step_two[locations_attributes][0][address]':{required:true}
     },
     messages : {
       'db_step_two[locations_attributes][0][address]':{required:''}
     }
  });
  }
});

//validations and tool tips for deal builder step 3
$(document).ready(function () {
  if($('#new_db_step_three').is(':visible') || $('.edit_db_step_three').is(':visible'))
  {
  $('.rightSideLayout').hide();
  $('#standard_restrictions').hide();
  $('#optional_restrictions').hide();

  $('#db_step_three_standard_restriction_ids_').focus(function () {
    $('#optional_restrictions').hide();
    $('#standard_restrictions').fadeIn();
    $('.rightSideLayout').fadeIn();
  });

  $('#db_step_three_standard_restriction_ids_').live("click",function () {
    $('#optional_restrictions').hide();
    $('#standard_restrictions').fadeIn();
    $('.rightSideLayout').fadeIn();
  });

  $('#db_step_three_optional_restriction').focus(function () {
    $('#standard_restrictions').hide();
    $('#optional_restrictions').fadeIn();
    $('.rightSideLayout').fadeIn();
  });

  $('#new_db_step_three').validate( {
    errorPlacement: function(error,element) {
      error.appendTo(element.closest('tr').prev('tr').last('td'));
    },
    rules: {
      "db_step_three[standard_restriction_ids][]":{required:true,minlength:1},
    },
    messages: {
     "db_step_three[standard_restriction_ids][]":{required:"",minlength:""}, 
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
    $('#incentive_ideas').fadeIn();
    $('.rightSideLayout').fadeIn();
  });

  $('#db_step_four_incentive_idea_ids_').live("click", function () {
    $('#optional_incentives').hide();
    $('#incentive_ideas').fadeIn();
    $('.rightSideLayout').fadeIn();
  });

  $('#db_step_four_optional_incentive').focus(function () {
    $('#incentive_ideas').hide();
    $('#optional_incentives').fadeIn();
    $('.rightSideLayout').fadeIn();
  });
 
  $('#new_db_step_four').validate( {
     errorPlacement: function(error,element) {
       if(element.is('input:checkbox')) {
         error.appendTo(element.closest('tr').prev('tr').last('td'));
       }
       else {
         error.appendTo(element.closest('td').next('td'));
       }
     },
     success: function(label) {
       label.addClass('valid');
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
/*
  $('#db_step_one_company_logo').focus( function () {
    $('#company_logo').fadeIn();
    $('#company_logo_label').css('color','#8cc63f');
    $('.rightSideLayout').fadeIn();
  });

  $('#db_step_one_industry').focus( function ()  {
    $('#company_logo').hide();
    $('#company_logo_label').css('color','white');
    $('#industry').fadeIn();
    $('#industry_label').css('color','#8cc63f');
    $('.rightSideLayout').fadeIn();
  });
  $('#db_step_one_industry').focusout( function ()  {
    $('#industry').hide();
    $('#industry_label').css('color','white');
    $('.rightSideLayout').hide()
  });
  $('#db_step_one_company_logo').live("click", function () {
    $('#company_logo').fadeIn();
    $('#company_logo_label').css('color','#8cc63f');
    $('.rightSideLayout').fadeIn();
  });

  //validations
  rules:
      "db_step_one[business_name]":{required:true},
      "db_step_one[company_logo]":{ accept:true},
      "db_step_one[industry]":{required:true},
 
  messages:
      "db_step_one[company_logo]":{accept:""},
      "db_step_one[industry]":{required:""},
      "db_step_one[business_name]":{required:""},
  
  //after validations
  $("#db_step_one_company_logo").change(function () {
    $("#db_step_one_company_logo").blur().focus();
  });
*/
