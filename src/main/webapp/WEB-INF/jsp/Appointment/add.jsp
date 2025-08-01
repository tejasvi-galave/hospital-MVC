<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../common/header.jsp"></jsp:include>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Appointment</title>
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
                <form action="${pageContext.request.contextPath}/appointments/add" method="post">
                    <h5>Add Appointment</h5>
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="patientId">Patient ID</label>
                            <input type="number" class="form-control" id="patientId" name="patientId" value="${param.patientId}" required>
                        </div>

                        <div class="col-md-6 mb-3">
                            <label for="doctorId">Doctor</label>
				  <select class="form-control" id="doctorId" name="doctorId">
				        <option value="">Select Doctor</option>
				          <c:forEach var="doc" items="${doctors}">
					        <option value="${doc.id}"> Dr. ${doc.firstName} ${doc.lastName}</option>
					     </c:forEach>
				    </select>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="appointmentDate">Appointment Date</label>
                            <input type="date" class="form-control" id="appointmentDate" name="appointmentDate" 
                                    required>
                        </div>

                        <div class="col-md-6 mb-3">
                            <label for="timeSlot">Time Slot</label>
                            <input type="text" class="form-control" id="timeSlot" name="timeSlot" 
                                    placeholder="e.g., 10:30:11.00 AM" required>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="status">Status</label>
                            <select class="form-control" id="status" name="status" required>
                                <option value="">Select</option>
                                <option value="Scheduled" 
                                    <c:if test="${appointment.status == 'Scheduled'}">selected</c:if>>Scheduled</option>
                                <option value="Completed" 
                                    <c:if test="${appointment.status == 'Completed'}">selected</c:if>>Completed</option>
                                <option value="Cancelled" 
                                    <c:if test="${appointment.status == 'Cancelled'}">selected</c:if>>Cancelled</option>
                            </select>
                        </div>
                        
                    <div class="col-md-6 mb-3">
                            <label for="phone">Phone</label>
                            <input type="text" class="form-control" id="phone" name="phone"  value="${param.phone}" required>
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
