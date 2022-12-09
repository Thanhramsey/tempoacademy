<?php

// session_start();

// include "db.php"; # Connect To the database
$conn = mysqli_connect("localhost", "root", "", "db_shop");

$active_sessions = 0;

$minutes = 5; # period considered active

if($sid = session_id()) # if there is an active session

{

# DB connect here

$ip = $_SERVER['REMOTE_ADDR']; # Get Users IP address

# Delete users from the table if time is greater than $minutes

mysqli_query($conn,"DELETE FROM `active_sessions` WHERE

`date` < DATE_SUB(NOW(),INTERVAL $minutes MINUTE)")or die(mysqli_error($conn));



# Check to see if the current ip is in the table

$sql = mysqli_query($conn,"SELECT * FROM active_sessions WHERE ip='$ip'");

$row = mysqli_fetch_array($sql);

# If the ip isn't in the table add it.

if(!$row){

mysqli_query($conn,"INSERT INTO `active_sessions` (`ip`, `session`, `date`)

VALUES ('$ip', '$sid', NOW()) ON DUPLICATE KEY UPDATE `date` = NOW()")or die(mysqli_error($conn));

}


# Get all the session in the table

$sessions = mysqli_query($conn,'SELECT * FROM `active_sessions`')or die(mysqli_error($conn));


# Add up all the rows returned

$active_sessions = mysqli_num_rows($sessions);

}

# Print the final result

echo'Đang online: '.$active_sessions;

?>