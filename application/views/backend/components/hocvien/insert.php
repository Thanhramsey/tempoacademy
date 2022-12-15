<?php echo form_open_multipart('admin/hocvien/insert'); ?>
<div class="content-wrapper">
	<form action="<?php echo base_url() ?>admin/hocvien/insert.html" enctype="multipart/form-data" method="POST" accept-charset="utf-8">
		<section class="content-header">
			<h1><i class="glyphicon glyphicon-cd"></i> Thêm học viên mới</h1>
			<div class="breadcrumb">
				<button type="submit" class="btn btn-primary btn-sm">
					<span class="glyphicon glyphicon-floppy-save"></span>
					Lưu[Thêm]
				</button>
				<a class="btn btn-primary btn-sm" href="admin/hocvien" role="button">
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
							<div class="col-md-6">
								<div class="form-group">
									<label>Tên học viên <span class="maudo">(*)</span></label>
									<input type="text" class="form-control" name="name" style="width:70%" placeholder="Tên học viên">
									<div class="error" id="password_error"><?php echo form_error('name') ?></div>
								</div>
								<div class="form-group">
									<label>Tên học viên <span class="maudo">(*)</span></label>
									<input type="text" class="form-control" name="name" style="width:70%" placeholder="Tên học viên">
									<div class="error" id="password_error"><?php echo form_error('name') ?></div>
								</div>
								<div class="form-group">
									<label>Tên học viên <span class="maudo">(*)</span></label>
									<input type="text" class="form-control" name="name" style="width:70%" placeholder="Tên học viên">
									<div class="error" id="password_error"><?php echo form_error('name') ?></div>
								</div>
								<div class="form-group">
									<label>Tên học viên <span class="maudo">(*)</span></label>
									<input type="text" class="form-control" name="name" style="width:70%" placeholder="Tên học viên">
									<div class="error" id="password_error"><?php echo form_error('name') ?></div>
								</div>
								<div class="form-group">
									<label>Tên học viên <span class="maudo">(*)</span></label>
									<input type="text" class="form-control" name="name" style="width:70%" placeholder="Tên học viên">
									<div class="error" id="password_error"><?php echo form_error('name') ?></div>
								</div>

							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label>Môn học<span class="maudo">(*)</span></label>
									<select name="monId" class="form-control" style="width:70%">
										<option value="">[--Chọn học viên--]</option>
										<?php
										$list = $this->Mmonhoc->monhoc_list();
										$option_parentid = "";
										foreach ($list as $r) {
											$option_parentid .= "<option value='" . $r['id'] . "'>" . $r['name'] . "</option>";
										}
										echo $option_parentid;
										?>
									</select>
									<div class="error" id="password_error"><?php echo form_error('monId') ?></div>
								</div>
								<div class="form-group">
									<label>Môn học<span class="maudo">(*)</span></label>
									<select name="monId" class="form-control" style="width:70%">
										<option value="">[--Chọn học viên--]</option>
										<?php
										$list = $this->Mmonhoc->monhoc_list();
										$option_parentid = "";
										foreach ($list as $r) {
											$option_parentid .= "<option value='" . $r['id'] . "'>" . $r['name'] . "</option>";
										}
										echo $option_parentid;
										?>
									</select>
									<div class="error" id="password_error"><?php echo form_error('monId') ?></div>
								</div>
								<div class="form-group">
									<label>Trạng thái</label>
									<select name="status" class="form-control" style="width:70%">
										<option value="">[--Chọn trạng thái--]</option>
										<option value="1">Đang hoạt động</option>
										<option value="0">Ngưng hoạt động</option>
									</select>
								</div>
							</div>

						</div>
					</div><!-- /.box -->
				</div>
		</section>
	</form>
	<!-- /.content -->
</div><!-- /.content-wrapper -->

</script>