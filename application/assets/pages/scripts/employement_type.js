var employement_typeForm = function() {

    var handleemployement_typeForm = function() {

        $('#employement_type_form').validate({

            errorElement: 'span', //default input error message container
            errorClass: 'help-block', // default input error message class
            focusInvalid: false, // do not focus the last invalid input
            messages: {
                    employement_type_name: {
                        required: 'Name is required'
                    }
                },
                rules: {
                    employement_type_name: {
                        maxlength:20,                        
                        required: true
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

        $('#employement_type_form input').keypress(function(e) {
            //alert('1213');
            if (e.which == 13) {
                if ($('#employement_type_form').validate().form()) {
                    $('#employement_type_form').submit(); //form validation success, call ajax form submit
                }
                return false;                    
            }
        });
    }




    return {
        //main function to initiate the module
        init: function() {
            handleemployement_typeForm();
        }

    };

}();

jQuery(document).ready(function() {
    employement_typeForm.init();
});


