package dome.Action;

import com.sun.net.httpserver.Authenticator;
import dome.Bean.Position;
import dome.Service.PositionService;

import java.util.ArrayList;
import java.util.List;

public class BaiduMap {
    private PositionService positionService;
    private List positionList;


    public PositionService getPositionService() {
        return positionService;
    }

    public void setPositionService(PositionService positionService) {
        this.positionService = positionService;
    }

    public List getPositionList() {
        return positionList;
    }

    public void setPositionList(List positionList) {
        this.positionList = positionList;
    }

    public String index(){
        return "success";
    }
    public String position(){
        positionList = positionService.getAllPosition();
        System.out.println(positionList.size());
        return "success";
    }
}
