
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
            width: 75%;
            margin-left: 275px;
            margin-right: 10px;
           
        }

        table {
            width: 75%;
            border-collapse: collapse;
            table-layout: auto;
             border: 1px solid black;
        }

        th, td {
            padding: 5px 5px; /* Small padding for all cells */
            
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

        .add-Receptionist-button {
        left: 35%;
		position: fixed;
		top: 17%;
		width: 9%;
		border-radius: 11%;
           
        }
        tr{
          border: 1px solid black;
        }

        .btn-primary {
            padding: 6px 12px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            cursor: pointer;
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
<div class="add-Receptionist-button">
    <a href="${pageContext.request.contextPath}/receptionistForm" class="btn-primary">
        Add Recept <i class="fas fa-plus"></i>
    </a>
</div>

<table id="ReceptionistTable" class="display">
    <thead>
        <tr>
            <th>Id</th>
            <th>Name</th>          
            <th>Email</th>
             <th>Phone</th>
             <th>dateOfBirth</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="recept" items="${recept}">
            <tr>
                <td>${recept.id}</td>
                <td>${recept.name}</td>
                 <td>${recept.email}</td>
                <td>${recept.phone}</td>
                <td>${recept.dob}</td>
                <td class="icon-center">
                    <a href="${pageContext.request.contextPath}/ReceptionistUpdateForm?id=${recept.id}&name=${recept.name}&email=${recept.email}&phone=${recept.phone}&dob=${recept.dob}" title="Edit">
                        <i class="fas fa-edit"></i>
                    </a>
                </td>
                <td class="icon-center">
                    <a href="${pageContext.request.contextPath}/receptionist/deleteReceptionist?id=${recept.id}" title="Delete" onclick="return confirm('Are you sure ?');">
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
        $('#ReceptionistTable').DataTable({
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
