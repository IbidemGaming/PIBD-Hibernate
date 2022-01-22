<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="DAOImplement.ClientDAOImpl" %>
<%@ page import="DAOImplement.ProiectDAOImpl" %>
<%@ page import="JavaBean.Client" %>
<%@ page import="JavaBean.Proiect" %>
<%@ page import="JavaBean.Contract" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>

    <meta name="viewport" content="width=device-width, initial-scale=1" charset="UTF-8">

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core/dist/umd/popper.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap/dist/js/bootstrap.min.js" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet"
          crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.css">
    <script type="text/javascript" charset="utf8"
            src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Readex+Pro" rel="stylesheet">
    <link rel="stylesheet" href="styles.css">

    <title>IbidemITDev</title>
</head>
<body>
<h1 style="text-align: center">

    <%= "Home Page" %>
</h1>

<%
    ClientDAOImpl clientDAO = new ClientDAOImpl();
    ProiectDAOImpl proiectDAO = new ProiectDAOImpl();
    List<Client> clientList = clientDAO.displayClient();
    List<Proiect> proiectList = proiectDAO.displayProiecte();
    request.setAttribute("clientList", clientList);
    request.setAttribute("proiectList", proiectList);
%>

<style>
    .button {
        border-radius: 10px;
        border: none;
        color: white;
        padding: 15px 32px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        margin: 4px 2px;
        cursor: pointer;
        margin-left: 15px;
        margin-right: 15px;
    }

    .button1 {
        background-color: #4CAF50;
    }

    /* Green */
    .button2 {
        background-color: #008CBA;
    }

    /* Blue */
    .button3 {
        background-color: #9900ff;
    }

    /* Purple */

    .center {
        margin: 0;
        position: absolute;
        top: 50%;
        left: 50%;
        -ms-transform: translate(-50%, -50%);
        transform: translate(-50%, -50%);
    }

</style>
</head>


<div class="center">

    <div>
        <div>

            <form style="display: inline-block" role="form" action="Clienti" method="GET">
                <input type="submit" class="button button1" name="displayClienti" value="  Listă Clienti  ">
            </form>

            <form style="display: inline-block" role="form" action="Contracte" method="GET">
                <input type="submit" class="button button2" name="displayContracte" value="  Listă Contracte  ">
            </form>

            <form style="display: inline-block" role="form" action="Proiecte" method="GET">
                <input type="submit" class="button button3" name="displayProiecte" value=" Listă Proiecte  ">
            </form>

        </div>

        <div>

            <button type="button" class="button button1" data-bs-toggle="modal" data-bs-target="#clienti_add_modal">
                Adaugă Client
            </button>

            <button type="button" class="button button2" data-bs-toggle="modal" data-bs-target="#contracte_add_modal">
                Adaugă Contract
            </button>

            <button type="button" class="button button3" data-bs-toggle="modal" data-bs-target="#proiecte_add_modal">
                Adaugă Proiect
            </button>

        </div>
    </div>
</div>

<!-- Clienți Add Modal -->
<div class="modal fade" id="clienti_add_modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
     aria-labelledby="clienti_add_modal_label" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="clienti_add_modal_label">Adaugă un client nou</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form autocomplete="on" action="Clienti" method="POST">
                <div class="modal-body">

                    <div class="col-md-6">
                        <div class="form-floating">
                            <input type="text" class="form-control" name="Prenume_add" placeholder="Prenume"
                                   aria-label="Prenume"
                                   id="Prenume_add" maxlength="45"
                                   pattern="[A-ZĂÂÎȚȘ]{1}[a-zăâîțș]+(-[A-ZĂÂÎȚȘ]{1}[a-zăâîțș]+)*"
                                   autocomplete="given-name">
                            <label for="Prenume_add">Prenume</label>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-floating">
                            <input type="text" class="form-control" name="NumeClient_add" placeholder="Nume"
                                   aria-label="Nume" id="NumeClient_add"
                                   maxlength="45" pattern="[A-Za-zăâîțșĂÂÎȚȘ]+(-[A-Za-zăâîțșĂÂÎȚȘ]+)*"
                                   autocomplete="family-name">
                            <label for="NumeClient_add">Nume</label>
                        </div>
                    </div>

                    <div class="col-12">
                        <div class="form-floating">
                            <input type="text" class="form-control" name="CNP_add"
                                   placeholder="Cod Numeric Personal (CNP)" aria-label="CNP"
                                   id="CNP_add" maxlength="13" pattern="\d{13}">
                            <label for="CNP_add">Cod Numeric Personal (CNP)</label>
                        </div>
                    </div>

                    <div class="col-12">
                        <div class="form-floating">
                            <input type="tel" class="form-control" name="Telefon_add" placeholder="Telefon"
                                   aria-label="Telefon"
                                   id="Telefon_add" autocomplete="tel" maxlength="13" pattern="\+\d{11,12}">
                            <label for="Telefon_add">Telefon</label>
                        </div>
                    </div>

                    <div class="col-12">
                        <div class="form-floating">
                            <input type="email" class="form-control" name="Email_add" placeholder="Email"
                                   aria-label="Email" id="Email_add"
                                   autocomplete="email" maxlength="45"
                                   pattern="([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)">
                            <label for="Email_add">Email</label>
                        </div>
                    </div>

                    <div class="col-12">
                        <div class="form-floating">
                            <input type="text" class="form-control" name="Adresa_add" placeholder="Adresa"
                                   aria-label="Adresa" id="Adresa_add"
                                   maxlength="45"
                            >
                            <label for="Adresa_add">Adresa</label>
                        </div>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Închide</button>
                    <button type="submit" class="btn btn-primary" name="addClient">Adaugă</button>
                </div>
            </form>
        </div>
    </div>
</div>


<!-- Contract Add Modal -->
<div class="modal fade" id="contracte_add_modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
     aria-labelledby="contracte_add_modal_label" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="contracte_add_modal_label">Adaugă un contract nou</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <form autocomplete="on" action="Contracte" method="POST">
                <div class="modal-body">

                    <div class="row g-3">

                        <div class="row g-3">
                            <div class="col-12">
                                <div class="form-floating">
                                    <select type="text" class="form-control" name="ID_Proiect_add" aria-label="Proiect"
                                            id="ID_Proiect_add"
                                            required>
                                        <c:forEach var="proiect" items="${proiectList}">
                                            <option value="${proiect.ID_PROIECT}"> ${proiect.NUME}</option>
                                        </c:forEach>
                                    </select>
                                    <label for="ID_Proiect_add">Proiect</label>
                                </div>
                            </div>

                            <div class="col-12">
                                <div class="form-floating">
                                    <select type="text" class="form-control" name="ID_Client_add" aria-label="Client"
                                            id="ID_Client_add"
                                            required>
                                        <c:forEach var="client" items="${clientList}">
                                            <option value="${client.ID_CLIENT}">${client.NUME} ${client.PRENUME}
                                                (${client.CNP})
                                            </option>
                                        </c:forEach>
                                    </select>
                                    <label for="ID_Client_add">Client</label>
                                </div>
                            </div>

                            <div class="col-12">
                                <div class="form-floating">
                                    <input type="text" class="form-control" name="TEAM_NAME_add" placeholder="TEAM_NAME"
                                           aria-label="TEAM_NAME" id="TEAM_NAME_add"
                                           maxlength="45">
                                    <label for="TEAM_NAME_add">TEAM NAME</label>
                                </div>
                            </div>

                            <div class="col-12">
                                <div class="form-floating">
                                    <select type="text" class="form-control" name="Urgent_add" placeholder="Urgent"
                                           aria-label="Urgent"
                                           id="Urgent_add" required>
                                        <option value="DA"> DA </option>
                                        <option value="NU"> NU </option>
                                    </select>
                                    <label for="Urgent_add">Urgent (DA/NU) </label>
                                </div>
                            </div>

                            <div class="col-12">
                                <div class="form-floating">
                                    <input type="date" class="form-control" name="DEADLINE_add" placeholder="DEADLINE"
                                           aria-label="DEADLINE" id="DEADLINE_add">
                                    <label for="DEADLINE_add">Deadline</label>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-floating">
                                    <input type="long" class="form-control" name="Pret_add" placeholder="Pret"
                                           aria-label="Pret" id="Pret_add">
                                    <label for="Pret_add">Pret</label>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Închide</button>
                    <button type="submit" class="btn btn-primary" name="addContract">Adaugă</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Proiecte Add Modal -->
<div class="modal fade" id="proiecte_add_modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
     aria-labelledby="proiecte_add_modal_label" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="proiecte_add_modal_label">Adaugă un proiect nou</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form autocomplete="on" action="Proiecte" method="POST">
                <div class="modal-body">

                    <div class="row g-3">

                        <div class="col-md-6">
                            <div class="form-floating">
                                <input type="text" class="form-control" name="Nume_add" placeholder="Nume"
                                       aria-label="Nume" id="Nume_add"
                                       maxlength="45">
                                <label for="Nume_add">Nume</label>
                            </div>
                        </div>

                        <div class="col-12">
                            <div class="form-floating">
                                <input type="text" class="form-control" name="Status_add" placeholder="Status"
                                       aria-label="Status"
                                       id="Status_add" maxlength="45">
                                <label for="Status_add">Status</label>
                            </div>
                        </div>

                        <div class="col-12">
                            <div class="form-floating">
                                <input type="text" class="form-control" name="Tip_add" placeholder="Tip"
                                       aria-label="Tip"
                                       id="Tip_add" maxlength="45">
                                <label for="Tip_add">Tip</label>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-floating">
                                <input type="date" class="form-control" name="Start_date_add" placeholder="Start_date"
                                       aria-label="Start_date" id="Start_date_add">
                                <label for="Start_date_add">Data Start</label>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-floating">
                                <input type="date" class="form-control" name="Finish_date_add" placeholder="Finish_date"
                                       aria-label="Finish_date" id="Finish_date_add">
                                <label for="Finish_date_add">Data Finish</label>
                            </div>
                        </div>

                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Închide</button>
                    <button type="submit" class="btn btn-primary" name="addProiect">Adaugă</button>
                </div>
            </form>
        </div>
    </div>
</div>


</body>


</html>