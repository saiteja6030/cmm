var icds_form = function() {

    var handleicds_form = function() {

        $('#icds_form').validate({

            errorElement: 'span', //default input error message container
            errorClass: 'help-block', // default input error message class
            focusInvalid: false, // do not focus the last invalid input
            messages: {
                    
                    icds_code: {
                        required: 'ICDS code is required'
                    },
                    icds_name: {
                        required: 'ICDS name is required'
                    },
                    mrkexe_code: {
                        required: 'Market executing code is required'
                    },
                    ph_num: {
                        required: 'Mobile number is required'
                    }
                },
                rules: {
                    
                    icds_code: {
                        required: true
                    },
                    icds_name: {
                        maxlength:255,                        
                        required: true
                    },
                    mrkexe_code: {
                        required: true
                    },
                    ph_num: {                                                
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

        $('#icds_form input').keypress(function(e) {
            //alert('1213');
            if (e.which == 13) {
                if ($('#icds_form').validate().form()) {
                    $('#icds_form').submit(); //form validation success, call ajax form submit
                }
                return false;                    
            }
        });
    }




    return {
        //main function to initiate the module
        init: function() {
            handleicds_form();
        }

    };

}();

jQuery(document).ready(function() {
    icds_form.init();
});


