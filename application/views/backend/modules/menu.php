<aside class="main-sidebar">

	<section class="sidebar">
		<ul class="sidebar-menu">
			<li class="header">QUẢN LÝ CỬA HÀNG</li>
			<li class="treeview">
				<a href="admin">
					<i class="glyphicon glyphicon-signal"></i> <span>Thống kê</span>
				</a>
			</li>
			<li class="treeview">
				<a href="admin/product">
					<i class="glyphicon glyphicon-apple"></i><span>Sản phẩm</span>
				</a>
			</li>
			<li class="treeview">
				<a href="admin/orders">
					<i class="glyphicon glyphicon-shopping-cart"></i> <span>Đơn hàng</span>
				</a>
			</li>
			<li class="treeview">
				<a href="admin/hoidap">
					<i class="glyphicon glyphicon-question-sign"></i> <span>Hỏi đáp</span>
				</a>
			</li>
			<?php
			if ($user['role'] == 1) {
				echo '<li class="header">QUẢN LÝ DANH MỤC</li>
				<li>
					<a href="admin/useradmin">
						<i class="glyphicon glyphicon-briefcase"></i><span> Cơ sở kinh doanh</span>
					</a>
				 </li>
				<li class="treeview">
					<a href="admin/coupon">
						<i class="glyphicon glyphicon-piggy-bank"></i> <span>Mã giảm giá</span>
					</a>
				</li>
				<li class="treeview">
					<a href="admin/contact">
						<i class="glyphicon glyphicon-earphone"></i> <span>Liên hệ</span>
					</a>
				</li>
				<li class="treeview">
					<a href="admin/chinhsach">
						<i class="glyphicon glyphicon-book"></i> <span>Văn bản, chính Sách</span>
					</a>
				</li>
				<li class="treeview">
					<a href="admin/customer">
						<i class="glyphicon glyphicon-user"></i><span>Khách hàng</span>
					</a>
				</li>
				<li class="treeview">
					<a href="admin/cungcau">
						<i class="glyphicon glyphicon-grain"></i><span>Kết nối cung cầu</span>
					</a>
				</li>';

			}
			?>
			<?php
			if ($user['role'] == 1) {
				echo '<li class="treeview">
                <a href="admin/category">
                    <i class="glyphicon glyphicon-leaf"></i><span>Loại sản phẩm</span>
                </a>
            	</li>';
			}
			?>

			<?php
			if ($user['role'] == 1) {
				echo '<li class="treeview">
                <a href="admin/producer">
                    <i class="glyphicon glyphicon-globe"></i><span>Địa bàn</span>
                </a>
            </li>';
			}
			?>


			<?php
			if ($user['role'] == 1) {
				echo '<li class="header">CÀI ĐẶT</li>
					<li class="treeview">
						<a href="admin/configuration/update">
							<i class="glyphicon glyphicon-cog"></i><span> Cấu hình</span>
						</a>
					</li>
					<li class="treeview">
						<a href="admin/sliders">
							<i class="glyphicon glyphicon-picture"></i> <span>Giao diện</span>
						</a>
					</li>
					<li class="treeview">
						<a href="admin/content">
							<i class="glyphicon glyphicon-list"></i><span>Tin tức</span>
						</a>
					</li>';
				}
			?>
			<li><a href="admin/user/logout.html"><i class="glyphicon glyphicon-off"></i> <span>Thoát</span></a></li>
		</ul>
	</section>
	<!-- /.sidebar -->
</aside>