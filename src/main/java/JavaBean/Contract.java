package JavaBean;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

public class Contract {

    private Long ID_CONTRACT;
    private Client CLIENT;
    private Proiect PROIECT;
    private String TEAM_NAME;
    private String URGENT;
    private LocalDate DEADLINE;
    private Long PRET;

    public Contract() {
        ID_CONTRACT = 0L;
        CLIENT = new Client();
        PROIECT = new Proiect();
        TEAM_NAME = "";
        URGENT = "";
        DEADLINE = LocalDate.now();
        PRET = 0L;
    }

    public Long getID_CONTRACT() {
        return ID_CONTRACT;
    }

    public void setID_CONTRACT(Long ID_CONTRACT) {
        this.ID_CONTRACT = ID_CONTRACT;
    }

    public Client getCLIENT() {
        return CLIENT;
    }

    public void setCLIENT(Client CLIENT) {
        this.CLIENT = CLIENT;
    }

    public Proiect getPROIECT() {
        return PROIECT;
    }

    public void setPROIECT(Proiect PROIECT) {
        this.PROIECT = PROIECT;
    }

    public String getTEAM_NAME() {
        return TEAM_NAME;
    }

    public void setTEAM_NAME(String TEAM_NAME) {
        this.TEAM_NAME = TEAM_NAME;
    }

    public String getURGENT() {
        return URGENT;
    }

    public void setURGENT(String URGENT) {
        this.URGENT = URGENT;
    }

    public LocalDate getDEADLINE() {
        return DEADLINE;
    }

    public void setDEADLINE(LocalDate DEADLINE) {
        this.DEADLINE = DEADLINE;
    }

    public Long getPRET() {
        return PRET;
    }

    public void setPRET(Long PRET) {
        this.PRET = PRET;
    }
}
