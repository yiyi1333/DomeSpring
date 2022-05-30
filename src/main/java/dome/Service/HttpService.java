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
        String data = datavalue.toString();
//        System.out.println(data.split(",").length);
//        System.out.println(data);
        HashMap<String, String> map = new HashMap<>();
        map.put("data", data);
        String ans = sendPost("http://www.zhangyuxiang.icu:9000/predict_7d_3d", map);
//        String ans = sendPost("http://127.0.0.1:9000/predict_7d_7d",map);
        System.out.println(ans);
        //解析result
        String[] cuts = ans.split(",");
        for(int i = 0; i < 3; i++){
            Pollutants temp = new Pollutants();
            temp.setPm2(Double.parseDouble(cuts[i * 6]));
            temp.setPm10(Double.parseDouble(cuts[i * 6 + 1]));
            temp.setSo2(Double.parseDouble(cuts[i * 6 + 2]));
            temp.setNo2(Double.parseDouble(cuts[i * 6 + 3]));
            temp.setCo(Double.parseDouble(cuts[i * 6 + 4]));
            temp.setO3(Double.parseDouble(cuts[i * 6 + 5]));
            pollutants.add(temp);
        }
        return pollutants;
    }
}
