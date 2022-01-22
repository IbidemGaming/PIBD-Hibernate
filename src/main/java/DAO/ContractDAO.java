package DAO;

import JavaBean.Client;
import JavaBean.Proiect;
import JavaBean.Contract;
import org.jetbrains.annotations.NotNull;

import java.time.LocalDate;
import java.util.List;

public interface ContractDAO
{
    void addContract(Contract contract);

    void deleteContract(Contract contract);

    void updateContract(Long ID_CONTRACT, Client CLIENT, Proiect PROIECT, String TEAM_NAME, String URGENT, LocalDate DEADLINE, Long PRET);

    Contract getContract(long ID_CONTRACT);

    List<Contract> displayContracte();
}