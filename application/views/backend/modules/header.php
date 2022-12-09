<header class="main-header">
    <a href="<?php echo base_url()?>admin" class="logo">
        <span class="logo-lg">Quản trị hệ thống</span>
		<i class="glyphicon glyphicon-grain"></i>
    </a>
    <nav class="navbar navbar-static-top" style="height: 52px">
        <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
			<i class="glyphicon glyphicon-list"></i>
            <!-- <span class="sr-only">Toggle navigation</span> -->
        </a>
        <div class="navbar-custom-menu">
            <ul class="nav navbar-nav" style="height: 52px;  padding: 1px">
                <li class="dropdown notifications-menu">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                      <i class="glyphicon glyphicon-bell"></i>
                      <span class="label" style="background-color:red">
                          <?php
						  $user_role = $this->session->userdata('sessionadmin');
						  if ($user_role['role'] == 1) {
							$not_approved = $this->Morders->orders_count_header_not();
							$approved = $this->Morders->orders_count_header();
						  } else {
							$userId = $user_role['id'];
							$approved =  $this->Morders->orders_count_header_count_not($userId);
							$not_approved = $this->Morders->orders_listorders_byId_count_2($userId);
						  }
                          echo  $approved+$not_approved;
                          ?>
                      </span>
                  </a>
                  <ul class="dropdown-menu">
                      <li>
                        <ul class="menu">
                          <li>
                            <a href="admin/orders">
                              <i class="glyphicon glyphicon-flash"></i>
                              <?php
							 	$user_role = $this->session->userdata('sessionadmin');
								if ($user_role['role'] == 1) {
									echo $this->Morders->orders_count_header_not();
								} else {
									$userId = $user_role['id'];
									echo $this->Morders->orders_listorders_byId_count_2($userId);
								}
							 ?>
                              Đơn hàng chưa duyệt
                          </a>
                      </li>
                  </ul>
              </li>
              <li>
                <ul class="menu">
                  <li>
                    <a href='admin/orders'>
                      <i class="glyphicon glyphicon-plane"></i>
                      <?php
					  $user_role = $this->session->userdata('sessionadmin');
						if ($user_role['role'] == 1) {
							echo $this->Morders->orders_count_header();
						} else {
							$userId = $user_role['id'];
							echo $this->Morders->orders_count_header_count_not($userId);
						}
					  ?>
                      Đơn hàng đang giao
                  </a>
              </li>
          </ul>
      </li>
      <li class="footer"><a href="<?php echo base_url() ?>admin/orders">Xem</a></li>
  </ul>
</li>
<li style="height: 52px">
    <a target="_blank" href="<?php echo base_url(); ?>">
        <span class="glyphicon glyphicon-home"></span>
        <span>Website</span>
    </a>
</li>
<?php
$image='';
if($user['img']){
    $image=$user['img'];
}else{
    $image='user.png';
}
?>
<li class="dropdown user user-menu" style="height: 52px; padding: 0px">
    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
        <img src="public/images/admin/<?php echo $image ?>" class="user-image" alt="User Image">
        <span class="hidden-xs"><?php echo $user['fullname'] ?></span>
    </a>
    <ul class="dropdown-menu">
        <li class="user-header">
            <img src="public/images/admin/<?php echo $image ?>" class="img-circle" alt="User Image">
            <p><?php echo $user['fullname'] ?><small><?php echo $user['phone'] ?></small></p>
        </li>
        <li class="user-footer">
			<!-- <?php
			$user_role = $this->session->userdata('sessionadmin');
			if ($user_role['role'] == 1) : ?>
				<div class="pull-left">
                	<a href="<?php echo base_url()?>admin/useradmin/update/<?php echo $user['id'] ?>" class="btn btn-default btn-flat">Chi tiết</a>
            	</div>
			<?php endif; ?> -->
			<div class="pull-left">
                	<a href="<?php echo base_url()?>admin/useradmin/update/<?php echo $user['id'] ?>" class="btn btn-default btn-flat">Chi tiết</a>
            	</div>
            <div class="pull-right">
                <a href="admin/user/logout" class="btn btn-default btn-flat">Thoát</a>
            </div>
        </li>
    </ul>
</li>
</ul>
</div>
</nav>
</header>