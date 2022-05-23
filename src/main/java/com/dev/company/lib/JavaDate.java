package com.dev.company.lib;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class JavaDate {

        public static String getDate() {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmssSSS");//dd/MM/yyyy
            Calendar calendar = Calendar.getInstance();
            String dateTotal = dateFormat.format(calendar.getTime());
            return dateTotal;
        }


        //나이스페이 시간
        public static final synchronized String getyyyyMMddHHmmss(){
        SimpleDateFormat yyyyMMddHHmmss = new SimpleDateFormat("yyyyMMddHHmmss");
        return yyyyMMddHHmmss.format(new Date());
        }

        //냐이스페이 가상 계좌
        public static String timeInfo() {
            SimpleDateFormat dateFormat = new SimpleDateFormat("YYYYMMdd");//YYYYMMDD
            Calendar calendar = Calendar.getInstance();
            calendar.add(Calendar.DATE, 7);
            String dateTotal = dateFormat.format(calendar.getTime());

            return dateTotal;
        }

        //현재 시간
        public static String nowDate() {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");//YYYYMMDD
            Calendar calendar = Calendar.getInstance();
            String nowDate = dateFormat.format(calendar.getTime());
            return nowDate;
        }

        //냐이스페이 가상 계좌
        public static String dateAdd(int add) {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");//YYYYMMDD
            Calendar calendar = Calendar.getInstance();
            calendar.add(Calendar.DATE, add);
            String dateAdd = dateFormat.format(calendar.getTime());

            return dateAdd;
        }

        //날짜 포맷
        public static String dateFormat(String stringDate) throws ParseException {
            String dateStr = stringDate;
            // 포맷터
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
            // 문자열 -> Date
            Date date = formatter.parse(dateStr);
            String date2 = formatter.format(date);
            return date2;
        }

        public static String getRandom() { //랜덤 값 생성
            int num = (int)((Math.random()*10000)%999)+100;
            String random = Integer.toString(num);
            return random;
        }



}
