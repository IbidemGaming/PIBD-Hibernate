package DAO;

import JavaBean.Client;

import java.util.List;

public interface ClientDAO
{
    void addClient(Client proces);

    void deleteClient(Client proces);

    void updateClient(long ID_Client, String CNP, String NUME, String PRENUME, String TELEFON, String EMAIL, String ADRESA);

    Client getClient(long ID_Client);

    List<Client> displayClient();
}