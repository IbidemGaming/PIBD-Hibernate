package DAOImplement;

import DAO.ProiectDAO;
import JavaBean.Proiect;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.time.LocalDate;
import java.util.List;

public class ProiectDAOImpl implements ProiectDAO
{
    @Override
    public void addProiect(Proiect proiect)
    {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.save(proiect);
        transaction.commit();
        session.close();
    }

    @Override
    public void deleteProiect(Proiect proiect)
    {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.delete(proiect);
        transaction.commit();
        session.close();
    }

    @Override
    public void updateProiect(Long ID_PROIECT, String NUME, String STATUS, String TIP, LocalDate START_DATE, LocalDate FINISH_DATE)
    {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Proiect proiect = session.load(Proiect.class, ID_PROIECT);
        proiect.setNUME(NUME);
        proiect.setSTATUS(STATUS);
        proiect.setTIP(TIP);
        proiect.setSTART_DATE(START_DATE);
        proiect.setFINISH_DATE(FINISH_DATE);
        session.update(proiect);
        transaction.commit();
        session.close();
    }

    @Override
    public Proiect getProiect(long ID_PROIECT)
    {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Proiect proiect = session.load(Proiect.class, ID_PROIECT);
        session.close();
        return proiect;
    }

    @Override
    public List<Proiect> displayProiecte()
    {
        Session session = HibernateUtil.getSessionFactory().openSession();
        List proiectList = session.createQuery("from Proiect").list();
        session.close();
        return proiectList;
    }
}