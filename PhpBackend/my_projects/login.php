<?php

include 'config.php';
header('Content-Type: application/json');

if (isset($_POST['username']) && isset($_POST['password'])) {

	$username=trim(htmlspecialchars($_POST['username']));
	$password=trim(htmlspecialchars($_POST['password']));

	if (empty($username) or empty($password)) {
		$json['success']=2;
		$json['message']='username or password are empty...';
		echo json_encode($json);
		die();
	}

	$tap=$db->prepare("select * from users where username=? and password=?");
	$tap->execute(array($username, $password));
	$say=$tap->rowCount();

	// $tap_email=$db->prepare("select * from users where email=? and password=?");
	// $tap_email->execute(array($email, $password));
	// $say_email=$tap_email->rowCount();

	if ($say>0) {

		$json['success']=1;
		$json['message']='Welcome';	 
		

		$sadala=$db->query("select * from users where username='".$username."'")->fetch(PDO::FETCH_ASSOC);

		$json['description']=$sadala;  //array();
		// $sadala['username']=$username;

		// array_push($json['description'], $sadala);
		echo json_encode($json);
		die();

	}else{

		$json['success']=0;
		$json['message']='username or password are incorrect...';
		echo json_encode($json);
		die();	
	}

}
elseif(isset($_POST['email']) && isset($_POST['password'])) {
	$email=trim(htmlspecialchars($_POST['email']));
	$password=trim(htmlspecialchars($_POST['password']));

	if (empty($email) or empty($password)) {
		$json['success']=2;
		$json['message']='email or password are empty...';
		echo json_encode($json);
		die();
	}

	$tap_email=$db->prepare("select * from users where email=? and password=?");
	$tap_email->execute(array($email, $password));
	$say_email=$tap_email->rowCount();

	// $tap=$db->prepare("select * from users where username=? and password=?");
	// $tap->execute(array($username, $password));
	// $say=$tap->rowCount();

	if ($say_email>0) {

		$json['success']=1;
		$json['message']='Welcome';	 
		

		$sadala=$db->query("select * from users where email='".$email."' ")->fetch(PDO::FETCH_ASSOC);

		$json['description']=$sadala;  //array();
		// $sadala['username']=$username;

		// array_push($json['description'], $sadala);
		echo json_encode($json);
		die();

	}else{

		$json['success']=0;
		$json['message']='email or password are incorrect...';
		echo json_encode($json);
		die();	
	}

}
else{
	$json["success"] = -1;
    $json["message"] = "Required field(s) is missing";
	echo json_encode($json);
}
?>


