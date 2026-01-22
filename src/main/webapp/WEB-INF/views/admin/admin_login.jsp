<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- JSP 상단에 taglib 확인 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--
<html>
	<form action="/admin/login" method="post">
		<h2>관리자 로그인</h2>
		<input type="text" name="id" placeholder="ID" required><br>
		<input type="password" name="password" placeholder="password" required><br>
		<c:if test="${not empty error}">
			<p style="color: red;">${error}</p>
		</c:if>
		<button type="submit">로그인</button>
		<button type="button" onclick="location.href='/'">취소</button>
	</form>
</html>
-->

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JM Kiosk - Admin Login</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Pretendard', sans-serif;
            background-color: #f0f2f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .login-card {
            background: white;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.1);
            width: 90%;
            max-width: 400px;
            box-sizing: border-box;
            text-align: center;
        }

        h2 {
            margin-bottom: 30px;
            color: #333;
            font-weight: 700;
        }

        input {
            width: 100%;
            padding: 12px 15px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 1rem;
            box-sizing: border-box;
            outline-color: #2c3e50;
        }

        .btn-group {
            display: flex;
            gap: 10px;
            margin-top: 10px;
        }

        button {
            flex: 1;
            padding: 12px;
            border: none;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: 0.2s;
        }

        .login-btn {
            background-color: #2c3e50;
            color: white;
        }

        .login-btn:hover {
            background-color: #1a252f;
        }

        .cancel-btn {
            background-color: #e0e0e0;
            color: #333;
        }

        .cancel-btn:hover {
            background-color: #d0d0d0;
        }

        .error-msg {
            color: #e74c3c;
            font-size: 0.9rem;
            margin-bottom: 15px;
        }

        /* 포트폴리오 안내 정보 (Tip Box) */
        .info-box {
            margin-top: 30px;
            padding: 15px;
            background-color: #f8f9fa;
            border-left: 4px solid #2c3e50;
            text-align: left;
            font-size: 0.9rem;
            color: #666;
            line-height: 1.6;
        }

        .info-box strong {
            color: #2c3e50;
        }

        /* 모바일 대응 */
        @media (max-width: 480px) {
            .login-card {
                padding: 30px 20px;
            }
        }
    </style>
</head>
<body>

    <div class="login-card">
        <h2>관리자 모드</h2>
        
        <form action="/admin/login" method="post">
            <input type="text" name="id" placeholder="아이디" required>
            <input type="password" name="password" placeholder="비밀번호" required>
            
            <c:if test="${not empty error}">
                <p class="error-msg">${error}</p>
            </c:if>

            <div class="btn-group">
                <button type="submit" class="login-btn">로그인</button>
                <button type="button" class="cancel-btn" onclick="location.href='/'">취소</button>
            </div>
        </form>

        <div class="info-box">
            <strong>💡 Portfolio Tip</strong><br>
            관리자 계정은 아래 정보를 사용해 주세요.<br>
            • 아이디: <strong>admin</strong><br>
            • 비밀번호: <strong>1234</strong>
        </div>
    </div>

</body>
</html>