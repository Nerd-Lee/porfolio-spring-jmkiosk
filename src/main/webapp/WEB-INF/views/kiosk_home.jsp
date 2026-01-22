<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>JM Kiosk - 메인화면</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Pretendard', -apple-system, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background-color: #f8f9fa;
        }

        .container {
            display: flex;
            flex-direction: row; /* 기본은 가로 배치 */
            gap: 20px;
            width: 90%;
            max-width: 1000px;
            padding: 20px;
        }

        .main-button {
            flex: 1;
            height: 450px;
            border: none;
            border-radius: 25px;
            cursor: pointer;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            font-size: 1.8rem;
            font-weight: 800;
            color: white;
            transition: all 0.2s ease-in-out;
            box-shadow: 0 8px 15px rgba(0,0,0,0.1);
            -webkit-tap-highlight-color: transparent; /* 모바일 터치 시 하이라이트 제거 */
        }

        /* 주문 버튼 (생동감 있는 보라) */
        .order-btn {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }

        /* 관리자 버튼 (차분한 다크) */
        .admin-btn {
            background: linear-gradient(135deg, #2c3e50 0%, #000000 100%);
        }

        /* 2. 모바일/세로 화면을 위한 미디어 쿼리 (핵심!) */
        @media (max-width: 768px) {
            .container {
                flex-direction: column; /* 세로로 쌓기 */
                height: 90vh;
            }
            .main-button {
                height: 100%; /* 버튼이 화면을 반씩 나눠 가짐 */
                font-size: 1.5rem;
            }
            .icon {
                font-size: 3rem !important;
            }
        }

        .main-button:active {
            transform: scale(0.95); /* 터치했을 때 꾹 눌리는 느낌 */
            filter: brightness(0.9);
        }

        .icon {
            font-size: 4.5rem;
            margin-bottom: 15px;
        }

        .sub-text {
            font-size: 1rem;
            font-weight: 300;
            margin-top: 10px;
            opacity: 0.9;
        }
    </style>
</head>
<body>

    <div class="container">
        <button class="main-button order-btn" onclick="location.href='/kiosk'">
            <div class="icon">☕</div>
            주문하기
            <div class="sub-text">Order Here</div>
        </button>

        <button class="main-button admin-btn" onclick="location.href='/admin/login'">
            <div class="icon">🛠️</div>
            관리자 모드
            <div class="sub-text">Management</div>
        </button>
    </div>

</body>
</html>