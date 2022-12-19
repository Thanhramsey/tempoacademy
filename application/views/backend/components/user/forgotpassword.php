<?php echo form_open('admin/user/forgotpassword'); ?>
<html lang="">
	<head>
        <base href="<?php echo base_url(); ?>"></base>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Hệ thống quản lý OCCP- </title>
        <link rel="shortcut icon" href="public/images/templates/favicon.png" />
		<link rel="stylesheet" href="public/css/bootstrap.css">
		<link rel="stylesheet" href="public/css/login.css">
		<link rel="stylesheet" href="public/css/font-awesome.min.css">
    </head>
    <body>
        <div class="container khung-merchant">
            <div class="title">
                <h2 class="text-center" style="color:#337ab7">Quên mật khẩu</h2>
            </div>
            <hr>
            <div class="myform">
                <form action="<?php echo base_url() ?>admin/user/forgotpassword.html" accept-charset="UTF-8" action="" id="reset_password" method="post">
                    <div id="login">
                        <?php
                        if(isset($success))
                            echo '<h4 style="color:green;">'.$success.'</h4>';
                        ?>
                        <div class="acc_content clearfix" style="display: block;">
                            <div class="col_full">
                                <label for="login-form-password">Email :<span class="require_symbol">* </span></label>
                                <input type="email" id="login-form-password" name="email" value="" class="form-control">
                                <div class="error" id="password_error"><?php echo form_error('email')?></div>
                            </div>
                            <button  style= "margin-top:10px" class="btn btn-primary btn-md" id="login-form-submit" name="login-form-submit" type="submit" value="login">Tiếp tục</button>
                        </div>
                    </div>
                 </form>
            </div>
        </div>
        <nav class="navbar navbar-fixed-bottom" role="navigation">
            <div class="container">
               <h5 class="text-center">Copyright © 2022 <a href="#" style="color:red">COOP </a>. All rights reserved.</h5>
            </div>
        </nav>
        <!-- jQuery -->
        <script src="public/js/jquery-2.2.3.min.js"></script>
		<script src="public/js/bootstrap.js"></script>

	</body>
</html>