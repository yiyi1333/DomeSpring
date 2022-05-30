package dome.Time;

import java.time.LocalDate;
import java.util.ArrayList;

public class TimeControl {
    private LocalDate today;
    private LocalDate sevenDaysAgo;
    private LocalDate oneYearAgo;

    public TimeControl() {
        this.today = LocalDate.of(2018, 12, 1);
        this.sevenDaysAgo = today.plusDays(-6);
        this.oneYearAgo = today.plusDays(-365);
    }

    public ArrayList<String> getYearTime() {
        ArrayList<String> yearList = new ArrayList<>();
        LocalDate oneYearAgo = today.plusDays(-365);
        for(int i = 0; i < 365; i++){
            yearList.add(String.valueOf(oneYearAgo.getYear()) + String.valueOf(oneYearAgo.getMonthValue()) + String.valueOf(oneYearAgo.getDayOfMonth()));
            oneYearAgo = oneYearAgo.plusDays(1);
        }
        return yearList;
    }



    public LocalDate getSevenDaysAgo() {
        return sevenDaysAgo;
    }

    public void setSevenDaysAgo(LocalDate sevenDaysAgo) {
        this.sevenDaysAgo = sevenDaysAgo;
    }

    public LocalDate getToday() {
        return today;
    }

    public void setToday(LocalDate today) {
        this.today = today;
    }

    public LocalDate getOneYearAgo() {
        return oneYearAgo;
    }

    public void setOneYearAgo(LocalDate oneYearAgo) {
        this.oneYearAgo = oneYearAgo;
    }
}
