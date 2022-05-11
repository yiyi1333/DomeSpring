import dome.Bean.Pollutants;
import dome.Service.PollutantsService;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;

import static dome.Service.HttpService.sendPost;

public class Test {
    public static void main(String[] args){
        HashMap<String, String> map = new HashMap<>();
        String data = "92.82,127.98,12.71,41.03,0.97,50.92,2.91,1.98,282.83,43.75,101729.68,137.67,189.57,13.7,59.03,1.34,17.75,2.62,-0.56,280.18,63.13,101550.59,256.21,326.04,16.95,68.12,1.99,26.24,0.73,-1.22,280.22,63.64,101524.03,318.88,393.64,25.06,66.05,2.25,15.55,-0.31,-2.19,281.81,66.64,101698.16,252.83,306.04,48.22,55.14,1.87,8.06,-0.01,-5.37,279.51,68.55,102134.96,104.75,134.85,40.16,35.68,1.01,14.99,-1.1,-7.03,277.36,34.25,102805.99,60.27,124.03,12.67,36.02,0.83,17.03,-3.05,-0.35,276.47,44.34,102262.63,33.06,114.18";
        map.put("data", data);
        String[] meta = data.split(",");
        System.out.println(meta.length);
        String ans = sendPost("http://www.zhangyuxiang.icu:9000/predict_7d_3d", map);
//        String ans = sendPost("http://127.0.0.1:9000/predict_7d_7d",map);
        System.out.println(ans);
    }
}
