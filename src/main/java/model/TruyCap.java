package model;

import java.io.Serializable;

public class TruyCap implements Serializable {

    private int maTC;

    private String tinhTrang;

    public TruyCap() {
    }

    public TruyCap(int maTC, String tinhTrang) {
        this.maTC = maTC;
        this.tinhTrang = tinhTrang;
    }

    public int getMaTC() {
        return maTC;
    }

    public void setMaTC(int maTC) {
        this.maTC = maTC;
    }

    public String getTinhTrang() {
        return tinhTrang;
    }

    public void setTinhTrang(String tinhTrang) {
        this.tinhTrang = tinhTrang;
    }

}
