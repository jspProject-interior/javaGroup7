select * from member;

show tables;

create table member(
  idx         int             not null auto_increment,         /*   회원/업체 고유번호 */
  mid         varchar(30)     not null,                        /*   회원/압체 아이디(중복불허) */
  pwd         varchar(100)    not null,                        /*   회원/업체 비밀번호(SHA256 암호화처리) */
  name        varchar(30)     not null,                        /*   회원성명/대표자명(중복허용) */
  company     varchar(30),                                     /*   업체명(개인은 null)	*/
  tel         varchar(15),                                     /*   전화번호 : 010-1234-5678 */
  email       varchar(60)     not null,                        /*   이메일(아이디/비밀번호 분실시에 사용) - 형식체크필수 */
  resident    varchar(30)     not null,                        /*   주민등록번호 (사업자번호)   */
  address     varchar(100),                                    /*   주소(우편번호:다음 API 활용) */
  gender      char(2),                                         /*   회원 성별 */
  birthday    datetime,                                        /*   회원 생일 */
  level       int,                                             /*   회원 등급(0:관리자, 1:개인, 2:인테리어업체 3:가구업체, 99:탈퇴예정회원) */
  photo       varchar(100)    default 'noimage.jpg',           /*   회원 사진 */
  userDel     char(2)         default 'NO',                    /*   회원 탈퇴신청여부(NO:현재 활동중, OK:탈퇴신청중) */
  joinDay     datetime        default now(),                   /*   최초 가입일 */
  lastDate    datetime        default now(),                   /*   마지막 접속일(탈퇴시는 탈퇴한 날짜) */
  
  primary key(idx),
  unique key(mid)
);

insert into member values(default, 'admin', '1234', '관리자', null, '010-1234-5678', 'admin@naver.com', '123456-1234567', '청주', '관리', '2024-11-11', 0, default, default, default, default);

drop table member;

SET foreign_key_checks = 1;