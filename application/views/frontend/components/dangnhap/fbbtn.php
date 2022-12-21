<?php
include_once('fb-config.php');
if(isset($_SESSION['fbUserId']) and $_SESSION['fbUserId']!=""){
	header('location: http://localhost:8080/tempoacademy/');
	exit;
}
$permissions = array('email'); // Optional permissions
// echo "<pre>---In ra---\n".print_r($permissions)."</pre>";
$loginUrl = $helper->getLoginUrl('http://localhost:8080/tempoacademy/dangnhap/fbcallback', $permissions);
?>
<a href="<?php echo htmlspecialchars($loginUrl); ?>" class="button button-3d button-black nomargin pull-left cursorsHover" style="background-color:#337ab7 !important"><i class="fab fa-facebook-square"></i> Đăng nhập bằng Facebook</a>