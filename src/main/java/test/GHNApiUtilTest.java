package test;

import com.google.gson.JsonObject;
import util.GHNApiUtil;

import java.io.IOException;

public class GHNApiUtilTest {
    public static void main(String[] args) throws IOException {
        String address = "Phường Linh Trung, Thành Phố Thủ Đức, Hồ Chí Minh";
//        String[] parts = address.split(", ");
//        String wardName = parts[0];
//        String districtName = parts[1];
//        String provinceName = parts[2];
//        JsonObject feeData = new JsonObject();
//        feeData.addProperty("service_type_id", 2);
//        feeData.addProperty("insurance_value", 10000);
//        feeData.addProperty("from_district_id", 1442);
//        feeData.addProperty("to_ward_code", "030712");
//        feeData.addProperty("to_district_id", 1820);
//        feeData.addProperty("weight", 3000);
//        feeData.addProperty("height", 20);
//        feeData.addProperty("length", 30);
//        feeData.addProperty("width", 40);
//        String fee = GHNApiUtil.calculateShippingFee(feeData);
//        System.out.println(fee);
        double totalFee = GHNApiUtil.totalFee(address);
        System.out.println("Phí vận chuyển: "+totalFee);
    }
}
