package com.sol.ru;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

public class ControllerServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        HttpSession session = req.getSession();
        ArrayList<ResRow> listResults= new ArrayList<ResRow>();
        if (session.getAttribute("resultHistory") == null){
          session.setAttribute("resultHistory", listResults);
        }

        String xVal = req.getParameter("xCoordClick");
        String yVal = req.getParameter("yCoord");
        String radius = req.getParameter("radiusValue");
        resp.setHeader("Content-Type", "text/html; charset=UTF-8");
        if(xVal == null || yVal ==null||radius==null){
            req.getServletContext().getRequestDispatcher("/Sol2pip").forward(req, resp);
        }
        else {
            req.getServletContext().getRequestDispatcher("/check").forward(req, resp);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("/Sol2pip");
    }
}
