<?php echo form_open_multipart('admin/cahoc/index'); ?>
<div class="content-wrapper">
<form action="<?php echo base_url() ?>admin/cahoc/index.html" enctype="multipart/form-data" method="POST" accept-charset="utf-8">
	<section class="content-header">
		<h1><i class="glyphicon glyphicon-cd"></i> Danh mục ca học</h1>
		<div class="breadcrumb">
			<?php
			if ($user['role'] == 1) {
				echo '<a class="btn btn-primary btn-sm" href="' . base_url() . 'admin/cahoc/insert" role="button">
				<span class="glyphicon glyphicon-plus"></span> Thêm mới
				</a>';
			}
			?>
			<a class="btn btn-primary btn-sm" href="admin/cahoc/recyclebin" role="button">
				<span class="glyphicon glyphicon-trash"></span> Thùng rác (<?php $total = $this->Mcahoc->cahoc_trash_count();
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
						<select name="loaisp" id="loaisp" class="form-control">
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
											<th class="text-center">Tên ca học</th>
											<th class="text-center">Môn học</th>
											<th class="text-center">Thời gian bắt đầu</th>
											<th class="text-center">Thời gian kết thúc</th>
											<th class="text-center">Trạng thái</th>
											<th class="text-center" colspan="2">Thao tác</th>
										</tr>
									</thead>
									<tbody>
										<?php foreach ($list as $row) : ?>
											<tr>
												<td class="text-center"><?php echo $row['id'] ?></td>
												<td class="text-center"><?php echo $row['name'] ?></td>
												<td class="text-center"><?php
													$monhoc = $this->Mmonhoc->monhoc_detail($row['monId']);
													echo $monhoc['name'];
												?></td>
												<td class="text-center"><?php echo $row['startTime'] ?></td>
												<td class="text-center"><?php echo $row['endTime'] ?></td>
												<td class="text-center">
													<a href="<?php echo base_url() ?>admin/cahoc/status/<?php echo $row['id'] ?>">
														<?php if ($row['status'] == 1) : ?>
															<span class="glyphicon glyphicon-ok-circle mauxanh18"></span>
														<?php else : ?>
															<span class="glyphicon glyphicon-remove-circle maudo"></span>
														<?php endif; ?>
													</a>
												</td>
												<td class="text-center">
													<?php if ($user['role'] == 1) : ?>
														<a class="btn btn-success btn-xs" href="<?php echo base_url() ?>admin/cahoc/update/<?php echo $row['id'] ?>" role="button">
															<span class="glyphicon glyphicon-edit"></span>Sửa
														</a>
													<?php else : ?>
														<span class="glyphicon glyphicon-remove-circle maudo"></span>
													<?php endif; ?>
												</td>
												<td class="text-center">
													<a class="btn btn-danger btn-xs" href="<?php echo base_url() ?>admin/cahoc/trash/<?php echo $row['id'] ?>" onclick="return confirm('Xác nhận xóa ca học này ?')" role="button">
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