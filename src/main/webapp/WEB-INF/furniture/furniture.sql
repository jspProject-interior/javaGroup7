show tables;

create table furniture(
   idx         int             not null auto_increment,         /*   회원 고유번호 */
  mid         varchar(30)     not null,                        /*   회원 아이디(중복불허) */
  company        varchar(30)     not null,                        /*   회원 닉네임(중복불허/수정가능) */
   category      varchar(30),                                                      /*   카테고리(빈티지,모던 | 소파, 테이블)   */   
  title            varchar(100)      not null,                                   /* 게시글 제목 */
   price            int                     default 0,                                 /*   가격   */
   content         text                   not null,                                    /* 글 내용 */
  titleImg      varchar(100)       default 'noimage.jpg',               /* 회원 사진 */
  subImg         varchar(100)       default 'noimage.jpg',               /* 회원 사진 */
  thumbnail      varchar(100)       default 'noimage.jpg',               /* 회원 사진 */
   fName            varchar(200)       not null,                                    /* 업로드시 원본 파일명 */
  fSName         varchar(300)       not null,                                    /* 실제 서버에 저장되는 파일명 */
  fSize            int                   not null,                                    /* 업로드파일의 총 사이즈 */
   claim            char(2)               default 'NO',                              /*   신고글   */
   wDate            datetime            default now(),                           /*   올린 날   */
   interest      int                     default 0,                                 /*   관심   */
   
   primary key(idx),
   foreign key(mid) references member(mid)
);

select * from furniture;