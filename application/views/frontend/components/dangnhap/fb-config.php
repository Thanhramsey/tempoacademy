<?php
if(!session_id()) {
    session_start();
}
include_once('facebook/php-graph-sdk-5.x/src/Facebook/autoload.php');
$fb = new Facebook\Facebook(array(
	'app_id' => '747312326582969', // Replace with your app id
	'app_secret' => '87723bd994e509ae64a063a0e4f2e841',  // Replace with your app secret
	'default_graph_version' => 'v3.2',
));


$helper = $fb->getRedirectLoginHelper();
if (isset($_GET['state'])) {
    $helper->getPersistentDataHandler()->set('state', $_GET['state']);
}
?>