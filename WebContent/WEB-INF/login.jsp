<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Login Page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="http://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
		.register{
			background: -webkit-linear-gradient(left, #313894, #048bb1);
			margin-top: 5%;
			padding: 5%;
		}
		.register-left{
			text-align: center;
			color: #fff;
			margin-top: 4%;
            padding-left: 3%;
		}
		.register-left input{
    		border: none;
    		border-radius: 1.5rem;
    		padding: 2%;
    		width: 60%;
    		background: #f8f9fa;
    		font-weight: bold;
    		color: #383d41;
    		margin-top: 30%;
    		margin-bottom: 3%;
    		cursor: pointer;
		}
		.register-left img{
	    	margin-top: 15%;
    		margin-bottom: 5%;
    		width: 250px;
    		-webkit-animation: mover 2s infinite  alternate;
    		animation: mover 1s infinite  alternate;
		}
		@-webkit-keyframes mover {
	    	0% { transform: translateY(0); }
    		100% { transform: translateY(-20px); }
		}
		@keyframes mover {
	    	0% { transform: translateY(0); }
	    	100% { transform: translateY(-20px); }
		}
		.register-left p{
	    	font-weight: lighter;
	    	padding: 12%;
	    	margin-top: -9%;
		}
		.register .register-form{
	    	padding: 10% 5% 10% 20%;
	    	margin-top: 10%;
		}
		.btnRegister{
	    	float: right;
	    	margin-top: 10%;
	    	border: none;
	    	border-radius: 1.5rem;
	    	padding: 2%;
	    	background: #eb8e03;
	    	color: #fff;
	    	font-weight: 600;
	    	width: 50%;
	    	cursor: pointer;
		}
		.register .nav-tabs{
	    	border: none;
	    	width:25%;
	    	float: right;
		}
		.register-heading{
	    	text-align: center;
	    	margin-top: 8%;
	    	margin-bottom: -15%;
    		color: #072442;
		}
        .fstyle{
            color:#f5d132;
            font-family:Comic Sans MS;
            font-size:50px;
        }
	</style>
    <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script>
    	function validate(){
        	var mailid=document.form1.email;
            var passw=document.form1.pass;
            
            var pass_reg=  /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{8,15}$/;
            var mail_reg = /^(([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5}){1,25})+([;.](([a-zA-Z0-9_\-\.]+)@{[a-zA-Z0-9_\-\.]+0\.([a-zA-Z]{2,5}){1,25})+)*$/;
            
            if(!mailid.value.match(mail_reg)||mailid.value==''){
            	alert("Enter Valid Email..!");
                email.focus();
                return false;
            }
            if(!passw.value.match(pass_reg)||passw.value==''){
                alert("Enter Valid Password..!");
                pass.focus();
       
                return false;
            }
		}
        
        function showpass() {
        	var x = document.getElementById("pass");
        	if (x.type === "password") {
        		x.type = "text";
        	}
        	else {
        		x.type = "password";
        	}
        }
	</script>
</head>
<body style="background-color: #a7d9fa;">
	<form action="/CRM/integratenew" name="form1" method="POST" onload="return validate();">
		<div class="container register">
        	<div class="row">
            	<div class="col-md-4 register-left">
                	<h3 class="fstyle">Welcome</h3>
                    <img src="kisspng-customer-relationship-management-application-softw-commit-to-using-your-crm-in-2-17-with-these-4-stra-5b80080f356e02.6268847915351173272189.png" alt=""/>
                    <h3>CRM</h3>
                   
                </div>
                <div class="col-md-8 register-right">
                	<div class="tab-content" id="myTabContent">
                    	<div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                            <h3 class="register-heading" style="color:#f5d132;font-family: Cambria;">LOGIN to work with CRM</h3>
                            <br>
                            <div class="row register-form">
                            	<div class="col-md-9">
                                	<div class="form-group">
                                    	<input type="text" size="40" class="form-control" name="email" id="mail" placeholder="Your Email *" value="" required/>
                                    </div>
                                    <br>
                                    <div class="form-group">
                                    	<input type="password" class="form-control" name="pass" id="pass" placeholder="Password *" value="" required/>
                                        <input type="checkbox" onclick="showpass()"> Show Password                                          
                                    </div>
                                    <input type="submit" class="btnRegister"  value="Login" onclick="validate()"/>
                                </div>
                            </div>
                        </div>
                    </div>
               	</div>
      		</div>
		</div>
	</form>
</body>
</html>
