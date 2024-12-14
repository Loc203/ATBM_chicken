package util;

import javax.servlet.http.HttpServletRequest;

public class IP {
    public static String getClientIp(HttpServletRequest request) {

        String remoteAddr = "";

        if (request != null) {
            remoteAddr = request.getHeader("X-FORWARDED-FOR");
            if (remoteAddr == null || remoteAddr.isEmpty()){
                remoteAddr = request.getRemoteAddr();
            }
        }
        return remoteAddr;
    }
}
