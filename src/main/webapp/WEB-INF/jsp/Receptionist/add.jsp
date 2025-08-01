<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../common/header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Receptionist</title>
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
        input {
            font-size: 14px !important;
        }
    </style>
</head>
<body>

<div class="card main-form">
    <div class="card-body">
        <div class="row">
            <div class="col-sm">
                <form class="needs-validation" action="receptionist/add" method="post">
                    <h5>Add Receptionist</h5>

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label class="mb-2" for="name">Name</label>
                            <input type="text" class="form-control" id="name" name="name" placeholder="Full Name" required>
                            <div class="valid-feedback">Looks good!</div>
                        </div>

                        <div class="col-md-6 mb-3">
                            <label class="mb-2" for="email">Email</label>
                            <input type="email" class="form-control" id="email" name="email" placeholder="example@mail.com" required>
                            <div class="invalid-feedback">Please provide a valid email.</div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label class="mb-2" for="phone">Phone</label>
                            <input type="text" class="form-control" id="phone" name="phone" placeholder="1234567890" required>
                            <div class="invalid-feedback">Please provide a valid phone number.</div>
                        </div>

                        <div class="col-md-6 mb-3">
                            <label class="mb-2" for="dob">Date of Birth</label>
                            <input type="date" class="form-control" id="dob" name="dob" required>
                            <div class="invalid-feedback">Please provide a date of birth.</div>
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
