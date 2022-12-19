
<section id="header">
	<nav class="navbar" style="z-index: 9999; background:#262144">
		<div class="container">
			<div class="col-md-12 col-lg-12">
				<div class="navbar-header">
					<!-- <div class="icon-img-logo hidden-md hidden-lg">
						<strong><p style="color:#fff">TEMPO </p></strong>
                    </div> -->
					<button style="padding-left:10px !important" type="button" class="navbar-toggle collapsed pull-left" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<div class="icon-cart-mobile hidden-md hidden-lg">
						<a href="gio-hang">
							<i class="fa fa-shopping-cart" aria-hidden="true" style="color: #fff; font-size: 17px;"></i>
							<span>(<?php
                               if($this->session->userdata('cart')){
                                $val = $this->session->userdata('cart');
                                echo count($val);
                            }else{
                                echo 0;
                            }
                            ?>)</span>
                        </a>
                    </div>
                </div>
                <div id="navbar" class="collapse navbar-collapse">
                	<ul class="nav navbar navbar-nav" id="nav1">
                		<li><a style='color:#fff' href="#">Trang chủ</a></li>
                		<li><a style='color:#fff' href="san-pham/1">Sản phẩm</a></li>
                		<li><a style='color:#fff' href="tin-tuc/1">Tin tức</a></li>
                		<li><a style='color:#fff' href="van-ban">Chính sách</a></li>
                		<li><a style='color:#fff' href="lien-he">Liên hệ</a></li>
                		<!-- <li><a href="thong-tin-tai-khoan">Tài khoản</a></li> -->
                		<?php
                		if($this->session->userdata('sessionKhachHang')){
                			echo "<li><a style='color:#fff' href='dang-xuat'>Thoát</a></li>";
                		}else{
                			echo "<li><a style='color:#fff' href='dang-ky'>Đăng ký</a></li>";
                			echo "<li><a style='color:#fff' href='dang-nhap'>Đăng nhập</a></li>";
                		}
                		?>
                	</ul>
                	<ul class="nav navbar navbar-nav pull-right" id="nav2">
					<li><a class='logi' style='color:#fff' href='#'><i style='margin-right:6px' class='glyphicon glyphicon-earphone'></i>Hot line:  0979.190.303 - 0349.303.368</a></li>
                		<?php
                		if($this->session->userdata('sessionKhachHang')){
                			$name=$this->session->userdata('sessionKhachHang_name');
                			echo "<li><a class='logi' style='color:#fff' href='#'>Xin chào: $name</a></li>";
                			echo "<li><a class='logi' style='color:#fff' href='dang-xuat'><i style='margin-right:6px' class='glyphicon glyphicon-log-out'></i><span>Thoát</span></a></a></li>";
                		}else{
                			echo "<li><a class='logi' style='color:#fff' href='dang-ky'><i style='margin-right:6px' class='glyphicon glyphicon-log-in'></i><span>Đăng ký</span></a></li>";
                			echo "<li><a class='logi' style='color:#fff' href='dang-nhap'><i style='margin-right:6px' class='glyphicon glyphicon-user'></i><span>Đăng nhập</span></a></li>";
                		}
                		?>
                	</ul>
					<ul class="nav navbar navbar-nav pull-left" id="nav2">
					<li><div style="padding:10px 0px; color:#fff"><i class="glyphicon glyphicon-calendar"></i></div></li>
					<li><div style="padding:10px 10px 10px 5px; color:#fff" id="runningDay">Ngày</div></li>
					<li><div style="padding:10px 0px; color:#fff; margin-left:5px"><i class="glyphicon glyphicon-time"></i></div></li>
					<li><div style="padding:10px 10px 10px 5px; color:#fff" id="runningTime">Giờ</div></li>
					</ul>
                </div>
            </div>
        </div>
    </nav>
</section>


<script type="text/javascript">
	$(document).ready(function() {
		// var dateObj = new Date();
		// $('#runningDay').html(new Intl.DateTimeFormat(['ban', 'id']).format(dateObj));
		// $('#runningTime').html(dateObj.toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' }));
		setInterval(function() {
			var dateObj = new Date();
			$('#runningDay').html(new Intl.DateTimeFormat(['ban', 'id']).format(dateObj));
			$('#runningTime').html(dateObj.toLocaleTimeString());
		}, 1000);
	});
</script>