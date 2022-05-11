package dome.Service;

import dome.Bean.AQI;
import dome.Bean.Pollutants;

public class AQICalculater {
    private double aqi[] = {0, 50, 100, 150, 200, 300, 400, 500};
    private double pm25[] = {0, 35, 75, 115, 150, 250, 350, 500};
    private double pm10[] = {0, 50, 150, 250, 350, 420, 500, 600};
    private double so2[] = {0, 50, 150, 475, 800, 1600, 2100, 2620};
    private double no2[] = {0, 40, 80, 180, 280, 565, 750, 940};
    private double co[] = {0, 2, 4, 14, 24, 36, 48, 60};
    private double o3[] = {0, 160, 200, 300, 400, 800, 1000, 1200};
    public AQI PollutantsToAQI(Pollutants pollutants){
        double maxn = 0;
        AQI a = new AQI();
        //pm2.5
        int p = 0;
        while (pollutants.getPm2() > pm25[p]) p++;
        a.setPm25((aqi[p] - aqi[p - 1]) / (pm25[p] - pm25[p - 1]) * (pollutants.getPm2() - pm25[p - 1]) + aqi[p - 1]);
        if(a.getPm25() > maxn) maxn = a.getPm25();
        //pm10
        p = 0;
        while (pollutants.getPm10() > pm10[p]) p++;
        a.setPm10((aqi[p] - aqi[p - 1]) / (pm10[p] - pm10[p - 1]) * (pollutants.getPm10() - pm10[p - 1]) + aqi[p - 1]);
        if(a.getPm10() > maxn) maxn = a.getPm10();
        //so2
        p = 0;
        while (pollutants.getSo2() > so2[p]) p++;
        a.setSo2((aqi[p] - aqi[p - 1]) / (so2[p] - so2[p - 1]) * (pollutants.getSo2() - so2[p - 1]) + aqi[p - 1]);
        if(a.getSo2() > maxn) maxn = a.getSo2();
        //no2
        p = 0;
        while (pollutants.getNo2() > no2[p]) p++;
        a.setNo2((aqi[p] - aqi[p - 1]) / (no2[p] - no2[p - 1]) * (pollutants.getNo2() - no2[p - 1]) + aqi[p - 1]);
        if(a.getNo2() > maxn) maxn = a.getNo2();
        //co
        p = 0;
        while (pollutants.getCo() > co[p]) p++;
        a.setCo((aqi[p] - aqi[p - 1]) / (co[p] - co[p - 1]) * (pollutants.getCo() - co[p - 1]) + aqi[p - 1]);
        if(a.getCo() > maxn) maxn = a.getCo();
        //o3
        p = 0;
        while (pollutants.getO3()> o3[p]) p++;
        a.setO3((aqi[p] - aqi[p - 1]) / (o3[p] - o3[p - 1]) * (pollutants.getO3() - o3[p - 1]) + aqi[p - 1]);
        if(a.getO3() > maxn) maxn = a.getO3();
        a.setMax(maxn);
        return a;
    }
}
