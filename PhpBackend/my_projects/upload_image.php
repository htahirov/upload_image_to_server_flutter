<?php 

include 'config.php';
header('Content-Type: application/json');

$image = $_FILES['image']['name'];
$aboutImage=trim(htmlspecialchars($_POST['aboutImage']));
$tmp_dir=$_FILES['image']['tmp_name'];
$upload_dir='uploads/'.$image;
move_uploaded_file($tmp_dir, $upload_dir);

$yoxla=$db->prepare("insert into images set image=?, aboutImage=?");
$insert=$yoxla->execute(array($image, $aboutImage));

if($insert==1){
	$json['success']=1;
	$json['message']='Image uploaded.';
	echo json_encode($json);

	$sadala=$db->query("select * from images where image='".$image."'")->fetch(PDO::FETCH_ASSOC);

	$json['description']=array();

	array_push($json['description'], $sadala);	
	echo json_encode($json);
	die();
}else{
	$json["success"] = -1;
    $json["message"] = "Required field(s) is missing";
	echo json_encode($json);
}
?>