package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.ClubDAO;
import DAO.MemberDAO;
import DAO.UserDAO;
import entity.Member;
import entity.User;

public class ManageMember extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("userData");
        int clubID = ClubDAO.getClubIDByUserID(user.getUserID());
        List<Member> members = MemberDAO.getMembersInClub(clubID);
        List<User> users = UserDAO.getUserList(members);
        request.setAttribute("memberList", users);
        request.setAttribute("clubID", clubID);
        session.setAttribute("clubID", clubID);
        request.getRequestDispatcher("/manager-manage-member.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String typeOfRequest = request.getParameter("typeOfRequest");
        if (typeOfRequest!=null &&  typeOfRequest.equals("delete")) {
            int userID = Integer.parseInt(request.getParameter("userID"));
            int clubID = Integer.parseInt(request.getParameter("clubID"));
            if (clubID != -1) {
                MemberDAO.delete(userID, clubID);
            }
        }
        processRequest(request, response);
    }
}
