<div class="menu-pri">
	<!-- <div class="panel-left" style="background: #262144;">
            MOBILE
            <nav class="navbar hidden-md hidden-lg" role="navigation">
                <div class="container-fluid" style="background-color: #262144;">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                            <span class="icon-bar"></span>
                            <span class="icon-bar primary-color"></span>
                            <span class="icon-bar primary-color"></span>
                            <span class="icon-bar primary-color"></span>
                        </button>
                        <a class="navbar-brand" style="color: #fff;" href="#">Danh mục sản phẩm</a>
                    </div>
                    <div class="collapse navbar-collapse navbar-ex1-collapse hidden-md hidden-lg">
                        <?php
						$listcat = $this->Mcategory->category_menu(0);
						$html_menu = '<ul class="nav navbar-nav">';
						foreach ($listcat as $menu) {
							$parentid = $menu['id'];
							$submenu = $this->Mcategory->category_menu($parentid);
							$html_menu .= '<li class="dropdown">';
							$html_menu .= "<a href='san-pham/" . $menu['link'] . "' class='dropdown-toggle' data-toggle='dropdown'>";
							$html_menu .= $menu['name'];
							if (!empty($submenu)) {
								$html_menu .= '<i class="fa fa-angle-right pull-right" aria-hidden="true">';
								$html_menu .= '</i>';
							}
							$html_menu .= "</a>";
							if (count($submenu)) {
								$html_menu .= '<ul class="dropdown-menu">';
								foreach ($submenu as $menu1) {
									$html_menu .= '<li>';
									$html_menu .= "<a href='san-pham/" . $menu1['link'] . "'> " . $menu1['name'] . "</a>";
									$html_menu .= "</li>";
								}
								$html_menu .= "</ul>";
							}
							$html_menu .= "</li>";
						}
						$html_menu .= "</ul>";
						echo $html_menu;
						?>
                    </div>

                </div>
       		</nav> -->
	<!--MD LG-->
</div>
<div class="col-md-12 col-lg-12 panel-right hidden-xs text-center" style="background: #262144;">
	<ul class="menu-right" style="display: inline-block;">
		<li class="pull-left"><a href="">Trang chủ</a></li>
		<li class="dropdown pull-left">
			<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Thương hiệu <span class="caret"></span></a>
			<ul class="dropdown-menu">
				<?php
				$listXa = $this->Mproducer->producer_list();
				$html = '';
				foreach ($listXa as $xa) {
					$html = "<li  class='sub-link'>";
					$html .= "<a href='san-pham/db/" . $xa['code'] . " '>";
					$html .= $xa['name'];
					$html .= "</a>";
					$html .= '</li>';
					echo $html;
				}
				?>
			</ul>
		</li>
		<li class="dropdown pull-left">
			<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Loại sản phẩm <span class="caret"></span></a>
			<ul class="dropdown-menu">
				<?php
				$listcat = $this->Mcategory->category_menu(0);
				$html = '';
				foreach ($listcat as $menu) {
					$html = "<li  class='sub-link'>";
					$html .= "<a href='san-pham/" . $menu['link'] . " '>";
					$html .= $menu['name'];
					$html .= "</a>";
					$html .= '</li>';
					echo $html;
				}
				?>
			</ul>
		</li>
		<li class="pull-left"><a href="lichhoc">Lịch học</a></li>
		<!-- <li class="pull-left"><a href="ketnoicungcau">Kết nối cung cầu</a></li> -->
		<li class="pull-left"><a href="san-pham">Sản phẩm</a></li>
		<li class="pull-left"><a href="tin-tuc/1">Tin tức</a></li>
		<li class="pull-left"><a href="van-ban">Chính Sách</a></li>
		<li class="dropdown pull-left">
		<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Liên hệ, thông tin <span class="caret"></span></a>
			<ul class="dropdown-menu">
				<li class="sub-link"><a href="lien-he">Liên hệ</a></li>
				<li class="sub-link"><a href="chinhsachbaomat">Chính sách bảo mật</a></li>
				<li class="sub-link"><a href="dieukhoanbaohanh">Điều khoản bảo hành</a></li>
				<li class="sub-link"><a href="questions">Câu hỏi thường gặp</a></li>
			</ul>
		</li>
	</ul>
</div>
</div>

