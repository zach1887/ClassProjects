//thanks JorunalDev.com <3<3
package com.tsguild.lvl2;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

/**
 * Handles requests for the application file upload requests
 */
@Controller
public class FileUploadController {

    @Value("#{servletContext.contextPath}")
    private String servletContextPath;

    private static final Logger logger = LoggerFactory
            .getLogger(FileUploadController.class);

    /**
     * Upload single file using Spring Controller
     */
    @RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
    public @ResponseBody
    String uploadFileHandler( @RequestParam() MultipartFile file, HttpServletRequest request ) {
        
        String name = String.valueOf(System.currentTimeMillis());
        
        if (!file.isEmpty()) {
            try {
                byte[] bytes = file.getBytes();

                // Creating the directory to store file
                String rootPath = request.getSession().getServletContext().getRealPath("/img/upload");
                File dir = new File(rootPath); 
               if (!dir.exists()) {
                    dir.mkdirs();
                }

                // Create the file on server
                File serverFile = new File(dir.getAbsolutePath()
                        + File.separator + name);
                BufferedOutputStream stream = new BufferedOutputStream(
                        new FileOutputStream(serverFile));
                stream.write(bytes);
                stream.close();

                logger.info("Server File Location="
                        + serverFile.getAbsolutePath());

                return name;
            } catch (Exception e) {
                return "You failed to upload " + name + " => " + e.getMessage();
            }
        } else {
            return "You failed to upload " + name
                    + " because the file was empty.";
        }
    }


    @RequestMapping(value = "/uploadWhere", method = RequestMethod.GET)
    public @ResponseBody
    String uploadWhere(HttpServletRequest request) throws IOException {
        //String rootPath = System.getProperty("catalina.home");
        //File dir = new File(rootPath + File.separator + "tmpFiles");

        
        String context = request.getSession().getServletContext().getRealPath("/img/upload");
        
        String rootPath = request.getSession().getServletContext().getRealPath("/img/upload/1");
        
        File serverFile = new File(rootPath);
        
        String type = Files.probeContentType(serverFile.toPath());
        
        return type;
    }

    @RequestMapping(value = "/getImage/{file}", method = RequestMethod.GET)
    public @ResponseBody
    ResponseEntity<InputStreamResource> getImage(@PathVariable String file, HttpServletRequest request) throws FileNotFoundException, IOException {
        String rootPath = request.getSession().getServletContext().getRealPath("/img/upload/" + file);

        File serverFile = new File(rootPath);
        
        
        InputStream inputStream = new FileInputStream(serverFile);
        
        return ResponseEntity.ok()
                .contentLength(serverFile.length())
                .contentType(MediaType.parseMediaType(Files.probeContentType(serverFile.toPath())))
                .body(new InputStreamResource(inputStream));
    }
}
