package dome.Action;

import dome.Bean.Pollutants;
import dome.Service.PollutantsService;

import java.util.ArrayList;

public class PollutantAction {
    private PollutantsService pollutantsService;
    private ArrayList<Pollutants> list;

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

    public String getPollutants(){
        list = pollutantsService.getAllPollutants(18.34, 109.25);
        return "success";
    }
}
