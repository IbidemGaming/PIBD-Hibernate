package DAOImplement;

import DAO.ContractDAO;
import JavaBean.Client;
import JavaBean.Contract;
import JavaBean.Proiect;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.jetbrains.annotations.NotNull;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

public class ContractDAOImpl implements ContractDAO
{
    @Override
    public void addContract(Contract contract)
    {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.save(contract);
        transaction.commit();
        session.close();
    }

    @Override
    public void deleteContract(Contract contract)
    {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.delete(contract);
        transaction.commit();
        session.close();
    }

    @Override
    public void updateContract(Long ID_CONTRACT, Client CLIENT, Proiect PROIECT, String TEAM_NAME, String URGENT, LocalDate DEADLINE, Long PRET)
    {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Contract contract = session.load(Contract.class, ID_CONTRACT);
        contract.setCLIENT(CLIENT);
        contract.setPROIECT(PROIECT);
        contract.setTEAM_NAME(TEAM_NAME);
        contract.setURGENT(URGENT);
        contract.setDEADLINE(DEADLINE);
        contract.setPRET(PRET);
        session.update(contract);
        transaction.commit();
        session.close();
    }

    @Override
    public Contract getContract(long ID_CONTRACT)
    {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Contract contract = session.load(Contract.class, ID_CONTRACT);
        session.close();
        return contract;
    }

    @Override
    public List<Contract> displayContracte()
    {
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Contract> contractList = session.createQuery("from Contract").list();
        session.close();
        return contractList;
    }
}