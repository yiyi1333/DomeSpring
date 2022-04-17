package dome.Service;

import dome.Bean.Position;
import dome.Dao.PositionMapper;

import java.util.ArrayList;
import java.util.List;

public class PositionService {
    private PositionMapper positionDao;

    public PositionMapper getPositionDao() {
        return positionDao;
    }

    public void setPositionDao(PositionMapper positionDao) {
        this.positionDao = positionDao;
    }

    public List getAllPosition(){
        List list = positionDao.getPosition();
        return list;
    }
}
