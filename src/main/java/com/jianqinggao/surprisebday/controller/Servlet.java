/*
 * Author: jianqing
 * Date: Nov 4, 2020
 * Description: This document is created for
 */
package com.jianqinggao.surprisebday.controller;

import com.google.gson.Gson;
import com.jianqinggao.surprisebday.Alerts;
import com.jianqinggao.surprisebday.SecretGarden;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author jianqing
 */
@WebServlet(name = "Servlet", urlPatterns =
{
    "/GetFaviSongs", "/bday", "/index", "/RecommendMusic","/WebsiteFeedback"
}//,loadOnStartup = 1
)
public class Servlet extends HttpServlet
{

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter())
        {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Servlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Servlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        //processRequest(request, response);
        switch (request.getServletPath())
        {
            case "/GetFaviSongs":
                processGetFaviSongsGET(request, response);

                break;
            case "/index":
            case "/bday":
                request.getRequestDispatcher(request.getServletPath() + ".jsp").forward(request, response);
                break;
            case "/RecommendMusic":
                processRecommendMusicGET(request, response);
                break;
            case "/WebsiteFeedback":
                processWebsiteFeedbackGET(request, response);
                break;
                    
            default:
                processRequest(request, response);
                break;
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo()
    {
        return "Short description";
    }// </editor-fold>

    protected void processRecommendMusicGET(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
    {
        String title,email;
        //need to do this on localhost, but NO on remote host, it works fine.
        //title = new String(request.getParameter("title").getBytes("ISO8859_1"), "UTF-8");
        title = request.getParameter("title");
        email = request.getParameter("email");
        //response.setContentType("plain/text");
        response.setCharacterEncoding("utf-8");
        PrintWriter w = response.getWriter();
       // w.println("-请稍后");
       w.println("<html><head><script src=\"https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js\" integrity=\"sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo\" crossorigin=\"anonymous\"></script>"
               + "<script src=\"js/jquery.min.js\"></script>"
               + "<link rel=\"stylesheet\" href='css/bootstrap.min.css'>"
               + "</head><body>");
        if(areValidStrings(title,email))
        {
            try(SecretGarden sg = SecretGarden.getDefaultInstance())
            {
                int o = sg.insertIntoRecommendations(title, email);
                if(o==1)
                {
                    w.println(Alerts.successMessage("成功", "您的反馈已提交，感谢您的推荐！"));
                }
            } catch (SQLException|ClassNotFoundException e)
            {
                w.println(Alerts.dangerMessage("网络不佳", "抱歉，我们出错了，请稍后再试"));
                
            }
        }else
        {
            w.println(Alerts.warningMessage("信息无效", "请输入有效的信息"));
        }
        
        w.println("</body></html>");
        w.flush();
    }

    protected void processWebsiteFeedbackGET(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
    {
        String feedback = request.getParameter("feedback");
        
        System.out.println(feedback);
        
        if(areValidStrings(feedback))
        {
            try(SecretGarden sg = SecretGarden.getDefaultInstance())
            {
                int f = Integer.parseInt(feedback);
                sg.insertIntoFeedback(f);
            } catch (Exception e)
            {
                e.printStackTrace();
            }
        }
    }
    protected void processGetFaviSongsGET(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
    {
        response.setContentType("application/json");
        response.setCharacterEncoding("utf-8");
        Gson h = new Gson();

        try (SecretGarden g = SecretGarden.getDefaultInstance())
        {
            response.getWriter().write("{\"code\":200, \"response\":" + h.toJson(g.selectFromMusics()) + "}");
        } catch (SQLException | ClassNotFoundException e)
        {
            response.getWriter().write("{\"code\":200, \"response\": \"数据库出了点小问题哦\"}");
        }

    }
    
    public static boolean areValidStrings(String... strs)
    {
        for (String str : strs)
        {
            if(str==null||str.isEmpty())
            {
                return false;
            }
        }
        return true;
    }

}
