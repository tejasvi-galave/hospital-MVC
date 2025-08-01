<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../common/header.jsp"></jsp:include> 

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Patient</title>
    <style>
        .main-form {
            width: 76%;
            margin-left: 21.5%;
            margin-top: 8%;
            height: auto;
        }
        h5 {
            margin-bottom: 30px;
            text-align: center;
        }
        label {
            font-size: 14px;
        }
        input, select, textarea {
            font-size: 14px !important;
        }
        
    
    </style>
</head>
<body>

<div class="card main-form">
    <div class="card-body">
        <div class="row">
            <div class="col-sm">
                <form action="patient/add" method="post">
                    <h5>Add Patient</h5>

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="name">Name</label>
                            <input type="text" class="form-control" id="name" name="name" required>
                        </div>

                        <div class="col-md-3 mb-3">
                            <label for="age">Age</label>
                            <input type="number" class="form-control" id="age" name="age" required>
                        </div>

                        <div class="col-md-3 mb-3">
                            <label for="gender">Gender</label>
                            <select class="form-control" id="gender" name="gender" required>
                                <option value="">Select</option>
                                <option value="Male">Male</option>
                                <option value="Female">Female</option>
                                <option value="Other">Other</option>
                            </select>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="phone">Phone</label>
                            <input type="text" class="form-control" id="phone" name="phone" required>
                        </div>

                        <div class="col-md-6 mb-3">
                            <label for="bloodGroup">Blood Group</label>
                            <select class="form-control" id="bloodGroup" name="bloodGroup" required>
                                <option value="">Select</option>
                                <option value="A+">A+</option>
                                <option value="A-">A-</option>
                                <option value="B+">B+</option>
                                <option value="B-">B-</option>
                                <option value="AB+">AB+</option>
                                <option value="AB-">AB-</option>
                                <option value="O+">O+</option>
                                <option value="O-">O-</option>
                            </select>
                        </div>
                    </div>
				  <div class="row">
					    <div class="col-md-6 mb-3">
					        <label for="address">Address</label>
					        <textarea class="form-control" id="address" name="address" rows="3" required></textarea>
					    </div>
					
					    <div class="col-md-6 mb-3">
					        <label for="medicalHistory">Medical History</label>
					        <textarea class="form-control" id="medicalHistory" name="medicalHistory" rows="3"></textarea>
					    </div>
					</div>
                    
                   

                    <button class="btn btn-primary" type="submit">Submit</button>
                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>

<jsp:include page="../common/footer.jsp"></jsp:include>
