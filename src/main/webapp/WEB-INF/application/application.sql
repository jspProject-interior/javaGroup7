select * from application;

show tables;

create table application(
  idx         int             not null auto_increment,         	/* 신청서 고유번호 */
  mid         varchar(30)     not null,                        	/* 상담신청 회원 아이디(중복불허) */
  name        varchar(30)     not null,                        	/* 상담신청 회원 성명 */
  conAddress  varchar(100)		not null,                        	/* 시공 할 주소(우편번호:다음 API 활용) */
  tel         varchar(15)			not null,                        	/* 전화번호 : 010-1234-5678 */
	category		varchar(30),																		 	/* 선호하는 분위기 */
	price				int,																						  /* 견적 가격(바로 상담신청서로 온 경우는 null)*/
	budget			int							not null,													/* 예산 */
	size				int							not null,													/* 평수 */
	conStartDay date,																						/*시공 시작 희망일*/
	area				varchar(10)		default 'N',												/* 컨설팅 희망 공간 */
	porch				varchar(10)		default 'N',												/* 현관 */
	papering		varchar(10)		default 'N',												/* 도배 */
	floor				varchar(10)		default 'N',												/* 장판 */
	molding			varchar(10)		default 'N',                        /* 몰딩 */
	balcony			varchar(10)		default 'N',                        /* 발코니 */
	kitchen			varchar(10)		default 'N',                        /* 주방 */
	bathroom		varchar(10)		default 'N',                        /* 욕실 */
	door				varchar(10)		default 'N',                        /* 문 */
	bed					varchar(10)		default 'N',                        /* 침대 */
	sofa				varchar(10)		default 'N',                        /* 소파 */
	desk				varchar(10)		default 'N',                        /* 테이블 */
	chair				varchar(10)		default 'N',                        /* 의자 */
	cabinet			varchar(10)		default 'N',                        /* 수납장 */
	lighting		varchar(10)		default 'N',												/* 조명 */
	

  primary key(idx),
 	foreign key(mid) references member(mid)
);
