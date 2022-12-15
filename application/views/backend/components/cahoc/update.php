<?php echo form_open_multipart('admin/cahoc/update/' . $row['id']); ?>
<?php
$list = $this->Mmonhoc->monhoc_list();
$option_parentid = "";
foreach ($list as $r) {
	if ($r['id'] == $row['monId']) {
		$option_parentid .= "<option selected value='" . $r['id'] . "'>" . $r['name'] . "</option>";
	} else {
		$option_parentid .= "<option value='" . $r['id'] . "'>" . $r['name'] . "</option>";
	}
} ?>
<div class="content-wrapper">
	<form action="<?php echo base_url() ?>admin/cahoc/update.html" enctype="multipart/form-data" method="POST" accept-charset="utf-8">
		<section class="content-header">
			<h1><i class="glyphicon glyphicon-cd"></i> Cập nhật ca học</h1>
			<div class="breadcrumb">
				<button type="submit" class="btn btn-primary btn-sm">
					<span class="glyphicon glyphicon-floppy-save"></span>
					Lưu[Cập nhật]
				</button>
				<a class="btn btn-primary btn-sm" href="admin/cahoc" role="button">
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
								<div class="form-group">
									<label>Tên ca học <span class="maudo">(*)</span></label>
									<input type="text" class="form-control" name="name" style="width:300px;" placeholder="Tên ca học" value="<?php echo $row['name'] ?>">
									<div class="error" id="password_error"><?php echo form_error('name') ?></div>
								</div>
								<div class="form-group">
									<label>Môn học<span class="maudo">(*)</span></label>
									<select name="monId" class="form-control" style="width:300px;">
										<option value="">[--Chọn môn học-]</option>
										<option value="0">No Parent</option>
										<?php
										echo $option_parentid;
										?>
									</select>
									<div class="error" id="password_error"><?php echo form_error('monId') ?></div>
								</div>
								<div class="form-group">
								<label>Thời gian bắt đầu<span class="maudo">(*)</span></label>
								<input type="text"  id="startTime" class="form-control" name="startTime" style="width:50%" placeholder="Thời gian" value="<?php echo $row['startTime'] ?>">
								<div class="error" id="password_error"><?php echo form_error('thoigian') ?></div>
							</div>
							<div class="form-group">
								<label>Thời gian kết thúc<span class="maudo">(*)</span></label>
								<input type="text"  id="endTime" class="form-control" name="endTime" style="width:50%" placeholder="Thời gian" value="<?php echo $row['endTime'] ?>">
								<div class="error" id="password_error"><?php echo form_error('thoigian') ?></div>
							</div>
								<div class="form-group">
									<label>Trạng thái</label>
									<select name="status" class="form-control" style="width:300px">
										<option value="">[--Chọn trạng thái--]</option>
										<option value="1" <?php if ($row['status'] == 1) {
																echo 'selected';
															} ?>>Đang hoạt động</option>
										<option value="0" <?php if ($row['status'] == 0) {
																echo 'selected';
															} ?>>Ngưng hoạt động</option>
									</select>
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