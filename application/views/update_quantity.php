 <?php $this->load->view('commons/main_template', $nestedView); ?>

 <!-- BEGIN PAGE CONTENT INNER -->
 <div class="page-content-inner">
    <div class="row">
        <div class="col-md-12">
            <!-- BEGIN BORDERED TABLE PORTLET-->
            <div class="portlet box blue">
                <div class="portlet-title">
                  <div class="caption">
                      <i class="fa fa-gift"></i><?php echo $portlet_title; ?>
                    </div>
              </div>
              <div class="portlet-body form">
                <?php if(@$flag==1) { ?>
                <form class="form-horizontal" role="form" method="post" action="<?php echo SITE_URL.'view_product_quantity';?>">
                    <div class="portlet box blue">
                        <div class="portlet-body">
                            <div class="form-group">
                                <label class="col-md-5 control-label">Plant :</label>
                                <div class="col-md-3">
                                    <p class="form-control-static"><b><?php echo $this->session->userdata('plant_name'); ?></b></p>
                                    <input type="hidden" name="plant_id" value="<?php echo $this->session->userdata('ses_plant_id'); ?>">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-5 col-sm-7">
                                    <button class="btn blue" type="submit" name="submit" value="button"><i class="fa fa-check"></i> Submit</button>
                                    <a class="btn default" href="<?php echo SITE_URL;?>product_quantity"><i class="fa fa-times"></i> Cancel</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
                <?php } 
              elseif(@$flag==2) 
                    { ?>
                <form class="form-horizontal" role="form" method="post" action="<?php echo SITE_URL.'insert_latest_quantity';?>">
                    <input type="hidden" name="plant_id" id="plant_id" value="<?php echo $plant_id?>">
                    <div class="portlet box blue">
                        <div class="portlet-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="table-responsive">
                                        <table class="table table-bordered">
                                           <?php $sno=1; foreach ($product_results as $key =>$value)
                                            {   if(count($value['sub_products']) != '') { ?>
                                                <tr align="center" style="background-color:#889ff3;">
                                                   <td colspan="4" style="color:white;"><b><?php echo $value['product_name']; ?></b></td>
                                                  
                                                </tr>
                                               <?php if($sno==1){ ?> 
                                                <tr>
                                                    <td><b>SNO</b></td>
                                                    <td><b>Product Name</b></td>
                                                    <td><b>Cartons</b></td>
                                                    <?php if($block_id==2){
                                                        ?>
                                                        <td><b>Loose pouches</b></td> <?php
                                                    } ?>
                                                    
                                                </tr>
                                                <?php } ?>
                                                <tr>
                                                    <?php foreach($value['sub_products'] as $keys =>$values)
                                                      { ?>

                                                    <td><?php echo  $sno++; ?></td> 
                                                    <td><?php echo $values['name']; ?>
                                                        <input type="hidden" name="product_id[]" value="<?php echo $values['product_id'];?>">
                                                    </td>
                                                    <td><input type="text" name="quantity[<?php echo $values['product_id'];?>]" class="form-control xs-box"  style="width:135px" value="<?php if(@$results[@$value['plant_id']][@$values['product_id']]!=''){ echo @$results[@$value['plant_id']][@$values['product_id']]; }else{ echo '';} ?>"></td>
                                                    <?php if($block_id==2) {
                                                        ?>
                                                    <td><input type="text" name="pouches[<?php echo $values['product_id'];?>]" class="form-control xs-box"  style="width:135px" value="<?php if(@$pouches[@$value['plant_id']][@$values['product_id']]!=''){ echo @$pouches[@$value['plant_id']][@$values['product_id']]; }else{ echo '';} ?>"></td>
                                                    <?php
                                                    }?>
                                                    
                                                </tr>
                                            <?php
                                            } } }?>    
                                        </table>
                                        <table class="table table-bordered">
                                           <?php $sno=1;
                                               if(count($loose_oil) != '') { ?>
                                                <tr align="center" style="background-color:#889ff3;">
                                                   <td colspan="3" style="color:white;"><b>Loose Oils</b></td>
                                                  
                                                </tr> <?php
                                                foreach ($loose_oil as $row)
                                                {
                                                if($sno==1){ ?> 
                                                <tr>
                                                    <td><b>SNO</b></td>
                                                    <td><b>Product Name</b></td>
                                                    <td><b>Oil Weight</b></td>
                                                </tr>
                                                <?php } ?>
                                                <tr>
                                                    <td><?php echo  $sno++; ?></td> 
                                                    <td><?php echo $row['name']; ?>
                                                        <input type="hidden" name="loose_oil_id[]" value="<?php echo $row['loose_oil_id'];?>">
                                                    </td>
                                                    <td><input type="text" name="oil_weight[<?php echo $row['loose_oil_id'];?>]" class="form-control xs-box"  style="width:135px" value="<?php if(@$oil_results[@$plant_id][@$row['loose_oil_id']]!=''){ echo @$oil_results[@$plant_id][@$row['loose_oil_id']]; }else{ echo '';} ?>"></td>
                                                    
                                                </tr>
                                            <?php
                                             } }?>    
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-actions right">
                            <input type="submit" name="submit"   class="proceed btn green">
                            <a type="button" href="<?php echo SITE_URL.'product_quantity';?>" class="btn default">Cancel</a>
                        </div>
                    </div>
                </form>
                 <?php }
                        ?>
              </div>
            </div>
        </div>
    </div>
 </div>
 <?php $this->load->view('commons/main_footer', $nestedView); ?>