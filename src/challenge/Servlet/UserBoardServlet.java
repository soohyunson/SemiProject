package challenge.Servlet;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	String uri = request.getRequestURI();
	String projectPath = request.getContextPath();
	
	String realPath = uri.substring(projectPath.length());
	if(realPath.contentEquals("/detail.usboard")) {
		
		
		
		try {
			
			
			ArrayList<ChallengeDTO> list = new ArrayList<>();
			
			list =  ChallengeDAO.getInstance().selectAll();
			
			request.setAttribute("Detail", list);
			
			request.getRequestDispatcher("jsp/detail.jsp").forward(request, response);
			
	
			
		}catch(Exception e) {
			System.out.println("오류다~~!!");
			e.printStackTrace();
		}
		
	}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
