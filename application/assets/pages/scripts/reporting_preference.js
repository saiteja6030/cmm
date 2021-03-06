var reporting = function() {

    var handlereporting = function() {

        $('.reporting_form').validate({
            errorElement: 'span', //default input error message container
            errorClass: 'help-block', // default input error message class
            focusInvalid: false, // do not focus the last invalid input
            rules: {
                section: {
                    required: true
                },
                name: {
                    required: true
                },
                label: {
                    required: true
                },
                issue_raised_by: {
                    required: true
                },
                issue_closed_by: {
                    required: true
                }
            },

            messages: {
                section: {
                    required: "section can not be empty."
                }
            },

            invalidHandler: function(event, validator) { //display error alert on form submit   
                //$('.alert-danger', $('.reset-form')).show();
            },

            highlight: function(element) { // hightlight error inputs
                $(element)
                    .closest('.form-group').addClass('has-error'); // set error class to the control group
            },

            success: function(label, element) {
                    var icon = $(element).parent('.input-icon').children('i');
                    $(element).closest('.form-group').removeClass('has-error').addClass('has-success'); // set success class to the control group
                    icon.removeClass("fa-warning").addClass("fa-check");
            },

            errorPlacement: function(error, element) {
                    var icon = $(element).parent('.input-icon').children('i');
                    icon.removeClass('fa-check').addClass("fa-warning");  
                    icon.attr("data-original-title", error.text()).tooltip({'container': 'body'});
            },


            submitHandler: function(form) {
                form.submit(); // form validation success, call ajax form submit
            }
        });

        $('.reporting_form input').keypress(function(e) {
            //alert('1213');
            if (e.which == 13) {
                if ($('.reporting_form').validate().form()) {
                    $('.reporting_form').submit(); //form validation success, call ajax form submit
                }
                return false;                    
            }
        });
    }




    return {
        //main function to initiate the module
        init: function() {
            handlereporting();
        }

    };

}();

jQuery(document).ready(function() {
    reporting.init();
});

$(document).on("change",".table_name",function() {    
   // var frequency = $('#equipment_id').val();
    var table_name = $('.table_name').val();
    if(table_name=='')
    {
        $('.table_column').html('<option value="">-Select Table Column-</option>');
        
    }
    else
    {
        $.ajax({
            type:"POST",
            url:SITE_URL+'get_table_column',
            data:{table_name:table_name},
            cache:false,
            success:function(html){
                $('.table_column').html(html);
            }
        });

        $.ajax({
            type:"POST",
            url:SITE_URL+'get_table_primary_column',
            data:{table_name:table_name},
            cache:false,
            success:function(html){
                $('.table_primary_column').html(html);
            }
        });
    }
});