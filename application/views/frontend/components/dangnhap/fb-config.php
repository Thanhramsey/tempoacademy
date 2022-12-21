<?php
if(!session_id()) {
    session_start();
}
include_once('facebook/php-graph-sdk-5.x/src/Facebook/autoload.php');
$fb = new Facebook\Facebook(array(
	'app_id' => '1663694830693692', // Replace with your app id
	'app_secret' => '1995dad28ce4c422decb43fd3b35c5b0',  // Replace with your app secret
	'default_graph_version' => 'v3.2',
));


$helper = $fb->getRedirectLoginHelper();
if (isset($_GET['state'])) {
    $helper->getPersistentDataHandler()->set('state', $_GET['state']);
}
?>