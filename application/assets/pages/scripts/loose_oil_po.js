var loose_oil_poForm = function() {

    var handlelooseoilpoForm = function() {

        $('#loose_oil_po_form').validate({

            errorElement: 'span', //default input error message container
            errorClass: 'help-block', // default input error message class
            focusInvalid: false, // do not focus the last invalid input
            messages: {
                    name: {
                        required: 'Name is required'
                    }
                },
                rules: {
                    name: {     
                                                     
                        required: true
                    },
                    po_number: {
                          number:true,                      
                        required: true
                    },
                    po_date: {
                                            
                        required: true
                    },
                    broker_id: {                                                
                        required: true
                    },
                    supplier_id: {                                              
                        required: true
                    },
                    delivery_to: {                                                
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

        $('#loose_oil_po_form input').keypress(function(e) {
            //alert('1213');
            if (e.which == 13) {
                if ($('#loose_oil_po_form').validate().form()) {
                    $('#loose_oil_po_form').submit(); //form validation success, call ajax form submit
                }
                return false;                    
            }
        });
    }




    return {
        //main function to initiate the module
        init: function() {
            handlelooseoilpoForm();
        }

    };

}();

jQuery(document).ready(function() {
    loose_oil_poForm.init();
});


