package com.szl.domain;

/**
 * Created by zsc on 2017/11/29.
 */
public class Discase {

    private int id;
    private String info;
    private String medicalHis;
    private String examine;
    private String disease;

    public Discase() {
    }

    public Discase(int id, String info, String medicalHis, String examine, String disease) {
        this.id = id;
        this.info = info;
        this.medicalHis = medicalHis;
        this.examine = examine;
        this.disease = disease;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public String getMedicalHis() {
        return medicalHis;
    }

    public void setMedicalHis(String medicalHis) {
        this.medicalHis = medicalHis;
    }

    public String getExamine() {
        return examine;
    }

    public void setExamine(String examine) {
        this.examine = examine;
    }

    public String getDisease() {
        return disease;
    }

    public void setDisease(String disease) {
        this.disease = disease;
    }
}

