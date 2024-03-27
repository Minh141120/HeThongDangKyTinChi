<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,dao.*,model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
        // Lay id sinh vien
        Thanhvien sv = (Thanhvien) session.getAttribute("sinhvien");
        if (sv == null) {
            response.sendRedirect("dangnhap.jsp?err=timeout");
        }
        // Lay thong tin dang ki va luu
        ArrayList<Dangkihoc> listDK = (ArrayList<Dangkihoc>) session.getAttribute("dangkihoc");
        if ((new DangkihocDAO()).luuDKcuaSV(listDK)) {
    %>
<script type="text/javascript">
        alert("Đăng kí thành công!");
    </script>
<%
        response.sendRedirect("gdChinhSV.jsp");
        } else {
    %>
<script type="text/javascript">
        alert("Lỗi đăng kí!");
        history.back();
    </script>
<%
        }
    %>
</head>
</html>
