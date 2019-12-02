package MyPage.point;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.MemberDAO;
import DAO.PaymentDAO;
import DTO.MemberDTO;
import DTO.PaymentDTO;


@WebServlet("*.mypage")
public class MyPageServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf8");
		String requestURI = request.getRequestURI();
		String ctxPath = request.getContextPath();
		String cmd = requestURI.substring(ctxPath.length());
		System.out.println(ctxPath);

		System.out.println(cmd);
		if (cmd.equals("/MyPoint.mypage")) {
			String id = "point";
			request.getSession().setAttribute("id", id);
		
			try {
				Date date = new Date();
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				request.setAttribute("today", format.format(date).toString());

				MemberDTO MemberDTO = MemberDAO.getInstance().select(id);
				request.setAttribute("dto", MemberDTO);
				System.out.println(MemberDTO.getPoint());
				List<PaymentDTO> list = PaymentDAO.getInstance().selectById(id);
				request.setAttribute("list", list);



				request.getRequestDispatcher("/user/myPage/MyPoint.jsp").forward(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(cmd.contentEquals("/myPageDetailView.mypage")) {
			String id = request.getParameter("id");
			try {
				MemberDTO MemberDTO = MemberDAO.getInstance().select(id);
				request.setAttribute("list", MemberDTO);
				request.getRequestDispatcher("user/login/memberdetail.jsp").forward(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
