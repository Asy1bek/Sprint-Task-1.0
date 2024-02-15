package tasks.servlets;

import tasks.service.DBManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/details")
public class DetailsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        Long id = Long.parseLong(req.getParameter("id"));
        req.setAttribute("task", DBManager.findById(id));
        req.getRequestDispatcher("/details.jsp").forward(req, resp);
    }
}
