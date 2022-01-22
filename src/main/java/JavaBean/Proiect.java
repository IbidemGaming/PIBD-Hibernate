package JavaBean;

import org.apache.taglibs.standard.lang.jstl.NullLiteral;

import java.sql.Date;
import java.time.LocalDate;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class Proiect {

    private Long ID_PROIECT;
    private String NUME;
    private String STATUS;
    private String TIP;
    private LocalDate START_DATE;
    private LocalDate FINISH_DATE;
    private Set<Contract> CONTRACTE;

    public Proiect(Long ID_PROIECT, String NUME, String STATUS, String TIP, LocalDate START_DATE, LocalDate FINISH_DATE) {
        this.ID_PROIECT = ID_PROIECT;
        this.NUME = NUME;
        this.STATUS = STATUS;
        this.TIP = TIP;
        this.START_DATE = START_DATE;
        this.FINISH_DATE = FINISH_DATE;
        this.CONTRACTE = new HashSet<>(CONTRACTE);
    }

    public Proiect() {
        ID_PROIECT = 0L;
        NUME = "";
        STATUS = "";
        TIP = "";
        START_DATE = LocalDate.now();
        FINISH_DATE = LocalDate.now();
        this.CONTRACTE = new HashSet<>();
    }

    public Long getID_PROIECT() {
        return ID_PROIECT;
    }

    public void setID_PROIECT(Long ID_PROIECT) {
        this.ID_PROIECT = ID_PROIECT;
    }

    public String getNUME() {
        return NUME;
    }

    public void setNUME(String NUME) {
        this.NUME = NUME;
    }

    public String getSTATUS() {
        return STATUS;
    }

    public void setSTATUS(String STATUS) {
        this.STATUS = STATUS;
    }

    public String getTIP() {
        return TIP;
    }

    public void setTIP(String TIP) {
        this.TIP = TIP;
    }

    public LocalDate getSTART_DATE() {
        return START_DATE;
    }

    public void setSTART_DATE(LocalDate START_DATE) {
        this.START_DATE = START_DATE;
    }

    public LocalDate getFINISH_DATE() {
        return FINISH_DATE;
    }

    public void setFINISH_DATE(LocalDate FINISH_DATE) {
        this.FINISH_DATE = FINISH_DATE;
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
