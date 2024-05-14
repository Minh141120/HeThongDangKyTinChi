<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,dao.*,model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Xem lich hoc</title>
<style>
    body {
        font-family: 'Arial', sans-serif;
        background-color: #f4f4f9;
        color: #333;
        margin: 0;
        padding: 20px;
    }
    h2 {
        color: #205081;
        text-align: center;
        margin-bottom: 20px;
    }
    table {
        width: 90%;
        margin: 20px auto;
        border-collapse: collapse;
        background-color: #fff;
        box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    }
    th, td {
        padding: 12px 15px;
        border: 1px solid #ddd;
        text-align: center;
    }
    th {
        background-color: #4CAF50;
        color: white;
    }
    button {
        background-color: #205081;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        display: block;
        margin: 20px auto;
    }
    button:hover {
        background-color: #1d4477;
    }
</style>
</head>
<%
    // Lay id sinh vien
    Thanhvien sv = (Thanhvien) session.getAttribute("sinhvien");
    if (sv == null) {
        response.sendRedirect("dangnhap.jsp?err=timeout");
    }
    int idLHP = Integer.parseInt(request.getParameter("idlhp"));
    // Lay danh sach mon hoc duoc dang ki
    ArrayList<Lichhoc> listLH = (new LichhocDAO()).getLHcuaLHP(idLHP);
%>
<body>
	<h2>Lịch học</h2>
	<table style="border: 1px solid black; border-collapse: collapse;">
		<thead>
			<td style="border: 1px solid black; padding: 0 15px 0 15px;">T.T</td>
			<td style="border: 1px solid black; padding: 0 15px 0 15px;">Tuần</td>
			<td style="border: 1px solid black; padding: 0 15px 0 15px;">Thứ</td>
			<td style="border: 1px solid black; padding: 0 15px 0 15px;">Kip</td>
			<td style="border: 1px solid black; padding: 0 15px 0 15px;">Phòng
				học</td>
			<td style="border: 1px solid black; padding: 0 15px 0 15px;">Giảng
				viên</td>
		</thead>
		<% if (listLH != null) {
            for (int i = 0; i < listLH.size(); i++) { %>
		<tr>
			<td style="text-align: center; padding: 0 15px 0 15px;"><%= (i + 1) %></td>
			<td style="text-align: center; padding: 0 15px 0 15px;"><%= listLH.get(i).getTuanhoc().getTen() %></td>
			<td style="text-align: center; padding: 0 15px 0 15px;"><%= listLH.get(i).getNgayhoc().getTen() %></td>
			<td style="text-align: center; padding: 0 15px 0 15px;"><%= listLH.get(i).getKiphoc().getTen() %></td>
			<td style="text-align: center; padding: 0 15px 0 15px;"><%= listLH.get(i).getPhonghoc().getTen() %></td>
			<td style="text-align: center; padding: 0 15px 0 15px;"><%= (listLH.get(i).getGiangvien().getHoten().getHodem() + " " + listLH.get(i).getGiangvien().getHoten().getTen()) %></td>
		</tr>
		<% }
        } %>
	</table>
	<br />
	<button type="button" name="back" onclick="history.back()">Quay
		lại</button>
</body>
</html>
