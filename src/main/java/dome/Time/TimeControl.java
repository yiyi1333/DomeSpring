package dome.Time;

import java.time.LocalDate;

public class TimeControl {
    private LocalDate today;
    private LocalDate sevenDaysAgo;
    private LocalDate oneYearAgo;

    public TimeControl() {
        this.today = LocalDate.of(2018, 12, 1);
        this.sevenDaysAgo = today.plusDays(-7);
        this.oneYearAgo = today.plusDays(-365);
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
