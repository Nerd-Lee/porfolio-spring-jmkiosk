<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JM Kiosk - Admin Dashboard</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Pretendard', sans-serif;
            background-color: #f4f7f6;
            color: #333;
        }

        .dashboard-container {
            max-width: 600px;
            margin: 0 auto;
            padding: 40px 20px;
            text-align: center;
        }

        .header {
            margin-bottom: 40px;
        }

        .header h1 {
            font-size: 1.8rem;
            color: #2c3e50;
            margin-bottom: 10px;
        }

        .header p {
            color: #7f8c8d;
            font-size: 1rem;
        }

        /* 메인 액션 버튼 그룹 */
        .menu-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 15px;
            margin-bottom: 30px;
        }

        .admin-card {
            background: white;
            padding: 30px 15px;
            border-radius: 20px;
            border: none;
            box-shadow: 0 4px 15px rgba(0,0,0,0.05);
            cursor: pointer;
            transition: all 0.2s ease;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        .admin-card:active {
            transform: scale(0.95);
            background-color: #fcfcfc;
        }

        .admin-card i {
            font-size: 2.5rem;
            margin-bottom: 15px;
        }

        .admin-card span {
            font-size: 1.1rem;
            font-weight: 700;
            color: #2c3e50;
        }

        /* 하단 보조 버튼 그룹 */
        .sub-menu {
            display: flex;
            flex-direction: column;
            gap: 10px;
            margin-top: 20px;
        }

        .sub-btn {
            padding: 15px;
            border-radius: 12px;
            border: 1px solid #ddd;
            background: white;
            font-size: 1rem;
            font-weight: 500;
            cursor: pointer;
            color: #555;
            transition: 0.2s;
        }

        .sub-btn:hover {
            background-color: #eee;
        }

        .logout-btn {
            color: #e74c3c;
            border-color: #fadbd8;
            background-color: #fef9f8;
        }
		
		.order-card {
		        grid-column: span 2; 
		        background: linear-gradient(135deg, #ffffff 0%, #f0f4ff 100%);
		        border: 2px solid #2575fc; /* 포인트 컬러 */
		    }

	    .order-card span {
	        color: #2575fc !important;
	    }

        /* 모바일 최적화 */
        @media (max-width: 480px) {
            .menu-grid {
                grid-template-columns: 1fr; /* 모바일에선 한 줄로 크게 */
            }
            .admin-card {
                padding: 40px 15px;
            }
			.order-card {
	            grid-column: span 1;
	        }
        }
    </style>
</head>
<body>
	<div class="dashboard-container">
	    <div class="header">
	        <h1>관리자 대시보드</h1>
	    </div>

	    <div class="menu-grid">
	        <div class="admin-card order-card" onclick="location.href='/admin/orders'">
	            <i style="position: relative;">
	                📦
	                <span style="position: absolute; top: -5px; right: -10px; background: #e74c3c; width: 12px; height: 12px; border-radius: 50%; border: 2px solid white;"></span>
	            </i>
	            <span>실시간 주문 관리</span>
	        </div>

	        <div class="admin-card" onclick="location.href='/admin/menu/new'">
	            <i>➕</i>
	            <span>메뉴 등록</span>
	        </div>

	        <div class="admin-card" onclick="location.href='/admin/menu/update_page'">
	            <i>📝</i>
	            <span>메뉴 수정/삭제</span>
	        </div>
	    </div>

	    <hr style="border: 0; height: 1px; background: #ddd; margin: 30px 0;">

	    <div class="sub-menu">
	        <button class="sub-btn" onclick="location.href='/'">🏠 메인 화면으로 돌아가기</button>
	        <button class="sub-btn logout-btn" onclick="location.href='/admin/logout'">🔒 로그아웃</button>
	    </div>
	</div>
</body>
</html>