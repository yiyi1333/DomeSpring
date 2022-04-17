package dome.Dao;

import dome.Bean.Pollutants;
import org.apache.ibatis.annotations.Param;

import java.sql.Date;

public interface PollutantMapper {
    public Pollutants getPollutants(@Param("lat") double lat, @Param("lon") double lon, @Param("tableName") String tableName);
}
