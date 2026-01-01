function validateForm(){
	const name = document.getElementsByName("name")[0].value;
	const price = document.getElementsByName("price")[0].value;
	
	if(name.trim() === ""){
		console.log(name);
		alert("메뉴 이름을 입력하셔야 등록할 수 있습니다.");
		return false;
	}
	else if(price <= 0){
		alert("가격은 0보다 커야 등록할 수 있습니다.");
		return false;
	}
	return true;
}