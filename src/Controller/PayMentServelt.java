package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

import DAO.PayDAO;
import DTO.PayDTO;
import bootpay.Payment;


@WebServlet("*.pay")
public class PayMentServelt extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String rootURL = request.getContextPath();
		String realURL = request.getRequestURI();
		String URL = realURL.replace(rootURL, "");
		System.out.println(URL);
		if(URL.equals("/payCheck.pay")) {
			//결제 검증용 
			String receipt_Id =  request.getParameter("receipt_id");
			System.out.println("영수증 " + receipt_Id);
			String result = Payment.getInstance().goVerfity(receipt_Id);
			System.out.println("검증 결과 " + result);
			
			JsonParser parser = new JsonParser();
			JsonElement elemt = parser.parse(result);
			
			String status = elemt.getAsJsonObject().get("data").getAsJsonObject().get("status_ko").getAsString();
			if(status.equals("결제완료")) {
				System.out.println("결제 완료 검증 ");
			}
		}else if(URL.equals("/payCancel.pay")) {
			String member_id = (String) request.getSession().getAttribute("");
			PayDTO dto = PayDAO.getInstance().selectAllById(member_id);
			
			String receipt_id = dto.getApproval_num();
			int price = dto.getPoint();
			
			String result = Payment.getInstance().goCancel(receipt_id, price);
			System.out.println(result);
		}else if(URL.equals("/user/myPage/charge.pay")) {
			//아이디 불러옴
			//String id = (String) request.getSession().getAttribute("");
			request.getRequestDispatcher("/user/pay/charge.jsp").forward(request, response);
		}else if(URL.equals("/myPage/refunds.pay")) {
			//아이디 불러옴
			//String id = (String) request.getSession().getAttribute("");
			request.getRequestDispatcher("/user/pay/refunds.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
