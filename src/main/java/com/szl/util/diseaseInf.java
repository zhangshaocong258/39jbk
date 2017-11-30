package com.szl.util;

/**
 * Created by zsc on 2017/11/28.
 * 用于显示疾病信息
 */
public class DiseaseInf implements Comparable<DiseaseInf>{
    private String name;
    private String description;
    private String pro;

    public DiseaseInf(String name, String description,String pro) {
        this.name = name;
        this.description = description;
        this.pro = pro;
    }

    @Override
    public int compareTo(DiseaseInf o) {
        if (Double.valueOf(pro) <= Double.valueOf(o.pro)) {
            return 1;
        } else {
            return -1;
        }
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPro() {
        return pro;
    }

    public void setPro(String pro) {
        this.pro = pro;
    }
}
