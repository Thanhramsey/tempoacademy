<div class="content-wrapper">
	<section class="content-header">
		<h1><i class="glyphicon glyphicon-grain"></i> Danh sách kết nối cung cầu</h1>
		<div class="breadcrumb">
			<a class="btn btn-primary btn-sm" href="<?php echo base_url()?>admin/cungcau/recyclebin" role="button">
				<span class="glyphicon glyphicon-trash"></span> Thùng rác(<?php $total=$this->Mcungcau->cungcau_trash_count(); echo $total; ?>)
			</a>
		</div>
	</section>
	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-md-12">
				<div class="box" id="view">
					<div class="box-header with-border">
						<!-- /.box-header -->
						<?php  if($this->session->userdata('message')):?>
							<div class="alert alert-success">
								<?php echo $this->session->userdata('message'); ?>
								<button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
							</div>
						<?php endif; ?>
						<div class="box-body">
							<?php  if($this->session->flashdata('success')):?>
								<div class="row">
									<div class="alert alert-success">
										<?php echo $this->session->flashdata('success'); ?>
										<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
									</div>
								</div>
							<?php  endif;?>
							<div class="row" style='padding:0px; margin:0px;'>
								<!--ND-->
								<div class="table-responsive">
									<table class="table table-hover table-bordered">
										<thead>
											<tr>
											<th class="text-center id-col">id</th>
											<th class="text-center">Tên người đăng</th>
											<th class="text-center">Số điện thoại</th>
											<th class="text-center">Địa chỉ</th>
											<th class="text-center">Tiêu đề</th>
											<th class="text-center">Nội dung</th>
											<th class="text-center">Lượt xem</th>
											<th class="text-center">Trạng thái</th>
											<th class="text-center">Thao tác</th>
											</tr>
										</thead>
										<tbody>
											<?php foreach ($list as $row):?>
												<tr>
													<td class="text-center id-col"><?php echo $row['id'] ?></td>
													<td><?php echo $row['nguoidang'] ?></td>
													<td><?php echo $row['phone'] ?></td>
													<td><?php echo $row['address'] ?></td>
													<td><?php echo $row['tieude'] ?></td>
													<td><?php echo $row['detail'] ?></td>
													<td><?php echo $row['luotxem'] ?></td>
													<td class="text-center">
														<a href="<?php echo base_url() ?>admin/cungcau/status/<?php echo $row['id'] ?>">
															<?php if($row['status']==1):?>
																<span class="glyphicon glyphicon-ok-circle mauxanh18"></span>
															<?php else: ?>
																<span class="glyphicon glyphicon-remove-circle maudo"></span>
															<?php endif; ?>
														</a>
													</td>
													<td class="text-center">
														<a class="btn btn-danger btn-xs" href="<?php echo base_url() ?>admin/cungcau/trash/<?php echo $row['id'] ?>" onclick="return confirm('Xác nhận xóa văn bản này ?')" role = "button">
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
</div><!-- /.content-wrapper -->