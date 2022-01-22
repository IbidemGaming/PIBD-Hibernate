package Controller;

import DAOImplement.ProiectDAOImpl;
import JavaBean.Proiect;
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

public class ProiectController extends HttpServlet
{
    Proiect proiect = new Proiect();
    ProiectDAOImpl proiectDAO = new ProiectDAOImpl();

    @Override
    protected void doGet(@NotNull HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        if (request.getParameter("displayProiecte") != null)
        {
            List<Proiect> proiectList = proiectDAO.displayProiecte();
            request.setAttribute("proiectList", proiectList);
            RequestDispatcher dispatcher = request.getRequestDispatcher("ListaProiecte.jsp");
            dispatcher.forward(request, response);
        }
    }

    @Override
    protected void doPost(@NotNull HttpServletRequest request, HttpServletResponse response) throws IOException
    {
        if (request.getParameter("addProiect") != null)
        {
            proiect.setNUME(request.getParameter("Nume_add").toUpperCase());
            proiect.setSTATUS(request.getParameter("Status_add"));
            proiect.setTIP(request.getParameter("Tip_add"));

            DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("yyyy-MM-dd");

            String Start_date_str = request.getParameter("Start_date_add");
            String Finish_date_str = request.getParameter("Finish_date_add");
            LocalDate Start_date = (Start_date_str.length() == 0) ? null : LocalDate.parse(Start_date_str, dateFormat);
            LocalDate Finish_date = (Start_date_str.length() == 0) ? null : LocalDate.parse(Finish_date_str, dateFormat);

            proiect.setSTART_DATE(Start_date);
            proiect.setFINISH_DATE(Finish_date);

            proiectDAO.addProiect(proiect);
            response.sendRedirect("/");
        }
        else if (request.getParameter("updateProiect") != null)
        {
            long ID_PROIECT = Long.parseLong(request.getParameter("Select_proiect_Update"));
            proiect = proiectDAO.getProiect(ID_PROIECT);

            String NUME = request.getParameter("Nume_update");
            NUME = NUME.length() == 0 ? proiect.getNUME() : NUME;

            String STATUS = request.getParameter("Status_update");
            STATUS = STATUS.length() == 0 ? proiect.getSTATUS() : STATUS;

            String TIP = request.getParameter("Tip_update");
            TIP = TIP.length() == 0 ? proiect.getTIP() : TIP;


            DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            String START_DATE_STR = request.getParameter("Start_date_update");
            String FINISH_DATE_STR = request.getParameter("Finish_date_update");

            LocalDate START_DATE = START_DATE_STR.length() == 0 ? proiect.getSTART_DATE() :
                    LocalDate.parse(START_DATE_STR, dateFormat);
            LocalDate FINISH_DATE = FINISH_DATE_STR.length() == 0 ? proiect.getFINISH_DATE() :
                    LocalDate.parse(FINISH_DATE_STR, dateFormat);

            proiectDAO.updateProiect(ID_PROIECT, NUME, STATUS, TIP, START_DATE, FINISH_DATE);
            response.sendRedirect("Proiecte?displayProiecte=Tabelul+cu+proiecte");
        }
        else if (request.getParameter("deleteProiect") != null)
        {
            long ID_Proiect = Long.parseLong(request.getParameter("Select_proiect_Delete"));
            proiect.setID_PROIECT(ID_Proiect);
            proiectDAO.deleteProiect(proiect);
            response.sendRedirect("Proiecte?displayProiecte=Tabelul+cu+proiect");
        }
    }

    @Override
    public String getServletInfo()
    {
        return "Controller for Proiect Servlet";
    }
}