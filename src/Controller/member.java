package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.media.jfxmedia.track.Track.Encoding;

import DAO.MemberDAO;
import DTO.MemberDTO;

@WebServlet("*.mem")
public class member extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String URI = request.getRequestURI();
		String ctx = request.getContextPath();
		String realPath = URI.substring(ctx.length());

		MemberDAO dao = MemberDAO.getInstance();
		System.out.println(realPath);
//		System.out.println(ctx); 절대경로

		if (realPath.contentEquals("/user/login/login.mem")) {
			try {
				String id = request.getParameter("id");
				String pw = request.getParameter("pw");
				System.out.println(id + " : " + pw);
				boolean loginResult = dao.isAdmin(id, dao.encrypt(pw)); //dao.isLoginOK(id, dao.encrypt(pw));			
				System.out.println("loginResult : " + loginResult);
				if(loginResult) {
					
					request.getSession().setAttribute("loginResult", loginResult);
					request.getSession().setAttribute("id", id);
					request.getRequestDispatcher("logincheck.jsp").forward(request, response);
				}else {
					boolean loginResult2 = dao.isLoginOK(id, dao.encrypt(pw));
					request.getSession().setAttribute("loginResult2", loginResult2);
					System.out.println("loginResult2 : " + loginResult2);
					System.out.println("id : " + id);
					request.getSession().setAttribute("id", id);
					request.getRequestDispatcher("logincheck.jsp").forward(request, response);
				}
				

			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (realPath.contentEquals("/user/login/idcheck.mem")) {
			try {
				String id = request.getParameter("id");
				//id 받아오기 ok
				boolean result = dao.isIdOk(id);
				PrintWriter pw = response.getWriter();
				pw.append("{\"result\" :" + result + "}");

			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (realPath.contentEquals("/user/login/signup.mem")) {
			request.setCharacterEncoding("utf8");
			try {
				String id = request.getParameter("id");
				String pw = request.getParameter("pw");
				String name = request.getParameter("name");
				String phone = request.getParameter("phone");
				String email = request.getParameter("email");
				dao.insert(new MemberDTO(0, id, pw, name, phone, email, 0, null));
				response.sendRedirect(ctx + "/user/login/signupcheck.jsp");

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
			else if(realPath.contentEquals("/admin/memberlist.mem")) { //멤버리스트 클릭했을때 주소받아오기
				request.setCharacterEncoding("utf8");
				try {
					String navi = dao.getPageNavi(1);
					int cpage = 1;
					String page = request.getParameter("cpage");
					if(page != null) {
						cpage = Integer.parseInt(page);
					}
					int start = cpage * configuration.Configuration.recordCountPerPage - (configuration.Configuration.recordCountPerPage -1 );
					int end = cpage * configuration.Configuration.recordCountPerPage;
					System.out.println(start + " : " + end);
					List<MemberDTO> list = dao.selectByPage(start, end);
//					List<MemberDTO> list = dao.selectAll();
					request.setAttribute("list", list);
					request.setAttribute("navi", navi);
					request.getRequestDispatcher("/admin/memberlist.jsp").forward(request, response);
					
					
				}catch(Exception e) {
					e.printStackTrace();
				}

			}else if(realPath.contentEquals("/admin/search.mem")) {
				request.setCharacterEncoding("utf8");
				try {
				String id = request.getParameter("search");
				System.out.println(id); 
				List<MemberDTO> dto = dao.search(id);
//				System.out.println(dto.getId() + " : " + dto.getName()); ok
				request.setAttribute("dto", dto);
				request.getRequestDispatcher("/admin/memberlist.mem").forward(request, response);

				
				}catch(Exception e) {
					e.printStackTrace();
				}
			}else if(realPath.contentEquals("/logout.mem")) {
				request.getSession().invalidate();
				response.sendRedirect("index.jsp");

			}else if(realPath.contentEquals("/delete.mem")) {
				
				try {String id = request.getParameter("id");
				System.out.println("삭제할 아이디는 : " + id);
					int result = MemberDAO.getInstance().delete(id);
					request.setAttribute("result", result);
					request.getRequestDispatcher("/index.jsp").forward(request, response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}else if(realPath.contentEquals("/update.mem")) {
				
			
				try {
					String id = request.getParameter("id");
					String pw = request.getParameter("pw");
					String name = request.getParameter("name");
					String phone = request.getParameter("phone");
					String email = request.getParameter("email");
					int result = dao.update(pw, phone, email);
					request.setAttribute("update", result);
					request.getRequestDispatcher("userMyPage.jsp").forward(request, response);
				
					
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
