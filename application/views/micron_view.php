 <?php $this->load->view('commons/main_template', $nestedView); ?>

<!-- BEGIN PAGE CONTENT INNER -->
<div class="page-content-inner">
    <div class="row">
        <div class="col-md-12">
            <!-- BEGIN BORDERED TABLE PORTLET-->
            <div class="portlet light portlet-fit">
                
                <div class="portlet-body">
                    <?php
                    if(isset($flg))
                    {
                        ?>
                            <form id="micron_form" method="post" action="<?php echo $form_action;?>" class="form-horizontal">
                                <?php
                                if($flg==2){
                                    ?>
                                    <input type="hidden" name="encoded_id" value="<?php echo cmm_encode($micron_row['micron_id']);?>">
                                    <input type="hidden" name="e_id" id="micron_id" value="<?php echo $micron_row['micron_id']?>">
                                    <?php
                                }
                                ?>
                                
                                <div class="form-group">
                                    <label class="col-md-3 control-label">Film Specification Name <span class="font-red required_fld">*</span></label>
                                    <div class="col-md-6">
                                        <div class="input-icon right">
                                            <i class="fa"></i>
                                            <input class="form-control" name="name" value="<?php echo @$micron_row['name'];?>" id="micronName" placeholder="Film Specification Name" type="text" >
                                            <p id="micronnameValidating" class="hidden"><i class="fa fa-spinner fa-spin"></i> Checking...</p>
                                          <p id="micronError" class="error hidden"></p>
                                        </div>
                                    </div>
                                </div>                                
                                <div class="form-actions">
                                    <div class="row">
                                        <div class="col-md-offset-3 col-md-6">
                                            <button type="submit" value="1" class="btn blue">Submit</button>
                                            <a href="<?php echo SITE_URL.'micron';?>" class="btn default">Cancel</a>
                                        </div>
                                    </div>  
                                </div>
                            </form>
                        <?php
                    }
                    if(isset($display_results)&&$display_results==1)
                    {
                    ?>
                        <form method="post" action="<?php echo SITE_URL.'micron'?>">
                            <div class="row">
                                
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <input class="form-control" name="name" value="<?php echo @$search_data['name'];?>" placeholder="Film Specification Name" type="text">
                                    </div>
                                </div>
                                
                                
                                <div class="col-sm-4">
                                    <div class="form-actions">
                                        <button type="submit" name="search_micron" value="1" class="btn blue tooltips" data-container="body" data-placement="top" data-original-title="Search"><i class="fa fa-search"></i></button>
                                        <a href="<?php echo SITE_URL.'add_micron';?>" class="btn blue tooltips" data-container="body" data-placement="top" data-original-title="Add New"><i class="fa fa-plus"></i></a>
                                        
                                    </div>
                                </div>
                            </div>
                        </form>
                        <div class="table-scrollable">
                            <table class="table table-bordered table-striped table-hover">
                                <thead>
                                    <tr>
                                        <th>S.No.</th>
                                        <th> Film Specification Name </th>
                                        <th> Status </th>          
                                    </tr>
                                </thead>
                                <tbody>
                                <?php

                                if(count($micron_results)>0){

                                    foreach($micron_results as $row)
                                    {
                                ?>
                                    <tr>
                                        <td> <?php echo $sn++;?></td>
                                        <td> <?php echo $row['name'];?> </td>
                                        <td>   
                                            <a class="btn btn-default btn-circle btn-sm tooltips" href="<?php echo SITE_URL.'edit_micron/'.cmm_encode($row['micron_id']);?>"  data-container="body" data-placement="top" data-original-title="Edit Details"><i class="fa fa-pencil"></i></a>
                                             <?php
                                            if($row['status']==1){
                                            ?>
                                            <a class="btn btn-danger btn-circle btn-sm"  onclick="return confirm('Are you sure you want to Deactivate?')" href="<?php echo SITE_URL.'deactivate_micron/'.cmm_encode($row['micron_id']);?>"><i class="fa fa-trash-o"></i></a>
                                            <?php
                                            }
                                            if($row['status']==2){
                                            ?>
                                            <a class="btn btn-info btn-circle btn-sm"  onclick="return confirm('Are you sure you want to Activate?')" href="<?php echo SITE_URL.'activate_micron/'.cmm_encode($row['micron_id']);?>"><i class="fa fa-check"></i></a>
                                            <?php
                                            }
                                            ?>
                                            
                                        </td>
                                    </tr>
                                <?php
                                    }
                                }
                                else
                                { ?>
                                    <tr><td colspan="3">-No Records Found-</td></tr>
                                <?php }
                                ?>
                                </tbody>
                            </table>
                        </div>
                        <div class="row">
                            <div class="col-md-5 col-sm-5">
                                <div class="dataTables_info" role="status" aria-live="polite">
                                    <?php echo @$pagermessage; ?>
                                </div>
                            </div>
                            <div class="col-md-7 col-sm-7">
                                <div class="dataTables_paginate paging_bootstrap_full_number">
                                    <?php echo @$pagination_links; ?>
                                </div>
                            </div>
                        </div> 
                    <?php
                    }
                    ?>
                </div>
            </div>
            <!-- END BORDERED TABLE PORTLET-->
        </div>
    </div>               
</div>

<!-- END PAGE CONTENT INNER -->

<?php $this->load->view('commons/main_footer', $nestedView); ?>
