<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Hospital Login</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/login_style.css">
    <style>
        body {
            background-color: #f0f2f5;
             background-image: url('images/bg.jpg'); 
        }
        .form-container {
            margin-top: 50px;
            padding: 8px;
            margin-left:40px;
            background-color: #ffffff;
            border-radius: 10px;
            
           /*  height:420px; */
            width:80%;
            
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
        }
        input,select{
	    width: 90% !important;
	    margin-left: 15px;
        }
        label {
	      margin-left: 15px;
       }
       button {
	     width: 30% !important;
	      margin: 15px auto 0 auto;
	     border-radius: 13px !important;
	     padding:5px;
	     padding-top:3px !important;
      }
      p{
      margin-top:0px !important;
      }
     h4 {
        margin-top: 20px;
        margin-bottom: 0px !important;
    }
    </style>
</head>
<body>
<section class="container-fluid">
    <section class="row justify-content-center">
        <section class="col-12 col-sm-8 col-md-6 col-lg-4">
            <form class="form-container" method="post" action="LoginController">
               <h4 class="text-center font-weight-bold"> Login</h4>

                <!-- Username -->
                <div class="form-group">
                    <label for="Inputuser1">Username</label>
                    <input type="text" class="form-control" id="Inputuser1" name="userName" placeholder="Enter username" required>
                </div>

                <!-- Password -->
                <div class="form-group">
                    <label for="InputPassword1">Password</label>
                    <input type="password" class="form-control" id="InputPassword1" name="password" placeholder="Password" required>
                </div>

                <!-- Role Selection -->
                <div class="form-group">
                    <label for="roleSelect">Select Role</label>
                    <select class="form-control" id="roleSelect" name="role" required>
                        <option value="" disabled selected>-Choose Role -</option>
                        <option value="admin">Admin</option>
                        <option value="doctor">Doctor</option>
                        <option value="receptionist">Receptionist</option>
                    </select>
                </div>

                <button type="submit" class="btn btn-primary btn-block">Login In</button>

                <div class="form-footer text-center mt-3">
                    <p>Don't have an account? <a href="#">Sign Up</a></p>
                </div>
            </form>
        </section>
    </section>
</section>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>
</html>