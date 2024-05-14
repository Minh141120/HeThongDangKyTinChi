<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,dao.*,model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Chọn ngành học</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f9;
        margin: 20px;
        padding: 0;
    }
    h2 {
        color: #333;
        text-align: center;
    }
    table {
        margin: auto;
        padding: 20px;
        border-collapse: collapse;
    }
    td {
        padding: 10px;
        font-size: 16px;
    }
    select, input[type="submit"] {
        padding: 8px 12px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }
    input[type="submit"] {
        background-color: #5c67f2;
        color: white;
        cursor: pointer;
    }
    input[type="submit"]:hover {
        background-color: #4a54e1;
    }
</style>
</head>
<%
    // Lay id sinh vien
    Thanhvien sv = (Thanhvien) session.getAttribute("sinhvien");
    if (sv == null) {
        response.sendRedirect("dangnhap.jsp?err=timeout");
    }
    // Lay danh sach nganh hoc cua sinh vien
    ArrayList<SinhvienKhoa> listNganh = (new SinhvienKhoaDAO()).getNganhcuaSV(sv.getId());
    session.setAttribute("listSVK", listNganh);
    // Lay danh sach ki hoc dang mo dang ki
    ArrayList<Kihoc> listKi = (new KihocDAO()).getKihocdangki();
%>
<body>
    <h2>Chọn ngành</h2>
    <form name="chonnganh" action="gdDangki.jsp" method="post">
        <table border="0">
            <tr>
                <td>Chọn ngành:</td>
                <td><select name="nganh" size=1>
                        <option value="-1" selected>--chọn ngành--</option>
                        <% for(SinhvienKhoa svk: listNganh){ %>
                        <option value="<%=svk.getId()%>"><%=svk.getKhoa().getTen() %></option>
                        <% } %>
                </select></td>
            </tr>
            <tr>
                <td>Chọn kì học:</td>
                <td><select name="kihoc" size=1>
                        <option value="-1" selected>--chọn kì học--</option>
                        <% for(Kihoc k: listKi){
                        String ten = k.getHocki().getTen() + " - " + k.getNamhoc().getTen();
                    %>
                        <option value="<%=k.getId()%>"><%=ten %></option>
                        <% } %>
                </select></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Vào đăng kí" /></td>
            </tr>
        </table>
    </form>
</body>
</html>
