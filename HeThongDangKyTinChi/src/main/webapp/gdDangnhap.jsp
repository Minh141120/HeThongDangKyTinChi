<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Đăng Nhập</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f7f7f7;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }
    .container {
        background: #fff;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        width: 300px;
    }
    h2 {
        text-align: center;
        color: #333;
    }
    table {
        width: 100%;
        margin-top: 10px;
    }
    td {
        padding: 10px 0;
    }
    input[type="text"],
    input[type="password"] {
        width: calc(100% - 10px);
        padding: 5px;
        border: 1px solid #ddd;
        border-radius: 3px;
        margin-top: 5px;
    }
    input[type="submit"] {
        background-color: #5cb85c;
        color: white;
        border: none;
        padding: 10px 20px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        margin: 4px 2px;
        cursor: pointer;
        border-radius: 5px;
        width: 100%;
    }
    input[type="submit"]:hover {
        background-color: #4cae4c;
    }
    .error-message {
        color: red;
        text-align: center;
    }
</style>
</head>
<body>
    <div class="container">
        <%
        if(request.getParameter("err") != null && request.getParameter("err").equalsIgnoreCase("timeout")){
        %>
        <h4 class="error-message">Hết phiên đăng nhập. Vui lòng đăng nhập lại.</h4>
        <%
        } else if(request.getParameter("err") != null && request.getParameter("err").equalsIgnoreCase("fail")){
        %>
        <h4 class="error-message">Sai tên đăng nhập hoặc mật khẩu.</h4>
        <%
        }
        %>
        <h2>Đăng Nhập</h2>
        <form name="dangnhap" action="doDangnhap.jsp" method="post">
            <table border="0">
                <tr>
                    <td>Tên Đăng Nhập:</td>
                    <td><input type="text" name="username" id="username" required /></td>
                </tr>
                <tr>
                    <td>Mật Khẩu:</td>
                    <td><input type="password" name="password" id="password" required /></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Đăng Nhập" /></td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
