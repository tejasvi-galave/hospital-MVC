<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../common/header.jsp"></jsp:include> 

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Doctor List</title>

    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <!-- DataTables CSS -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css"/>

    <style>
        .dataTables_wrapper {
            margin: 40px;
            width: 80%;
            margin-left: 250px;
            margin-right: 10px;
        }

        table {
            width: 80%;
            border-collapse: collapse;
            table-layout: auto;
        }

        th, td {
            padding: 5px 7px; /* Small padding for all cells */
        }

        th {
            background-color: #f4f4f4;
        }

        .icon-center {
            text-align: center;
        }

        .fa-edit {
            color: green;
        }

        .fa-trash-alt {
            color: red;
        }

        /* Align Search and Entries */
        div.dataTables_wrapper div.dataTables_filter {
            text-align: right;
        }

        div.dataTables_wrapper div.dataTables_length {
            text-align: left;
        }

        h2 {
            margin-left: 30px;
            margin-top: 20px;
        }

        .add-doctor-button {
          left:35%;
          position: fixed; 
          top:19%;
           width:9%;
           border-radius: 11%;
        }

        .btn-primary {
            padding: 6px 12px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            font-size: 14px;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<h2>Doctor Records</h2>

<!-- Add Doctor Button -->
<div class="add-doctor-button" >
    <a href="doctorForm" class="btn-primary">Add Doctor
         <i class="fas fa-plus"></i> 
   
</div>
 </a>
<!-- Doctor Table -->
<table id="doctorTable" class="display">
    <thead>
        <tr>
            <th>Id</th>
            <th>Name</th>          
            <th>Phone</th>
            <th>Email</th>
            <th>Department</th>
            <th>Specialization</th>
            <th>Available Time</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="doc" items="${doctorList}">
            <tr>
                <td>${doc.id}</td>
                <td>${doc.firstName} ${doc.lastName}</td>
                <td>${doc.phone}</td>
                <td>${doc.email}</td>
                <td>${doc.department}</td>
                <td>${doc.speciality}</td>
                <td>${doc.fromTime}Am to ${doc.toTime}Pm</td>
                <td class="icon-center">
                    <a href="updateForm?id=${doc.id}&firstName=${doc.firstName}&lastName=${doc.lastName}&phone=${doc.phone}&email=${doc.email}&department=${doc.department}&speciality=${doc.speciality}&fromTime=${doc.fromTime}&toTime=${doc.toTime}" title="Edit">
                        <i class="fas fa-edit"></i>
                    </a>
                </td>
                <td class="icon-center">
                    <a href="deleteDoctor?id=${doc.id}" title="Delete" onclick="return confirm('Are you sure you want to delete this doctor?');">
                        <i class="fas fa-trash-alt"></i>
                    </a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<!-- jQuery and DataTables JS -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>

<script>
    $(document).ready(function () {
        $('#doctorTable').DataTable({
            paging: true,
            searching: true,
            ordering: true,
            info: true,
            dom: '<"top"lf>rt<"bottom"ip><"clear">'
        });
    });
</script>

</body>
</html>

<jsp:include page="../common/footer.jsp"></jsp:include>
