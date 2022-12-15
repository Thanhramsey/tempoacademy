<div class="content-wrapper">
	<section class="content-header">
		<h1><i class="glyphicon glyphicon-cd"></i> Danh mục môn học</h1>
		<div class="breadcrumb">
			<?php
			if($user['role']==1){
				echo '<a class="btn btn-primary btn-sm" href="'.base_url().'admin/monhoc/insert" role="button">
				<span class="glyphicon glyphicon-plus"></span> Thêm mới
				</a>';
			}
			?>
			<a class="btn btn-primary btn-sm" href="admin/monhoc/recyclebin" role="button">
				<span class="glyphicon glyphicon-trash"></span> Thùng rác (<?php $total=$this->Mmonhoc->monhoc_trash_count(); echo $total; ?>)
			</a>
		</div>
	</section>
	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-md-12">
				<div class="box" id="view">
					<!-- /.box-header -->
					<div class="box-body">
						<?php  if($this->session->flashdata('success')):?>
							<div class="row">
								<div class="alert alert-success">
									<?php echo $this->session->flashdata('success'); ?>
									<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
								</div>
							</div>
						<?php  endif;?>
						<?php  if($this->session->flashdata('error')):?>
							<div class="row">
								<div class="alert alert-error">
									<?php echo $this->session->flashdata('error'); ?>
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
											<th class="text-center">ID</th>
											<th class="text-center">Tên môn học</th>
											<th class="text-center">Trạng thái</th>
											<th class="text-center" colspan="2">Thao tác</th>
										</tr>
									</thead>
									<tbody>
										<?php foreach ($list as $row):?>
											<tr>
												<td class="text-center"><?php echo $row['id'] ?></td>
												<td class="text-center"><?php echo $row['name'] ?></td>
											<td class="text-center">
												<a href="<?php echo base_url() ?>admin/monhoc/status/<?php echo $row['id'] ?>">
													<?php if($row['status']==1):?>
														<span class="glyphicon glyphicon-ok-circle mauxanh18"></span>
														<?php else: ?>
															<span class="glyphicon glyphicon-remove-circle maudo"></span>
														<?php endif; ?>
													</a>
												</td>
												<td class="text-center">
													<?php if($user['role']==1):?>
														<a class="btn btn-success btn-xs" href="<?php echo base_url() ?>admin/monhoc/update/<?php echo $row['id'] ?>"  role = "button">
														<span class="glyphicon glyphicon-edit"></span>Sửa
														</a>
														<?php else: ?>
															<span class="glyphicon glyphicon-remove-circle maudo"></span>
														<?php endif; ?>
												</td>
												<td class="text-center">
													<a class="btn btn-danger btn-xs" href="<?php echo base_url() ?>admin/monhoc/trash/<?php echo $row['id'] ?>" onclick="return confirm('Xác nhận xóa môn học này ?')" role = "button">
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