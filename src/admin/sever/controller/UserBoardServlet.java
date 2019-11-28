package admin.sever.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.AbstractDocument.Content;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import DAO.ChallengeDAO;
import DAO.ChallengeRecordDAO;
import DTO.ChallengeDTO;
import DTO.Challenge_recordDTO;
import adminboardCongiuration.Configuration;

@WebServlet("*.usboard")
public class UserBoardServlet extends HttpServlet {
   
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	StringBuffer url = request.getRequestURL();
	String uri = request.getRequestURI();
	String projectPath = request.getContextPath();
//	System.out.println(url);
//	System.out.println(uri);
//	System.out.println(projectPath);
//	System.out.println();
	String realPath = uri.substring(projectPath.length());
	System.out.println(realPath);
	if(realPath.contentEquals("/banner.usboard")) {
		
		
		
		try {
			
			
			ArrayList<ChallengeDTO> list = new ArrayList<>();
			
			list =  ChallengeDAO.getInstance().selectAll();
			
			request.setAttribute("detail", list);
			
			request.getRequestDispatcher("jsp/userMyPage.jsp").forward(request, response);
			
	
			
		}catch(Exception e) {
			System.out.println("오류다~~!!");
			e.printStackTrace();
		}
		
	}else if(realPath.contentEquals("/fromList.usboard")) {
		int seq = Integer.parseInt(request.getParameter("seq"));
		ChallengeDTO detail = new ChallengeDTO();
		try {
			detail = ChallengeDAO.getInstance().getChallenge(seq);
			request.setAttribute("detailpage", detail);
			RequestDispatcher rd = request.getRequestDispatcher("jsp/detail.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		
		
	}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
