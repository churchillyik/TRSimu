<?php

//////////////////////////////////////////////////////////////////////////////////////////////////////
//                                             TRAVIANX                                             //
//            Only for advanced users, do not edit if you dont know what are you doing!             //
//                                Made by: Dzoki & Dixie (TravianX)                                 //
//                              - TravianX = Travian Clone Project -                                //
//                                 DO NOT REMOVE COPYRIGHT NOTICE!                                  //
//////////////////////////////////////////////////////////////////////////////////////////////////////

class Mailer {
	
	function sendActivate($email,$username,$pass,$act) {
		
		$subject = "Welcome to ".SERVER_NAME;
		
		$message = "Hello ".$username."

Thank you for your registration.

----------------------------
Name: ".$username."
Password: ".$pass."
Activation code: ".$act."
----------------------------

Click the following link in order to activate your account:
".SERVER."activate.php?code=".$act."

Greetings,
TravianX";
				
		$headers = "From: Mailer@".SERVER_NAME."\n";
		//$headers .= 'MIME-Version: 1.0' . "\r\n";
		//$headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";
		
		mail($email, $subject, $message, $headers);
	}
	
};
$mailer = new Mailer;
?>