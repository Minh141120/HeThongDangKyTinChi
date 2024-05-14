<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,dao.*,model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="../header.jsp"%>
<title>Dang ki hoc</title>
<style>
    body {
        font-family: 'Arial', sans-serif;
        background-color: #f4f4f9;
        color: #333;
        margin: 0;
        padding: 20px;
    }
    h2, h3 {
        color: #205081;
        text-align: center;
        margin-bottom: 20px;
    }
    table {
        width: 90%;
        margin: 10px auto;
        border-collapse: collapse;
        background-color: #fff;
        box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    }
    th {
        background-color: #4CAF50;
        color: white;
        padding: 10px;
        border-bottom: 1px solid #ddd;
    }
    td {
        padding: 10px;
        border-bottom: 1px solid #ddd;
    }
    button {
        background-color: #205081;
        color: white;
        padding: 10px 15px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        margin-right: 5px;
    }
    button:hover {
        background-color: #1d4477;
    }
    a {
        color: #5c67f2;
        text-decoration: none;
    }
    a:hover {
        text-decoration: underline;
    }
</style>
</head>
<%
    // Lay id sinh vien
    Thanhvien sv = (Thanhvien)session.getAttribute("sinhvien");
    if(sv == null) {
        response.sendRedirect("dangnhap.jsp?err=timeout");
    }
    ArrayList<Dangkihoc> listDK = null;
    SinhvienKhoa svk = null;
    // Kiem tra cach trang nay bi goi
    String action = request.getParameter("action");
    if ((action == null) || (action.trim().length() == 0)) { // Goi tu trang chon nganh
        // Lay du lieu nganh hoc va ki hoc
        int idSVK = Integer.parseInt(request.getParameter("nganh"));
        int idKihoc = Integer.parseInt(request.getParameter("kihoc"));
        session.setAttribute("idSVK", idSVK);
        session.setAttribute("idKihoc", idKihoc);
        // Lay thong tin sinh vien + nganh hoc
        ArrayList<SinhvienKhoa> listSVK = (ArrayList<SinhvienKhoa>)session.getAttribute("listSVK");
        for(SinhvienKhoa tmp : listSVK) {
            if(tmp.getId() == idSVK) {
                svk = tmp;
            }
        }
        // Lay danh sach dang ki cua sinh vien, neu co
        listDK = (new DangkihocDAO()).getDKcuaSV(idSVK, idKihoc);
    } else if (action.equalsIgnoreCase("them")) { // Goi tu trang chon lop hoc phan
        listDK = (ArrayList<Dangkihoc>)session.getAttribute("dangkihoc");
        if(listDK == null) listDK = new ArrayList<Dangkihoc>();
        svk = (SinhvienKhoa)session.getAttribute("sinhvienkhoa");
        ArrayList<Lophocphan> listLHP = (ArrayList<Lophocphan>)session.getAttribute("listLHP");
        int idLHP = Integer.parseInt(request.getParameter("idlhp"));
        boolean daTontaiLHP = false;
        for(Dangkihoc dk : listDK) {
            if(dk.getLophocphan().getId() == idLHP) {
                daTontaiLHP = true;
                break;
            }
        }
        if(!daTontaiLHP) {
            // Tao dang ki moi
            Dangkihoc dkMoi = null;
            for (Lophocphan lhp : listLHP) {
                if (lhp.getId() == idLHP) {
                    dkMoi = new Dangkihoc();
                    dkMoi.setLophocphan(lhp);
                    dkMoi.setSinhvienKhoa(svk);
                }
            }
            // Kiem tra co phai sua dang ki cu khong
            boolean daTontaiMHKH = false;
            int index = 0;
            for (Dangkihoc dk : listDK) {
                if (dk.getLophocphan().getMonhocKihoc().getId() == dkMoi.getLophocphan().getMonhocKihoc().getId()) {
                    listDK.remove(dk);
                    break;
                }
                index++;
            }
            // Them dang ki moi vao danh sach
            listDK.add(index, dkMoi);
        }
    } else if (action.equalsIgnoreCase("xoa")) { // Goi tu trang dang ki, de xoa
        listDK = (ArrayList<Dangkihoc>)session.getAttribute("dangkihoc");
        if (listDK == null) listDK = new ArrayList<Dangkihoc>();
        svk = (SinhvienKhoa)session.getAttribute("sinhvienkhoa");
        int idLHP = Integer.parseInt(request.getParameter("idlhp"));
        for (Dangkihoc dk : listDK) {
            if (dk.getLophocphan().getId() == idLHP) {
                listDK.remove(dk);
                break;
            }
        }
    }
    session.setAttribute("sinhvienkhoa", svk);
    session.setAttribute("dangkihoc", listDK);
%>
<body>
	<h2>Đăng kí học</h2>
	<table border="0">
		<tr>
			<td>
				<% if (svk != null) { %>
				<p />Họ tên: <%= svk.getSinhvien().getHoten().getHodem() %> <%= svk.getSinhvien().getHoten().getTen() %>
				<p />Mã: <%= svk.getSinhvien().getMasv() %>
				<p />Ngành: <%= svk.getKhoa().getTen() %> <% } %>
			</td>
		</tr>
		<tr>
			<td>
				<h3>Các môn đã đăng kí:</h3>
			</td>
		</tr>
		<tr>
			<td>
				<table style="border: 1px solid black; border-collapse: collapse;">
					<thead>
						<td style="border: 1px solid black; padding: 0 15px 0 15px;">T.T</td>
						<td style="border: 1px solid black; padding: 0 15px 0 15px;">Mã
							môn học</td>
						<td style="border: 1px solid black; padding: 0 15px 0 15px;">Tên
							môn học</td>
						<td style="border: 1px solid black; padding: 0 15px 0 15px;">Tên
							lớp học phần</td>
						<td style="border: 1px solid black; padding: 0 15px 0 15px;">Xem
							lịch</td>
						<td style="border: 1px solid black; padding: 0 15px 0 15px;">Sửa</td>
						<td style="border: 1px solid black; padding: 0 15px 0 15px;">Xóa</td>
					</thead>
					<% 
                    int soTC = 0;
                    if (listDK != null)
                        for (int i = 0; i < listDK.size(); i++) {
                            soTC += listDK.get(i).getLophocphan().getMonhocKihoc().getMonhoc().getSoTC();
                    %>
					<tr>
						<td style="text-align: center; padding: 0 15px 0 15px;"><%= (i+1) %></td>
						<td style="text-align: center; padding: 0 15px 0 15px;"><%= listDK.get(i).getLophocphan().getMonhocKihoc().getMonhoc().getId() %></td>
						<td style="padding: 0 15px 0 15px;"><%= listDK.get(i).getLophocphan().getMonhocKihoc().getMonhoc().getTen() %></td>
						<td style="padding: 0 15px 0 15px;"><%= listDK.get(i).getLophocphan().getTen() %></td>
						<td style="text-align: center; padding: 0 15px 0 15px;"><a
							href="gdxemlich.jsp?idlhp=<%= listDK.get(i).getLophocphan().getId()%>">Xem
								lịch</a></td>
						<td style="text-align: center; padding: 0 15px 0 15px;"><a
							href="gdChonLHP.jsp?idmhkh=<%= listDK.get(i).getLophocphan().getMonhocKihoc().getId()%>">Sửa</a>
						</td>
						<td style="text-align: center; padding: 0 15px 0 15px;"><a
							href="gdDangki.jsp?action=xoa&&idlhp=<%= listDK.get(i).getLophocphan().getId()%>"
							onclick="return confirm('Bạn muốn xóa lớp học phần khỏi danh sách đăng kí?');">Xóa</a>
						</td>
					</tr>
					<% } %>
				</table>
				<p />Tổng số tín chỉ: <%= soTC %>
			</td>
		</tr>
		<tr>
			<td>
				<button onclick="openPage('gdChinhSV.jsp')">Về trang chính</button>
				<button onclick="openPage('gdChonMH.jsp')">Chọn tiếp</button>
				<button onclick="openPage('doluudk.jsp')">Lưu đăng kí</button>
			</td>
		</tr>
	</table>
</body>
</html>
