package dome.Dao;

import org.apache.ibatis.annotations.Param;

public interface Table {
    public int getId(@Param("lat") double lat, @Param("lon") double lon);
}
