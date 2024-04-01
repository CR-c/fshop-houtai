FROM openjdk:8-jre
LABEL authors="chen-v1.0"
MAINTAINER chen-v1.0
#LABEL maintainer=
LABEL image.name="fshop"
# VOLUME 指定临时文件目录为/tmp，在主机/var/lib/docker目录下创建了一个临时文件并链接到容器的/tmp
RUN mkdir -p /home/fshop
# 挂载目录
VOLUME /home/fshop
# 创建目录

# 指定路径
WORKDIR /home/fshop
COPY target/*.jar /app.jar
# 将jar包添加到容器中并更名
#ADD target/ruoyi-admin.jar ruoyi-admin.jar
# 暴露端口
EXPOSE 9001
ENV TZ=Asia/Shanghai
ENTRYPOINT ["java","-Djavasecurity.egd=file:/dev/./urandom","-jar","/app.jar"]

#ENTRYPOINT ["top", "-b"]