<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../common/header.jsp"></jsp:include>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Appointment</title>
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
        button{
         width:10% !important;
       }
    </style>
</head>
<body>

<div class="card main-form">
    <div class="card-body">
        <div class="row">
            <div class="col-sm">
                <form action="${pageContext.request.contextPath}/appointments/update" method="post">
                    <h5>Edit Appointment</h5>

                       <input type="hidden" name="appointmentId" value="${appointment.appointmentId}" /> 
                    <div class="row">
						                    
				       <div class="col-md-6 mb-3">
						    <label for="patientName">Patient Name</label>
						    <input type="text" class="form-control" id="patientName" value="${appointment.patientName}" readonly>
						    <input type="hidden" name="patientId" value="${appointment.patientId}" />
						</div>
						
						<!-- Doctor Name (read-only) -->
					 <div class="col-md-6 mb-3">
						<label for="doctorName">Doctor Name</label>
					    <input type="text" class="form-control" id="doctorName" value="${appointment.doctorName}" readonly>
					    <input type="hidden" name="doctorId" value="${appointment.doctorId}" />
					 </div>
	                   </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="appointmentDate">Appointment Date</label>
                            <input type="date" class="form-control" id="appointmentDate" name="appointmentDate"
                                   value="${appointment.appointmentDate}" required />
                        </div>

                        <div class="col-md-6 mb-3">
                            <label for="timeSlot">Time Slot</label>
                            <input type="text" class="form-control" id="timeSlot" name="timeSlot"
                                   value="${appointment.timeSlot}" placeholder="e.g., 10:30-11:00 AM" required />
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="status">Status</label>
                            <select class="form-control" id="status" name="status" required>
                                <option value="">Select</option>
                                <option value="Scheduled" <c:if test="${appointment.status == 'Scheduled'}">selected</c:if>>Scheduled</option>
                                <option value="Completed" <c:if test="${appointment.status == 'Completed'}">selected</c:if>>Completed</option>
                                <option value="Cancelled" <c:if test="${appointment.status == 'Cancelled'}">selected</c:if>>Cancelled</option>
                            </select>
                        </div>

                        <div class="col-md-6 mb-3">
                            <label for="phone">Phone</label>
                            <input type="text" class="form-control" id="phone" name="phone"
                                   value="${appointment.phone}" required />
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
