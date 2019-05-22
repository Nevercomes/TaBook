package com.nevercome.tabook;

import com.nevercome.tabook.common.config.Global;
import com.nevercome.tabook.common.utils.FileUtils;
import com.nevercome.tabook.common.utils.IdGen;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;
import okhttp3.*;
import org.junit.Test;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

/**
 * @Author: sun
 * @Description:
 * @Date: 2019/4/4
 */
public class OkHttpTest {
    @Test
    public void okHttp() {
        String url = "https://www.baidu.com/";
        OkHttpClient okHttpClient = new OkHttpClient();
        Request request = new Request.Builder()
                .url(url)
                .build();
        Call call = okHttpClient.newCall(request);
        try {
            Response response = call.execute();
            System.out.println(response.body().string());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Test
    public void downLoadImage() {
        String avatarUrl = "https://wx.qlogo.cn/mmopen/vi_32/F2dtEIPNBBy6Y707NumKWicGSyxEspAKMEuj5MXvo2svSAdnuJFPkBIeroalFtCp9V0CX3fZpAGWBp3PsN2jUpw/132";
        OkHttpClient okHttpClient = new OkHttpClient();
        Request okRequest = new Request.Builder().url(avatarUrl).build();
//                Call call = okHttpClient.newCall(okRequest);
        Call call = okHttpClient.newCall(okRequest);
        try {
            Response okResponse = call.execute();
            InputStream inputStream = okResponse.body().byteStream();
//            String baseDir = FileUtils.path(Global.getUserFilesBaseDir() + Global.USERFILES_BASE_URL + "avatar/");
//            String uuId = IdGen.uuid();
            saveImage(inputStream, "D:/test/image.jpg");
        } catch (IOException e) {
            e.printStackTrace();
        }
//        okHttpClient.newCall(okRequest).enqueue(new Callback() {
//
//
//            @Override
//            public void onFailure(Call call, IOException e) {
//                System.out.println("fail");
//            }
//
//            @Override
//            public void onResponse(Call call, Response okResponse) throws IOException {
//                System.out.println("request success");
//                InputStream inputStream = okResponse.body().byteStream();
////                String baseDir = FileUtils.path(Global.getUserFilesBaseDir() + Global.USERFILES_BASE_URL + "avatar/");
////                String uuId = IdGen.uuid();
//                Path savePath = Paths.get("D:/test");
//                if (!Files.exists(savePath)) {
//                    Files.createDirectories(savePath);
//                }
//                File file = new File(savePath.toString()) ;
//                FileOutputStream fos = new FileOutputStream(file);
//                try {
//                    fos.write(readInputStream(inputStream));
//                    fos.flush();
////                    user.setAvatarUrl(baseDir + uuId);
//                } catch (Exception e) {
//                    e.printStackTrace();
//                }
//                fos.close();
//            }
//        });
    }

    private byte[] readInputStream(InputStream inStream) throws Exception {
        ByteArrayOutputStream outStream = new ByteArrayOutputStream();
        byte[] buffer = new byte[1024];
        int len = 0;
        while ((len = inStream.read(buffer)) != -1) {
            outStream.write(buffer, 0, len);
        }
        inStream.close();
        return outStream.toByteArray();
    }

    private void saveImage(InputStream inputStream, String savePath) {
        BufferedInputStream in = null;
        try {
            in = new BufferedInputStream(inputStream);

            //字节流转图片对象
            Image bi = ImageIO.read(in);
            //构建图片流
            BufferedImage tag = new BufferedImage(132, 132, BufferedImage.TYPE_INT_RGB);
            //绘制改变尺寸后的图
            tag.getGraphics().drawImage(bi, 0, 0, 32, 32, null);
            //输出流
            BufferedOutputStream out = new BufferedOutputStream(new FileOutputStream(savePath));
            JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
            encoder.encode(tag);
            ImageIO.write(tag, "JPEG", out);
            in.close();
            out.close();
        } catch (IOException e) {

        }
    }
}

