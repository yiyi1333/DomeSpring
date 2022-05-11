package dome.Dao;

import dome.Bean.Pollutants;
import org.apache.ibatis.annotations.Param;

import java.sql.Date;
import java.util.ArrayList;

public interface PollutantMapper {
    public Pollutants getPollutants(@Param("lat") double lat, @Param("lon") double lon, @Param("tableName") String tableName);
    public Pollutants getTodayPollutants(@Param("lat") double lat, @Param("lon") double lon, @Param("tableName") String tableName, @Param("date") Date date);
    public ArrayList<Pollutants> getRangePollutants(@Param("lat") double lat, @Param("lon") double lon, @Param("tableName") String tableName, @Param("begindate") Date begindate, @Param("enddate") Date enddate);
}
