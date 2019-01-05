package cn.xx55xx.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

public class GenerateOrderNoUtil {
    private static long orderNum = 0L;
    private static String date;

    public static synchronized String getOrderNo() {
        String str = new SimpleDateFormat("yyMMddHHmmss").format(new Date());

        //三位随机数
        int random = new Random().nextInt(900) + 100;  //100-999

        return str + random;
    }

}
