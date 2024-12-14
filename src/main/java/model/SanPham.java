    package model;

    import java.io.Serializable;

    public class SanPham implements Serializable {
        private int maSP;
        private String tenSP;
        private double giaGoc;
        private double giaGiam;
        private int soLuongTonKho;
        private String moTa;
        private TheLoai theLoai;
        private Anh anh;

        private int soLuongSanPhamDaBan;

        public SanPham() {
        }

        public SanPham(int maSP, int soLuongSanPhamDaBan) {
            this.maSP = maSP;
            this.soLuongSanPhamDaBan = soLuongSanPhamDaBan;
        }

        public SanPham(int maSP) {
            this.maSP = maSP;
        }

        public SanPham(int maSP, String tenSP, double giaGoc, int soLuongTonKho, String moTa) {
            this.maSP = maSP;
            this.tenSP = tenSP;
            this.giaGoc = giaGoc;
            this.soLuongTonKho = soLuongTonKho;
            this.moTa = moTa;
        }

        public SanPham(int maSP, String tenSP, double giaGoc, double giaGiam, int soLuongTonKho, String moTa, TheLoai theLoai, Anh anh) {
            this.maSP = maSP;
            this.tenSP = tenSP;
            this.giaGoc = giaGoc;
            this.giaGiam = giaGiam;
            this.soLuongTonKho = soLuongTonKho;
            this.moTa = moTa;
            this.theLoai = theLoai;
            this.anh = anh;
        }

        public SanPham(int maSP, String tenSP) {
            this.maSP = maSP;
            this.tenSP = tenSP;
        }

        public SanPham(int maSP, String tenSP, double giaGoc, int soLuongTonKho, String moTa, int maAnh) {
            this.maSP = maSP;
            this.tenSP = tenSP;
            this.giaGoc = giaGoc;
            this.soLuongTonKho = soLuongTonKho;
            this.moTa = moTa;
            this.anh = new Anh(maAnh);
        }

        public SanPham(String tenSP, double giaGoc, double giaGiam) {
            this.tenSP = tenSP;
            this.giaGoc = giaGoc;
            this.giaGiam = giaGiam;
        }

        public int getMaSP() {
            return maSP;
        }

        public void setMaSP(int maSP) {
            this.maSP = maSP;
        }

        public String getTenSP() {
            return tenSP;
        }

        public void setTenSP(String tenSP) {
            this.tenSP = tenSP;
        }

        public double getGiaGoc() {
            return giaGoc;
        }

        public void setGiaGoc(double giaGoc) {
            this.giaGoc = giaGoc;
        }

        public double getGiaGiam() {
            return giaGiam;
        }

        public void setGiaGiam(double giaGiam) {
            this.giaGiam = giaGiam;
        }

        public int getSoLuongTonKho() {
            return soLuongTonKho;
        }

        public void setSoLuongTonKho(int soLuongTonKho) {
            this.soLuongTonKho = soLuongTonKho;
        }

        public String getMoTa() {
            return moTa;
        }

        public void setMoTa(String moTa) {
            this.moTa = moTa;
        }

        public TheLoai getTheLoai() {
            return theLoai;
        }

        public void setTheLoai(TheLoai theLoai) {
            this.theLoai = theLoai;
        }

        public Anh getAnh() {
            return anh;
        }

        public void setAnh(Anh anh) {
            this.anh = anh;
        }


        public int getSoLuongSanPhamDaBan() {
            return soLuongSanPhamDaBan;
        }

        public void setSoLuongSanPhamDaBan(int soLuongSanPhamDaBan) {
            this.soLuongSanPhamDaBan = soLuongSanPhamDaBan;
        }

        @Override
        public String toString() {
            return "SanPham{" +
                    "maSP=" + maSP +
                    ", tenSP='" + tenSP + '\'' +
                    ", giaGoc=" + giaGoc +
                    ", giaGiam=" + giaGiam +
                    ", soLuongTonKho=" + soLuongTonKho +
                    ", moTa='" + moTa + '\'' +
                    ", theLoai=" + theLoai +
                    ", anh=" + anh +
                    ", soLuongSanPhamDaBan=" + soLuongSanPhamDaBan +
                    '}';
        }

        public String beforeValue() {
            return "SanPham{" +
                    "maSP=" + maSP +
                    ", tenSP='" + tenSP + '\'' +
                    ", giaGoc=" + giaGoc +
                    ", soLuongTonKho=" + soLuongTonKho +
                    ", moTa='" + moTa + '\'' +
                    ", theLoai=" + theLoai +
                    ", anh=" + anh +
                    '}';
        }

        public String afterValue() {
            return "SanPham{" +
                    "maSP=" + maSP +
                    ", tenSP='" + tenSP + '\'' +
                    ", giaGoc=" + giaGoc +
                    ", soLuongTonKho=" + soLuongTonKho +
                    ", moTa='" + moTa + '\'' +
                    ", theLoai=" + theLoai +
                    ", anh=" + anh +
                    '}';
        }

        public String toShortString() {
            return "SanPham{" +
                    "tenSP='" + tenSP + '\'' +
                    ", giaGoc=" + giaGoc +
                    ", giaGiam=" + giaGiam +
                    '}';
        }


    }
