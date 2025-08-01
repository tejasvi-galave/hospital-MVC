<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="${pageContext.request.contextPath}../common/header.jsp" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Appointment Records</title>

    <style>
        .top-bar {
            width: 80%;
            margin: 44px auto 20px auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .controls {
            display: flex;
            gap: 10px;
            align-items: center;
            margin-left: 130px!important;
        }

        .controls input {
            padding: 6px 10px;
            border: 1px solid black;
           /*  margin-left: 3%!important; */
        }

        .btn-add {
            background-color: #28a745;
            color: white !important;
            padding: 5px 13px;
            text-decoration: none;
            border-radius: 4px;
            margin-left: 130px;
        }

        table {
            width: 78%;
            margin: 10px auto;
            margin-left: 20%;
            border-collapse: collapse;
        }

        th, td {
            padding: 14px;
            text-align: center;
            border: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
        }
         .icon-center {
            text-align: center;
        }
          .fa-edit {
            color: green;
        }
    </style>
</head>
<body>

<h2 style="text-align: center;">Appointment Records</h2>

<!-- Normal alert() for success and error messages -->
<c:if test="${not empty msg}">
    <script>
        alert('${msg}');
    </script>
</c:if>

<c:if test="${not empty error}">
    <script>
        alert('${error}');
    </script>
</c:if>

<div class="top-bar">
<%--     <a href="${pageContext.request.contextPath}/appointments/form" class="btn-add">Add Appointment</a>
 --%>
    <div class="controls">
        <input type="text" id="searchKeyword" placeholder="Search by phone..." />
    </div>
</div>

<table>
    <thead>
        <tr>
            <th>Appointment ID</th>
            <th>Patient Name</th>
            <th>Appointment Date</th>
            <th>Doctor Name</th>
            <th>Time Slot</th>
            <th>Status</th>
            <th>Phone</th>
            <th>Edit</th>
        </tr>
    </thead>
    <tbody id="appointmentData">
        <c:forEach var="appointment" items="${appointmentList}">
            <tr>
                <td>${appointment.appointmentId}</td>
                <td>${appointment.patientName}</td>
                <td>${appointment.appointmentDate}</td>
                <td>${appointment.doctorName}</td>
                <td>${appointment.timeSlot}</td>
                <td>${appointment.status}</td>
                <td>${appointment.phone}</td>
			    <td class="icon-center">
                    <a href="${pageContext.request.contextPath}/appointments/AppointmentById?id=${appointment.appointmentId}" title="Edit">
                        <i class="fas fa-edit"></i>
                    </a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<div style="text-align: center; margin-top: 20px;">
    <c:if test="${totalPages > 1}">
        <c:forEach var="i" begin="0" end="${totalPages - 1}">
            <c:choose>
                <c:when test="${i == currentPage}">
                    <!-- Highlight Current Page -->
                    <span style="font-weight: bold; color: blue; margin: 0 6px;">[${i + 1}]</span>
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/appointments/all?page=${i}&size=${pageSize}"
                       style="margin: 0 6px;">${i + 1}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </c:if>
</div>
<!-- JavaScript for live search -->
<script>
    const contextPath = "${pageContext.request.contextPath}";

    document.addEventListener("DOMContentLoaded", function () {
        const input = document.getElementById("searchKeyword");

        input.addEventListener("input", async function () {
            const phone = input.value;

            try {
                const response = await fetch(contextPath + "/appointments/searchbyPhone?phone=" + encodeURIComponent(phone));
                const data = await response.json();
              
                let tbody = "";

                if (data.length === 0) {
                    tbody = `
                        <tr>
                            <td colspan="7" style="text-align:center;">No appointment found</td>
                        </tr>`;
                } else {
                    data.forEach(list => {
                        tbody += `
                            <tr>
                                <td>\${list.appointmentId}</td>
                                <td>\${list.patientName}</td>
                                <td>\${list.appointmentDate}</td>
                                <td>\${list.doctorName}</td>
                                <td>\${list.timeSlot}</td>
                                <td>\${list.status}</td>
                                <td>\${list.phone}</td>
                                <td class="icon-center">
                                <a href="${pageContext.request.contextPath}/appointments/AppointmentById?id=${appointment.appointmentId}" title="Edit">
                                    <i class="fas fa-edit"></i>
                                </a>
                            </td>
                            </tr>`;
                    });
                }

                document.getElementById("appointmentData").innerHTML = tbody;

            } catch (error) {
                alert("Error while searching appointments: " + error.message);
            }
        });
    });
</script>

</body>
</html>

<jsp:include page="../common/footer.jsp" />
