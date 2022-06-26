package vn.furniture;


import javax.servlet.*;
import javax.servlet.annotation.*;
import java.io.File;

@WebListener
public class UploadListener implements ServletContextListener {


    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext sc = sce.getServletContext();
        String path = sc.getInitParameter("upload");
        File file = new File(path);
        if (!file.exists())
            file.mkdirs();
        sc.setAttribute("DIR_PATH", file);
        sc.setAttribute("STRING_PATH", path);


    }


}
