<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table class="admin-table">
    <thead>
        <tr>
            <th>ID</th>
            <th>이미지</th>
            <th>카테고리</th>
            <th>메뉴명</th>
            <th>가격</th>
            <th>관리</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="menu" items="${menuList}">
            <tr>
                <td>${menu.id}</td>
                <td><img src="${menu.image_url}" width="50"></td>
                <td>${menu.category}</td>
                <td>${menu.name}</td>
                <td>${menu.price}원</td>
                <td>
                    <button onclick="location.href='/admin/menu/edit/${menu.id}'">수정</button>
                    <button onclick="deleteMenu(${menu.id})" class="delete-btn">삭제</button>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
<br>
<button onclick="location.href='/admin/menu'">관리자 메뉴로 돌아가기</button>

<script>
function deleteMenu(id) {
    if(confirm("정말 이 메뉴를 삭제하시겠습니까?")) {
        location.href = "/admin/menu/delete/" + id;
    }
}
</script>