package com.szl.domain;

/**
 * Created by zsc on 2017/11/16.
 */
public class Rule {
    private int id;
    private String name;
    private String zhuzheng;
    private String cizheng;
    private String zhushezhi;
    private String cishezhi;
    private String zhushetai;
    private String cishetai;
    private String zhumai;
    private String cimai;

    public Rule() {

    }


    public Rule(int id, String name, String zhuzheng, String cizheng, String zhushezhi, String cishezhi, String zhushetai, String cishetai, String zhumai, String cimai) {
        this.id = id;
        this.name = name;
        this.zhuzheng = zhuzheng;
        this.cizheng = cizheng;
        this.zhushezhi = zhushezhi;
        this.cishezhi = cishezhi;
        this.zhushetai = zhushetai;
        this.cishetai = cishetai;
        this.zhumai = zhumai;
        this.cimai = cimai;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getZhuzheng() {
        return zhuzheng;
    }

    public void setZhuzheng(String zhuzheng) {
        this.zhuzheng = zhuzheng;
    }

    public String getCizheng() {
        return cizheng;
    }

    public void setCizheng(String cizheng) {
        this.cizheng = cizheng;
    }

    public String getZhushezhi() {
        return zhushezhi;
    }

    public void setZhushezhi(String zhushezhi) {
        this.zhushezhi = zhushezhi;
    }

    public String getCishezhi() {
        return cishezhi;
    }

    public void setCishezhi(String cishezhi) {
        this.cishezhi = cishezhi;
    }

    public String getZhushetai() {
        return zhushetai;
    }

    public void setZhushetai(String zhushetai) {
        this.zhushetai = zhushetai;
    }

    public String getCishetai() {
        return cishetai;
    }

    public void setCishetai(String cishetai) {
        this.cishetai = cishetai;
    }

    public String getZhumai() {
        return zhumai;
    }

    public void setZhumai(String zhumai) {
        this.zhumai = zhumai;
    }

    public String getCimai() {
        return cimai;
    }

    public void setCimai(String cimai) {
        this.cimai = cimai;
    }
}
