show tables;

create table member(
  idx         int             not null auto_increment,         /*   회원 고유번호 */
  mid         varchar(30)     not null,                        /*   회원 아이디(중복불허) */
  pwd         varchar(100)    not null,                        /*   회원 비밀번호(SHA256 암호화처리) */
  name        varchar(30)     not null,                        /*   회원 성명(중복허용) */
  nickName    varchar(30)     not null,                        /*   회원 닉네임(중복불허/수정가능) */
  tel         varchar(15),                                     /*   전화번호 : 010-1234-5678 */
  email       varchar(60)     not null,                        /*   이메일(아이디/비밀번호 분실시에 사용) - 형식체크필수 */
  resident    varchar(30)     not null,                        /*   주민등록번호   */
  address     varchar(100),                                    /*   주소(우편번호:다음 API 활용) */
  gender      char(2),                                         /*   회원 성별 */
  birthday    datetime,                                        /*   회원 생일 */
  level       int,                                             /*   회원 등급(0:관리자, 1:개인, 2:업체, 99:탈퇴예정회원) */
  industry    varchar(30)     not null default '개인',          /*   업종   */
  photo       varchar(100)    default 'noimage.jpg',           /*   회원 사진 */
  userDel     char(2)         default 'NO',                    /*   회원 탈퇴신청여부(NO:현재 활동중, OK:탈퇴신청중) */
  joinDay     datetime        default now(),                   /*   최초 가입일 */
  lastDate    datetime        default now(),                   /*   마지막 접속일(탈퇴시는 탈퇴한 날짜) */
  
  primary key(idx),
  unique key(mid)
);

