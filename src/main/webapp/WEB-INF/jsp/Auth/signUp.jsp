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
            margin-top: 40px;
            padding: 10px;
            margin-left: auto;
            margin-right: auto;
            background-color: #ffffff;
            border-radius: 10px;
            height: auto; /* dynamic height */
            width: 60%;   /* wider width */
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
        }
        input, select {
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
            padding: 5px;
            padding-top: 3px !important;
        }
        p {
         /*    margin-top: 0px !important; */
         margin-bottom: 0px !important;
            
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
        <section class="col-12 col-sm-10 col-md-8 col-lg-6">
            <form class="form-container" method="post" action="SignUpAccount">
                <h4 class="text-center font-weight-bold">SignUp</h4>

                <!-- Name -->
                <div class="form-group">
                    <label for="Inputuser1">Name</label>
                    <input type="text" class="form-control" id="Inputuser1" name="name" placeholder="Enter name" required>
                </div>

                <!-- Email -->
                <div class="form-group">
                    <label for="InputEmail1">Email</label>
                    <input type="text" class="form-control" id="InputEmail1" name="email" placeholder="Enter email" required>
                </div>

                <!-- Password -->
                <div class="form-group">
                    <label for="InputPassword1">Password</label>
                    <input type="password" class="form-control" id="InputPassword1" name="password" placeholder="Password" required>
                </div>

                <!-- Phone -->
                <div class="form-group">
                    <label for="InputmoNo">Mo.no</label>
                    <input type="text" class="form-control" id="InputmoNo" name="phone" placeholder="Phone" required>
                </div>

                <!-- Role -->
                <div class="form-group">
                    <label for="roleSelect">Select Role</label>
                    <select class="form-control" id="roleSelect" name="role" required>
                        <option value="" disabled selected>-Choose Role-</option>
                        <option value="admin">Admin</option>
                        <option value="doctor">Doctor</option>
                        <option value="receptionist">Receptionist</option>
                    </select>
                </div>

                <button type="submit" class="btn btn-primary btn-block">SignUP</button>
                <div class="form-footer text-center mt-3">
                    <p>You have an account? <a href="loginForm">Login</a></p>
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
