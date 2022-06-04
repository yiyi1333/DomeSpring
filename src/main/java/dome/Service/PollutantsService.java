package dome.Service;

import dome.Bean.AQI;
import dome.Bean.Pollutants;
import dome.Dao.PollutantMapper;
import dome.Dao.PositionMapper;
import dome.Dao.Table;
import dome.Time.TimeControl;
import org.mybatis.spring.SqlSessionTemplate;

import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

public class PollutantsService {
    private SqlSessionTemplate sqlSession;
    private TimeControl timeControl;

    public TimeControl getTimeControl() {
        return timeControl;
    }

    public void setTimeControl(TimeControl timeControl) {
        this.timeControl = timeControl;
    }

    public SqlSessionTemplate getSqlSession() {
        return sqlSession;
    }

    public void setSqlSession(SqlSessionTemplate sqlSession) {
        this.sqlSession = sqlSession;
    }

    public Pollutants getTodayPollutants(double lat, double lon, LocalDate today){
        int id = sqlSession.getMapper(Table.class).getId(lat, lon);
        int tableid = (id - 1) / 5 * 5 + 1;
        String tableName = "`" + String.valueOf(tableid) + "`";
        Pollutants pollutants = sqlSession.getMapper(PollutantMapper.class).getTodayPollutants(lat, lon, tableName, Date.valueOf(today));
        return pollutants;
    }

    public ArrayList<Pollutants> getWeekPollutants(double lat, double lon){
        int id = sqlSession.getMapper(Table.class).getId(lat, lon);
        int tableid = (id - 1) / 5 *5 + 1;
        String tableName = "`" + String.valueOf(tableid) + "`";
        ArrayList<Pollutants> weekPollutants = sqlSession.getMapper(PollutantMapper.class).getRangePollutants(lat, lon, tableName, Date.valueOf(timeControl.getSevenDaysAgo()), Date.valueOf(timeControl.getToday()));
        return weekPollutants;
    }

    public ArrayList<Pollutants> getNextThreeDaysPollutants(double lat, double lon){
        int id = sqlSession.getMapper(Table.class).getId(lat, lon);
        int tableid = (id - 1) / 5 * 5 +1;
        String tableName = "`" + String.valueOf(tableid) + "`";
        ArrayList<Pollutants> nextThreeDayPollutants = sqlSession.getMapper(PollutantMapper.class).getRangePollutants(lat, lon, tableName, Date.valueOf(timeControl.getToday().plusDays(1)), Date.valueOf(timeControl.getToday().plusDays(3)));
        return nextThreeDayPollutants;
    }

    public ArrayList<Pollutants> getYearPollutants(double lat, double lon){
        int id = sqlSession.getMapper(Table.class).getId(lat, lon);
        int tableid = (id - 1) / 5 *5 + 1;
        String tableName = "`" + String.valueOf(tableid) + "`";
        ArrayList<Pollutants> yearPollutants = sqlSession.getMapper(PollutantMapper.class).getRangePollutants(lat, lon, tableName, Date.valueOf(timeControl.getOneYearAgo()), Date.valueOf(timeControl.getToday()));
        return yearPollutants;
    }

    public ArrayList<AQI> getWeekAQI(ArrayList<Pollutants> pollutantsArrayList){
        ArrayList<AQI> weekAQI = new ArrayList<>();
        AQICalculater aqiCalculater = new AQICalculater();
        for(Pollutants p : pollutantsArrayList){
            weekAQI.add(aqiCalculater.PollutantsToAQI(p));
        }
        return weekAQI;
    }

//    public ArrayList<Pollutants> getAllPollutants(double lat, double lon){
//        ArrayList<Pollutants> pollutants = new ArrayList<>();
//        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
//        LocalDate endDate = LocalDate.parse("20181231", formatter);
//        LocalDate begin = LocalDate.parse("20130101", formatter);
//        while (begin.isBefore(endDate)){
//            Pollutants temp = sqlSession.getMapper(PollutantMapper.class).getPollutants(lat, lon, "`" + begin.format(formatter) + "`");
//            pollutants.add(temp);
//            begin = begin.plusDays(1);
//        }
//        return pollutants.size() == 0 ? null : pollutants;
//    }


}
