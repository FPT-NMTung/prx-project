<?php if(isset($_POST["email"]))  
{
	// Read the form values
	$success = false;
	$senderEmail = isset( $_POST['email'] ) ? preg_replace( "/[^\.\-\_\@a-zA-Z0-9]/", "", $_POST['email'] ) : "";
	
	//Headers
	$to = ""; // Your email address goes here
    $subject = 'Newslatters';
	$headers = "MIME-Version: 1.0\r\n";
	$headers .= "Content-type: text/html; charset=iso-8859-1\r\n";
	
	//body message
	$message = "Email: ". $senderEmail . "";
	
	//Email Send Function
    $send_email = mail($to, $subject, $message, $headers);
      
    echo ($send_email) ? '<div class="success">Email has been sent successfully.</div>' : 'Error sending. Please try again later.';
}
else
{
	echo '<div class="failed">Error: Faild to send. Please try again later.</div>';
}
?>