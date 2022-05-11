package dome.Dao;

import dome.Bean.InputData;
import org.apache.ibatis.annotations.Param;

import java.sql.Date;
import java.util.ArrayList;

public interface ParmaMapper {
    public ArrayList<InputData> getweekData(@Param("lat") double lat, @Param("lon") double lon, @Param("tableName") String tableName, @Param("begindate") Date begindate, @Param("enddate") Date enddate);
}
