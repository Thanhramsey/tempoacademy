<div class="content-wrapper">
	<section class="content-header">
		<h1><i class="glyphicon glyphicon-book"></i> Danh sách văn bản</h1>
		<div class="breadcrumb">

			<?php
			if($user['role']==1){
				echo '<a class="btn btn-primary btn-sm" href="'.base_url().'admin/chinhsach/insert" role="button">
				<span class="glyphicon glyphicon-plus"></span> Thêm mới
				</a>';
			}
			?>
			<a class="btn btn-primary btn-sm" href="<?php echo base_url()?>admin/chinhsach/recyclebin" role="button">
				<span class="glyphicon glyphicon-trash"></span> Thùng rác(<?php $total=$this->Mchinhsach->chinhsach_trash_count(); echo $total; ?>)
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
											<th class="text-center">Tên văn bản</th>
											<th class="text-center">Số hiệu</th>
											<th class="text-center">Loại văn bản</th>
											<th class="text-center">Cơ quan ban hành</th>
											<th class="text-center">Lĩnh vực</th>
											<th class="text-center">Download</th>
											<th class="text-center" colspan="2">Thao tác</th>
											</tr>
										</thead>
										<tbody>
											<?php foreach ($list as $row):?>
												<tr>
													<td class="text-center id-col"><?php echo $row['id'] ?></td>
													<td><?php echo $row['name'] ?></td>
													<td><?php echo $row['sohieu'] ?></td>
													<td><?php echo $row['loaivanban_name'] ?></td>
													<td><?php echo $row['coquanbanhanh'] ?></td>
													<td><?php echo $row['linhvuc'] ?></td>
													<td class="text-center">
														<a href="<?php echo base_url() ?>public/images/chinhsach/<?php echo $row['file'] ?>">
														Download
														</a>
													</td>
														<?php
														if($user['role']==1){
															echo '<td class="text-center">
															<a class="btn btn-success btn-xs" href="admin/chinhsach/update/'.$row['id'].'" role = "button">
															<span class="glyphicon glyphicon-edit"></span>Sửa
															</a>
															</td>';
														}
														?>

														<td class="text-center">
															<a class="btn btn-danger btn-xs" href="<?php echo base_url() ?>admin/chinhsach/trash/<?php echo $row['id'] ?>" onclick="return confirm('Xác nhận xóa văn bản này ?')" role = "button">
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