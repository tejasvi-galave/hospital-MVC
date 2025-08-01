<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../common/header.jsp"></jsp:include> 

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Patient</title>
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
                <form action="/patient/update" method="post">
                    <h5>Edit Patient</h5>

                    <!-- Hidden field for ID -->
                    <input type="hidden" name="id" value="${patient.id}" />

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="name">Name</label>
                            <input type="text" class="form-control" id="name" name="name" value="${patient.name}" required>
                        </div>

                        <div class="col-md-3 mb-3">
                            <label for="age">Age</label>
                            <input type="number" class="form-control" id="age" name="age" value="${patient.age}" required>
                        </div>

                        <div class="col-md-3 mb-3">
                            <label for="gender">Gender</label>
                            <select class="form-control" id="gender" name="gender" required>
                                <option value="">Select</option>
                                <option value="Male" ${patient.gender == 'Male' ? 'selected' : ''}>Male</option>
                                <option value="Female" ${patient.gender == 'Female' ? 'selected' : ''}>Female</option>
                                <option value="Other" ${patient.gender == 'Other' ? 'selected' : ''}>Other</option>
                            </select>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="phone">Phone</label>
                            <input type="text" class="form-control" id="phone" name="phone" value="${patient.phone}" required>
                        </div>

                        <div class="col-md-6 mb-3">
                            <label for="bloodGroup">Blood Group</label>
                            <select class="form-control" id="bloodGroup" name="bloodGroup" required>
                                <option value="">Select</option>
                                <option value="A+" ${patient.bloodGroup == 'A+' ? 'selected' : ''}>A+</option>
                                <option value="A-" ${patient.bloodGroup == 'A-' ? 'selected' : ''}>A-</option>
                                <option value="B+" ${patient.bloodGroup == 'B+' ? 'selected' : ''}>B+</option>
                                <option value="B-" ${patient.bloodGroup == 'B-' ? 'selected' : ''}>B-</option>
                                <option value="AB+" ${patient.bloodGroup == 'AB+' ? 'selected' : ''}>AB+</option>
                                <option value="AB-" ${patient.bloodGroup == 'AB-' ? 'selected' : ''}>AB-</option>
                                <option value="O+" ${patient.bloodGroup == 'O+' ? 'selected' : ''}>O+</option>
                                <option value="O-" ${patient.bloodGroup == 'O-' ? 'selected' : ''}>O-</option>
                            </select>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="address">Address</label>
                            <textarea class="form-control" id="address" name="address" rows="3" required>${patient.address}</textarea>
                        </div>

                        <div class="col-md-6 mb-3">
                            <label for="medicalHistory">Medical History</label>
                            <textarea class="form-control" id="medicalHistory" name="medicalHistory" rows="3">${patient.medicalHistory}</textarea>
                        </div>
                    </div>

                    <!-- 👇 Status field added here -->
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="status">Status</label>
                            <select class="form-control" id="status" name="status" required>
                                <option value="">Select</option>
                                <option value="Active" ${patient.status == 'Active' ? 'selected' : ''}>Active</option>
                                <option value="Inactive" ${patient.status == 'Inactive' ? 'selected' : ''}>Inactive</option>
                            </select>
                        </div>
                    </div>

                    <button class="btn btn-primary" type="submit">Update</button>
                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>

<jsp:include page="../common/footer.jsp"></jsp:include>
