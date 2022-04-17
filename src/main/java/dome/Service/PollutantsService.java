package dome.Service;

import dome.Bean.Pollutants;
import dome.Dao.PollutantMapper;
import org.mybatis.spring.SqlSessionTemplate;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;

public class PollutantsService {
    private SqlSessionTemplate sqlSession;

    public SqlSessionTemplate getSqlSession() {
        return sqlSession;
    }

    public void setSqlSession(SqlSessionTemplate sqlSession) {
        this.sqlSession = sqlSession;
    }

    public ArrayList<Pollutants> getAllPollutants(double lat, double lon){
        ArrayList<Pollutants> pollutants = new ArrayList<>();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
        LocalDate endDate = LocalDate.parse("20181231", formatter);
        LocalDate begin = LocalDate.parse("20130101", formatter);
        while (begin.isBefore(endDate)){
            Pollutants temp = sqlSession.getMapper(PollutantMapper.class).getPollutants(lat, lon, "`" + begin.format(formatter) + "`");
            pollutants.add(temp);
            begin = begin.plusDays(1);
        }
        return pollutants.size() == 0 ? null : pollutants;
    }
}
