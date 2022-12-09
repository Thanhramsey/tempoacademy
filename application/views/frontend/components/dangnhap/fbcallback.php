<?php
include_once('fb-config.php');

try {
  $accessToken = $helper->getAccessToken();
} catch(Facebook\Exceptions\FacebookResponseException $e) {
  // When Graph returns an error
  echo 'Graph returned an error: ' . $e->getMessage();
  exit;
} catch(Facebook\Exceptions\FacebookSDKException $e) {
  // When validation fails or other local issues
  echo 'Facebook SDK returned an error: ' . $e->getMessage();
  exit;
}

if (!isset($accessToken)) {
  if ($helper->getError()) {
    header('HTTP/1.0 401 Unauthorized');
    echo "Error: " . $helper->getError() . "\n";
    echo "Error Code: " . $helper->getErrorCode() . "\n";
    echo "Error Reason: " . $helper->getErrorReason() . "\n";
    echo "Error Description: " . $helper->getErrorDescription() . "\n";
  } else {
    header('HTTP/1.0 400 Bad Request');
    echo 'Bad request';
  }
  exit;
}

if(!$accessToken->isLongLived()){
  // Exchanges a short-lived access token for a long-lived one
  try {
    $accessToken = $oAuth2Client->getLongLivedAccessToken($accessToken);
  } catch (Facebook\Exceptions\FacebookSDKException $e) {
    echo "<p>Error getting long-lived access token: " . $e->getMessage() . "</p>\n\n";
    exit;
  }
}

//$fb->setDefaultAccessToken($accessToken);

# These will fall back to the default access token
$res 	= 	$fb->get('/me?locale=en_US&fields=name,email',$accessToken->getValue());
$fbUser	=	$res->getDecodedBody();


$resImg		=	$fb->get('/me/picture?type=large&amp;amp;redirect=false',$accessToken->getValue());
$picture	=	$resImg->getGraphObject();


$_SESSION['fbUserId']		=	$fbUser['id'];
$fbfullname	=	$fbUser['name'];
$fbemail	=	$fbUser['email'];
$_SESSION['fbfullname']	=	$fbfullname;
$_SESSION['fbemail']	=	$fbemail;
// echo "<pre>---In ra 123---\n".print_r($_SESSION)."</pre>";
$today = date('Y-m-d');
$conn = mysqli_connect("localhost", "id18981557_shopdb", "Z]tVtB~(p!F)8wHk", "id18981557_db_shop");
$sql = mysqli_query($conn,"SELECT * FROM db_customer WHERE email='$fbemail' limit 1 ");
$row = mysqli_fetch_array($sql);
# If the ip isn't in the table add it.
if(!$row){
	$pass =  md5('123456');
	mysqli_query($conn,"INSERT INTO `db_customer` (`fullname`, `username`, `password`,`address`,`phone`,`email`,`created`)
	VALUES ('$fbfullname', '$fbemail','$pass','','0','$fbemail',$today")or die(mysqli_error($conn));
	$id = mysqli_query($conn,"SELECT LAST_INSERT_ID() ");
}else{
	$id = $row['id'];
}
$url = 'http://ocopchupuh.000webhostapp.com/dang-nhap-fb/'.$id.'';
if (headers_sent() === false)
    {
        header('Location: ' . $url, true, ($permanent === true) ? 301 : 302);
    }

    exit();

?>

