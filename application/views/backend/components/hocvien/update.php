<?php echo form_open_multipart('admin/hocvien/insert'); ?>
<?php
$list = $this->Mmonhoc->monhoc_list();
$option_parentid = "";
foreach ($list as $r) {
	if ($r['id'] == $row['monId']) {
		$option_parentid .= "<option selected value='" . $r['id'] . "'>" . $r['name'] . "</option>";
	} else {
		$option_parentid .= "<option value='" . $r['id'] . "'>" . $r['name'] . "</option>";
	}
}
$listCa = $this->Mcahoc->cahoc_list();
$option_ca =  "";
foreach ($listCa as $r) {
	if ($r['id'] == $row['cahocId']) {
		$option_ca .= "<option selected value='" . $r['id'] . "'>" . $r['name'] . "</option>";
	} else {
		$option_ca .= "<option value='" . $r['id'] . "'>" . $r['name'] . "</option>";
	}
}
?>
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
									<input type="text" class="form-control" name="name" style="width:70%" placeholder="Tên học viên" value="<?php echo $row['name'] ?>">
									<div class="error" id="password_error"><?php echo form_error('name') ?></div>
								</div>
								<div class="form-group">
									<label>Năm sinh</label>
									<input type="number" class="form-control" name="ngaysinh" style="width:70%" placeholder="Năm sinh" value="<?php echo $row['ngaysinh'] ?>">
								</div>
								<div class="form-group">
									<label>Số điện thoại</label>
									<input type="text" class="form-control" name="phone" style="width:70%" placeholder="Số điện thoại" value="<?php echo $row['phone'] ?>">
								</div>
								<div class="form-group">
									<label>Địa chỉ</label>
									<input type="text" class="form-control" name="diachi" style="width:70%" placeholder="Địa chỉ" value="<?php echo $row['diachi'] ?>">
								</div>
								<div class="form-group">
									<label>Ảnh học sinh</label>
									<input type="file" id="image" name="img" onchange="loadFile(event)" style="display:none">
									<label for="image" class="btn-upload-img">Chọn file</label>
									<div class="anh" style="width:250px; height:250px; border:1px dashed black; padding: 5px">
										<img style="width:100%; height:100%;border-radius:10px" id="output" src="<?php echo base_url() ?>public/images/hocvien/<?php echo $row['img'] ?>"/>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label>Môn học<span class="maudo">(*)</span></label>
									<select id="loaisp" name="monId" class="form-control" style="width:70%" onchange="loadCahoc()">
										<option value="">[--Chọn môn học-]</option>
										<option value="0">No Parent</option>
										<?php
										echo $option_parentid;
										?>
									</select>
									<div class="error" id="password_error"><?php echo form_error('monId') ?></div>
								</div>
								<div class="form-group">
									<label>Môn học</label>
									<select name="cahocId" id="caId" class="form-control"  style="width:70%">
										<option value="">[--Chọn ca học-]</option>
										<option value="0">No Parent</option>
										<?php
										echo $option_ca;
										?>
									</select>
									<div class="error" id="password_error"><?php echo form_error('cahocId') ?></div>
								</div>
								<div class="form-group">
									<label>Giới tính</label>
									<select name="status" class="form-control" style="width:70%">
										<option value="1" <?php if ($row['gioitinh'] == 1) {
																echo 'selected';
															} ?>>Nam</option>
										<option value="0" <?php if ($row['gioitinh'] == 0) {
																echo 'selected';
															} ?>>Nữ</option>
									</select>
								</div>
								<div class="form-group">
									<label>Trạng thái</label>
									<select name="status" class="form-control" style="width:70%">
										<option value="1" <?php if ($row['status'] == 1) {
																echo 'selected';
															} ?>>Hoạt động</option>
										<option value="0" <?php if ($row['status'] == 0) {
																echo 'selected';
															} ?>>Ngừng hoạt động</option>
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

<script>
		function loadCahoc(){
			var strurl="<?php echo base_url();?>"+'/admin/cahoc/listCaHoc/'+$("#loaisp").val();
			jQuery.ajax({
				url: strurl,
				type: 'GET',
				dataType: 'json',
				success: function(data) {
					if(data){
						$("#caId").html(data.message);
					}else{
						$("#caId").html("");
					}

				}
			});
		}

		var loadFile = function(event) {
		var output = document.getElementById('output');
		output.src = URL.createObjectURL(event.target.files[0]);
		output.onload = function() {
			URL.revokeObjectURL(output.src) // free memory
		}
	};
</script>