<?php echo form_open_multipart('admin/chinhsach/update/'.$row['id']); ?>
<div class="content-wrapper">
	<form action="<?php echo base_url() ?>admin/chinhsach/update.html" enctype="multipart/form-data" method="POST" accept-charset="utf-8">
		<section class="content-header">
			<h1><i class="glyphicon glyphicon-text-background"></i> Cập nhật văn bản</h1>
			<div class="breadcrumb">
				<button type = "submit" class="btn btn-primary btn-sm">
					<span class="glyphicon glyphicon-floppy-save"></span>
					Lưu[Cập nhật]
				</button>
				<a class="btn btn-primary btn-sm" href="admin/chinhsach" role="button">
					<span class="glyphicon glyphicon-remove do_nos"></span> Thoát
				</a>
			</div>
		</section>
		<!-- Main content -->
		<section class="content">
			<div class="row">
				<div class="col-md-12">
					<div class="box" id="view">
						<div class="box-body">
							<div class="col-md-12">
							<?php echo validation_errors(); ?>
								<div class="box-body">
								<div class="col-md-10">
									<div class="form-group">
											<label>Tên văn bản<span class="maudo">(*)</span></label>
											<input value="<?php echo $row['name'] ?>" type="text" class="form-control" name="name" style="width:100%" placeholder="Tên văn bản">
											<div class="error" id="password_error"><?php echo form_error('name') ?></div>
										</div>
										<div class="row">
											<div class="col-md-12">
												<div class="col-md-4" style="padding-left: 0px;">
													<div class="form-group">
														<label>Loại văn bản<span class="maudo">(*)</span></label>
														<select name="loaivanban" class="form-control" id="loaivanban">
															<option value="">[--Chọn loại văn bản--]</option>
															<option value=1	<?php if($row['loaivanban'] == 1) {echo 'selected';}?>>Văn bản</option>
															<option value=2	<?php if($row['loaivanban'] == 2) {echo 'selected';}?>>Quyết định</option>
															<option value=3	<?php if($row['loaivanban'] == 3) {echo 'selected';}?>>Nghị quyết</option>
															<option value=4	<?php if($row['loaivanban'] == 4) {echo 'selected';}?>>Thông báo</option>
															<option value=5	<?php if($row['loaivanban'] == 5) {echo 'selected';}?>>Tờ trình</option>
															<option value=6	<?php if($row['loaivanban'] == 6) {echo 'selected';}?>>Báo cáo</option>
														</select>
														<input type="hidden" name="loaivanban_name" id="loaivanban_name">
														<div class="error" id="password_error"><?php echo form_error('loaivanban') ?></div>
													</div>
												</div>
												<div class="col-md-4" style="padding-right: 0px;">
													<div class="form-group">
														<label>Số hiệu</label>
														<input value="<?php echo $row['sohieu'] ?>" type="text" class="form-control" name="sohieu" style="width:100%" placeholder="Số hiệu">
														<div class="error" id="password_error"><?php echo form_error('sohieu') ?></div>
													</div>
												</div>
												<div class="col-md-4" style="padding-right: 0px;">
													<div class="form-group">
														<label>Lĩnh vực</label>
														<input value="<?php echo $row['linhvuc'] ?>" type="text" class="form-control" name="linhvuc" style="width:100%" placeholder="Lĩnh vực">
														<div class="error" id="password_error"><?php echo form_error('linhvuc') ?></div>
													</div>
												</div>
											</div>
										</div>
										<div class="form-group">
											<label>Trích yếu</label>
											<input value="<?php echo $row['trichyeu'] ?>" type="text" class="form-control" name="trichyeu" style="width:100%" placeholder="Trích yếu">
											<div class="error" id="password_error"><?php echo form_error('trichyeu') ?></div>
										</div>
										<div class="form-group">
											<label>Ngày ban hành</label>
											<input value="<?php echo $row['ngaybanhanh'] ?>" type="text" class="form-control" name="ngaybanhanh" style="width:100%" placeholder="Ngày ban hành">
											<div class="error" id="password_error"><?php echo form_error('ngaybanhanh') ?></div>
										</div>
										<div class="form-group">
											<label>File văn bản</label>
											<input type="file"  id="file_pdf" name="file_pdf">
										</div>
										<div class="form-group">
											<label>Trạng thái</label>
											<select name="status" class="form-control">
												<option value="1" <?php if($row['status'] == 1) {echo 'selected';}?> >Kích hoạt</option>
												<option value="0" <?php if($row['status'] == 0) {echo 'selected';}?>>Chưa kích hoạt</option>
											</select>
										</div>
									</div>
								<!-- </div> -->
								</div>
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