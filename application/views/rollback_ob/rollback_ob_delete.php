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
                      <form id="dd_date_form" method="post" action="<?php echo SITE_URL.'rollback_ob_delete';?>" class="form-horizontal">
                        <div class="row ">  
                            <div class="col-md-offset-3 col-md-5"> 
                                <div class="form-group">
                                    <label class="col-md-5 control-label">Enter OB Number</label>
                                    <div class="col-md-7">
                                        <input type="text" name="order_number" required class="form-control numeric"> 
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
                        </div>
                    </form><?php  
                    } 
                    if($flag==2)
                    { 
                      //echo "<pre>"; print_r($dd_list); exit;
                       ?>
                       <form id="dd_date_form" method="post" action="<?php echo SITE_URL.'insert_rb_ob_delete';?>" class="form-horizontal">
                            <input type="hidden" name="order_id" value="<?php echo $results[0]['order_id']; ?>">
                            <input type="hidden" name="order_number" value="<?php echo $results[0]['order_number']; ?>">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="col-md-4 control-label">OB Number :</label>
                                        <div class="col-md-6">
                                            <b class="form-control-static"><?php echo  $results[0]['order_number'] ;?></b>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="col-md-4 control-label">Order Booking Date :</label>
                                        <div class="col-md-6">
                                            <b class="form-control-static"><?php echo  date('d-m-Y', strtotime($results[0]['order_date']));?></b>
                                        </div>
                                    </div>
                                </div>    
                            </div>
                            <div class="row">
                            <?php if($type==1) { ?>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="col-md-4 control-label">Distributor Name :</label>
                                        <div class="col-md-6">
                                            <b class="form-control-static"><?php echo  $results[0]['agency_name']. ' ['.$results[0]['distributor_code'].']' ;?></b>
                                        </div>
                                    </div>
                                </div>
                                 <input type="hidden" name="distributor_code" value="<?php echo $results[0]['distributor_code'] ?>">
                                 <input type="hidden" name="old_distributor_id" value="<?php echo $results[0]['distributor_id']; ?>"> 
                                <?php } elseif($type==2) { ?>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="col-md-4 control-label">Unit Name :</label>
                                        <div class="col-md-6">
                                            <b class="form-control-static"><?php echo  $results[0]['plant_name'] ;?></b>
                                        </div>
                                    </div>
                                </div> <?php } ?>
                                 <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="col-md-4 control-label">Stock Lifting Point :</label>
                                        <div class="col-md-6">
                                            <b class="form-control-static"><?php echo  get_plant_name_by_id($results[0]['lifting_point']) ;?></b>
                                        </div>
                                    </div>
                                </div>    
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    
                                        <table class="table table-bordered table-striped table-hover">
                                            <thead>
                                                <th> S.No</th>
                                                <th> Product </th>
                                                <th> Ordered Qty </th>
                                                <th> Pending Qty </th>
                                                <th> Price </th>
                                                <th> Amount </th>
                                            </thead>
                                            <tbody>
                                            <?php
                                                $sn=1;
                                                $total=0;
                                                if(@$results)
                                                {

                                                foreach(@$results as $row)
                                                    {  
                                                    if($row['pending_qty'] >0) 
                                                    {
                                                        $amount= $row['pending_qty']*($row['unit_price']+$row['add_price']); 
                                                    }
                                                    else
                                                    {
                                                        $amount= $row['unit_price']+$row['add_price'];
                                                    }
                                                    $total+=$amount;                                 
                                                ?>
                                                <tr>
                                                    <td><?php echo $sn++;?></td>
                                                    <td><?php echo $row['product_name'];?> </td>
                                                    <td align="right"><?php echo qty_format($row['quantity']);?> </td>
                                                    <td align="right"><?php echo qty_format($row['pending_qty']);?> </td>
                                                    <td align="right"><?php echo price_format($row['add_price']+$row['unit_price']) ?></td>
                                                    <td align="right"><?php echo price_format($amount); ?></td>
                                                   <input type="hidden" name="order_product_id[]" value="<?php echo $row['order_product_id'] ; ?>" >
                                                    
                                                </tr>
                                                <?php
                                                    } ?>
                                                <tr>
                                                    <td colspan="6" align="right"><b>Total Amount: <?php echo price_format($total); ?></b></td>
                                                </tr>
                                                <?php
                                                }
                                                else
                                                {
                                                    ?> <tr><td colspan="6" align="center"> No Records Found</td></tr>      
                                        <?php   }
                                                ?>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            <div class="row ">
                                <div class="col-md-offset-3 col-md-6">
                                    <div class="form-group">
                                        <label class="col-md-4 control-label">Remarks <span class="font-red required_fld">*</span></label>
                                        <div class="col-md-6">
                                            <textarea class="form-control" name="remarks" required></textarea> 
                                        </div>
                                    </div>    
                                </div>    
                            </div>
                            <div class="row">
                                <div class="col-md-offset-5 col-md-6">
                                    <button type="submit" class="btn blue" onclick="return confirm('Are you sure you want to Delete OB?')" name="submit">Delete OB</button>
                                    <a href="<?php echo SITE_URL.'ob_delete';?>" class="btn default">Cancel</a>
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