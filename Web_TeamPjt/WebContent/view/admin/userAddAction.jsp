<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="Web_TeamPjt.User"%>
<%@ page import="Web_TeamPjt.UserDAO"%>
<%@ page import="java.io.PrintWriter" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	String id = request.getParameter("userId");
	String pwd = request.getParameter("userPwd");
	String nickname = request.getParameter("userNickname");
	String email = request.getParameter("userEmail");
	String number = request.getParameter("userNumber");
	
	
	User user = new User();
	
	user.setId(id);
	user.setPwd(pwd);
	user.setNickname(nickname);
	user.setEmail(email);
	user.setNumber(number);

	
	if (user.getId() == null || user.getPwd() == null || user.getNickname() == null
		|| user.getEmail() == null || user.getNumber() == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else{
			UserDAO userDAO = new UserDAO(); //인스턴스생성
			boolean result = userDAO.insertDB(user);				
			
			if(!result){ // 아이디가 기본키기. 중복되면 오류.
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 존재하는 아이디 입니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			//가입성공
			else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'index.jsp'");
				script.println("</script>");
			}
		}

	
	%>
</body>
</html>