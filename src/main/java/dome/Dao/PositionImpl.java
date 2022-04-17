package dome.Dao;

import dome.Bean.Position;
import org.mybatis.spring.SqlSessionTemplate;

import java.util.ArrayList;
import java.util.List;

public class PositionImpl implements PositionMapper{
    private SqlSessionTemplate sqlSession;

    public SqlSessionTemplate getSqlSession() {
        return sqlSession;
    }

    public void setSqlSession(SqlSessionTemplate sqlSession) {
        this.sqlSession = sqlSession;
    }

    @Override
    public List getPosition() {
        return sqlSession.getMapper(PositionMapper.class).getPosition();
    }
}
