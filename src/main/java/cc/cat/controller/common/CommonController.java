package cc.cat.controller.common;


import cc.cat.common.R;
import cc.cat.utils.SshUtils;
import com.jcraft.jsch.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

@RestController
@RequestMapping("common")
public class CommonController {

    //使用application.yml中 image.url属性
//    @Value("${image.url}")
//    private String url;

//    //使用application.yml中 image.path属性
    @Value("${SSH.imagePath}")
    private String imagePath;

//    private SshUtils sshUtils
    @Autowired
    private SshUtils sshUtils;
    @PostMapping("/upLoad")
    public R<String> upLoad(MultipartFile file) {
        Session jSchSession = null;
        ChannelSftp sftp=null;
        try{
            jSchSession = sshUtils.connect().getData();
            sftp = (ChannelSftp) jSchSession.openChannel("sftp");
            sftp.connect();;
            sftp.setFilenameEncoding("UTF-8");
            InputStream inputStream = file.getInputStream();
            sftp.put(inputStream,imagePath+file.getName());
            return R.success("上传成功");
        } catch (JSchException | SftpException | IOException e) {
            throw new RuntimeException(e);
        }finally {
//            // 关闭sftpChannel
//            if (sftp != null && sftp.isConnected()) {
//                sftp.quit();
//            }
//            if (jSchSession != null && jSchSession.isConnected()) {
//                jSchSession.disconnect();
//            }
        }


    }

}
