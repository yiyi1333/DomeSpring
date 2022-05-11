package dome.Action;

import dome.Bean.AQI;
import dome.Bean.Detail;
import dome.Bean.Pollutants;
import dome.Service.AQICalculater;
import dome.Service.HttpService;
import dome.Service.PollutantsService;
import dome.Time.TimeControl;

import java.time.LocalDate;
import java.util.ArrayDeque;
import java.util.ArrayList;

public class PollutantAction {
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
        ArrayList<Pollutants> weekPolluntants = pollutantsService.getWeekPollutants(18.34, 109.25);
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

        ArrayList<Pollutants> yearPolluntans = pollutantsService.getYearPollutants(18.34, 109.25);
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

        httpService.getForecastData(18.34, 109.25);
        return "success";
    }
}
