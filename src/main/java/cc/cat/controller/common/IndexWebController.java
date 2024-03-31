package cc.cat.controller.common;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class IndexWebController {
    @RequestMapping({"/","index.html"})
    public String hello(){
        return "forward:index.html";
    }

}
