<?php
include_once('fb-config.php');
if(isset($_SESSION['fbUserId']) and $_SESSION['fbUserId']!=""){
	header('location: https://ocopchupuh.000webhostapp.com/');
	exit;
}
$permissions = array('email'); // Optional permissions
$loginUrl = $helper->getLoginUrl('https://ocopchupuh.000webhostapp.com/application/views/frontend/components/dangnhap/fbcallback.php', $permissions);
?>
<a href="<?php echo htmlspecialchars($loginUrl); ?>" class="button button-3d button-black nomargin pull-left cursorsHover" style="background-color:#337ab7 !important"><i class="fab fa-facebook-square"></i> Đăng nhập bằng Facebook</a>