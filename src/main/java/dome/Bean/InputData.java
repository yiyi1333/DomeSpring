package dome.Bean;

public class InputData {
    private double pm2;
    private double pm10;
    private double so2;
    private double no2;
    private double co;
    private double o3;
    private double u;
    private double v;
    private double temp;
    private double rh;
    private double psfc;

    @Override
    public String toString() {
        return String.valueOf(pm2) + "," + String.valueOf(pm10) + "," + String.valueOf(so2) + "," + String.valueOf(no2) + "," + String.valueOf(co)
                + String.valueOf(o3) + "," + String.valueOf(u) + "," + String.valueOf(v) + "," + String.valueOf(temp) + "," + String.valueOf(rh) + "," + String.valueOf(psfc);
    }

    public double getPm2() {
        return pm2;
    }

    public void setPm2(double pm2) {
        this.pm2 = pm2;
    }

    public double getPm10() {
        return pm10;
    }

    public void setPm10(double pm10) {
        this.pm10 = pm10;
    }

    public double getSo2() {
        return so2;
    }

    public void setSo2(double so2) {
        this.so2 = so2;
    }

    public double getNo2() {
        return no2;
    }

    public void setNo2(double no2) {
        this.no2 = no2;
    }

    public double getCo() {
        return co;
    }

    public void setCo(double co) {
        this.co = co;
    }

    public double getO3() {
        return o3;
    }

    public void setO3(double o3) {
        this.o3 = o3;
    }

    public double getU() {
        return u;
    }

    public void setU(double u) {
        this.u = u;
    }

    public double getV() {
        return v;
    }

    public void setV(double v) {
        this.v = v;
    }

    public double getTemp() {
        return temp;
    }

    public void setTemp(double temp) {
        this.temp = temp;
    }

    public double getRh() {
        return rh;
    }

    public void setRh(double rh) {
        this.rh = rh;
    }

    public double getPsfc() {
        return psfc;
    }

    public void setPsfc(double psfc) {
        this.psfc = psfc;
    }
}
