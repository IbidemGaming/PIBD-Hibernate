package DAOImplement;

import DAO.ClientDAO;
import JavaBean.Client;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class ClientDAOImpl implements ClientDAO {

    @Override
    public void addClient(Client client)
    {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.save(client);
        transaction.commit();
        session.close();
    }

    @Override
    public void deleteClient(Client client)
    {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.delete(client);
        transaction.commit();
        session.close();
    }

    @Override
    public void updateClient(long ID_Client, String CNP, String NUME, String PRENUME, String TELEFON, String EMAIL,
                                String ADRESA)
    {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Client client = session.load(Client.class, ID_Client);
        client.setCNP(CNP);
        client.setNUME(NUME);
        client.setPRENUME(PRENUME);
        client.setTELEFON(TELEFON);
        client.setEMAIL(EMAIL);
        client.setADRESA(ADRESA);
        session.update(client);
        transaction.commit();
        session.close();
    }

    @Override
    public Client getClient(long ID_Client)
    {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Client client = session.load(Client.class, ID_Client);
        session.close();
        return client;
    }

    @Override
    public List<Client> displayClient()
    {
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Client> clientList = session.createQuery("from Client").list();
        session.close();
        return clientList;
    }


}
