<?php echo form_open_multipart('admin/hocvien/index'); ?>
<div class="content-wrapper">
<form action="<?php echo base_url() ?>admin/hocvien/index.html" enctype="multipart/form-data" method="POST" accept-charset="utf-8">
	<section class="content-header">
		<h1><i class="glyphicon glyphicon-cd"></i> Danh mục học viên</h1>
		<div class="breadcrumb">
			<?php
			if ($user['role'] == 1) {
				echo '<a class="btn btn-primary btn-sm" href="' . base_url() . 'admin/hocvien/insert" role="button">
				<span class="glyphicon glyphicon-plus"></span> Thêm mới
				</a>';
			}
			?>
			<a class="btn btn-primary btn-sm" href="admin/hocvien/recyclebin" role="button">
				<span class="glyphicon glyphicon-trash"></span> Thùng rác (<?php $total = $this->Mhocvien->hocvien_trash_count();
																			echo $total; ?>)
			</a>
		</div>
	</section>
	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-md-12">
				<div class="col-md-4">
					<div class="form-group">
						<label>Môn</label>
						<select name="loaisp" id="loaisp" class="form-control" onchange="loadCahoc()">
							<option value="">[--Chọn môn--]
								<?php
								$monhoc_list = $this->Mmonhoc->monhoc_list();
								$option_parentid = "";
								foreach ($monhoc_list as $r) {
									$option_parentid .= "<option value='" . $r['id'] . "'>" . $r['name'] . "</option>";
								}
								echo $option_parentid;
								?>
							</option>
						</select>
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label>Ca</label>
						<select name="caId" id="caId" class="form-control">
						</select>
					</div>
				</div>
				<div class="col-md-4" style="padding-top: 25px;">
					<button type="submit" class="btn btn-primary btn-sm">
						<span class="glyphicon glyphicon-search"></span>
						Tìm kiếm
					</button>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="box" id="view">
					<!-- /.box-header -->
					<div class="box-body">
						<?php if ($this->session->flashdata('success')) : ?>
							<div class="row">
								<div class="alert alert-success">
									<?php echo $this->session->flashdata('success'); ?>
									<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
								</div>
							</div>
						<?php endif; ?>
						<?php if ($this->session->flashdata('error')) : ?>
							<div class="row">
								<div class="alert alert-error">
									<?php echo $this->session->flashdata('error'); ?>
									<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
								</div>
							</div>
						<?php endif; ?>
						<div class="row" style='padding:0px; margin:0px;'>
							<!--ND-->
							<div class="table-responsive">
								<table class="table table-hover table-bordered">
									<thead>
										<tr>
											<th class="text-center">ID</th>
											<th class="text-center">Tên học viên</th>
											<th class="text-center">Năm sinh</th>
											<th class="text-center">giới tính</th>
											<th class="text-center">SĐT</th>
											<th class="text-center">Môn học</th>
											<th class="text-center">Ca học</th>
											<th class="text-center">Trạng thái</th>
											<th class="text-center" colspan="2">Thao tác</th>
										</tr>
									</thead>
									<tbody>
										<?php foreach ($list as $row) : ?>
											<tr>
												<td class="text-center"><?php echo $row['id'] ?></td>
												<td class="text-center"><?php echo $row['name'] ?></td>
												<td class="text-center"><?php echo $row['ngaysinh'] ?></td>
												<td class="text-center"><?php echo $row['gioitinh'] ?></td>
												<td class="text-center"><?php echo $row['phone'] ?></td>
												<td class="text-center"><?php
													$monhoc = $this->Mmonhoc->monhoc_detail($row['monId']);
													echo $monhoc['name'];
												?></td>
												<td class="text-center"><?php
													if ($row['cahocId'] != 0){
														$cahoc = $this->Mcahoc->cahoc_detail($row['cahocId']);
														echo $cahoc['name'];
													}else{
														echo "Chưa xếp ca";
													}
												?></td>
												<td class="text-center">
													<a href="<?php echo base_url() ?>admin/hocvien/status/<?php echo $row['id'] ?>">
														<?php if ($row['status'] == 1) : ?>
															<span class="glyphicon glyphicon-ok-circle mauxanh18"></span>
														<?php else : ?>
															<span class="glyphicon glyphicon-remove-circle maudo"></span>
														<?php endif; ?>
													</a>
												</td>
												<td class="text-center">
													<?php if ($user['role'] == 1) : ?>
														<a class="btn btn-success btn-xs" href="<?php echo base_url() ?>admin/hocvien/update/<?php echo $row['id'] ?>" role="button">
															<span class="glyphicon glyphicon-edit"></span>Sửa
														</a>
													<?php else : ?>
														<span class="glyphicon glyphicon-remove-circle maudo"></span>
													<?php endif; ?>
												</td>
												<td class="text-center">
													<a class="btn btn-danger btn-xs" href="<?php echo base_url() ?>admin/hocvien/trash/<?php echo $row['id'] ?>" onclick="return confirm('Xác nhận xóa học viên này ?')" role="button">
														<span class="glyphicon glyphicon-trash"></span>Xóa
													</a>
												</td>
											</tr>
										<?php endforeach; ?>
									</tbody>
								</table>
							</div>
							<div class="row">
								<div class="col-md-12 text-center">
									<ul class="pagination">
										<?php echo $strphantrang ?>
									</ul>
								</div>
							</div>
							<!-- /.ND -->
						</div>
					</div><!-- ./box-body -->
				</div><!-- /.box -->
			</div>
			<!-- /.col -->
		</div>
		<!-- /.row -->
	</section>
	<!-- /.content -->
</form>
</div><!-- /.content-wrapper -->

<script type="text/javascript">
    function sortby(option){
        var strurl="<?php echo base_url();?>"+'/admin/cahoc';
        jQuery.ajax({
            url: strurl,
            type: 'POST',
            dataType: 'json',
            data: {'sapxep': option},
            success: function(data) {
                $('#list-product').html(data);
            }
        });
    }
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
</script>