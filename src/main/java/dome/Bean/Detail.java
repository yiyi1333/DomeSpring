package dome.Bean;

import java.util.ArrayList;

public class Detail {
    private AQI tomorrowAQI;

    private ArrayList<Double> weekPM25;
    private ArrayList<Double> weekPM10;
    private ArrayList<Double> weekSO2;
    private ArrayList<Double> weekCO;
    private ArrayList<Double> weekNO2;
    private ArrayList<Double> weekO3;

    private ArrayList<AQI> weekAQI;

    private ArrayList<AQI> nextThreeDaysAQI;

    private ArrayList<Double> yearPM25;
    private ArrayList<Double> yearPM10;
    private ArrayList<Double> yearSO2;
    private ArrayList<Double> yearCO;
    private ArrayList<Double> yearNO2;
    private ArrayList<Double> yearO3;

    private ArrayList<String> dateList;


    public ArrayList<String> getDateList() {
        return dateList;
    }

    public void setDateList(ArrayList<String> dateList) {
        this.dateList = dateList;
    }

    public AQI getTomorrowAQI() {
        return tomorrowAQI;
    }

    public void setTomorrowAQI(AQI tomorrowAQI) {
        this.tomorrowAQI = tomorrowAQI;
    }

    public ArrayList<Double> getWeekPM25() {
        return weekPM25;
    }

    public void setWeekPM25(ArrayList<Double> weekPM25) {
        this.weekPM25 = weekPM25;
    }

    public ArrayList<Double> getWeekPM10() {
        return weekPM10;
    }

    public void setWeekPM10(ArrayList<Double> weekPM10) {
        this.weekPM10 = weekPM10;
    }

    public ArrayList<Double> getWeekSO2() {
        return weekSO2;
    }

    public void setWeekSO2(ArrayList<Double> weekSO2) {
        this.weekSO2 = weekSO2;
    }

    public ArrayList<Double> getWeekCO() {
        return weekCO;
    }

    public void setWeekCO(ArrayList<Double> weekCO) {
        this.weekCO = weekCO;
    }

    public ArrayList<Double> getWeekNO2() {
        return weekNO2;
    }

    public void setWeekNO2(ArrayList<Double> weekNO2) {
        this.weekNO2 = weekNO2;
    }

    public ArrayList<Double> getWeekO3() {
        return weekO3;
    }

    public void setWeekO3(ArrayList<Double> weekO3) {
        this.weekO3 = weekO3;
    }

    public ArrayList<AQI> getWeekAQI() {
        return weekAQI;
    }

    public void setWeekAQI(ArrayList<AQI> weekAQI) {
        this.weekAQI = weekAQI;
    }

    public ArrayList<AQI> getNextThreeDaysAQI() {
        return nextThreeDaysAQI;
    }

    public void setNextThreeDaysAQI(ArrayList<AQI> nextThreeDaysAQI) {
        this.nextThreeDaysAQI = nextThreeDaysAQI;
    }

    public ArrayList<Double> getYearPM25() {
        return yearPM25;
    }

    public void setYearPM25(ArrayList<Double> yearPM25) {
        this.yearPM25 = yearPM25;
    }

    public ArrayList<Double> getYearPM10() {
        return yearPM10;
    }

    public void setYearPM10(ArrayList<Double> yearPM10) {
        this.yearPM10 = yearPM10;
    }

    public ArrayList<Double> getYearSO2() {
        return yearSO2;
    }

    public void setYearSO2(ArrayList<Double> yearSO2) {
        this.yearSO2 = yearSO2;
    }

    public ArrayList<Double> getYearCO() {
        return yearCO;
    }

    public void setYearCO(ArrayList<Double> yearCO) {
        this.yearCO = yearCO;
    }

    public ArrayList<Double> getYearNO2() {
        return yearNO2;
    }

    public void setYearNO2(ArrayList<Double> yearNO2) {
        this.yearNO2 = yearNO2;
    }

    public ArrayList<Double> getYearO3() {
        return yearO3;
    }

    public void setYearO3(ArrayList<Double> yearO3) {
        this.yearO3 = yearO3;
    }
}
