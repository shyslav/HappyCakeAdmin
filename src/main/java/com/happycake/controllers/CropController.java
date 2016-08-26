package com.happycake.controllers;

import com.sun.org.apache.bcel.internal.util.ClassLoader;
import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.*;


/**
 * Created by shyslav on 8/26/16.
 */
@Controller
@EnableWebMvc
@RequestMapping("/cropaction")
public class CropController {
    @RequestMapping(value = "index")
    public @ResponseBody String home(ModelMap map, HttpServletRequest req) throws IOException, ServletException {


//        Collection<Part> files = req.getParts();
//        if (files != null && !files.isEmpty()) {
//            for (Part file : files) {
//                if (file.getSubmittedFileName() == null) {
//                    return;
//                }
//                if (file.getSize() > 16000000) {
//                    return;
//                }
//            }
//        }
        String x = req.getParameter("xReq");
        String y = req.getParameter("yReq");
        String width = req.getParameter("widthReq");
        String height = req.getParameter("heightReq");

        cropImage(IOUtils.toByteArray(getClass().getResourceAsStream("/file/picture.jpg")),
                Integer.parseInt(width), Integer.parseInt(height),
                Integer.parseInt(x),
                Integer.parseInt(y));
        return "ok";
    }

    @RequestMapping(value = "getImage")
    public void getImage(ModelMap map, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        File file = new File("/home/shyslav/storageImageTest/test.png");
        InputStream stream = new FileInputStream(file);
        response.setContentType("image/png");
        response.getOutputStream().write(IOUtils.toByteArray(stream));
    }

    private byte[] cropImage(byte[] originalImage, int AVATAR_WIDTH, int AVATAR_HEIGHT, int x, int y) throws IOException {
        BufferedImage sourceImage = ImageIO.read(new ByteArrayInputStream(originalImage));
        BufferedImage croppedImage = sourceImage.getSubimage(x, y, AVATAR_WIDTH, AVATAR_HEIGHT);
        ImageIO.write(croppedImage, "png", new File("/home/shyslav/storageImageTest/test.png"));

        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        ImageIO.write(croppedImage, "png", baos);

        return baos.toByteArray();
    }
}
