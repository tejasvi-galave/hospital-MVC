<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../common/header.jsp"></jsp:include> 

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Doctor</title>
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
            font-style: inherit;
        }
        label {
            font-size: 14px;
        }
        input, select {
            font-size: 14px !important;
        }
    </style>
</head>
<body>

<div class="card main-form">
    <div class="card-body">
        <div class="row">
            <div class="col-sm">
                <form class="needs-validation" action="addDoctor" method="post">
                    <h5>Add Doctor</h5>

                    <div class="row">
                        <div class="col-md-4 mb-3">
                            <label class="mb-2" for="firstName">First Name</label>
                            <input type="text" class="form-control" id="firstName" name="firstName" placeholder="john" required>
                            <div class="valid-feedback">Looks good!</div>
                        </div>

                        <div class="col-md-4 mb-3">
                            <label class="mb-2" for="lastName">Last Name</label>
                            <input type="text" class="form-control" id="lastName" name="lastName" placeholder="sharma" required>
                            <div class="valid-feedback">Looks good!</div>
                        </div>

                        <div class="col-md-4 mb-3">
                            <label class="mb-2" for="phone">Phone</label>
                            <input type="text" class="form-control" id="phone" name="phone" placeholder="1234567890" required>
                            <div class="invalid-feedback">Please provide a phone number.</div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label class="mb-2" for="email">Email</label>
                            <input type="email" class="form-control" id="email" name="email" placeholder="john@gmail.com" required>
                            <div class="invalid-feedback">Please provide a valid email.</div>
                        </div>

                        <div class="col-md-3 mb-3">
                            <label class="mb-2" for="department">Department</label>
                            <select class="form-control" id="department" name="department" required>
                                <option value="">Select Department</option>
                                <option value="cardiology">Cardiology</option>
                                <option value="neurology">Neurology</option>
                                <option value="orthopedics">Orthopedics</option>
                                <option value="pediatrics">Pediatrics</option>
                                <option value="radiology">Radiology</option>
                                <option value="general_surgery">General Surgery</option>
                                <option value="gynaecology">Gynaecology</option>
                            </select>
                            <div class="invalid-feedback">Please select a department.</div>
                        </div>

                        <div class="col-md-3 mb-3">
                            <label class="mb-2" for="speciality">Speciality</label>
                            <select class="form-control" id="speciality" name="speciality" required>
                                <option value="">Select Speciality</option>
                                <option value="cardiology">Cardiology</option>
                                <option value="dermatology">Dermatology</option>
                                <option value="neurology">Neurology</option>
                                <option value="pediatrics">Pediatrics</option>
                                <option value="orthopedics">Orthopedics</option>
                            </select>
                            <div class="invalid-feedback">Please select a speciality.</div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-4 mb-3">
                            <label class="mb-2" for="fromTime">Available From</label>
                            <input type="time" class="form-control" id="fromTime" name="fromTime"  required>
                            <div class="valid-feedback">Looks good!</div>
                        </div>

                        <div class="col-md-4 mb-3">
                            <label class="mb-2" for="toTime">Available To</label>
                            <input type="time" class="form-control" id="toTime" name="toTime"  required>
                            <div class="valid-feedback">Looks good!</div>
                        </div>
                    </div>

                    <button class="btn btn-primary" type="submit">Submit Form</button>
                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>

<jsp:include page="../common/footer.jsp"></jsp:include>
