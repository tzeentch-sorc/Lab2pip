package com.sol.ru;

import com.sun.org.apache.xpath.internal.operations.Bool;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

public class AreaCheckServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String xCoord = req.getParameter("xCoordClick").replace(',', '.');
        String yCoord = req.getParameter("yCoord").replace(',', '.');
        String radius = req.getParameter("radiusValue").replace(',', '.');
            double x,y,r;
            x = Double.parseDouble(xCoord);
            y = Double.parseDouble(yCoord);
            r = Double.parseDouble(radius);
            ResRow current = new ResRow();
            current.setX(Double.toString(x));
            current.setY(Double.toString(y));
            current.setRadius(Double.toString(r));

        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        out.println("<html>");
        out.println("<head>");
        out.println("<title>" + "Point checking" + "</title>");

        out.println(
        "   <style>"+
        "table{"+
        "   border: 2px solid #ffc62a;"+
        "   box-shadow: 0 0 6px 2px #9a0000;"+
        "   vertical-align: center;"+
        "   text-align: center; " +
        "   background: rgba(255, 198, 42, 0.7);"+
        "}"+
        "td, th{"+
        "   padding: 3px 6px;"+
        "   width: 150px;"+
        "   box-shadow: 0 0 3px 1px black inset;" +
        "}"+
        " " +
        "body{" +
        "      background: url(\"img/bg.jpg\") fixed no-repeat center #9a0000;" +
        "    }" +
        "p{" +
        "      font-family: century gothic;" +
        "      font-size: 25px;" +
        "      color: #ffc62a;" +
        "      text-align: center;" +
        "      text-shadow: 2px 2px 3px black;" +
        "    }" +
                ".colorTable{" +
                "font-family: century gothic;" +
                "font-size: 20px;" +
                "}" +
                "#goBack{" +
                "font:Times New Roman 24px;"+
                "font-weight: 200;"+
                "color: #ffc62a;" +
                "text-shadow: 2px 2px 2px black;" +
                "background: linear-gradient(#9a0000, #f6bd4a 150%) #f6bd4a;\n" +
                "position: relative;" +
                "text-align: center;" +
                "margin-top: 30px;" +
                "left:47%;" +
                "top: 50%" +
                //"display: inline-block;\n" +


                "border: #282c34 10px;" +
                "border-radius: 5px;" +
                "width: 130px;" +
                "height: 30px;" +
                "outline: none;" +
                "box-shadow: 0 0 2px 2px #f6bd4a," +
                "0 0 6px 3px #9a0000," +
                "0 0 4px 2px black;" +
                "}" +

                "#goBack:hover {" +
                "background: linear-gradient(#9a0000, #f6bd4a 120%);}" +

                "#goBack:active {" +
                "padding-top: 3px;" +
                "background: linear-gradient(#9a0000, #f6bd4a 90%);" +
                "box-shadow:" +
                "0 0 2px 2px #f6bd4a," +
                "0 0 6px 3px #9a0000," +
                "0 0 4px 2px black," +
                "0 0 2px rgba(0, 0, 0, 1) inset," +
                "0 2px 3px rgba(0, 0, 0, 0.8) inset," +
                "0 1px 1px rgba(255, 255, 255, .1); }" +
        "       </style>");

        out.println("</head>");
        out.println("<body bgcolor=white>");
        out.println("<p>РЕЗУЛЬТАТЫ ПРОВЕРКИ:</p>");
        out.println("<table align=center class=\"colorTable\">");


        out.println("<tr>");
            out.println("<td>");
            out.println("X coordinate");
            out.println("</td>");
            out.println("<td>");
            out.println("Y coordinate");
            out.println("</td>");
            out.println("<td>");
            out.println("Radius");
            out.println("</td>");
            out.println("<td>");
            out.println("Result");
            out.println("</td>");
        out.println("</tr>");


        out.println("<tr>");
            out.println("<td>");
            out.println(x);
            out.println("</td>");
            out.println("<td>");
                out.println(y);
            out.println("</td>");
            out.println("<td>");
                out.println(r);
            out.println("</td>");
            out.println("<td>");

                Boolean res = checkArea(x,y,r);
                if(res!=null){
                    if (res) {
                        current.setResult(res.toString());
                        out.println("TRUE");
                    }
                    else{
                        current.setResult(res.toString());
                        out.println("FALSE");
                    }
                }
                else{
                    current.setResult("INVALID ARGUMENTS");
                    out.println("INVALID ARGUMENTS");
                }

            out.println("</td>");
        out.println("</tr>");

        out.println("</table>");
        out.println("<form action=\"/Sol_2pip\"><button id=\"goBack\" type=\"submit\">Назад</button></from>");

        out.println("</body>");
        out.println("</html>");


        ((ArrayList<ResRow>)session.getAttribute("resultHistory")).add(current);
    }

    protected Boolean checkArea(double x, double y, double r){
        try{
        if (    (x >= 0 && x <= (r/2)) && (y <= 0 && y >= -r) //прямоугольник
                || (x >= 0 && y > 0) && (y <= -x + r) //треугольник
                || (x <= 0 && y >= 0) && (x * x + y * y <= r * r / 4))//окружность
            return true;
        else return false;
        }catch (Exception e){
            return null;
        }
    }
}
