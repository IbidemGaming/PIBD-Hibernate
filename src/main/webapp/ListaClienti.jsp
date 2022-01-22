<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Ibidem
  Date: 1/4/2022
  Time: 4:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <title>Tabel Clienți</title>

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
            $('#clienti_table').DataTable(
                {
                    pageLength: 10,
                    "language": {
                        "decimal": ",",
                        "emptyTable": "Nu există date în tabel",
                        "info": "Se afișează de la _START_ la _END_ din _TOTAL_ clienți",
                        "infoEmpty": "Se afișează 0 clienti",
                        "infoFiltered": "(selectați dintr-un total de _MAX_)",
                        "infoPostFix": "",
                        "thousands": ".",
                        "lengthMenu": "Afișează _MENU_ clienți/pagină",
                        "loadingRecords": "Se încarcă...",
                        "processing": "Se procesează...",
                        "search": "Căutare:",
                        "zeroRecords": "Nu s-a găsit niciun client",
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
            <button type="submit" class="btn btn-primary btn-lg m-2 fix-button" data-bs-toggle="modal" data-bs-target="#clienti_update_modal">
                Modifică un client
            </button>
        </div>

        <div class="col-sm text-center menu ">
            <button class="btn btn-primary btn-lg m-2 fix-button" onclick="location.href='/';" value="Home">
                Home
            </button>
        </div>

        <div class="col-sm text-center ">
            <button type="submit" class="btn btn-primary btn-lg m-2 fix-button" data-bs-toggle="modal" data-bs-target="#clienti_delete_modal">
                Șterge un client
            </button>
        </div>
    </div>
</div>

<!-- Clienti Update Modal -->
<div class="modal fade" id="clienti_update_modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
     aria-labelledby="clienti_update_modal_label" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="clienti_update_modal_label">Modifică un client</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form autocomplete="on" action="Clienti" method="POST">
                <div class="modal-body">

                    <div class="row g-3">
                        <div class="col-12">
                            <div class="form-floating">
                                <select type="text" class="form-control" name="Select_client_Update" aria-label="Select client"
                                        id="Select_client_Update">
                                    <c:forEach items="${clientList}" var="client">
                                        <option value="${client.ID_CLIENT}">${client.PRENUME} ${client.NUME} (${client.CNP})</option>
                                    </c:forEach>
                                </select>
                                <label for="Select_client_Update">Client</label>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-floating">
                                <input type="text" class="form-control" name="Prenume_update" placeholder="Prenume" aria-label="Prenume"
                                       id="Prenume_update" maxlength="45" pattern="[A-ZĂÂÎȚȘ]{1}[a-zăâîțș]+(-[A-ZĂÂÎȚȘ]{1}[a-zăâîțș]+)*"
                                       autocomplete="given-name">
                                <label for="Prenume_update">Prenume</label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-floating">
                                <input type="text" class="form-control" name="Nume_update" placeholder="Nume" aria-label="Nume" id="Nume_update"
                                       maxlength="45" pattern="[A-Za-zăâîțșĂÂÎȚȘ]+(-[A-Za-zăâîțșĂÂÎȚȘ]+)*" autocomplete="family-name">
                                <label for="Nume_update">Nume</label>
                            </div>
                        </div>

                        <div class="col-12">
                            <div class="form-floating">
                                <input type="text" class="form-control" name="CNP_update" placeholder="Cod Numeric Personal (CNP)" aria-label="CNP"
                                       id="CNP_update" maxlength="13" pattern="\d{13}">
                                <label for="CNP_update">Cod Numeric Personal (CNP)</label>
                            </div>
                        </div>

                        <div class="col-12">
                            <div class="form-floating">
                                <input type="tel" class="form-control" name="Telefon_update" placeholder="Telefon" aria-label="Telefon"
                                       id="Telefon_update" autocomplete="tel" maxlength="13" pattern="\+\d{11,12}">
                                <label for="Telefon_update">Telefon</label>
                            </div>
                        </div>

                        <div class="col-12">
                            <div class="form-floating">
                                <input type="email" class="form-control" name="Email_update" placeholder="Email" aria-label="Email" id="Email_update"
                                       autocomplete="email" maxlength="45"
                                       pattern="([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)">
                                <label for="Email_update">Email</label>
                            </div>
                        </div>

                        <div class="col-12">
                            <div class="form-floating">
                                <input type="text" class="form-control" name="Adresa_update" placeholder="Adresa" aria-label="Adresa" id="Adresa_update"
                                       maxlength="45"
                                       >
                                <label for="Adresa_update">Adresa</label>
                            </div>
                        </div>
                    </div>


                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Închide</button>
                    <button type="submit" class="btn btn-primary" name="updateClient">Modifică</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Judecători Delete Modal -->
<div class="modal fade" id="clienti_delete_modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
     aria-labelledby="clienti_delete_modal_label" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="clienti_delete_modal_label">Șterge un client</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form autocomplete="on" action="Clienti" method="POST">
                <div class="modal-body">

                    <div class="row g-3">
                        <div class="col-12">
                            <div class="form-floating">
                                <select type="text" class="form-control" name="Select_client_Delete" aria-label="Select client"
                                        id="Select_client_Delete">
                                    <%--@elvariable id="clientList" type="java.util.List"--%>
                                    <c:forEach items="${clientList}" var="client">
                                        <option value="${client.ID_CLIENT}">${client.PRENUME} ${client.NUME} (${client.CNP})</option>
                                    </c:forEach>
                                </select>
                                <label for="Select_client_Delete">Client</label>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Închide</button>
                    <button type="submit" class="btn btn-primary" name="deleteClient">Șterge</button>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="m-5">
    <table id="clienti_table" class="table table-striped cell-border">
        <thead>
        <tr class="table-dark text-center align-middle">
            <th scope="col">NUME</th>
            <th scope="col">PRENUME</th>
            <th scope="col">CNP</th>
            <th scope="col">TELEFON</th>
            <th scope="col">EMAIL</th>
            <th scope="col">ADRESA</th>
        </tr>
        </thead>

        <tbody>
        <%--@elvariable id="clientList" type="java.util.List"--%>
        <c:forEach var="client" items="${clientList}">
            <tr class="align-middle">
                <td class="text-center">${client.NUME}</td>
                <td class="text-center">${client.PRENUME}</td>
                <td class="text-center">${client.CNP}</td>
                <td class="text-center">${client.TELEFON}</td>
                <td>${client.EMAIL}</td>
                <td>${client.ADRESA}</td>

            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
