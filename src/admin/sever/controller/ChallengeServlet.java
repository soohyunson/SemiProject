package admin.sever.controller;


import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ChallengeDAO;
import DAO.ChallengeRecordDAO;
import DTO.ChallengeDTO;

@WebServlet("*.challenge")
public class ChallengeServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String URI = request.getRequestURI();
		String ctxPath = request.getContextPath();
		String realPath = URI.substring(ctxPath.length());
		System.out.println(realPath);

		if (realPath.contentEquals("/index/give.challenge")) {
			try {
				List<ChallengeDTO> list;
				list = ChallengeDAO.getInstance().selectAll("give");
				request.setAttribute("list", list);
				RequestDispatcher rd = request.getRequestDispatcher("/Main/donateMain.jsp");
				rd.forward(request, response);
				
			}  catch (Exception e) {
				// TODO Auto-generated catch block
				System.out.println("왜 오류인지 아시는분~~??");
				e.printStackTrace();
			}
		}
		
		
		
		else if(realPath.contentEquals("/take.challenge")){
				List<ChallengeDTO> list;
				try {
					list = ChallengeDAO.getInstance().selectAll("take");
					request.setAttribute("list", list);
					RequestDispatcher rd = request.getRequestDispatcher("takeMain.jsp");
					rd.forward(request, response);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			
			
		}
		

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
