import dome.Bean.Pollutants;
import dome.Service.PollutantsService;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

public class Test {
    public static void main(String[] args){
//        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
//        LocalDate endDate = LocalDate.parse("20181231", formatter);
//        LocalDate begin = LocalDate.parse("20130101", formatter);
//        while (begin.isBefore(endDate)){
////            Pollutants temp = sqlSession.getMapper(PollutantMapper.class).getPollutants(lat, lon, begin.format(formatter));
//            System.out.println(begin.format(formatter));
//
//            begin = begin.plusDays(1);
//        }
        PollutantsService pollutantsService = new PollutantsService();
        ArrayList<Pollutants> list = pollutantsService.getAllPollutants(18.34, 109.25);
    }
}
