<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>Admin register</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="http://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet">
        <style type="text/css">
			.register{
				background: -webkit-linear-gradient(left, #313894, #048bb1);
				margin-top: 3%;
				padding: 3%;
			}
			.register-left{
				text-align: center;
				color: #fff;
				margin-top: 4%;
                padding-left: 5%;
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
    			width: 200px;
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
			.btn1{
    			border: none;
    			border-top-left-radius: 0.5rem;
    			border-bottom-left-radius: 0.5rem;
    			border-top-right-radius: 0.5rem;
    			border-bottom-right-radius: 0.5rem;
    			padding: 3% 15% 3% 15%;
    			background: #fff;
    			color: #eb8e03;
    			font-weight: 600;
    			cursor: pointer;
			}
			.btn1:hover{
	    		background-color:#eb8e03;
    			color: #fff;
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
			var cname=document.admin.cname;
        	var uname=document.admin.uname;
        	var mailid=document.admin.email;
        	var pass=document.admin.pass;
			
        	var cname_reg=/^[a-zA-Z ]{2,30}$/;
        	var uname_reg=/^[a-zA-Z ]{2,30}$/;
        	var mail_reg = /^(([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5}){1,25})+([;.](([a-zA-Z0-9_\-\.]+)@{[a-zA-Z0-9_\-\.]+0\.([a-zA-Z]{2,5}){1,25})+)*$/;
        	var pass_reg=  /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{8,15}$/;
         
        	if(!cname.value.match(cname_reg)||cname.value==''){
	        	alert("Enter Valid CompanyName..!");
            	cname.focus();
            	return false;
        	}
        	if(!fname.value.match(fname_reg)||fname.value==''){
	        	alert("Enter Valid UserName..!");
        		uname.focus();
        		return false;
        	}
        	if(!mailid.value.match(mail_reg)||mailid.value==''){
	        	alert("Enter Valid Email..!");
        		email.focus();
        		return false;
        	}
        	if(!pass.value.match(pass_reg)||pass.value==''){
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
	<div class="container register">
		<div class="row">
			<div class="col-md-3 register-left">
				<h2 class="fstyle">Welcome</h2>
				<img src="kisspng-customer-relationship-management-application-softw-commit-to-using-your-crm-in-2-17-with-these-4-stra-5b80080f356e02.6268847915351173272189.png" alt=""/>
				<br>
                <h5>CRM for</h5>
                <h5>CREATIVE_ENTREPRENEURS</h5>
				<a href="/CRM/Login"><input type="submit" name="" value="Login"/><br/></a>
				<p>If your are a Customer for Customer Management!</p>
			</div>
			<div class="col-md-9 register-right">
				<!--<ul class="nav nav-tabs nav-justified" id="myTab" role="tablist">
					<li class="nav-item">
						<a href="#"><button class="btn1"style="background-color: #eb8e03;color: #fff;">Admin</button></a>
					</li>
					<li class="nav-item">
						<a href="user.html"><button class="btn1">User</button></a>
					</li>
				</ul>-->
				<form method="POST" name="admin" action="/CRM/integration">
					<div class="tab-pane fade show" id="profile" role="tabpanel" aria-labelledby="profile-tab">
						<h3  class="register-heading" style="color:#f5d132;font-family: Cambria;">REGISTER as ADMIN</h3>
						<div class="row register-form">
							<div class="col-md-9">
								<div class="form-group">
									<input type="text" name="cname"class="form-control" placeholder="Company Name *" value="" required/>
								</div>
								<div class="form-group">
									<input type="text" name="uname"class="form-control" placeholder="User Name *" value="" required/>
								</div>
								<div class="form-group">
									<input type="email" name="email1"class="form-control" placeholder="Email *" value="" required/>
								</div>
								<div class="form-group">
									<input type="password" name="pass" id="pass" class="form-control" placeholder="Password *" value="" required />
									<input type="checkbox" onclick="showpass()"> Show Password
								</div>
								<input type="submit" class="btnRegister"  value="Register" onclick="validate()"/>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>