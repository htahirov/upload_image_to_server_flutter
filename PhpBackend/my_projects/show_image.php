		<?php
            include 'config.php';
			header('Content-Type: application/json');

			$stmt=$db->prepare('SELECT * FROM images ORDER BY id DESC');
				$stmt->execute();
				if($stmt->rowCount()>0)
				{
					$json['success']=1;
					while($row=$stmt->fetchAll(PDO::FETCH_ASSOC))
					{
						extract($row);

						$json['description']=$row;
		//$sadala['username']=$username;

		// array_push($json['description'], $row);
		echo json_encode($json);
		die();
						?>

			<img src="uploads/<?php echo $row['image']?>"><br><br>
            
			<?php 

				}
			}
			?>