<?php

include 'config.php';
header('Content-Type: application/json');

if ( isset($_POST['email']) && isset($_POST['username']) && isset($_POST['password']) ) {

	$email=trim(htmlspecialchars($_POST['email']));
	$username=trim(htmlspecialchars($_POST['username']));
	$password=trim(htmlspecialchars($_POST['password']));
	

	if ( empty($username) or empty($password) or empty($email) )  {

		$json['success']=2;
		$json['message']='Fill blank...';
		echo json_encode($json);
		die();
	}

	$tap=$db->prepare("select * from users where email=?");
	$tap->execute(array($email));
	$say=$tap->rowCount();

	$tap_username=$db->prepare("select * from users where username=?");
	$tap_username->execute(array($username));
	$say_username=$tap_username->rowCount();

	if ($say>0 || $say_username>0) {

		$json['success']=0;
		$json['message']='This user has been registered';

		echo json_encode($json);
 		die();

			
	}else{

		$yoxla=$db->prepare("insert into users set email=?, username=?, password=? ");
	    $insert=$yoxla->execute(array($email, $username, $password));

	    //print_r($insert);


		if ($insert==1) {
			$json['success']=1;
			$json['message']='Account created, Welcome '.$username;
			// echo json_encode($json);

		$sadala=$db->query("select * from users where username='".$username."'")->fetch(PDO::FETCH_ASSOC);

		$json['description'] = $sadala;  //array();
		// $sadala['id']=$id;
		// $sadala['username']=$username;

		//array_push($json['description'], $sadala);	
		echo json_encode($json);
		die();

		}
		else{
			$json['success']= -2;
			$json['message']='An error occured';
			echo json_encode($json);
		}	

		die();	
	}

}
else{
	$json["success"] = -1;
    $json["message"] = "Required field(s) is missing";
	echo json_encode($json);
}
?>