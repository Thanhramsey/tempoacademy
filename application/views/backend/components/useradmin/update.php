<?php echo form_open_multipart('admin/useradmin/update/'.$row['id']); ?>
<div class="content-wrapper">
    <form action="<?php echo base_url() ?>admin/useradmin/update.html" enctype="multipart/form-data" method="POST" accept-charset="utf-8">
        <section class="content-header">
            <h1><i class="glyphicon glyphicon-plus glyphicon"></i> Sửa thành viên</h1>
            <div class="breadcrumb">
                <button type = "submit" class="btn btn-primary btn-sm">
                    <span class="glyphicon glyphicon-floppy-save"></span>
                    Lưu[Sửa]
                </button>
				<?php 	$user_role = $this->session->userdata('sessionadmin');
									if ($user_role['role'] == 1) : ?>
					<a class="btn btn-primary btn-sm" href="admin/useradmin" role="button">
                   		 <span class="glyphicon glyphicon-remove do_nos"></span> Thoát
               		 </a>
				<?php else : ?>
					<a class="btn btn-primary btn-sm" href="admin" role="button">
                   		 <span class="glyphicon glyphicon-remove do_nos"></span> Thoát
               		 </a>
				<?php endif; ?>

            </div>
        </section>
        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-md-12">
                    <div class="box" id="view">
                        <div class="box-body">
                            <div class="col-md-9">
                                <div class="form-group">
                                    <label>Họ và tên <span class = "maudo">(*)</span></label>
                                    <input type="text" class="form-control" name="fullname" value="<?php echo $row['fullname'] ?>" >
                                    <div class="error" id="password_error"  style="color: red;"><?php echo form_error('fullname')?></div>
                                </div>
                                <div class="form-group">
                                    <label>Email <span class = "maudo">(*)</span></label>
                                    <input type="email" class="form-control" name="email" value="<?php echo $row['email'] ?>" disabled>
                                </div>
                                <div class="form-group">
                                    <label>Tên đăng nhập <span class = "maudo">(*)</span></label>
                                    <input type="text" class="form-control" name="username" value="<?php echo $row['username']?>" disabled>
                                </div>
                                <div class="form-group">
                                    <label>Mật khẩu <span class = "maudo">(*)</span></label>
                                    <input type="password" class="form-control" name="password">
                                    <div class="error" id="password_error"  style="color: red;"><?php echo form_error('password')?></div>
                                </div>
                                <div class="form-group">
                                    <label>Điện thoại <span class = "maudo">(*)</span></label>
                                    <input type="text" class="form-control" name="phone" value="<?php echo $row['phone'] ?>" disabled>
                                </div>
                                <div class="form-group">
                                    <label>Địa chỉ <span class = "maudo">(*)</span></label>
                                    <input type="text" class="form-control" name="address" value="<?php echo $row['address'] ?>" >
                                    <div class="error" id="password_error" style="color: red;"><?php echo form_error('address')?></div>
                                </div>
								<div class="form-group">
									<label>Chi tiết doanh nghiệp</label>
									<textarea name="detail" id="detail" class="form-control"><?php echo $row['detail'] ?></textarea>
									<script>CKEDITOR.replace('detail');</script>
								</div>

                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label>Giới tính</label>
                                    <select name="gender" class="form-control">
                                        <option value="1" <?php if($row['gender'] == 1) {echo 'selected';}?> >Nam</option>
                                        <option value="0" <?php if($row['gender'] == 0) {echo 'selected';}?>>Nữ</option>
                                    </select>
                                </div>
                                <div class="form-group">
									<div class="anh">
										<!-- Chứa ảnh ở đây -->
										<img src="public/images/admin/<?php echo $row['img'] ?>" style ="width:100%; height:100%" id="output"/>
									</div>
                                    <label>Ảnh đại diện</label>
                                    <input type="file"  id="image_list" name="image" style="width: 100%" onchange="loadFile(event)">
                                </div>
								<?php
									$user_role = $this->session->userdata('sessionadmin');
									if ($user_role['role'] == 1) : ?>
										<div class="form-group">
											<label>Trạng thái</label>
											<select name="status" class="form-control">
												<option value="1" <?php if($row['status'] == 1) {echo 'selected';}?> >Kích hoạt</option>
												<option value="0" <?php if($row['status'] == 0) {echo 'selected';}?>>Chưa kích hoạt</option>
											</select>
										</div>
										<div class="form-group">
											<label>Sao đánh giá</label>
											<input class="form-control" type="number" min="1" max="5"  id="star" name="star"  value="<?php echo $row['star'] ?>">
										</div>
								<?php endif; ?>
                            </div>
                        </div>
                    </div><!-- /.box -->
                </div>
            <!-- /.col -->
          </div>
          <!-- /.row -->
        </section>
    </form>
<!-- /.content -->
</div><!-- /.content-wrapper -->

<script>
	var loadFile = function(event) {
    var output = document.getElementById('output');
    output.src = URL.createObjectURL(event.target.files[0]);
    output.onload = function() {
      URL.revokeObjectURL(output.src) // free memory
    }
  };
</script>