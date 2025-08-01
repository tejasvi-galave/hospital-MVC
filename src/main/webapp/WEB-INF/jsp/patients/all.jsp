<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="${pageContext.request.contextPath}../common/header.jsp" />
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Patient List</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

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
            margin-left: 250px!important;
        }

        .controls input,
        .controls select {
            padding: 6px 10px;
            border: 1px solid black;
        }

        select {
            margin-left: 9%!important;
        }

        input {
            margin-left: 19%!important;
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
            padding: 7px;
            text-align: center;
            border: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
        }

        .btn {
            padding: 5px 10px;
            text-decoration: none;
            border-radius: 4px;
            color: white;
        }

        .btn-edit {
            background-color: #28a745 !important;
        }

        .btn-delete {
            background-color: #dc3545 !important;
        }

        .btn-appointment {
            background-color: #007bff !important;
        }

        .custom-swal-padding {
            padding: 0.5rem !important;
        }

        .custom-swal-padding .swal2-title {
            margin: 0.5rem 0 !important;
            font-size: 1.2rem;
        }

        .custom-swal-padding .swal2-content {
            margin: 0.5rem 0 !important;
            font-size: 1rem;
        }

        .custom-swal-padding .swal2-actions {
            margin-top: 0.3rem !important;
        }

        .icon-center {
            text-align: center;
        }

        .fa-edit {
            color: green;
        }

        .fa-notes-medical {
            color: #007bff;
        }
    </style>
</head>
<body>

<h2 style="text-align: center;">Patient Records</h2>

<!-- Toast Message Handling -->
<c:if test="${not empty msg}">
    <script>
        Swal.fire({
            toast: true,
            position: 'top-end',
            icon: 'success',
            title: '${msg}',
            showConfirmButton: false,
            timer: 5000,
            timerProgressBar: true,
            background: '#ffffff',
            color: '#000000',
            iconColor: '#28a745',
            customClass: {
                popup: 'custom-swal-padding'
            }
        });
    </script>
</c:if>

<c:if test="${not empty error}">
    <script>
        Swal.fire({
            toast: true,
            position: 'top-end',
            icon: 'error',
            title: '${error}',
            showConfirmButton: false,
            timer: 3000,
            timerProgressBar: true,
            background: '#ffffff',
            color: '#000000',
            iconColor: '#dc3545',
            customClass: {
                popup: 'custom-swal-padding'
            }
        });
    </script>
</c:if>

<div class="top-bar">
    <a href="${pageContext.request.contextPath}/patientForm" class="btn-add">Add Patient</a>
    <div class="controls">
        <input type="text" id="searchKeyword" placeholder="Search by name" />
        
 <select id="statusDropdown" onchange="window.location.href=this.value">
    <c:set var="isActive" value="${fn:contains(pageContext.request.requestURI, 'getActiveRecordByUserId')}" />
    <c:set var="isInactive" value="${fn:contains(pageContext.request.requestURI, 'getInactiveRecord')}" />

    <option value="" disabled 
        <c:if test="${!isActive && !isInactive}">selected</c:if>>
        Select By Status
    </option>

    <option value="${pageContext.request.contextPath}/patient/getActiveRecordByUserId"
        data-status="Active"
        <c:if test="${isActive}">selected</c:if>>
        Active
    </option>

    <option value="${pageContext.request.contextPath}/patient/getInactiveRecord"
        data-status="Inactive"
        <c:if test="${isInactive}">selected</c:if>>
        Inactive
    </option>
</select>

    </div>
</div>

<table>
    <thead>
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Age</th>
            <th>Gender</th>
            <th>Phone</th>
            <th>Blood Group</th>
            <th>Address</th>
            <th>Medical History</th>
            <th>Edit</th>
            <th>Appointment</th>
        </tr>
    </thead>
    <tbody id="patientData">
        <c:forEach var="patient" items="${patientList}">
            <tr>
                <td>${patient.id}</td>
                <td>${patient.name}</td>
                <td>${patient.age}</td>
                <td>${patient.gender}</td>
                <td>${patient.phone}</td>
                <td>${patient.bloodGroup}</td>
                <td>${patient.address}</td>
                <td>${patient.medicalHistory}</td>
                <td class="icon-center">
                    <a href="${pageContext.request.contextPath}/patient/getPatient?id=${patient.id}" title="Edit">
                        <i class="fas fa-edit"></i>
                    </a>
                </td>
                <td class="icon-center">
                    <a href="${pageContext.request.contextPath}/appointments/AppointmentForm?patientId=${patient.id}&phone=${patient.phone}" title="Appointment">
                        <i class="fas fa-notes-medical"></i>
                    </a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
<!-- Pagination: Numbered Buttons Only -->
 <div style="text-align: center; margin-top: 20px;">
    <c:if test="${totalPages > 1}">
        <c:forEach var="i" begin="0" end="${totalPages - 1}">
            <c:choose>
                <c:when test="${i == currentPage}">
                    <!-- Highlight Current Page -->
                    <span style="font-weight: bold; color: blue; margin: 0 6px;">[${i + 1}]</span>
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/patient/getActiveRecordByUserId?page=${i}&size=${pageSize}"
                       style="margin: 0 6px;">${i + 1}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </c:if>
</div>


<!-- Async/Await Search Logic -->
<script>
 
    const contextPath = "${pageContext.request.contextPath}";

    // Fix dropdown selected option after reload
    document.addEventListener("DOMContentLoaded", function () {
        const dropdown = document.getElementById("statusDropdown");
        const currentUrl = window.location.href;

        if (currentUrl.includes("getActiveRecordByUserId")) {
            dropdown.value = contextPath + "/patient/getActiveRecordByUserId";
        } else if (currentUrl.includes("getInactiveRecord")) {
            dropdown.value = contextPath + "/patient/getInactiveRecord";
        }

        // Search by name with selected status
        const input = document.getElementById("searchKeyword");

        input.addEventListener("input", async function () {
            const name = input.value;
            const selectedOption = dropdown.options[dropdown.selectedIndex];
            const status = selectedOption.getAttribute("data-status");

            try {
                const response = await fetch(contextPath + "/patient/searchbyName?name=" + encodeURIComponent(name)+ "&status=" + encodeURIComponent(status));
                const data = await response.json();

                let tbody = "";
                
                if (data.length === 0) {
                    tbody = `
                        <tr>
                            <td colspan="10" style="text-align:center;">No patient found</td>
                        </tr>`;
                } else {
                data.forEach(list => {
                    tbody += `
                        <tr>
                            <td>\${list.id}</td>
                            <td>\${list.name}</td>
                            <td>\${list.age}</td>
                            <td>\${list.gender}</td>
                            <td>\${list.phone}</td>
                            <td>\${list.bloodGroup}</td>
                            <td>\${list.address}</td>
                            <td>\${list.medicalHistory}</td>
                            <td class="icon-center">
                                <a href="\${contextPath}/patient/getPatient?id=${list.id}" title="Edit">
                                    <i class="fas fa-edit"></i>
                                </a>
                            </td>
                            <td class="icon-center">
                                <a href="\${contextPath}/addAppointment?patientId=${list.id}" title="Appointment">
                                    <i class="fas fa-notes-medical"></i>
                                </a>
                            </td>
                        </tr>`;
                });
              }

                document.getElementById("patientData").innerHTML = tbody;

            } catch (error) {
                console.error("Error fetching patient data:", error);
            }
        });
    });
    
</script>
</body>
</html>

<jsp:include page="../common/footer.jsp" />
