<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,dao.*,model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Chon mon hoc</title>
</head>
<%
    // Lay id sinh vien
    Thanhvien sv = (Thanhvien) session.getAttribute("sinhvien");
    if (sv == null) {
        response.sendRedirect("dangnhap.jsp?err=timeout");
    }
    // Lay du lieu nganh hoc va ki hoc
    int idSVK = (int) session.getAttribute("idSVK");
    int idKihoc = (int) session.getAttribute("idKihoc");
    // Lay danh sach mon hoc duoc dang ki
    ArrayList<MonhocKihoc> listMHKH = (new MonhocKihocDAO()).getMHcuaSV(idSVK, idKihoc);
    // Loai bo cac mon hoc da dang ki
    ArrayList<Dangkihoc> listDK = (ArrayList<Dangkihoc>) session.getAttribute("dangkihoc");
    if (listDK != null) {
        for (int i = 0; i < listMHKH.size(); i++) {
            boolean daDK = false;
            for (Dangkihoc dk : listDK) {
                if (dk.getLophocphan().getMonhocKihoc().getId() == listMHKH.get(i).getId()) {
                    daDK = true;
                    break;
                }
            }
            if (daDK) {
                listMHKH.remove(i);
                i--;
            }
        }
    }
    session.setAttribute("listMHKH", listMHKH);
%>
<body>
	<h2>Chọn môn học</h2>
	<table style="border: 1px solid black; border-collapse: collapse;">
		<thead>
			<td style="border: 1px solid black; padding: 0 15px 0 15px;">T.T</td>
			<td style="border: 1px solid black; padding: 0 15px 0 15px;">Mã
				môn học</td>
			<td style="border: 1px solid black; padding: 0 15px 0 15px;">Tên
				môn học</td>
			<td style="border: 1px solid black; padding: 0 15px 0 15px;">Số
				tín chỉ</td>
			<td style="border: 1px solid black; padding: 0 15px 0 15px;">Chọn</td>
		</thead>
		<%
            if (listMHKH != null) {
                for (int i = 0; i < listMHKH.size(); i++) {
        %>
		<tr>
			<td style="text-align: center; padding: 0 15px 0 15px;"><%= (i+1) %></td>
			<td style="text-align: center; padding: 0 15px 0 15px;"><%= listMHKH.get(i).getMonhoc().getId() %></td>
			<td style="padding: 0 15px 0 15px;"><%= listMHKH.get(i).getMonhoc().getTen() %></td>
			<td style="text-align: center; padding: 0 15px 0 15px;"><%= listMHKH.get(i).getMonhoc().getSoTC() %></td>
			<td style="text-align: center; padding: 0 15px 0 15px;"><a
				href="gdChonLHP.jsp?idmhkh=<%= listMHKH.get(i).getId() %>">Chọn</a>
			</td>
		</tr>
		<%
                }
            }
        %>
	</table>
	<br />
	<button type="button" name="back" onclick="history.back()">Quay
		lại</button>
</body>
</html>
