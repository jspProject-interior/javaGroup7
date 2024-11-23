show tables;

create table furniture(
	idx         int             not null auto_increment,         /*  업체 고유번호 */
  mid         varchar(30)     not null,                        /*   업체 아이디(중복불허) */
  company     varchar(30)     not null,                        /*   업체명(중복불허/수정가능) */
  category    varchar(30),                                     /*   카테고리(소파, 테이블)   */   
  title       varchar(100)    not null,                        /* 상품명 */
  pay         int             default 0,                       /*   가격   */
  discount    int             default 0,                       /*   가격   */
  saleUnit    varchar(30),                                     /*   카테고리(소파, 테이블)   */   
  price       int             default 0,                       /*   가격   */
  titleImg    varchar(100)    default 'noimage.jpg',           /* 상품 사진 */
  subImg      varchar(100)    default 'noimage.jpg',           /* 상품 사진 */
  thumbnail   varchar(100)    default 'noimage.jpg',           /* 상품 사진 */
  fName       varchar(200)    not null,                        /* 업로드시 원본 파일명 */
  fSName      varchar(300)    not null,                        /* 실제 서버에 저장되는 파일명 */
  fSize       int             not null,                        /* 업로드파일의 총 사이즈 */
  claim       char(2)         default 'NO',                    /*   신고글   */
  wDate       datetime        default now(),                   /*   올린 날   */
  interest    int             default 0,                       /*   관심   */
   
   primary key(idx),
   foreign key(mid) references member(mid)
);

select * from furniture;

drop table purchase;

create table purchase(
  idx        	 	int             not null auto_increment,         /* 주문 고유번호 */
  cusMid       	varchar(30)     not null,                        /* 고객 아이디 */
  comMid        varchar(30)     not null,                        /* 업체 아이디 */
  name       		varchar(30)     not null,                        /* 주문자명 */
  company       varchar(30)     not null,                        /* 업체명 */
  tel         	varchar(15),                                     /* 전화번호 */
  address    		varchar(100),                                    /* 배송지 */
  category      varchar(30),                                     /* 카테고리(소파, 테이블) */   
  title         varchar(100)    not null,                        /* 상품명 */
  thumbnail     varchar(100)    default 'noimage.jpg',           /* 상품 사진 */
  pay           int             default 0,                       /* 원가격 */
  discount      int             default 0,                       /* 할인금액 */
  price         int             default 0,                       /* 총 결제 금액 */
	cnt						int							default 0,											 /* 주문 수량 */	   
  purDate       datetime        default now(),                   /* 올린 날 */

  primary key(idx),
  foreign key(cusMid) references member(mid)
);
