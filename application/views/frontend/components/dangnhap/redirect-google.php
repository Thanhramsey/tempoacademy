<?php
    require_once('define.php');

    /**
     * SET CONNECT
     */
    $conn = mysqli_connect('localhost','root','','newtempo');
    if (!$conn) {
        echo "Error: Unable to connect to MySQL." . PHP_EOL;
        echo "Debugging errno: " . mysqli_connect_errno() . PHP_EOL;
        echo "Debugging error: " . mysqli_connect_error() . PHP_EOL;
        exit;
    }


    /**
     * CALL GOOGLE API
     */
    require_once 'google/vendor/autoload.php';
    $client = new Google_Client();
    $client->setClientId('657412202004-iih5ap2dkvtmsfa0osi4hicnkd82le5c.apps.googleusercontent.com');
    $client->setClientSecret('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');
    $client->setRedirectUri('http://localhost:8080/tempoacademy/dangnhap/ggcallback');
    $client->addScope("email");
    $client->addScope("profile");

    if (isset($_GET['code'])) {
        $token = $client->fetchAccessTokenWithAuthCode($_GET['code']);
       // print_r($token);
        $client->setAccessToken($token['access_token']);

        // get profile info
        $google_oauth = new Google_Service_Oauth2($client);
        $google_account_info = $google_oauth->userinfo->get();
        $email =  $google_account_info->email;
        $name =  $google_account_info->name;
		$today = date('Y-m-d');
		print_r($google_account_info);
       /**
        * CHECK EMAIL AND NAME IN DATABASE
        */
        $row = $this->Mcustomer->customer_detail_email($email);
		# If the ip isn't in the table add it.
		if(!$row){
			$pass =  md5('123456');
			$data = array(
				'username'     => $email,
				'fullname'     => $name,
				'email'    => $email,
				'phone'    => 0,
				'created'=>$today,
				'password' => $pass
			);
			$this->Mcustomer->customer_insert($data);
			$row2 = $this->Mcustomer->customer_detail_email($email);
			$id= $row2['id'];
		}else{
			$id = $row['id'];
		}
        $url = 'http://localhost:8080/tempoacademy/dang-nhap-fb/'.$id.'';

		if (headers_sent() === false)
			{
				header('Location: ' . $url, true, ($permanent === true) ? 301 : 302);
		}
		exit();

    } else {
        /**
         * IF YOU DON'T LOGIN GOOGLE
         * YOU CAN SEEN AGAIN GOOGLE_APP_ID, GOOGLE_APP_SECRET, GOOGLE_APP_CALLBACK_URL
         */
        echo "<a class='button button-3d button-black nomargin pull-left cursorsHover' style='background-color:#337ab7 !important' href='".$client->createAuthUrl()."' >Google Login</a>";
    }
