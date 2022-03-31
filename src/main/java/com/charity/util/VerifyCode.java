package com.charity.util;
import java.awt.BasicStroke;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Random;

import javax.imageio.ImageIO;

import org.springframework.stereotype.Service;
@Service
public class VerifyCode {

    private int w = 100; //图片的宽
    private int h = 33; //图片的高
    private Random random = new Random();
    private String text;//随机产生的字符串
    // 图片背景色(白色)
    private Color bgColor  = new Color(255, 255, 255);
    private String []font = {"宋体", "华文楷体", "黑体", "微软雅黑", "楷体_GB2312"};
    private String codes = "123456789qwertyuopasdfghjkmnbvcxzQWERTYUPKJHGFDSAZXCVBNM";


    //随机生成字体
    private Font randomFont(){
        int index = random.nextInt(font.length);
        String fontName = font[index];
        int style = random.nextInt(4);//生成随机的样式, 0(无样式), 1(粗体), 2(斜体), 3(粗体+斜体)
        int size = random.nextInt(5) + 24; //生成随机字号, 24 ~ 28
        return new Font(fontName, style, size);
    }

    //随机生成颜色
    private Color randomColor(){
        int red = random.nextInt(150);
        int green = random.nextInt(150);
        int blue = random.nextInt(150);
        return new Color(red, green, blue);
    }

    // 画干扰线
    private void drawLine (BufferedImage image) {
        int num  = 3;//一共画3条
        Graphics2D g2 = (Graphics2D)image.getGraphics();
        for(int i = 0; i < num; i++) {//生成两个点的坐标，即4个值
            int x1 = random.nextInt(w);
            int y1 = random.nextInt(h);
            int x2 = random.nextInt(w);
            int y2 = random.nextInt(h);
            g2.setStroke(new BasicStroke(1.5F));
            g2.setColor(Color.BLUE); //干扰线是蓝色
            g2.drawLine(x1, y1, x2, y2);//画线
        }
    }

    //随机生成一个字符
    private char randomChar () {
        int index = random.nextInt(codes.length());
        return codes.charAt(index);
    }

    // 创建BufferedImage
    private BufferedImage createImage () {
        BufferedImage image = new BufferedImage(w, h, BufferedImage.TYPE_INT_RGB);
        Graphics2D g2 = (Graphics2D)image.getGraphics();
        g2.setColor(this.bgColor);
        g2.fillRect(0, 0, w, h);
        return image;
    }

    // 调用这个方法得到验证码
    public BufferedImage getImage () {
        BufferedImage image = createImage();//创建图片缓冲区
        Graphics2D g2 = (Graphics2D)image.getGraphics();//得到绘制环境
        StringBuilder sb = new StringBuilder();//用来装载生成的验证码文本
        // 向图片中画4个字符
        for(int i = 0; i < 4; i++)  {//循环四次，每次生成一个字符
            String s = randomChar() + "";//随机生成一个字母
            sb.append(s); //把字母添加到sb中
            float x = i * 1.0F * w / 4; //设置当前字符的x轴坐标
            g2.setFont(randomFont()); //设置随机字体
            g2.setColor(randomColor()); //设置随机颜色
            g2.drawString(s, x, h-5); //画图
        }
        this.text = sb.toString(); //把生成的字符串赋给了this.text
        drawLine(image); //添加干扰线
        return image;
    }

    // 返回验证码图片上的文本
    public String getText () {
        return text;
    }

    // 保存图片到指定的输出流
    public static void output (BufferedImage image, OutputStream out)
            throws IOException {
        ImageIO.write(image, "JPEG", out);
    }
}
