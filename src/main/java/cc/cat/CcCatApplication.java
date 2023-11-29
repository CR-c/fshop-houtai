package cc.cat;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication
@EnableTransactionManagement //开启注解方式的事务管理
@ComponentScan("cc.cat.mapper")
@Slf4j
public class CcCatApplication {

    public static void main(String[] args) {
        SpringApplication.run(CcCatApplication.class, args);
        log.info("毛毛Application is running...");
    }

}
