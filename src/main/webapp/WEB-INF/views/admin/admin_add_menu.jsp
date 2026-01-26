<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메뉴 등록 - 관리자 모드</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Pretendard', -apple-system, sans-serif;
            background-color: #f8f9fa;
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .form-container {
            background: white;
            width: 90%;
            max-width: 500px;
            padding: 30px;
            border-radius: 20px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.08);
            box-sizing: border-box;
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #2c3e50;
            font-size: 1.5rem;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            font-size: 0.9rem;
            color: #555;
        }

        input[type="text"],
        input[type="number"],
        select {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 10px;
            font-size: 1rem;
            box-sizing: border-box;
            transition: border-color 0.2s;
        }

        input:focus, select:focus {
            border-color: #2575fc;
            outline: none;
        }

        /* 파일 업로드 스타일 */
        input[type="file"] {
            width: 100%;
            padding: 10px;
            background: #f1f3f5;
            border-radius: 10px;
            border: 1px dashed #adb5bd;
            cursor: pointer;
        }

        .btn-group {
            display: flex;
            flex-direction: column;
            gap: 12px;
            margin-top: 30px;
        }

        button {
            width: 100%;
            padding: 15px;
            border: none;
            border-radius: 12px;
            font-size: 1rem;
            font-weight: 700;
            cursor: pointer;
            transition: 0.2s;
        }

        .submit-btn {
            background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
            color: white;
        }

        .submit-btn:active {
            transform: scale(0.98);
        }

        .back-btn {
            background-color: #f1f3f5;
            color: #495057;
        }

        .back-btn:hover {
            background-color: #e9ecef;
        }

        /* 모바일 텍스트 크기 조정 */
        @media (max-width: 480px) {
            .form-container {
                padding: 20px;
            }
            h2 { font-size: 1.3rem; }
        }
    </style>
</head>
<body>

    <div class="form-container">
        <h2>새 메뉴 등록</h2>
        
        <form action="/admin/menu/add" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="name">메뉴 이름</label>
                <input type="text" id="name" name="name" placeholder="예: 아이스 아메리카노" required>
            </div>

            <div class="form-group">
                <label for="price">판매 가격(원)</label>
                <input type="number" id="price" name="price" placeholder="예: 4500" required>
            </div>

            <div class="form-group">
                <label for="category">카테고리</label>
                <select id="category" name="category" required>
                    <option value="">-- 카테고리를 선택하세요 --</option>
                    <option value="커피">커피</option>
                    <option value="에이드">에이드</option>
                    <option value="디저트">디저트</option>
                    <option value="티">티</option>
                </select>
            </div>

            <div class="form-group">
                <label for="image">메뉴 이미지</label>
                <input type="file" id="image" name="image" accept="image/*">
            </div>

            <div class="btn-group">
                <button type="submit" class="submit-btn">등록 완료</button>
                <button type="button" class="back-btn" onclick="location.href='/admin/menu'">취소 후 돌아가기</button>
            </div>
        </form>
    </div>

</body>
</html>