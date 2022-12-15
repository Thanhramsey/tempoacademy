<?php echo form_open_multipart('admin/monhoc/update/'.$row['id']); ?>
<div class="content-wrapper">
	<form action="<?php echo base_url() ?>admin/monhoc/update.html" enctype="multipart/form-data" method="POST" accept-charset="utf-8">
		<section class="content-header">
			<h1><i class="glyphicon glyphicon-cd"></i> Cập nhật môn học</h1>
			<div class="breadcrumb">
				<button type = "submit" class="btn btn-primary btn-sm">
					<span class="glyphicon glyphicon-floppy-save"></span>
					Lưu[Cập nhật]
				</button>
				<a class="btn btn-primary btn-sm" href="admin/monhoc" role="button">
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
									<label>Tên môn học <span class = "maudo">(*)</span></label>
									<input type="text" class="form-control" name="name" style="width:300px;" placeholder="Tên môn học" value="<?php echo $row['name'] ?>">
									<div class="error" id="password_error"><?php echo form_error('name')?></div>
								</div>
								<div class="form-group">
									<label>Trạng thái</label>
									<select name="status" class="form-control" style="width:300px">
										<option value = "">[--Chọn trạng thái--]</option>
										<option value="1" <?php if($row['status'] == 1) {echo 'selected';}?> >Đang kinh doanh</option>
										<option value="0" <?php if($row['status'] == 0) {echo 'selected';}?>>Ngưng kinh doanh</option>
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