package DAO;

import JavaBean.Proiect;

import java.time.LocalDate;
import java.util.List;

public interface ProiectDAO
{
    void addProiect(Proiect proces);

    void deleteProiect(Proiect proces);

    void updateProiect(Long ID_PROIECT, String NUME, String STATUS, String TIP, LocalDate START_DATE, LocalDate FINISH_DATE);

    Proiect getProiect(long ID_PROIECT);

    List<Proiect> displayProiecte();
}