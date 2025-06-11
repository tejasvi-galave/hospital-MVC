<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../common/header.jsp"></jsp:include> 

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Doctor</title>
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
                <form class="needs-validation" action="editDoctor" method="post">
                    <input type="hidden" name="id" value="${param.id}">
                    <h5>Edit Doctor</h5>

                    <div class="row">
                        <div class="col-md-4 mb-3">
                            <label for="firstName">First Name</label>
                            <input type="text" class="form-control" name="firstName" value="${param.firstName}" required>
                        </div>

                        <div class="col-md-4 mb-3">
                            <label for="lastName">Last Name</label>
                            <input type="text" class="form-control" name="lastName" value="${param.lastName}" required>
                        </div>

                        <div class="col-md-4 mb-3">
                            <label for="phone">Phone</label>
                            <input type="text" class="form-control" name="phone" value="${param.phone}" required>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="email">Email</label>
                            <input type="email" class="form-control" name="email" value="${param.email}" required>
                        </div>

                        <div class="col-md-3 mb-3">
                            <label for="department">Department</label>
                            <select class="form-control" name="department" required>
                                <option value="">Select Department</option>
                                <option value="cardiology" <c:if test="${param.department == 'cardiology'}">selected</c:if>>Cardiology</option>
                                <option value="neurology" <c:if test="${param.department == 'neurology'}">selected</c:if>>Neurology</option>
                                <option value="orthopedics" <c:if test="${param.department == 'orthopedics'}">selected</c:if>>Orthopedics</option>
                                <option value="pediatrics" <c:if test="${param.department == 'pediatrics'}">selected</c:if>>Pediatrics</option>
                                <option value="radiology" <c:if test="${param.department == 'radiology'}">selected</c:if>>Radiology</option>
                                <option value="general_surgery" <c:if test="${param.department == 'general_surgery'}">selected</c:if>>General Surgery</option>
                                <option value="gynaecology" <c:if test="${param.department == 'gynaecology'}">selected</c:if>>Gynaecology</option>
                            </select>
                        </div>

                        <div class="col-md-3 mb-3">
                            <label for="speciality">Speciality</label>
                            <select class="form-control" name="speciality" required>
                                <option value="">Select Speciality</option>
                                <option value="cardiology" <c:if test="${param.speciality == 'cardiology'}">selected</c:if>>Cardiology</option>
                                <option value="dermatology" <c:if test="${param.speciality == 'dermatology'}">selected</c:if>>Dermatology</option>
                                <option value="neurology" <c:if test="${param.speciality == 'neurology'}">selected</c:if>>Neurology</option>
                                <option value="pediatrics" <c:if test="${param.speciality == 'pediatrics'}">selected</c:if>>Pediatrics</option>
                                <option value="orthopedics" <c:if test="${param.speciality == 'orthopedics'}">selected</c:if>>Orthopedics</option>
                            </select>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-4 mb-3">
                            <label for="fromTime">Available From</label>
                            <input type="time" class="form-control" name="fromTime" value="${param.fromTime}" required>
                        </div>

                        <div class="col-md-4 mb-3">
                            <label for="toTime">Available To</label>
                            <input type="time" class="form-control" name="toTime" value="${param.toTime}" required>
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
