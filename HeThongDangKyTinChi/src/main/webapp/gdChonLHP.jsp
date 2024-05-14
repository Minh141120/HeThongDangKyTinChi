<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,dao.*,model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Chon lop hoc phan</title>
<style>
    body {
        font-family: 'Arial', sans-serif;
        background-color: #f7f7f7;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        color: #333;
    }
    .container {
        background: #fff;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        width: auto;
    }
    h2, h4 {
        text-align: center;
        color: #205081;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 10px;
    }
    th, td {
        padding: 10px;
        border: 1px solid #ddd;
        text-align: center;
    }
    th {
        background-color: #4CAF50;
        color: white;
    }
    a {
        color: #5c67f2;
        text-decoration: none;
    }
    a:hover {
        text-decoration: underline;
    }
    button {
        background-color: #205081;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        display: block;
        margin: 10px auto;
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
    // Lay du lieu nganh hoc va ki hoc
    int idSVK = (int) session.getAttribute("idSVK");
    int idMHKH = Integer.parseInt(request.getParameter("idmhkh"));
    // Lay danh sach mon hoc duoc dang ki
    ArrayList<Lophocphan> listLHP = (new LophocphanDAO()).getLHPchoSVdangki(idSVK, idMHKH);
    // Loai cac LHP trung lich voi cac lop da hoc
    ArrayList<Dangkihoc> listDK = (ArrayList<Dangkihoc>) session.getAttribute("dangkihoc");
    if ((listDK != null) && (listLHP != null)) {
        ArrayList<Lichhoc> lichdachon = new ArrayList<Lichhoc>();
        LichhocDAO lhdao = new LichhocDAO();
        for (Dangkihoc dk : listDK) {
            lichdachon.addAll(lhdao.getLHcuaLHP(dk.getLophocphan().getId()));
        }
        for (int i = 0; i < listLHP.size(); i++) {
            ArrayList<Lichhoc> listLH = lhdao.getLHcuaLHP(listLHP.get(i).getId());
            boolean ok = true;
            for (Lichhoc lhmoi : listLH) {
                for (Lichhoc lhdk : lichdachon) {
                    if (lhmoi.getTuanhoc().equals(lhdk.getTuanhoc()) &&
                        lhmoi.getNgayhoc().equals(lhdk.getNgayhoc()) &&
                        lhmoi.getKiphoc().equals(lhdk.getKiphoc())) {
                        ok = false;
                        break;
                    }
                }
                if (!ok) break;
            }
            if (!ok) {
                listLHP.remove(i);
                i--;
            }
        }
    }
    session.setAttribute("listLHP", listLHP);
%>
<body>
	<% if (listLHP != null) { %>
	<div class="container">
	<h2>Chọn lớp học phần</h2>
	<table style="border: 1px solid black; border-collapse: collapse;">
		<thead>
			<td style="border: 1px solid black; padding: 0 15px 0 15px;">T.T</td>
			<td style="border: 1px solid black; padding: 0 15px 0 15px;">Mã
				lớp học phần</td>
			<td style="border: 1px solid black; padding: 0 15px 0 15px;">Tên
				lớp học phần</td>
			<td style="border: 1px solid black; padding: 0 15px 0 15px;">Sĩ
				số tối đa</td>
			<td style="border: 1px solid black; padding: 0 15px 0 15px;">Sĩ
				số thực</td>
			<td style="border: 1px solid black; padding: 0 15px 0 15px;">Lịch
				học</td>
			<td style="border: 1px solid black; padding: 0 15px 0 15px;">Chọn</td>
		</thead>
		<% for (int i = 0; i < listLHP.size(); i++) { %>
		<tr>
			<td style="text-align: center; padding: 0 15px 0 15px;"><%= (i + 1) %></td>
			<td style="text-align: center; padding: 0 15px 0 15px;"><%= listLHP.get(i).getId() %></td>
			<td style="padding: 0 15px 0 15px;"><%= listLHP.get(i).getTen() %></td>
			<td style="text-align: center; padding: 0 15px 0 15px;"><%= listLHP.get(i).getSisotoida() %></td>
			<td style="text-align: center; padding: 0 15px 0 15px;"><%= listLHP.get(i).getSisothucte() %></td>
			<td style="text-align: center; padding: 0 15px 0 15px;"><a
				href="gdxemlich.jsp?idlhp=<%= listLHP.get(i).getId() %>">Xem
					lịch</a></td>
			<td style="text-align: center; padding: 0 15px 0 15px;"><a
				href="gdDangki.jsp?action=them&&idlhp=<%= listLHP.get(i).getId() %>">Chọn</a>
			</td>
		</tr>
		<% } %>
	</table>
	<% } else { %>
	<h4>Không có lớp học phần nào trống lịch và còn chỗ</h4>
	<% } %>
	<br />
	<button type="button" name="back" onclick="history.back()">Quay
		lại</button>
		</div>
</body>
</html>
