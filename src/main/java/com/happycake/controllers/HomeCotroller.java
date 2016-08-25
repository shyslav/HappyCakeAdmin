package com.happycake.controllers;

import com.happycake.data.GlobalController;
import com.happycake.siteData.UserBean;
import org.json.JSONException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.sql.SQLException;

/**
 * Created by shyslav on 8/25/16.
 */
@Controller
public class HomeCotroller extends GlobalController {
    @RequestMapping(value="index")
    public String home(ModelMap map , HttpServletRequest request){
        UserBean user = getUserInfo(request);
        map.addAttribute("webTitle","Главная");
        map.addAttribute("webMenu",headerLoader(request));
        map.addAttribute("hotPrice", hotPriceLoader(request));
        map.addAttribute("randCategory", randCategory(request));
        return "index.jsp";
    }

    @RequestMapping(value="crop")
    public String crop(ModelMap map , HttpServletRequest request) throws IOException, JSONException, SQLException {
        return "crop.jsp";
    }
}
