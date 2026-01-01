let cart=[];

function addToCart(name, price){
	const foundItem = cart.find(item => item.name === name);
	
	if(foundItem){
		// 이미 있다면 수량을 증가
		foundItem.quantity += 1;
	}
	else{
		// 만약 장바구니에 추가 된 게 없다면 새로운 아이템을 추가
		const item = {
				id: Date.now(),
				name: name,
				quantity: 1,
				price: price
		};
		cart.push(item);
	}
	
	//console.log("장바구니 담김 : ", item);
	
	renderCart(); // 장바구니 화면 업데이트 함수
}

function changeQuantity(name, delta){
	const item = cart.find(item => item.name === name);
	if(item){
		item.quantity += delta;
		
		// 수량이 0 이하가 되면 삭제
		if(item.quantity <= 0){
			removeFromCart(name);
		}
	}
	renderCart();
}

// 장바구니 삭제 X 버튼
function removeFromCart(name) {
	cart = cart.filter(item => item.name !== name);
	renderCart();
}

function clearCart(){
	if(cart.length === 0){
		return;
	}
	
	if(confirm("장바구니를 모두 비우시겠습니까?")){
		cart = [];
		renderCart();
	}
}

function orderCancel(){
	const orderCancel = confirm("주문을 취소하시겠습니까?");
	if(orderCancel){
		location.href = "/";
	}
}

function renderCart(){
	const cartItemList = document.getElementById("cart-items");
	const totalAmountSpan = document.getElementById("total-amount");
	
	cartItemList.innerHTML = "";
	let total = 0;
	
	if(cart.length === 0){
		cartItemList.innerHTML = '<p id="empty-msg">메뉴를 선택해주세요.</p>';
		totalAmountSpan.innerText ="0";
		return;
	}
	
	cart.forEach(item => {
		const itemDiv = document.createElement("div");
		itemDiv.className = "cart-item";
		itemDiv.style.display = "flex";
		itemDiv.style.justifyContent = "space-between";
		itemDiv.style.alignItems = "center";
		itemDiv.style.padding = "10px 0";
		itemDiv.style.borderBottom = "1px solid #eee";
		
		itemDiv.innerHTML = `
			<div style="flex: 2;">
		    	<strong>${item.name}</strong><br>
		        <small style="color:#888;">${item.price.toLocaleString()}원</small>
		    </div>
		            
			<div class="right-side" style="display: flex; align-items: center; gap: 20px;">
				<div class="quantity-control" style="display: flex; align-items: center; background: #f8f9fa; border-radius: 5px; padding: 2px;">
					<button onclick="changeQuantity('${item.name}', -1)" style="width:25px; height:25px; border:none; background:none; cursor:pointer;">-</button>
					<span style="margin: 0 10px; font-weight:bold; min-width: 20px; text-align: center;">${item.quantity}</span>
					<button onclick="changeQuantity('${item.name}', 1)" style="width:25px; height:25px; border:none; background:none; cursor:pointer;">+</button>
				</div>
				            
				<div class="price-info" style="min-width: 80px; text-align: right;">
					<span style="font-weight:bold;">${(item.price * item.quantity).toLocaleString()}원</span>
					<button onclick="removeFromCart('${item.name}')" style="margin-left:10px; color:#ff4d4d; border:none; background:none; cursor:pointer; font-size: 1.2rem;">&times;</button>
				</div>
			</div>
		`;
		
		cartItemList.appendChild(itemDiv);
		total += (item.price * item.quantity);
	});
	
	totalAmountSpan.innerText = total.toLocaleString();
}

function filterCategory(category){
	const cards = document.querySelectorAll('.menu-card');
	
	const buttons = document.querySelectorAll('.tab-btn');
	buttons.forEach(btn => btn.classList.remove('active'));
	event.target.classList.add('active');
	
	cards.forEach(card =>{
		const itemCategory = card.getAttribute('data-category');
		
		if(category === 'all' || itemCategory === category){
			card.style.display = 'flex';
		}
		else{
			card.style.display = 'none';
		}
	});
}

function processOrder(){
	if(cart.length === 0){
		alert("장바구니가 비어있습니다.");
		return;
	}
	
	const total = cart.reduce((sum, item) => sum + item.price * item.quantity, 0);
	
	if(confirm(`총 ${total.toLocaleString()} 원을 결제하시겠습니까?`)){
		fetch("/kiosk/pay", {
			method:"POST",
			headers: {"Content-Type": "application/json"},
			body: JSON.stringify(cart)
		})
		.then(response => response.text())
		.then(data => {
			if(data === "success"){
				alert("주문이 완료되었습니다! 주문번호를 확인해주세요.");
				cart = [];
				renderCart();
			}
		});
	}
}