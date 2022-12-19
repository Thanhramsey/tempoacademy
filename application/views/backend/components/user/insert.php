<?php echo form_open_multipart('admin/user/insert'); ?>
<html lang="">

<head>
	<base href="<?php echo base_url(); ?>">
	</base>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Hệ thống quản lý OCCP- </title>
	<link rel="shortcut icon" href="public/images/templates/favicon.png" />
	<link rel="stylesheet" href="public/css/bootstrap.css">
	<link rel="stylesheet" href="public/css/login.css">
	<link rel="stylesheet" href="public/css/font-awesome.min.css">
	<script src="public/js/loader.js"></script>
    <script src="public/ckeditor/ckeditor.js"></script>
</head>

<body>
	<div class="container khung-merchant">
		<div class="title">
			<h2 class="text-center" style="color:#337ab7">THÊM TÀI KHOẢN MỚI </h2>
		</div>
		<hr>
		<div class="myform">
			<form action="<?php echo base_url() ?>admin/user/insert.html" enctype="multipart/form-data" method="POST" accept-charset="utf-8">
				<!-- Main content -->
				<section class="content">
					<div class="row">
						<div class="col-md-12">
							<div class="box" id="view">
								<div class="box-body">
									<div class="col-md-6">
										<div class="form-group">
											<label>Họ và tên <span class="maudo">(*)</span></label>
											<input type="text" class="form-control" name="fullname">
											<div class="error" id="password_error" style="color: red;"><?php echo form_error('fullname') ?></div>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label>Email <span class="maudo">(*)</span></label>
											<input type="email" class="form-control" name="email">
											<div class="error" id="password_error" style="color: red;"><?php echo form_error('email') ?></div>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label>Tên đăng nhập <span class="maudo">(*)</span></label>
											<input type="text" class="form-control" name="username">
											<div class="error" id="password_error" style="color: red;"><?php echo form_error('username') ?></div>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label>Mật khẩu <span class="maudo">(*)</span></label>
											<input type="password" class="form-control" name="password">
											<div class="error" id="password_error" style="color: red;"><?php echo form_error('password') ?></div>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label>Số điện thoại <span class="maudo">(*)</span></label>
											<input type="text" class="form-control" name="phone">
											<div class="error" id="password_error" style="color: red;"><?php echo form_error('phone') ?></div>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label>Địa chỉ <span class="maudo">(*)</span></label>
											<input type="text" class="form-control" name="address">
											<div class="error" id="password_error" style="color: red;"><?php echo form_error('address') ?></div>
										</div>
									</div>
									<div class="col-md-6">
										<div class="anh">
											<!-- Chứa ảnh ở đây -->
											<img style ="width:100%; height:100%" id="output"/>
										</div>
										<div class="form-group">
											<label>Ảnh đại diện</label>
											<input type="file"  id="image_list" name="img" onchange="loadFile(event)">
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<label>Chi tiết sản phẩm</label>
											<textarea name="detail" id="detail" class="form-control"></textarea>
											<script>
												CKEDITOR.replace('detail');
											</script>
										</div>
									</div>
								</div>
							</div><!-- /.box -->
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</section>
				<div class="breadcrumb">
					<button type="submit" class="btn btn-primary btn-sm">
						<span class="glyphicon glyphicon-floppy-save"></span>
						Lưu
					</button>
					<a class="btn btn-primary btn-sm" href="admin/useradmin" role="button">
						<span class="glyphicon glyphicon-user"></span> Đăng nhập
					</a>
					<a class="btn btn-primary btn-sm" href="#" role="button">
						<span class="	glyphicon glyphicon-home"></span> Về trang web
					</a>
				</div>
			</form>
		</div>
	</div>
	<!-- <nav class="navbar navbar-fixed-bottom" role="navigation">
		<div class="container">
			<h5 class="text-center">Copyright © 2022 <a href="#" style="color:red">COOP </a>. All rights reserved.</h5>
		</div>
	</nav> -->
	<!-- jQuery -->
	<script src="public/js/jquery-2.2.3.min.js"></script>
	<script src="public/js/bootstrap.js"></script>

</body>

</html>

<script>
	var loadFile = function(event) {
    var output = document.getElementById('output');
    output.src = URL.createObjectURL(event.target.files[0]);
    output.onload = function() {
      URL.revokeObjectURL(output.src) // free memory
    }
  };
</script>