<?php echo form_open_multipart('admin/producer/update/' . $row['id']); ?>
<div class="content-wrapper">
	<form action="<?php echo base_url() ?>admin/producer/update.html" enctype="multipart/form-data" method="POST" accept-charset="utf-8">
		<section class="content-header">
			<h1><i class="glyphicon glyphicon-text-background"></i> Cập nhật địa bàn</h1>
			<div class="breadcrumb">
				<button type="submit" class="btn btn-primary btn-sm">
					<span class="glyphicon glyphicon-floppy-save"></span>
					Lưu[Cập nhật]
				</button>
				<a class="btn btn-primary btn-sm" href="admin/producer" role="button">
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
							<div class="col-md-9">
								<?php echo validation_errors(); ?>
								<div class="box-body">
									<div class="col-md-9">
										<div class="form-group">
											<label>Tên địa bàn</label>
											<input type="text" class="form-control" name="name" placeholder="Tên nhà cung cấp" value="<?php echo $row['name'] ?>">
											<div class="error" id="password_error" style="color: red"><?php echo form_error('name') ?></div>
										</div>
										<div class="form-group">
											<label>Maps</label>
											<input type="text" class="form-control" name="iframe" placeholder="maps">
											<span style="font-style: italic; line-height: 32px;">Chú ý: bỏ iframe địa bàn lấy trên google maps</span>
											<a target="_blank" href="https://themevi.com/cach-lay-iframe-google-maps-de-chen-vao-website/#gsc.tab=0">click</a>
											<div class="error" id="password_error" style="color: red"><?php echo form_error('keyword') ?></div>
										</div>
										<div class="form-group">
											<div class="form-group">
												<label>Ảnh đại diện</label>
												<input type="file" id="image_xa" name="img">
											</div>
										</div>
										<div class="form-group">
											<label>Chi tiết địa bàn</label>
											<textarea name="detail" id="detail" class="form-control"><?php echo $row['detail'] ?></textarea>
											<script>CKEDITOR.replace('detail');</script>
										</div>
										<div class="form-group">
											<label>Trạng thái</label>
											<select name="status" class="form-control">
												<option value="1" <?php if ($row['status'] == 1) {
																		echo 'selected';
																	} ?>>Đang hoạt động</option>
												<option value="0" <?php if ($row['status'] == 0) {
																		echo 'selected';
																	} ?>>Ngừng họt động</option>
											</select>
										</div>
									</div>
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