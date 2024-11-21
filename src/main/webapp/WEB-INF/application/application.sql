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
	conStartDay date,																							/*시공 시작 희망일*/
	companyMid	varchar(30),																			/*	시공 신청 업체	*/
	area				varchar(10)			default 'N',											/* 컨설팅 희망 공간 */

  primary key(idx),
 	foreign key(mid) references member(mid)
);

drop table application;