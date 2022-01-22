package Controller;

import DAOImplement.ClientDAOImpl;
import JavaBean.Client;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.jetbrains.annotations.NotNull;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

public class ClientController extends HttpServlet
{
    Client client = new Client();
    ClientDAOImpl clientDAO = new ClientDAOImpl();

    @Override
    protected void doGet(@NotNull HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String aux = request.getParameter("displayClienti");
        if (request.getParameter("displayClienti") != null)
        {
            List<Client> clientList = clientDAO.displayClient();
            request.setAttribute("clientList", clientList);
            RequestDispatcher dispatcher = request.getRequestDispatcher("ListaClienti.jsp");
            dispatcher.forward(request, response);
        }
    }

    @Override
    protected void doPost(@NotNull HttpServletRequest request, HttpServletResponse response) throws IOException
    {
        if (request.getParameter("addClient") != null)
        {
            client.setCNP(request.getParameter("CNP_add"));
            client.setNUME(request.getParameter("NumeClient_add"));
            client.setPRENUME(request.getParameter("Prenume_add"));
            client.setTELEFON(request.getParameter("Telefon_add"));
            client.setEMAIL(request.getParameter("Email_add").toLowerCase());
            client.setADRESA(request.getParameter("Adresa_add"));

            clientDAO.addClient(client);
            response.sendRedirect("/");
        }
        else if (request.getParameter("updateClient") != null)
        {
            long ID_CLIENT = Long.parseLong(request.getParameter("Select_client_Update"));
            client = clientDAO.getClient(ID_CLIENT);

            String CNP = request.getParameter("CNP_update");
            CNP = CNP.length() == 0 ? client.getCNP() : CNP;

            String NUME = request.getParameter("Nume_update");
            NUME = NUME.length() == 0 ? client.getNUME() : NUME.toUpperCase();

            String PRENUME = request.getParameter("Prenume_update");
            PRENUME = PRENUME.length() == 0 ? client.getPRENUME() : PRENUME;

            String TELEFON = request.getParameter("Telefon_update");
            TELEFON = TELEFON.length() == 0 ? client.getTELEFON() : TELEFON;

            String EMAIL = request.getParameter("Email_update");
            EMAIL = EMAIL.length() == 0 ? client.getEMAIL() : EMAIL.toLowerCase();

            String ADRESA = request.getParameter("Adresa_update");
            ADRESA = ADRESA.length() == 0 ? client.getADRESA() : ADRESA;

            clientDAO.updateClient(ID_CLIENT, CNP, NUME, PRENUME, TELEFON, EMAIL, ADRESA);
            response.sendRedirect("Clienti?displayClienti=Tabelul+cu+judecători");
        }
        else if (request.getParameter("deleteClient") != null)
        {
            long ID_CLIENT = Long.parseLong(request.getParameter("Select_client_Delete"));
            client.setID_CLIENT(ID_CLIENT);
            clientDAO.deleteClient(client);
            response.sendRedirect("Clienti?displayClienti=Tabelul+cu+clienti");
        }
    }

    @Override
    public String getServletInfo()
    {
        return "Controller for Clienti Servlet";
    }
}