package Controller;

import DAOImplement.HibernateUtil;
import DAOImplement.ContractDAOImpl;
import JavaBean.Client;
import JavaBean.Proiect;
import JavaBean.Contract;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.jetbrains.annotations.NotNull;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

public class ContractController extends HttpServlet
{
    Contract contract = new Contract();
    ContractDAOImpl contractDAO = new ContractDAOImpl();

    @Override
    protected void doGet(@NotNull HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {

        if (request.getParameter("displayContracte") != null)
        {
            List<Contract> contractList = contractDAO.displayContracte();
            request.setAttribute("contractList", contractList);
            RequestDispatcher dispatcher = request.getRequestDispatcher("ListaContracte.jsp");
            dispatcher.forward(request, response);
        }
    }

    @Override
    protected void doPost(@NotNull HttpServletRequest request, HttpServletResponse response) throws IOException
    {
        if (request.getParameter("addContract") != null)
        {
            long ID_CLIENT = Long.parseLong(request.getParameter("ID_Client_add"));
            long ID_PROIECT = Long.parseLong(request.getParameter("ID_Proiect_add"));
            Session session = HibernateUtil.getSessionFactory().openSession();
            contract.setCLIENT(session.get(Client.class, ID_CLIENT));
            contract.setPROIECT(session.get(Proiect.class, ID_PROIECT));
            session.close();

            contract.setTEAM_NAME(request.getParameter("TEAM_NAME_add"));
            contract.setURGENT(request.getParameter("Urgent_add"));
            DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            contract.setDEADLINE(LocalDate.parse(request.getParameter("DEADLINE_add"), dateFormat));
            contract.setPRET(Long.parseLong(request.getParameter("Pret_add")));

            contractDAO.addContract(contract);
            response.sendRedirect("/");
        }
        else if (request.getParameter("updateContract") != null)
        {
            String aux = request.getParameter("URGENT_update");
            long ID_CONTRACT = Long.parseLong(request.getParameter("Select_contract_Update"));
            contract = contractDAO.getContract(ID_CONTRACT);

            Client CLIENT = contract.getCLIENT();
            Proiect PROIECT = contract.getPROIECT();

            String TEAM_NAME = request.getParameter("TEAM_NAME_update");
            TEAM_NAME = TEAM_NAME.length() == 0 ? contract.getTEAM_NAME() : TEAM_NAME;
            String URGENT = request.getParameter("URGENT_update");
            URGENT = URGENT.length() == 0 ? contract.getURGENT() : URGENT;

            String PRET_STR = request.getParameter("PRET_update");
            Long PRET = Long.parseLong(PRET_STR);


            DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            String DEAD_LINE_STR = request.getParameter("DEADLINE_update");
            LocalDate DEAD_LINE = DEAD_LINE_STR.length() == 0 ? contract.getDEADLINE() : LocalDate.parse(DEAD_LINE_STR, dateFormat);

            contractDAO.updateContract(ID_CONTRACT, CLIENT, PROIECT, TEAM_NAME, URGENT, DEAD_LINE, PRET);
            response.sendRedirect("Contracte?displayContracte=Tabelul+cu+contracte");
        }
        else if (request.getParameter("deleteContract") != null)
        {
            long ID_CONTRACT = Long.parseLong(request.getParameter("Select_contract_Delete"));
            contract = contractDAO.getContract(ID_CONTRACT);
            contractDAO.deleteContract(contract);
            response.sendRedirect("Contracte?displayContracte=Tabelul+cu+contracte");
        }
    }

    @Override
    public String getServletInfo()
    {
        return "Controller for Contracte Servlet";
    }
}