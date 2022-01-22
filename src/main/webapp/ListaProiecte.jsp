<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Ibidem
  Date: 1/4/2022
  Time: 9:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <title>Tabel Proiecte</title>

    <meta name="viewport" content="width=device-width, initial-scale=1" charset="UTF-8">

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core/dist/umd/popper.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap/dist/js/bootstrap.min.js" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.css">
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Readex+Pro" rel="stylesheet">
    <link rel="stylesheet" href="styles.css">

    <script>
        $(document).ready(function ()
        {
            $('#proiect_table').DataTable(
                {
                    pageLength: 10,
                    "language": {
                        "decimal": ",",
                        "emptyTable": "Nu există date în tabel",
                        "info": "Se afișează de la _START_ la _END_ din _TOTAL_ proiecte",
                        "infoEmpty": "Se afișează 0 proiect",
                        "infoFiltered": "(selectați dintr-un total de _MAX_)",
                        "infoPostFix": "",
                        "thousands": ".",
                        "lengthMenu": "Afișează _MENU_ proiecte/pagină",
                        "loadingRecords": "Se încarcă...",
                        "processing": "Se procesează...",
                        "search": "Căutare:",
                        "zeroRecords": "Nu s-a găsit niciun proiect",
                        "paginate": {
                            "first": "Prima",
                            "last": "Ultima",
                            "next": "Înainte",
                            "previous": "Înapoi"
                        }
                    }
                }
            );
        });
    </script>

</head>

<body>



<div class="m-4 title">
    Clienți
</div>

<div class="container">
    <div class="row">

        <div class="col-sm text-center ">
            <button type="submit" class="btn btn-primary btn-lg m-2 fix-button" data-bs-toggle="modal" data-bs-target="#proiect_update_modal">
                Modifică un proiect
            </button>
        </div>

        <div class="col-sm text-center menu ">
            <button class="btn btn-primary btn-lg m-2 fix-button" onclick="location.href='/';" value="Home">
                Home
            </button>
        </div>

        <div class="col-sm text-center ">
            <button type="submit" class="btn btn-primary btn-lg m-2 fix-button" data-bs-toggle="modal" data-bs-target="#proiect_delete_modal">
                Șterge un proiect
            </button>
        </div>
    </div>
</div>

<!-- Proiecte Update Modal -->
<div class="modal fade" id="proiect_update_modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
     aria-labelledby="proiect_update_modal_label" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="proiect_update_modal_label">Modifică un proiect</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="Proiecte" method="POST">
                <div class="modal-body">

                    <div class="row g-3">
                        <div class="col-12">
                            <div class="form-floating">
                                <select type="text" class="form-control" name="Select_proiect_Update" aria-label="Select proiect"
                                        id="Select_proiect_Update">
                                    <c:forEach items="${proiectList}" var="proiect">
                                        <option value="${proiect.ID_PROIECT}">${proiect.NUME} </option>
                                    </c:forEach>
                                </select>
                                <label for="Select_proiect_Update">Proiect</label>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-floating">
                                <input type="text" class="form-control" name="Nume_update" placeholder="Nume" aria-label="Nume" id="Nume_update"
                                       maxlength="45" >
                                <label for="Nume_update">Nume</label>
                            </div>
                        </div>

                        <div class="col-12">
                            <div class="form-floating">
                                <input type="text" class="form-control" name="Status_update" placeholder="Status" aria-label="Status"
                                       id="Status_update" maxlength="45">
                                <label for="Status_update">Status</label>
                            </div>
                        </div>

                        <div class="col-12">
                            <div class="form-floating">
                                <input type="text" class="form-control" name="Tip_update" placeholder="Tip" aria-label="Tip"
                                       id="Tip_update" maxlength="45" >
                                <label for="Tip_update">Tip</label>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-floating">
                                <input type="date" class="form-control" name="Start_date_update" placeholder="Start_date" aria-label="Start_date" id="Start_date_update">
                                <label for="Start_date_update">Data Start</label>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-floating">
                                <input type="date" class="form-control" name="Finish_date_update" placeholder="Finish_date" aria-label="Finish_date" id="Finish_date_update">
                                <label for="Finish_date_update">Data Finish</label>
                            </div>
                        </div>

                    </div>


                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Închide</button>
                    <button type="submit" class="btn btn-primary" name="updateProiect">Modifică</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Proiect Delete Modal -->
<div class="modal fade" id="proiect_delete_modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
     aria-labelledby="proiect_delete_modal_label" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="proiect_delete_modal_label">Șterge un proiect</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="Proiecte" method="POST">
                <div class="modal-body">

                    <div class="row g-3">
                        <div class="col-12">
                            <div class="form-floating">
                                <select type="text" class="form-control" name="Select_proiect_Delete" aria-label="Select proiect"
                                        id="Select_proiect_Delete">
                                    <%--@elvariable id="proiectList" type="java.util.List"--%>
                                    <c:forEach items="${proiectList}" var="proiect">
                                        <option value="${proiect.ID_PROIECT}">${proiect.NUME}</option>
                                    </c:forEach>
                                </select>
                                <label for="Select_proiect_Delete">Proiect</label>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Închide</button>
                    <button type="submit" class="btn btn-primary" name="deleteProiect">Șterge</button>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="m-5">
    <table id="proiect_table" class="table table-striped cell-border">
        <thead>
        <tr class="table-dark text-center align-middle">
            <th scope="col">NUME</th>
            <th scope="col">STATUS</th>
            <th scope="col">TIP</th>
            <th scope="col">START_DATE</th>
            <th scope="col">FINISH_DATE</th>
        </tr>
        </thead>

        <tbody>
        <%--@elvariable id="proiectList" type="java.util.List"--%>
        <c:forEach var="proiect" items="${proiectList}">
            <tr class="align-middle">
                <td class="text-center">${proiect.NUME}</td>
                <td class="text-center">${proiect.STATUS}</td>
                <td class="text-center">${proiect.TIP}</td>
                <td class="text-center">${proiect.START_DATE}</td>
                <td class="text-center">${proiect.FINISH_DATE}</td>

            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
