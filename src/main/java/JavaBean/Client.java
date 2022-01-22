package JavaBean;

import java.util.HashSet;
import java.util.Set;

public class Client {

    private Long ID_CLIENT;
    private String CNP;
    private String NUME;
    private String PRENUME;
    private String TELEFON;
    private String EMAIL;
    private String ADRESA;
    private Set<Contract> CONTRACTE;

    public Client(long ID_CLIENT, String CNP, String NUME, String PRENUME, String TELEFON, String EMAIL, String ADRESA,
                  Set<Contract> CONTRACTE) {
        this.ID_CLIENT = ID_CLIENT;
        this.CNP = CNP;
        this.NUME = NUME;
        this.PRENUME = PRENUME;
        this.TELEFON = TELEFON;
        this.EMAIL = EMAIL;
        this.ADRESA = ADRESA;
        this.CONTRACTE = new HashSet<>(CONTRACTE);
    }

    public Client(){
        ID_CLIENT = 0L;
        CNP = "";
        NUME = "";
        PRENUME = "";
        TELEFON = "";
        EMAIL = "";
        ADRESA = "";
        this.CONTRACTE = new HashSet<>();
    }

    public void setID_CLIENT(Long ID_CLIENT) {
        this.ID_CLIENT = ID_CLIENT;
    }

    public long getID_CLIENT() {
        return ID_CLIENT;
    }

    public void setID_CLIENT(long ID_CLIENT) {
        this.ID_CLIENT = ID_CLIENT;
    }

    public String getCNP() {
        return CNP;
    }

    public void setCNP(String CNP) {
        this.CNP = CNP;
    }

    public String getNUME() {
        return NUME;
    }

    public void setNUME(String NUME) {
        this.NUME = NUME;
    }

    public String getPRENUME() {
        return PRENUME;
    }

    public void setPRENUME(String PRENUME) {
        this.PRENUME = PRENUME;
    }

    public String getTELEFON() {
        return TELEFON;
    }

    public void setTELEFON(String TELEFON) {
        this.TELEFON = TELEFON;
    }

    public String getEMAIL() {
        return EMAIL;
    }

    public void setEMAIL(String EMAIL) {
        this.EMAIL = EMAIL;
    }

    public String getADRESA() {
        return ADRESA;
    }

    public void setADRESA(String ADRESA) {
        this.ADRESA = ADRESA;
    }

    public Set<Contract> getCONTRACTE()
    {
        return new HashSet<>(CONTRACTE);
    }

    public void setCONTRACTE(Set<Contract> CONTRACTE)
    {
        this.CONTRACTE = new HashSet<>(CONTRACTE);
    }

}
