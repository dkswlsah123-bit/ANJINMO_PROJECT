select user
  from dual;
  
select *
from account_event_type;



-- 범례테이블 데이터 생성 ======================================================

-- 5. ACCOUNT_EVENT_TYPE
insert into account_event_type (
   account_event_type_id,
   event_name
) values ( account_event_type_seq.nextval,
           '가입' );
insert into account_event_type (
   account_event_type_id,
   event_name
) values ( account_event_type_seq.nextval,
           '탈퇴' );

select *
  from account_event_type;
/*
1	가입
2	탈퇴
*/

-- 7. ADMIN_ROLE
insert into admin_role (
   admin_role_id,
   admin_role_name
) values ( admin_role_seq.nextval,
           '최고관리자' );
insert into admin_role (
   admin_role_id,
   admin_role_name
) values ( admin_role_seq.nextval,
           '관리자' );

select *
  from admin_role;
/*
1	최고관리자
2	관리자
*/

-- 11. COMMON
insert into common (
   common_yn_id,
   common_yn_name
) values ( 0,
           'N' );
insert into common (
   common_yn_id,
   common_yn_name
) values ( 1,
           'Y' );

select *
  from common;
/*
0	N
1	Y
*/




-- 14. PRODUCT_GRADE
insert into product_grade (
   product_grade_id,
   product_grade_name
) values ( product_grade_seq.nextval,
           '최상' );
insert into product_grade (
   product_grade_id,
   product_grade_name
) values ( product_grade_seq.nextval,
           '상' );
insert into product_grade (
   product_grade_id,
   product_grade_name
) values ( product_grade_seq.nextval,
           '중' );
insert into product_grade (
   product_grade_id,
   product_grade_name
) values ( product_grade_seq.nextval,
           '하' );

select *
  from product_grade;
/*
1	최상
2	상
3	중
4	하
*/


-- 15. PRODUCT_GENRE
insert into product_genre (
   product_genre_id,
   product_genre_name
) values ( product_genre_seq.nextval,
           '영화' );
insert into product_genre (
   product_genre_id,
   product_genre_name
) values ( product_genre_seq.nextval,
           '애니메이션' );
insert into product_genre (
   product_genre_id,
   product_genre_name
) values ( product_genre_seq.nextval,
           '만화(코믹스)' );
insert into product_genre (
   product_genre_id,
   product_genre_name
) values ( product_genre_seq.nextval,
           '게임' );
insert into product_genre (
   product_genre_id,
   product_genre_name
) values ( product_genre_seq.nextval,
           '연예인' );
insert into product_genre (
   product_genre_id,
   product_genre_name
) values ( product_genre_seq.nextval,
           '버튜버' );
insert into product_genre (
   product_genre_id,
   product_genre_name
) values ( product_genre_seq.nextval,
           '기타' );

select *
  from product_genre;
/*
1	영화
3	애니메이션
4	만화(코믹스)
5	게임
6	연예인
7	버튜버
8	기타
*/


-- 16. PRODUCT_SIZE
insert into product_size (
   product_size_id,
   product_size_name
) values ( product_size_seq.nextval,
           '대' );
insert into product_size (
   product_size_id,
   product_size_name
) values ( product_size_seq.nextval,
           '중' );
insert into product_size (
   product_size_id,
   product_size_name
) values ( product_size_seq.nextval,
           '소' );

select *
  from product_size;
/*
1	대
2	중
3	소
*/

-- 20. MONEY_TYPE
insert into money_type (
   money_type_id,
   money_type_name
) values ( money_type_seq.nextval,
           '결제' );
insert into money_type (
   money_type_id,
   money_type_name
) values ( money_type_seq.nextval,
           '판매 보증금 납부' );
insert into money_type (
   money_type_id,
   money_type_name
) values ( money_type_seq.nextval,
           '구매 보증금 납부' );
insert into money_type (
   money_type_id,
   money_type_name
) values ( money_type_seq.nextval,
           '판매 보증금 환급' );
insert into money_type (
   money_type_id,
   money_type_name
) values ( money_type_seq.nextval,
           '구매 보증금 환급' );
insert into money_type (
   money_type_id,
   money_type_name
) values ( money_type_seq.nextval,
           '결제 취소' );
insert into money_type (
   money_type_id,
   money_type_name
) values ( money_type_seq.nextval,
           '결제 대금' );
insert into money_type (
   money_type_id,
   money_type_name
) values ( money_type_seq.nextval,
           '보증금 몰수' );

select *
  from money_type;
/*
1	결제
2	판매 보증금 납부
3	구매 보증금 납부
4	판매 보증금 환급
5	구매 보증금 환급
6	결제 취소
7	결제 대금
8	보증금 몰수
*/

-- 21. MONEY_CHARGE_METHOD
insert into money_charge_method (
   money_charge_method_id,
   money_charge_method_name
) values ( money_charge_method_seq.nextval,
           '무통장' );
insert into money_charge_method (
   money_charge_method_id,
   money_charge_method_name
) values ( money_charge_method_seq.nextval,
           '신용카드' );

select *
  from money_charge_method;
/*
1	무통장
2	신용카드
*/


-- 23. AUCTION_PERIOD
insert into auction_period (
   auction_period_id,
   auction_period_name
) values ( auction_period_seq.nextval,
           '1일' );
insert into auction_period (
   auction_period_id,
   auction_period_name
) values ( auction_period_seq.nextval,
           '2일' );
insert into auction_period (
   auction_period_id,
   auction_period_name
) values ( auction_period_seq.nextval,
           '3일' );
insert into auction_period (
   auction_period_id,
   auction_period_name
) values ( auction_period_seq.nextval,
           '4일' );
insert into auction_period (
   auction_period_id,
   auction_period_name
) values ( auction_period_seq.nextval,
           '5일' );
insert into auction_period (
   auction_period_id,
   auction_period_name
) values ( auction_period_seq.nextval,
           '6일' );
insert into auction_period (
   auction_period_id,
   auction_period_name
) values ( auction_period_seq.nextval,
           '7일' );

select *
  from auction_period;
/*
1	1일
2	2일
3	3일
4	4일
5	5일
6	6일
7	7일
*/


-- 29. BID_FAILURE_TYPE
insert into bid_failure_type (
   bid_fail_type_id,
   bid_fail_type_name
) values ( bid_fail_type_seq.nextval,
           '결제기한만료' );
insert into bid_failure_type (
   bid_fail_type_id,
   bid_fail_type_name
) values ( bid_fail_type_seq.nextval,
           '낙찰포기' );

select *
  from bid_failure_type;
/*
1	결제기한만료
2	낙찰포기
*/

-- 35. PENALTY_ASSIGN_TYPE
insert into penalty_assign_type (
   penalty_type_id,
   penalty_type_name
) values ( penalty_type_seq.nextval,
           '자동' );
insert into penalty_assign_type (
   penalty_type_id,
   penalty_type_name
) values ( penalty_type_seq.nextval,
           '수동' );

select *
  from penalty_assign_type;
/*
1	자동
2	수동
*/


-- 38. REPORT_TYPE
insert into report_type (
   report_type_id,
   report_type_name
) values ( report_type_seq.nextval,
           '도배' );
insert into report_type (
   report_type_id,
   report_type_name
) values ( report_type_seq.nextval,
           '광고' );
insert into report_type (
   report_type_id,
   report_type_name
) values ( report_type_seq.nextval,
           '개인정보 노출' );
insert into report_type (
   report_type_id,
   report_type_name
) values ( report_type_seq.nextval,
           '불법정보' );
insert into report_type (
   report_type_id,
   report_type_name
) values ( report_type_seq.nextval,
           '음란물' );
insert into report_type (
   report_type_id,
   report_type_name
) values ( report_type_seq.nextval,
           '욕설/혐오/차별적 표현' );

select *
  from report_type;
/*
1	도배
2	광고
3	개인정보 노출
4	불법정보
5	음란물
6	욕설/혐오/차별적 표현
*/



-- 39. REPORT_TARGET
insert into report_target (
   report_target_id,
   report_target_name
) values ( report_target_seq.nextval,
           '상품' );
insert into report_target (
   report_target_id,
   report_target_name
) values ( report_target_seq.nextval,
           '경매' );

select *
  from report_target;
/*
1	상품
2	경매
*/


-- 43. REPORT_RESULT
insert into report_result (
   report_result_id,
   report_result_name
) values ( report_result_seq.nextval,
           '승인' );
insert into report_result (
   report_result_id,
   report_result_name
) values ( report_result_seq.nextval,
           '반려' );

select *
  from report_result;
/*
1	승인
2	반려
*/
-- 12. PRODUCT_COUNTRY
insert into product_country (
   product_country_id,
   product_country_name
) values ( 'KR',
           '한국' );
insert into product_country (
   product_country_id,
   product_country_name
) values ( 'JP',
           '일본' );
insert into product_country (
   product_country_id,
   product_country_name
) values ( 'CN',
           '중국' );
insert into product_country (
   product_country_id,
   product_country_name
) values ( 'US',
           '미국' );
insert into product_country (
   product_country_id,
   product_country_name
) values ( 'HK',
           '홍콩' );
insert into product_country (
   product_country_id,
   product_country_name
) values ( 'EU',
           '유럽' );
insert into product_country (
   product_country_id,
   product_country_name
) values ( 'ZZ',
           '알 수 없음' );


select *
  from product_country;
/*
KR	한국
JP	일본
CN	중국
US	미국
HK	홍콩
EU	유럽
*/


-- 13. PRODUCT_MANUFACTURER
-- 한국 (KR)
insert into product_manufacturer (
   manufacturer_id,
   product_country_id,
   manufacturer_name
) values ( manufacturer_seq.nextval,
           'KR',
           '블리츠웨이' );
insert into product_manufacturer (
   manufacturer_id,
   product_country_id,
   manufacturer_name
) values ( manufacturer_seq.nextval,
           'KR',
           '오프로 스튜디오' );
insert into product_manufacturer (
   manufacturer_id,
   product_country_id,
   manufacturer_name
) values ( manufacturer_seq.nextval,
           'KR',
           'JND 스튜디오' );

-- 일본 (JP)
insert into product_manufacturer (
   manufacturer_id,
   product_country_id,
   manufacturer_name
) values ( manufacturer_seq.nextval,
           'JP',
           '굿스마일 컴퍼니' );
insert into product_manufacturer (
   manufacturer_id,
   product_country_id,
   manufacturer_name
) values ( manufacturer_seq.nextval,
           'JP',
           '반다이' );
insert into product_manufacturer (
   manufacturer_id,
   product_country_id,
   manufacturer_name
) values ( manufacturer_seq.nextval,
           'JP',
           '알터' );
insert into product_manufacturer (
   manufacturer_id,
   product_country_id,
   manufacturer_name
) values ( manufacturer_seq.nextval,
           'JP',
           '메가하우스' );
insert into product_manufacturer (
   manufacturer_id,
   product_country_id,
   manufacturer_name
) values ( manufacturer_seq.nextval,
           'JP',
           '코토부키야' );

-- 미국 (US)
insert into product_manufacturer (
   manufacturer_id,
   product_country_id,
   manufacturer_name
) values ( manufacturer_seq.nextval,
           'US',
           '사이드쇼' );
insert into product_manufacturer (
   manufacturer_id,
   product_country_id,
   manufacturer_name
) values ( manufacturer_seq.nextval,
           'US',
           '네카' );
insert into product_manufacturer (
   manufacturer_id,
   product_country_id,
   manufacturer_name
) values ( manufacturer_seq.nextval,
           'US',
           '해즈브로' );

-- 홍콩 (HK)
insert into product_manufacturer (
   manufacturer_id,
   product_country_id,
   manufacturer_name
) values ( manufacturer_seq.nextval,
           'HK',
           '핫토이' );
insert into product_manufacturer (
   manufacturer_id,
   product_country_id,
   manufacturer_name
) values ( manufacturer_seq.nextval,
           'HK',
           '쓰리제로' );

-- 중국 (CN)
insert into product_manufacturer (
   manufacturer_id,
   product_country_id,
   manufacturer_name
) values ( manufacturer_seq.nextval,
           'CN',
           '에이펙스' );
insert into product_manufacturer (
   manufacturer_id,
   product_country_id,
   manufacturer_name
) values ( manufacturer_seq.nextval,
           'CN',
           '모쇼토이즈' );

-- 유럽(EU)
insert into product_manufacturer (
   manufacturer_id,
   product_country_id,
   manufacturer_name
) values ( manufacturer_seq.nextval,
           'EU',
           '츠메아트' );

-- 알 수 없음 (ZZ)
insert into product_manufacturer (
   manufacturer_id,
   product_country_id,
   manufacturer_name
) values ( manufacturer_seq.nextval,
           'ZZ',
           '제조사 미확인' );

select *
  from product_manufacturer;
/*
1	KR	블리츠웨이
2	KR	오프로 스튜디오
3	KR	JND 스튜디오
4	JP	굿스마일 컴퍼니
5	JP	반다이
6	JP	알터
7	JP	메가하우스
8	JP	코토부키야
9	US	사이드쇼
10	US	네카
11	US	해즈브로
12	HK	핫토이
13	HK	쓰리제로
14	CN	에이펙스
15	CN	모쇼토이즈
16	EU	츠메아트
17	ZZ	제조사 미확인
*/

-- 범례테이블 데이터 생성 ======================================================



-- 샘플 데이터 생성 ============================================================

select *
  from users;

-- [1] 사용자 생성 (기본키 → 계정 → 프로필)
insert into users ( user_id ) values ( users_seq.nextval ); -- 1번 사용자
insert into user_account (
   user_id,
   user_login_id,
   user_password
) values ( users_seq.currval,
           'user01',
           '0123456789' );
insert into user_profile (
   user_id,
   user_name,
   user_ssn,
   user_email,
   user_phone,
   user_zipcode,
   user_address,
   user_address_detail
) values ( users_seq.currval,
           '홍길동',
           '9001011234567',
           'hong@test.com',
           '01012345678',
           '06035',
           '서울 강남구 가로수길',
           '101호' );
insert into account_event_history values ( account_event_history_seq.nextval,
                                           1,
                                           1,
                                           sysdate );

insert into users ( user_id ) values ( users_seq.nextval ); -- 2번 사용자
insert into user_account (
   user_id,
   user_login_id,
   user_password
) values ( users_seq.currval,
           'user02',
           '0123456789' );
insert into user_profile (
   user_id,
   user_name,
   user_ssn,
   user_email,
   user_phone,
   user_zipcode,
   user_address,
   user_address_detail
) values ( users_seq.currval,
           '김철수',
           '9205052345678',
           'kim@test.com',
           '01098765432',
           '04524',
           '서울 중구 세종대로',
           '202호' );
insert into account_event_history values ( account_event_history_seq.nextval,
                                           2,
                                           1,
                                           sysdate );

select *
  from account_event_history;

-- 사용자 전체 정보 조회
select u.user_id,
       ua.user_login_id,
       ua.user_password,
       up.user_name,
       up.user_ssn,
       up.user_email,
       up.user_phone,
       up.user_zipcode,
       up.user_address,
       up.user_address_detail
  from users u
  join user_account ua
on u.user_id = ua.user_id
  join user_profile up
on ua.user_id = up.user_id;


-- [추가] 1번 사용자에게 경매 보증금용 10만 원 충전 데이터 입력
insert into money_charge_history (
   money_charge_id,
   user_id,
   money_charge_method_id,
   charge_amount,
   charged_at
) values ( money_charge_seq.nextval,
           1,
           2,
           100000,
           sysdate );

<<<<<<< HEAD
select *
  from money_charge_history;
=======

SELECT *
FROM MONEY_CHARGE_HISTORY;
>>>>>>> 02706d13cfda250fcb449d8a7307b6f65bbc423a

select *
  from money_charge_method;


-- [2] 머니 충전 (2번 사용자가 경매 참여를 위해 50만 원 충전)
insert into money_charge_history (
   money_charge_id,
   user_id,
   money_charge_method_id,
   charge_amount
) values ( money_charge_seq.nextval,
           2,
           2,
           500000 ); -- 신용카드로 50만 원 충전

select *
  from money_charge_history;


-- [3] 상품 등록 (1번 사용자가 핫토이 아이언맨 피규어 등록)
-- 범례: 최상(1), 애니메이션(3), 중(2), Y(1), N(0)
insert into product (
   product_id,
   product_release_name,
   product_alias,
   user_id,
   manufacturer_id,
   product_grade_id,
   product_genre_id,
   product_size_id,
   work_name,
   character_name,
   is_opened,
   is_parts_missing,
   descriptions,
   image_path_1,
   image_path_2,
   image_path_3,
   is_public
) values ( product_seq.nextval,
           'Hot Toys Iron Man Mark 85',
           '핫토이 마크85',
           1,
           12,
           1,
           1,
           1,
           '어벤져스: 엔드게임',
           '아이언맨',
           1,
           0,
           '단순 개봉 풀박스입니다. 상태 매우 좋습니다.',
           'images/ironman_1.png',
           'images/ironman_2.png',
           'images/ironman_3.png',
           1 );




-- [4] 추가 이미지 등록 (PRODUCT_IMAGE 테이블 활용)
-- 상품 상세컷 
insert into product_image (
   product_image_id,
   product_id,
   image_order,
   file_path
) values ( product_image_seq.nextval,
           product_seq.currval,
           1,
           'images/ironman_4.png' );

-- 상품 상세컷 2 
insert into product_image (
   product_image_id,
   product_id,
   image_order,
   file_path
) values ( product_image_seq.nextval,
           product_seq.currval,
           2,
           'images/ironman_5.png' );


-- 상품 상세 조
select p.*,
       max(decode(
          pi.image_order,
          1,
          pi.file_path
       )) as photo_1,
       max(decode(
          pi.image_order,
          2,
          pi.file_path
       )) as photo_2
  from product p
  left join product_image pi
on p.product_id = pi.product_id
 group by p.product_id,
          p.product_release_name,
          p.product_alias,
          p.user_id,
          p.manufacturer_id,
          p.product_grade_id,
          p.product_genre_id,
          p.product_size_id,
          p.work_name,
          p.character_name,
          p.purchase_datetime,
          p.is_opened,
          p.is_parts_missing,
          p.descriptions,
          p.image_path_1,
          p.image_path_2,
          p.image_path_3,
          p.is_public,
          p.created_at;



-- [4] 경매 등록 (등록한 상품을 7일간 경매 진행)
-- 범례: 7일(7)
insert into auction_registration (
   auction_id,
   product_id,
   auction_title,
   auction_content,
   start_price,
   created_at,
   auction_period_id
) values ( auction_seq.nextval,
           product_seq.currval,
           '핫토이 마크85 풀구성 급처합니다',
           '전시만 했던 상품입니다.',
           300000,
           sysdate,
           7 );

select *
  from auction_registration;

-- [5] 입찰 참여 (2번 사용자가 35만 원에 입찰)
insert into auction_bid_participation (
   bid_id,
   auction_id,
   user_id,
   bid_price
) values ( bid_seq.nextval,
           auction_seq.currval,
           2,
           350000 );

select *
  from auction_bid_participation;




-- 샘플 데이터 생성 ============================================================