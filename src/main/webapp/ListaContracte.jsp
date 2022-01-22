<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Ibidem
  Date: 1/5/2022
  Time: 11:43 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<html lang="ro">

<head>

  <title>Tabel Contracte</title>

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
      $('#contracte_table').DataTable(
              {
                pageLength: 10,
                "language": {
                  "decimal": ",",
                  "emptyTable": "Nu există date în tabel",
                  "info": "Se afișează de la _START_ la _END_ din _TOTAL_ contracte",
                  "infoEmpty": "Se afișează 0 contracte",
                  "infoFiltered": "(selectate dintr-un total de _MAX_)",
                  "infoPostFix": "",
                  "thousands": ".",
                  "lengthMenu": "Afișează _MENU_ contracte/pagină",
                  "loadingRecords": "Se încarcă...",
                  "processing": "Se procesează...",
                  "search": "Căutare:",
                  "zeroRecords": "Nu s-a găsit niciun contract",
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
  Contracte
</div>

<div class="container">
  <div class="row">

    <div class="col-sm text-center">
      <button type="submit" class="btn btn-primary btn-lg m-2 fix-button" data-bs-toggle="modal" data-bs-target="#contracte_update_modal">
        Modifică un contract
      </button>
    </div>

    <div class="col-sm text-center menu">
      <button class="btn btn-primary btn-lg m-2 fix-button" onclick="location.href='/';" value="Home">
        Home
      </button>
    </div>

    <div class="col-sm text-center">
      <button type="submit" class="btn btn-primary btn-lg m-2 fix-button" data-bs-toggle="modal" data-bs-target="#contracte_delete_modal">
        Șterge un contract
      </button>
    </div>
  </div>
</div>

<!-- Contracte Update Modal -->
<div class="modal fade" id="contracte_update_modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
     aria-labelledby="contracte_update_modal_label" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="contracte_update_modal_label">Modifică un contract</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <form autocomplete="on" action="Contracte" method="POST">
        <div class="modal-body">

          <div class="row g-3">
            <div class="col-12">
              <div class="form-floating">
                <select type="text" class="form-control" name="Select_contract_Update" aria-label="Contracte"
                        id="Select_contract_Update">
                  <%--@elvariable id="contractList" type="java.util.List"--%>
                  <c:forEach var="contract" items="${contractList}">
                    <option value="${contract.ID_CONTRACT}">${contract.PROIECT.NUME}
                      - ${contract.CLIENT.NUME} ${contract.CLIENT.PRENUME} (${contract.CLIENT.CNP})
                    </option>
                  </c:forEach>
                </select>
                <label for="Select_contract_Update">Contract</label>
              </div>
            </div>

            <div class="col-12">
              <div class="form-floating">
                <input type="text" class="form-control" name="TEAM_NAME_update" placeholder="TEAM_NAME" aria-label="TEAM_NAME" id="TEAM_NAME_update"
                       maxlength="45" >
                <label for="TEAM_NAME_update">TEAM NAME</label>
              </div>
            </div>

            <div class="col-12">
              <div class="form-floating">
                <select type="text" class="form-control" name="URGENT_update" aria-label="Urgent_update"
                        id="URGENT_update" required>
                  <option value="DA"> DA </option>
                  <option value="NU"> NU </option>
                </select>
                <label for="URGENT_update">Urgent (DA/NU) </label>
              </div>
            </div>

            <div class="col-12">
              <div class="form-floating">
                <input type="date" class="form-control" name="DEADLINE_update" placeholder="DEADLINE" aria-label="DEADLINE" id="DEADLINE_update">
                <label for="DEADLINE_update">Deadline</label>
              </div>
            </div>

            <div class="col-md-6">
              <div class="form-floating">
                <input type="long" class="form-control" name="PRET_update" placeholder="Pret" aria-label="Pret" id="PRET_update">
                <label for="PRET_update">Pret</label>
              </div>
            </div>

          </div>


        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Închide</button>
          <button type="submit" class="btn btn-primary" name="updateContract">Modifică</button>
        </div>
      </form>
    </div>
  </div>
</div>

<!-- Contracte Delete Modal -->
<div class="modal fade" id="contracte_delete_modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
     aria-labelledby="contracte_delete_modal_label" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="contracte_delete_modal_label">Șterge un contract</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <form autocomplete="on" action="Contracte" method="POST">
        <div class="modal-body">

          <div class="row g-3">
            <div class="col-12">
              <div class="form-floating">
                <select type="text" class="form-control" name="Select_contract_Delete" aria-label="Select contract"
                        id="Select_contract_Delete">
                  <%--@elvariable id="contractList" type="java.util.List"--%>
                  <c:forEach var="contract" items="${contractList}">
                    <option value="${contract.ID_CONTRACT}">${contract.PROIECT.NUME}
                      - ${contract.CLIENT.NUME} ${contract.CLIENT.PRENUME} (${contract.CLIENT.CNP})
                    </option>
                  </c:forEach>
                </select>
                <label for="Select_contract_Delete">Contract</label>
              </div>
            </div>
          </div>

        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Închide</button>
          <button type="submit" class="btn btn-primary" name="deleteContract">Șterge</button>
        </div>
      </form>
    </div>
  </div>
</div>

<div class="m-5">
  <table id="contracte_table" class="table table-striped cell-border">
    <thead>
    <tr class="table-dark text-center align-middle">
      <th scope="col">Nume Client</th>
      <th scope="col">Prenume Client</th>
      <th scope="col">CNP</th>

      <th scope="col">Nume Proiect</th>

      <th scope="col">Team Name</th>
      <th scope="col">Urgent</th>
      <th scope="col">Deadline</th>
      <th scope="col">Pret</th>
    </tr>
    </thead>

    <tbody>
    <%--@elvariable id="programareList" type="java.util.List"--%>
    <c:forEach var="CONTRACT" items="${contractList}">
      <tr class="align-middle">
        <td class="text-center">${CONTRACT.CLIENT.NUME}</td>
        <td class="text-center">${CONTRACT.CLIENT.PRENUME}</td>
        <td class="text-center">${CONTRACT.CLIENT.CNP}</td>
        <td class="text-center">${CONTRACT.PROIECT.NUME}</td>
        <td>${CONTRACT.TEAM_NAME}</td>
        <td>${CONTRACT.URGENT}</td>
        <td class="text-center">${CONTRACT.DEADLINE.format(DateTimeFormatter.ofPattern("dd.MM.yyyy"))}</td>
        <td>${CONTRACT.PRET}</td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>

</body>

</html>
