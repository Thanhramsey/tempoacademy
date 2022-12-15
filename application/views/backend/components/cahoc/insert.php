<?php echo form_open_multipart('admin/cahoc/insert'); ?>
<div class="content-wrapper">
	<form action="<?php echo base_url() ?>admin/cahoc/insert.html" enctype="multipart/form-data" method="POST" accept-charset="utf-8">
		<section class="content-header">
			<h1><i class="glyphicon glyphicon-cd"></i> Thêm ca học mới</h1>
			<div class="breadcrumb">
				<button type="submit" class="btn btn-primary btn-sm">
					<span class="glyphicon glyphicon-floppy-save"></span>
					Lưu[Thêm]
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
							<div class="form-group">
								<label>Tên ca học <span class="maudo">(*)</span></label>
								<input type="text" class="form-control" name="name" style="width:50%" placeholder="Tên ca học">
								<div class="error" id="password_error"><?php echo form_error('name') ?></div>
							</div>
							<div class="form-group">
								<label>Môn học<span class="maudo">(*)</span></label>
								<select name="monId" class="form-control" style="width:50%">
									<option value="">[--Chọn ca học--]</option>
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
								<label>Thời gian bắt đầu<span class="maudo">(*)</span></label>
								<input type="text"  id="startTime" class="form-control" name="startTime" style="width:50%" placeholder="Thời gian" value="17:00 PM">
								<div class="error" id="password_error"><?php echo form_error('thoigian') ?></div>
							</div>
							<div class="form-group">
								<label>Thời gian kết thúc<span class="maudo">(*)</span></label>
								<input type="text"  id="endTime" class="form-control" name="endTime" style="width:50%" placeholder="Thời gian" value="18:30 PM">
								<div class="error" id="password_error"><?php echo form_error('thoigian') ?></div>
							</div>
							<div class="form-group">
								<label>Trạng thái</label>
								<select name="status" class="form-control" style="width:50%">
									<option value="">[--Chọn trạng thái--]</option>
									<option value="1">Đang hoạt động</option>
									<option value="0">Ngưng hoạt động</option>
								</select>
							</div>
						</div>
					</div><!-- /.box -->
				</div>
		</section>
	</form>
	<!-- /.content -->
</div><!-- /.content-wrapper -->

</script>