var leakage_form = function() {
    var handleleakage_form = function() {
        $('#leakage_form').validate({
            errorElement: 'span', //default input error message container
            errorClass: 'help-block', // default input error message class
            focusInvalid: false, // do not focus the last invalid input
            messages: {
                leakage_no:{
                    required: 'Leakage Number cannot be empty'
                },
                recovery_qty:{
                    required: 'Recovery Quantity cannot be empty'
                },
                recovery_pouches:{
                    required: 'Recovery Pouches cannot be empty'
                },
                oil_weight:{
                    required: 'Oil Weight cannot be empty'
                }
            },
            rules: 
            {
                leakage_no: {
                    required: true
                },
                recovery_qty: {
                    required: true
                },
                recovery_pouches: {
                    required: true 
                },
                oil_weight: {
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
        $('#leakage_form input').keypress(function(e) {
            //alert('1213');
            if (e.which == 13) {
                if ($('#leakage_form').validate().form()) {
                    $('#leakage_form').submit(); //form validation success, call ajax form submit
                }
                return false;                    
            }
        });
    }
    return {
        //main function to initiate the module
        init: function() {
             handleleakage_form();
        }
    };
}();
jQuery(document).ready(function() {
     leakage_form.init();
});