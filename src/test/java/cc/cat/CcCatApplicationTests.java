package cc.cat;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.ArrayList;
import java.util.List;

@SpringBootTest
class CcCatApplicationTests {

    @Test
    void contextLoads() {
    }

    @Test
    void text(){
        List<Integer> list = new ArrayList<>();
        list.add(1);
        list.add(1);
        list.add(1);
        for(Integer integer:list){
            System.out.println(integer);
        }

    }

}
