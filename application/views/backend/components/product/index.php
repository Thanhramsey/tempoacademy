<?php echo form_open_multipart('admin/product/index'); ?>
<div class="content-wrapper">
<form action="<?php echo base_url() ?>admin/product/index.html" enctype="multipart/form-data" method="POST" accept-charset="utf-8">
	<section class="content-header">
		<h1><i class="glyphicon glyphicon-cd"></i> Danh sách sản phẩm</h1>
		<div class="breadcrumb">

			<!-- <?php
					if ($user['role'] == 1) {
						echo '<a class="btn btn-primary btn-sm" href="' . base_url() . 'admin/product/insert" role="button">
				<span class="glyphicon glyphicon-plus"></span> Thêm mới
				</a>';
					}
					?> -->
			<a class="btn btn-primary btn-sm" href="admin/product/insert" role="button">
				<span class="glyphicon glyphicon-plus"></span> Thêm mới
			</a>
			<a class="btn btn-primary btn-sm" href="<?php echo base_url() ?>admin/product/recyclebin" role="button">
				<span class="glyphicon glyphicon-trash"></span> Thùng rác(<?php $total = $this->Mproduct->product_trash_count();
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
						<label>Loại sản phẩm</label>
						<select name="loaisp" id="loaisp" class="form-control">
							<option value="">[--Chọn loại sản phẩm--]
								<?php
								$category_list = $this->Mcategory->category_list();
								$option_parentid = "";
								foreach ($category_list as $r) {
									$option_parentid .= "<option value='" . $r['id'] . "'>" . $r['name'] . "</option>";
								}
								echo $option_parentid;
								?>
							</option>
						</select>
					</div>
				</div>
				<?php $user_role = $this->session->userdata('sessionadmin'); if ($user_role['role'] == 1) : ?>
					<div class="col-md-4">
					<div class="form-group">
						<label>Doanh Nghiệp</label>
						<select name="doanhnghiep" id ="doanhnghiep" class="form-control">
							<option value="">[--Chọn doanh nghiệp--]
							<?php
								$producer_list = $this->Mproducer->producer_list();
								$option_parentid = "";
								foreach ($producer_list as $r) {
									$option_parentid .= "<option value='" . $r['id'] . "'>" . $r['name'] . "</option>";
								}
								echo $option_parentid;
								?>
							</option>
						</select>
					</div>
					</div>
				<?php endif; ?>
				<div class="col-md-4" style="padding-top: 25px;">
					<!-- <a class="btn btn-primary btn-sm" href="admin/product/search" role="button" type="submit">
						<span class="glyphicon glyphicon-search"></span> Tìm kiếm
					</a> -->
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
					<div class="box-header with-border">
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
												<th class="text-center id-col" style="width:20px">ID</th>
												<th>Hình</th>
												<th>Tên sản phẩm</th>
												<th>Số lượng trong kho</th>
												<th>Loại sản phẩm</th>
												<th>Bình luận sp</th>
												<?php if ($user['role'] == 1) : ?>
													<th class="text-center">Trạng thái</th>
													<th class="text-center">Sản phẩm tiềm năng</th>
												<?php else : ?>
												<?php endif; ?>
												<th class="text-center">Nhập hàng</th>
												<th class="text-center" colspan="2">Thao tác</th>
											</tr>
										</thead>
										<tbody>
											<?php foreach ($list as $row) : ?>
												<tr>
													<td class="text-center id-col"><?php echo $row['id'] ?></td>
													<td style="width:100px">
														<img src="public/images/products/<?php echo $row['avatar'] ?>" alt="<?php echo $row['name'] ?>" class="img-responsive">
													</td>
													<td style="font-size: 16px; width:200px"><?php echo $row['name'] ?></td>
													<td style="width:80px" class="text-center"> <?php echo $row['number'] - $row['number_buy'] ?></td>
													<?php
													$namecat = $this->Mcategory->category_name($row['catid']);
													?>
													<td><?php echo $namecat ?></td>
													<td class="text-center"><a target="_blank" href="admin/product/danhgia/<?php echo $row['id'] ?>">Xem!</a></td>
													<?php if ($user['role'] == 1) : ?>
														<td  style="width:80px"  class="text-center">
															<a href="<?php echo base_url() ?>admin/product/status/<?php echo $row['id'] ?>">
																<?php if ($row['status'] == 1) : ?>
																	<span class="glyphicon glyphicon-ok-circle mauxanh18"></span>
																<?php else : ?>
																	<span class="glyphicon glyphicon-remove-circle maudo"></span>
																<?php endif; ?>
															</a>
														</td>
														<td  style="width:80px"  class="text-center">
															<a href="<?php echo base_url() ?>admin/product/tiemnang/<?php echo $row['id'] ?>">
																<?php if ($row['is_hot'] == 1) : ?>
																	<span class="glyphicon glyphicon-ok-circle mauxanh18"></span>
																<?php else : ?>
																	<span class="glyphicon glyphicon-remove-circle maudo"></span>
																<?php endif; ?>
															</a>
														</td>
													<?php else : ?>
													<?php endif; ?>
													<!--
													<?php
													$quyen = '';
													if ($user['role'] == 1) {
														$quyen .= '
															<td class="text-center"><a class="btn btn-info btn-xs" href="admin/product/import/' . $row['id'] . '" role = "button">
															<span class="glyphicon glyphicon-share-alt"></span>Nhập hàng
															</a>
															</td>
															';
													} else {
														$quyen .= '
															<td class="text-center">
															<p class="fa fa-lock" style="color:red"> Không đủ quyền</p>
															</td>';
													}
													echo $quyen;
													?>
													 <?php
															if ($user['role'] == 1) {
																echo '<td class="text-center">
															<a class="btn btn-success btn-xs" href="admin/product/update/' . $row['id'] . '" role = "button">
															<span class="glyphicon glyphicon-edit"></span> Sửa
															</a>
															</td>';
															}
															?> -->

													<td class="text-center"><a class="btn btn-info btn-xs" href="admin/product/import/<?php echo $row['id'] ?>" role="button">
															<span class="glyphicon glyphicon-share-alt"></span>Nhập hàng
														</a>
													</td>
													<td class="text-center">
														<a class="btn btn-success btn-xs" href="admin/product/update/<?php echo $row['id'] ?>" role="button">
															<span class="glyphicon glyphicon-edit"></span> Sửa
														</a>
													</td>

													<td class="text-center">
														<a class="btn btn-danger btn-xs" href="<?php echo base_url() ?>admin/product/trash/<?php echo $row['id'] ?>" onclick="return confirm('Xác nhận xóa sản phẩm này ?')" role="button">
															<span class="glyphicon glyphicon-trash"></span> Xóa
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
	</form>
	<!-- /.content -->
</div><!-- /.content-wrapper -->