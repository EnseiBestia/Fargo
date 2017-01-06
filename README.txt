AppFuse Basic Spring MVC Archetype
--------------------------------------------------------------------------------
If you're reading this then you've created your new project using Maven and
AppBase-MVC-Hibernate.  You have only created the shell of an AppFuse Java EE
application.  The project object model (pom) is defined in the file pom.xml.
The application is ready to run as a web application. The pom.xml file is
pre-defined with Hibernate as a persistence model and Spring MVC as the web
framework.

To get started, please complete the following steps:

1. Download and install a MySQL 5.x database from 
   http://dev.mysql.com/downloads/mysql/5.0.html#downloads.

2. Run "mvn jetty:run" and view the application at http://localhost:8080.

3. More information can be found at:

   http://appfuse.org/display/APF/AppFuse+QuickStart

@Cre 2016.3.23
branch:fargo_hybrid
1.基础代码中包含mongodb和hibernate的扩展，主要是dao的基础现实。支持amp-fargo生成mongodb和hibernate代码
2.权限控制，系统配置，缓存配置，使用mongodb数据库
3.下一版本的目标是将所有基础配置数据库改为hibernate-即完全hibernate，脱离mongodb的项目
@Cre 2016.6.21
完全删掉对mongodb的依赖，完全使用hibernate。改名为 Fargo-MySQL
原有基础包从 com.btxy 剔除不需要的包之后移动到  com.fargo

@Cre 2016.6.29
删除mongodb，移植数据到mysql完成。
基础包com.btxy清空，代码移植到com.fargo下