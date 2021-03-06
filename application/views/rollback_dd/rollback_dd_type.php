<?php $this->load->view('commons/main_template', $nestedView); ?>

<!-- BEGIN PAGE CONTENT INNER -->
<div class="page-content-inner">
    <div class="row">
        <div class="col-md-12">
            <!-- BEGIN BORDERED TABLE PORTLET-->
            <div class="portlet light portlet-fit">
                <div class="portlet-body">
                    <?php
                    if($flag==1)
                    {
                      ?>
                      <form id="dd_date_form" method="post" action="<?php echo SITE_URL.'rollback_dd_type';?>" class="form-horizontal">
                        <div class="row ">  
                            <div class="form-group">
                                <label class="col-md-4 control-label">Distributor <span class="font-red required_fld">*</span></label>
                                <div class="col-md-5">
                                    <select  class="form-control select2" name="distributor_name" required >
                                        <option selected value="">-Select distributor-</option>
                                        <?php 
                                            foreach($distributor_list as $row)
                                            {
                                                echo '<option value="'.$row['distributor_id'].'">'.$row['distributor_code'].' - ('.$row['agency_name'].')</option>';
                                            }
                                        ?>
                                    </select> 
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-4 control-label">DD Number <span class="font-red required_fld">*</span></label>
                                <div class="col-md-5">
                                    <input type="text" name="dd_number" maxlength="15" class="form-control numeric" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-4 control-label">DD Amount</label>
                                <div class="col-md-5">
                                    <input type="text" name="dd_amount" maxlength="15" class="form-control numeric">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-5"></div>
                                    <div class="col-md-6">
                                        <input type="submit" class="btn blue tooltips"  value="Proceed" name="submit">
                                        <a href="<?php echo SITE_URL;?>" class="btn default">Cancel</a>
                                    </div>                                 
                            </div>
                        </div>
                        
                    </form><?php  
                    } 
                    if($flag==2)
                    { 
                      //echo "<pre>"; print_r($dd_list); exit;
                       ?>
                       <form id="dd_date_form" method="post" action="<?php echo SITE_URL.'insert_rollback_dd_type';?>" class="form-horizontal">
                            <input type="hidden" name="payment_id" value="<?php echo $dd_list['payment_id']; ?>">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="col-md-5 control-label">Distributor :</label>
                                        <div class="col-md-6">
                                            <b class="form-control-static"><?php echo  $dd_list['distributor_code'].' - ('.$dd_list['agency_name'].')' ;?></b>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="col-md-4 control-label">Bank Name :</label>
                                        <div class="col-md-6">
                                            <b class="form-control-static"><?php echo  $dd_list['name'];?></b>
                                        </div>
                                    </div>
                                </div>    
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="col-md-5 control-label">DD Number :</label>
                                        <div class="col-md-6">
                                            <b class="form-control-static"><?php echo  $dd_list['dd_number'];?></b>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="col-md-4 control-label">DD Amount :</label>
                                        <div class="col-md-6">
                                            <b class="form-control-static"><?php echo  price_format($dd_list['amount']);?></b>
                                        </div>
                                    </div>
                                </div>    
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="col-md-5 control-label">Existing Payment Mode :</label>
                                        <div class="col-md-6">
                                            <p><b class="form-control-static"><?php echo  $dd_list['payment_mode'];?></b> </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="col-md-4 control-label">Payment Date :</label>
                                        <div class="col-md-6">
                                            <p><b class="form-control-static"><?php echo  format_date($dd_list['payment_date']);?></b> </p>
                                        </div>
                                    </div>
                                </div>    
                            </div>
                            <div class="row ">
                                <div class="col-md-offset-3 col-md-5">
                                    <div class="form-group">
                                        <label class="col-md-5 control-label">New Payment Mode <span class="font-red required_fld">*</span></label>
                                        <div class="col-md-7">
                                            <select  class="form-control" name="payment_mode_id" required>
                                                <option value="">-Select Payment Mode-</option>
                                                <?php 
                                                    foreach($payment_mode as $row)
                                                    {
                                                        echo '<option value="'.$row['pay_mode_id'].'">'.$row['name'].' </option>';
                                                        
                                                    }
                                                ?>
                                            </select> 
                                        </div>
                                    </div>    
                                </div>    
                            </div>
                            <div class="row ">
                                <div class="col-md-offset-3 col-md-5">
                                    <div class="form-group">
                                        <label class="col-md-5 control-label">Remarks <span class="font-red required_fld">*</span></label>
                                        <div class="col-md-7">
                                            <textarea class="form-control" name="remarks" required></textarea> 
                                        </div>
                                    </div>    
                                </div>    
                            </div>
                                <div class="row">
                                    <div class="col-md-offset-5 col-md-6">
                                        <button type="submit" class="btn blue"  onclick="return confirm('Are you sure you want to Submit?')" name="submit">Submit</button>
                                        <a href="<?php echo SITE_URL.'dd_type';?>" class="btn default">Cancel</a>
                                    </div>
                                </div>
                        </form><?php
                    }?>
                    
                </div>
            </div>
            <!-- END BORDERED TABLE PORTLET-->
        </div>
    </div>               
</div>
<!-- END PAGE CONTENT INNER -->
<?php $this->load->view('commons/main_footer', $nestedView); ?>                