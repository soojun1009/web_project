package com.test;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;


//javax.servlet.http.HttpServlet Ŭ������ ��� ���� Ŭ������ ���� Ŭ������ �ȴ�.
public class ControllerServlet extends HttpServlet {

	//�������� main() �޼ҵ� ��� doGet(), doPost() �޼ҵ尡 �ִ�.
	//�������� Ŭ���̾�Ʈ���� ��û�� ������ doGet() �Ǵ� doPost() �޼ҵ尡 �ڵ� ȣ��ȴ�.
	//����) ���� Ŭ������ ���������� �ƴϹǷ� ���������� ���� ��û �Ұ� -> ��Ĺ������ ���� �ּҿ� Ŭ���̾�Ʈ ��û �ּҸ� �����ϴ� ���� �ʿ� -> web.xml
	//doGet() �޼ҵ��� �Ű��������� request, response�� ������ ��
	@Override
	protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
	
		//����� ��û �ּ� �м�
		String uri = request.getRequestURI();
		//System.out.println(uri);
		String methodName = uri.substring(uri.lastIndexOf("/")+1, uri.lastIndexOf("."));
		//System.out.println(methodName);
				
		adminAction action = new adminAction();
		/*
		if (methodName.equals("memberlist")) {
			action.memberlist();
		}
		if (methodName.equals("memberinsert")) {
			action.memberinsert();
		}
		*/
		//->�ּ� �м� ���ؼ� ���� �޼ҵ� �̸��� ������ ���� ȣ�� -> invoke()
		String result = "WEB-INF/source/error.jsp";
		java.lang.reflect.Method m;
		try {
			m = adminAction.class.getMethod(methodName, HttpServletRequest.class, HttpServletResponse.class);
			result = (String)m.invoke(action, request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//������ �̵�
		if (result.contains("redirect:")) {
			//���� �ּ� ��û
			response.sendRedirect(result.substring(9));
		} else {
			//JSP ������ ��û
			RequestDispatcher dispatcher = request.getRequestDispatcher(result);
			dispatcher.forward(request, response);
		}
		
	}

	//doPost() �޼ҵ��� �Ű��������� request, response�� ������ ��
	@Override
	protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	
}
