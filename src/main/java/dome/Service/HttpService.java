package dome.Service;

import dome.Bean.InputData;
import dome.Bean.Pollutants;
import dome.Dao.ParmaMapper;
import dome.Dao.Table;
import dome.Time.TimeControl;
import org.apache.http.Consts;
import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.ParseException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.mybatis.spring.SqlSessionTemplate;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class HttpService {
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

    public static String sendPost(String url, Map<String, String> map) {
        CloseableHttpClient httpclient = HttpClients.createDefault();
        List<NameValuePair> formparams = new ArrayList<NameValuePair>();
        for (Map.Entry<String, String> entry : map.entrySet()) {
            //给参数赋值
            formparams.add(new BasicNameValuePair(entry.getKey(), entry.getValue()));
        }
        UrlEncodedFormEntity entity = new UrlEncodedFormEntity(formparams, Consts.UTF_8);
        HttpPost httppost = new HttpPost(url);
        httppost.setEntity(entity);
        CloseableHttpResponse response = null;
        try {
            response = httpclient.execute(httppost);
        } catch (IOException e) {
            e.printStackTrace();
        }
        assert response != null;
        HttpEntity entity1 = response.getEntity();
        String result = null;
        try {
            result = EntityUtils.toString(entity1);
        } catch (ParseException | IOException e) {
            e.printStackTrace();
        }
        return result;
    }
    //三天预测数据
    public ArrayList<Pollutants> getForecastData(double lat, double lon){
        ArrayList<Pollutants> pollutants = new ArrayList<>();
        int id = sqlSession.getMapper(Table.class).getId(lat, lon);
        int tableid = (id - 1) / 5 * 5 + 1;
        String tableName = "`" + String.valueOf(tableid) + "`";
        ArrayList<InputData> inputDataList = sqlSession.getMapper(ParmaMapper.class).getweekData(lat, lon, tableName, Date.valueOf(timeControl.getSevenDaysAgo()), Date.valueOf(timeControl.getToday()));
        StringBuilder datavalue = new StringBuilder();
        for(InputData i : inputDataList){
            datavalue.append(i.toString() + ",");
        }
        datavalue.append(String.valueOf(lat) + "," + String.valueOf(lon));
//        String data = datavalue.toString();
        HashMap<String, String> map = new HashMap<>();
        String data = "92.82,127.98,12.71,41.03,0.97,50.92,2.91,1.98,282.83,43.75,101729.68,137.67,189.57,13.7,59.03,1.34,17.75,2.62,-0.56,280.18,63.13,101550.59,256.21,326.04,16.95,68.12,1.99,26.24,0.73,-1.22,280.22,63.64,101524.03,318.88,393.64,25.06,66.05,2.25,15.55,-0.31,-2.19,281.81,66.64,101698.16,252.83,306.04,48.22,55.14,1.87,8.06,-0.01,-5.37,279.51,68.55,102134.96,104.75,134.85,40.16,35.68,1.01,14.99,-1.1,-7.03,277.36,34.25,102805.99,60.27,124.03,12.67,36.02,0.83,17.03,-3.05,-0.35,276.47,44.34,102262.63,33.06,114.18";
        map.put("data", data);
        System.out.println(data);
        String ans = sendPost("http://www.zhangyuxiang.icu:9000/predict_7d_3d", map);
//        String ans = sendPost("http://127.0.0.1:9000/predict_7d_7d",map);
        System.out.println(ans);
        return pollutants;
    }
}
