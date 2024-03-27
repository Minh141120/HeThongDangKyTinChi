<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList,dao.*,model.*"%>
<%
    String username = (String) request.getParameter("username");
    String password = (String) request.getParameter("password");
    Thanhvien tv = new Thanhvien();
    tv.setUsername(username);
    tv.setPassword(password);
    ThanhvienDAO dao = new ThanhvienDAO();
    boolean kq = dao.kiemtraDangnhap(tv);
    if (kq && (tv.getVaitro().equalsIgnoreCase("sinhvien"))) {
        session.setAttribute("sinhvien", tv);
        System.out.println("1");
        response.sendRedirect("gdChinhSV");
    } else if (kq && (tv.getVaitro().equalsIgnoreCase("giangvien"))) {
    	System.out.println("2");
        session.setAttribute("giangvien", tv);
        response.sendRedirect("gv\\gdChinhSV");
    } else {
    	System.out.println("3");
        response.sendRedirect("gddangnhap.jsp?err=fail");
    }
%>
