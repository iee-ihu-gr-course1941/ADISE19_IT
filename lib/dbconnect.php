<?php

$user='root';
$pass='';
$host='localhost';
$db = 'stratego';


if(gethostname()=='users.iee.ihu.gr') {
	$mysqli = new mysqli($host, $user, $pass, $db,null,'/home/student/it/2017/it174894/mysql.sock');
} else {
        $mysqli = new mysqli($host, $user, $pass, $db);
}


$mysqli = new mysqli($host, $user, $pass, $db);
if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: (" . 
    $mysqli->connect_errno . ") " . $mysqli->connect_error;
}
?>
