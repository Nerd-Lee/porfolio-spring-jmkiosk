-- 테이블 만들기
CREATE TABLE MENU (
   	ID BIGINT PRIMARY KEY AUTO_INCREMENT, -- 고유 번호 (자동 증가)
    NAME VARCHAR(255) NOT NULL,            -- 메뉴 이름
    PRICE INT NOT NULL,                    -- 가격
    CATEGORY VARCHAR(50),                  -- 카테고리 (커피, 음료, 디저트 등)
    IMAGE_URL VARCHAR(500)                 -- 메뉴 사진 경로 (나중에 추가 대비)
);

-- 기존 데이터 삭제 (중복 방지)
DELETE FROM MENU;

-- 기초 메뉴 데이터를 삽입
INSERT INTO MENU(NAME, PRICE, CATEGORY, IMAGE_URL) VALUES ('아메리카노', 4500, '커피','');
INSERT INTO MENU(NAME, PRICE, CATEGORY, IMAGE_URL) VALUES ('카페라떼', 4500, '커피','');
INSERT INTO MENU(NAME, PRICE, CATEGORY, IMAGE_URL) VALUES ('바닐라라떼', 5000, '커피','');
INSERT INTO MENU(NAME, PRICE, CATEGORY, IMAGE_URL) VALUES ('딸기 에이드', 5500, '음료','');
INSERT INTO MENU(NAME, PRICE, CATEGORY, IMAGE_URL) VALUES ('치즈 케이크', 6500, '디저트','');

CREATE TABLE ADMIN (
	ID VARCHAR(20) PRIMARY KEY,
	PASSWORD VARCHAR(20) NOT NULL
);

-- 테스트용 관리자 계정
INSERT INTO ADMIN(ID, PASSWORD) VALUES ('admin', '1234');