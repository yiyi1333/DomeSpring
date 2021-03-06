package dome.Action;

import dome.Bean.AQI;
import dome.Bean.Detail;
import dome.Bean.Pollutants;
import dome.Service.AQICalculater;
import dome.Service.HttpService;
import dome.Service.PollutantsService;
import dome.Time.TimeControl;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import javax.servlet.http.HttpServletRequest;
import java.time.LocalDate;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Map;

public class PollutantAction{
    private PollutantsService pollutantsService;
    private HttpService httpService;
    private ArrayList<Pollutants> list;
    private Pollutants pollutants;
    private AQI aqi;
    private double lon;
    private double lat;
    private Detail detail;

    public HttpService getHttpService() {
        return httpService;
    }

    public void setHttpService(HttpService httpService) {
        this.httpService = httpService;
    }

    public void setDetail(Detail detail) {
        this.detail = detail;
    }

    public Detail getDetail() {
        return detail;
    }

    public double getLon() {
        return lon;
    }

    public void setLon(double lon) {
        this.lon = lon;
    }

    public double getLat() {
        return lat;
    }

    public void setLat(double lat) {
        this.lat = lat;
    }

    public AQI getAqi() {
        return aqi;
    }

    public void setAqi(AQI aqi) {
        this.aqi = aqi;
    }

    public void setPollutants(Pollutants pollutants) {
        this.pollutants = pollutants;
    }

    public Pollutants getPollutants() {
        return pollutants;
    }

    public PollutantsService getPollutantsService() {
        return pollutantsService;
    }

    public void setPollutantsService(PollutantsService pollutantsService) {
        this.pollutantsService = pollutantsService;
    }

    public ArrayList<Pollutants> getList() {
        return list;
    }

    public void setList(ArrayList<Pollutants> list) {
        this.list = list;
    }

    public String getTodayPollutants(){
        TimeControl timeControl = new TimeControl();
        pollutants = pollutantsService.getTodayPollutants(lat, lon, timeControl.getToday());
        System.out.println(pollutants);
        AQICalculater aqiCalculater = new AQICalculater();
        aqi = aqiCalculater.PollutantsToAQI(pollutants);
        return "success";
    }

    public String getDetailInfo(){
        detail = new Detail();
        System.out.println(lat + " " + lon);
        ArrayList<Pollutants> weekPolluntants = pollutantsService.getWeekPollutants(lat, lon);
//        System.out.println(weekPolluntants.size());
        ArrayList<Double> weekPM25 = new ArrayList<>();
        ArrayList<Double> weekPM10 = new ArrayList<>();
        ArrayList<Double> weekSO2 = new ArrayList<>();
        ArrayList<Double> weekCO = new ArrayList<>();
        ArrayList<Double> weekNO2 = new ArrayList<>();
        ArrayList<Double> weekO3 = new ArrayList<>();
        for (Pollutants p : weekPolluntants) {
            weekPM25.add(p.getPm2());
            weekPM10.add(p.getPm10());
            weekCO.add(p.getCo());
            weekNO2.add(p.getNo2());
            weekO3.add(p.getO3());
            weekSO2.add(p.getSo2());
        }
        detail.setWeekPM10(weekPM10);
        detail.setWeekPM25(weekPM25);
        detail.setWeekCO(weekCO);
        detail.setWeekSO2(weekSO2);
        detail.setWeekNO2(weekNO2);
        detail.setWeekO3(weekO3);
        ArrayList<AQI> weekAQI = pollutantsService.getWeekAQI(weekPolluntants);
        detail.setWeekAQI(weekAQI);

        ArrayList<Pollutants> yearPolluntans = pollutantsService.getYearPollutants(lat, lon);
        ArrayList<Double> yearPM25 = new ArrayList<>();
        ArrayList<Double> yearPM10 = new ArrayList<>();
        ArrayList<Double> yearSO2 = new ArrayList<>();
        ArrayList<Double> yearCO = new ArrayList<>();
        ArrayList<Double> yearNO2 = new ArrayList<>();
        ArrayList<Double> yearO3 = new ArrayList<>();
        for(Pollutants p : yearPolluntans){
            yearPM25.add(p.getPm2());
            yearPM10.add(p.getPm10());
            yearCO.add(p.getCo());
            yearNO2.add(p.getNo2());
            yearO3.add(p.getO3());
            yearSO2.add(p.getSo2());
        }
        detail.setYearPM25(yearPM25);
        detail.setYearPM10(yearPM10);
        detail.setYearSO2(yearSO2);
        detail.setYearCO(yearCO);
        detail.setYearNO2(yearNO2);
        detail.setYearO3(yearO3);
        AQICalculater aqiCalculater = new AQICalculater();
        ArrayList<Pollutants> forecastData = httpService.getForecastData(lat, lon);
        ArrayList<Double> pPM25 = new ArrayList<>();
        ArrayList<Double> pPM10 = new ArrayList<>();
        ArrayList<Double> pSO2 = new ArrayList<>();
        ArrayList<Double> pNO2 = new ArrayList<>();
        ArrayList<Double> pCO = new ArrayList<>();
        ArrayList<Double> pO3 = new ArrayList<>();
        ArrayList<AQI> aqiList = new ArrayList<>();


        ArrayList<Pollutants> realData = pollutantsService.getNextThreeDaysPollutants(lat, lon);
        ArrayList<Double> rPM25 = new ArrayList<>();
        ArrayList<Double> rPM10 = new ArrayList<>();
        ArrayList<Double> rSO2 = new ArrayList<>();
        ArrayList<Double> rNO2 = new ArrayList<>();
        ArrayList<Double> rCO = new ArrayList<>();
        ArrayList<Double> rO3 = new ArrayList<>();
        for(Pollutants p : realData){
            rPM25.add(p.getPm2());
            rPM10.add(p.getPm10());
            rSO2.add(p.getSo2());
            rNO2.add(p.getNo2());
            rO3.add(p.getO3());
            rCO.add(p.getCo());
        }

        for(int i = 0; i < 3; i++){
            AQI temp = aqiCalculater.PollutantsToAQI(forecastData.get(i));
            pPM25.add((realData.get(i).getPm2() + forecastData.get(i).getPm2()) / 2);
            pPM10.add((realData.get(i).getPm10()+ forecastData.get(i).getPm10()) / 2);
            pSO2.add((realData.get(i).getSo2() + forecastData.get(i).getSo2()) / 2);
            pNO2.add((realData.get(i).getNo2() + forecastData.get(i).getNo2()) / 2);
            pO3.add((realData.get(i).getO3() + forecastData.get(i).getO3()) / 2);
            pCO.add((realData.get(i).getCo() + forecastData.get(i).getCo()) / 2);
            aqiList.add(temp);
        }

        detail.setpPM25(pPM25);
        detail.setpPM10(pPM10);
        detail.setpSO2(pSO2);
        detail.setpNO2(pNO2);
        detail.setpCO(pCO);
        detail.setpO3(pO3);

        detail.setrPM25(rPM25);
        detail.setrPM10(rPM10);
        detail.setrSO2(rSO2);
        detail.setrNO2(rNO2);
        detail.setrCO(rCO);
        detail.setrO3(rO3);

        detail.setTomorrowAQI(aqiList.get(0));
        detail.setNextThreeDaysAQI(aqiList);
        TimeControl timeControl = new TimeControl();
        detail.setDateList(timeControl.getYearTime());
        return "success";
    }


}
