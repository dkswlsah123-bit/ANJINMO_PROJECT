select user
  from dual;

-- ○ 1. 회원가입 생성 프로시저
-- 회원 가입 시 회원 고유키, 회원 계정, 회원 정보, 회원 계정이벤트 이력 등에 이력 추가
create or replace procedure prc_user_signup (
   p_user_login_id       in varchar2,
   p_user_password       in varchar2,
   p_user_password_check in varchar2,
   p_user_name           in varchar2,
   p_user_ssn            in char,
   p_user_email          in varchar2,
   p_user_phone          in char,
   p_user_zipcode        in varchar2,
   p_user_address        in varchar2,
   p_user_address_detail in varchar2
) is
   v_has_id  number(1);
   v_has_ssn number(1);
   v_birth   date;
   v_age     number(3);
   err_duplicate_id exception;
   err_duplicate_ssn exception;
   err_invalid_ssn exception;
   err_invalid_format_length exception;
   err_underage exception;
   err_wrong_pwd exception;
   err_invalid_email exception;
   err_null_value exception;
begin
-- NULL 검사
   if ( p_user_login_id is null
   or p_user_password is null
   or p_user_password is null
   or p_user_name is null
   or p_user_ssn is null
   or p_user_ssn is null
   or p_user_email is null
   or p_user_phone is null
   or p_user_zipcode is null
   or p_user_address is null
   or p_user_address_detail is null ) then
      raise err_null_value;
   end if;

-- 아이디 중복 검사
   select count(*)
     into v_has_id
     from user_account
    where user_login_id = p_user_login_id;

   if ( v_has_id != 0 ) then
      raise err_duplicate_id;
   end if;
    
-- 아이디 조건 검사(4글자이상 12자이하)
   if ( length(p_user_login_id) < 4
   or length(p_user_login_id) > 12 ) then
      raise err_invalid_format_length;
   end if;

-- 비밀번호 조건 검사(8자이상 16자이하)
   if ( length(p_user_password) < 8
   or length(p_user_password) > 16 ) then
      raise err_invalid_format_length;
   end if;
    
-- 비밀번호 확인
   if ( p_user_password != p_user_password_check ) then
      raise err_wrong_pwd;
   end if;
    
-- 주민번호 유효성 검사
   if not regexp_like(
      p_user_ssn,
      '^[0-9]{6}[1-4][0-9]{6}$'
   ) then
      raise err_invalid_ssn;
   end if;
    
-- 주민번호 중복 검사
   select count(*)
     into v_has_ssn
     from user_profile
    where user_ssn = p_user_ssn;

   if ( v_has_ssn != 0 ) then
      raise err_duplicate_ssn;
   end if;

-- 주민번호 미성년자 제외 검사
   v_birth := to_date (
      case
         when substr(
            p_user_ssn,
            7,
            1
         ) in ( '3',
                '4' ) then
            '20'
         else
            '19'
      end
      || substr(
      p_user_ssn,
      1,
      6
   ),
   'YYYYMMDD' );

   v_age := trunc(months_between(
      sysdate,
      v_birth
   ) / 12);
   if ( v_age < 19 ) then
      raise err_underage;
   end if;

-- 이메일 유효성 검사
    -- ^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$
   if not regexp_like(
      p_user_email,
      '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'
   ) then
      raise err_invalid_email;
   end if;

-- 1. USERS INSERT
   insert into users values ( users_seq.nextval );
    
-- 2. USER_ACCOUNT INSERT
   insert into user_account values ( users_seq.currval,
                                     p_user_login_id,
                                     p_user_password );

-- 3. USER_PROFILE INSERT
   insert into user_profile values ( users_seq.currval,
                                     p_user_name,
                                     p_user_ssn,
                                     p_user_email,
                                     p_user_phone,
                                     p_user_zipcode,
                                     p_user_address,
                                     p_user_address_detail );
    

      
-- 4. ACCOUNT_EVENT_HISTORY INSERT
   insert into account_event_history values ( account_event_history_seq.nextval,
                                              users_seq.currval,
                                              1,
                                              sysdate );

-- 예외 처리
exception
   when err_duplicate_id then
      rollback;
      raise_application_error(
         -20001,
         '이미 존재하는 아이디입니다.'
      );
   when err_duplicate_ssn then
      rollback;
      raise_application_error(
         -20002,
         '이미 존재하는 주민등록번호입니다.'
      );
   when err_invalid_ssn then
      rollback;
      raise_application_error(
         -20003,
         '유효하지 않은 주민등록번호입니다.'
      );
   when err_invalid_format_length then
      rollback;
      raise_application_error(
         -20005,
         '입력 범위가 맞지 않습니다.'
      );
   when err_underage then
      rollback;
      raise_application_error(
         -20006,
         '미성년자입니다.'
      );
   when err_wrong_pwd then
      rollback;
      raise_application_error(
         -20007,
         '비밀번호가 일치하지 않습니다.'
      );
   when err_invalid_email then
      rollback;
      raise_application_error(
         -20008,
         '올바른 이메일 형식이 아닙니다.'
      );
   when err_null_value then
      rollback;
      raise_application_error(
         -20014,
         '필수 입력 항목이 누락되었습니다.'
      );
end;
/
-- Procedure PRC_USER_SIGNUP이(가) 컴파일되었습니다.


-- ○ 3. 특정 경매코드에 대해 현재 마감기한이 지났는지 확인하는 함수
--      진행중: 0, 마감: 1, 에러: -1
create or replace function fn_is_auction_finished (
   p_auction_id in auction_registration.auction_id%type
) return number is
   v_start_date     date;
   v_auction_period number;
   v_result         number;
begin
    -- 경매 테이블에서 등록시간과 경매기간 조회
   select ar.created_at,
          to_number(regexp_replace(
             ap.auction_period_name,
             '[^0-9]',
             ''
          ))
     into
      v_start_date,
      v_auction_period
     from auction_registration ar
     join auction_period ap
   on ap.auction_period_id = ar.auction_period_id
    where ar.auction_id = p_auction_id;

   if ( sysdate < ( v_start_date + v_auction_period ) ) then
      return 0;   -- 경매 중
   else
      return 1;   -- 경매 종료
   end if;

exception
   when no_data_found then
      return -1; --(경매 정보가 없는 경우에 대한 예외 처리)
   when others then
      return -1;
end;
/
--Function FN_IS_AUCTION_FINISHED이(가) 컴파일되었습니다.

create or replace function fn_get_auction_due_date (
   p_auction_id in auction_registration.auction_id%type
) return varchar2 is
   v_start_date     date;
   v_auction_period number;
begin
    -- 경매 테이블에서 등록시간과 경매기간 조회
   select ar.created_at,
          to_number(regexp_replace(
             ap.auction_period_name,
             '[^0-9]',
             ''
          ))
     into
      v_start_date,
      v_auction_period
     from auction_registration ar
     join auction_period ap
   on ap.auction_period_id = ar.auction_period_id
    where ar.auction_id = p_auction_id;


   return to_char(
      v_start_date + v_auction_period,
      'YYYY-MM-DD HH24:MI'
   );
exception
   when no_data_found then
      return '-';
   when others then
      return '-';
end;
/
-- Function FN_GET_AUCTION_DUE_DATE이(가) 컴파일되었습니다.


-- ○ 4. 회원 잔여 머니 조회 함수
create or replace function fn_get_user_money_balance (
   p_user_id in users.user_id%type
) return number is
   v_money1 number;
   v_money2 number;
begin

-- 머니입출금이력테이블에서 아이디로 조회해서 금액 계산한 값 +
-- 머니 충전 이력 테이블에서 아이디로 조회해서 금액 계산한 값

   select nvl(
      sum(amount),
      0
   )
     into v_money1
     from money_transaction_history
    where user_id = p_user_id;

   select nvl(
      sum(charge_amount),
      0
   )
     into v_money2
     from money_charge_history
    where user_id = p_user_id;

   return v_money1 + v_money2;
exception
   when others then
      return -1;
end;
--Function FN_GET_USER_MONEY_BALANCE이(가) 컴파일되었습니다.







-- ○ 2. 회원탈퇴 프로시저
-- 회원 탈퇴 클릭 시, 회원 상세 정보 테이블에 있는 정보를 회원 탈퇴 테이블에 INSERT, 회원 계정 이벤트 이력에 INSERT
-- 진행 중인 경매가 있는지 확인, 진행 중인 입찰이 있는지 확인, 진행중인 낙찰이 있는지 확인, 잔여머니가 있는지 확인
-- 
create or replace procedure prc_user_delete (
   p_user_id in users.user_id%type
) is
     -- 커서 정의 (경매테이블)
   cursor cur_user_auction is
   select ar.auction_id
     from auction_registration ar
     join product p
   on ar.product_id = p.product_id
    where p.user_id = p_user_id;

   cursor cur_user_bid is
   select ar.auction_id
     from auction_registration ar
     join auction_bid_participation abp
   on abp.auction_id = ar.auction_id
    where abp.user_id = p_user_id;

   v_auction_id    auction_registration.auction_id%type;
   v_bid_result_id auction_winning_result.bid_result_id%type;
   v_has_bid       number;
   v_has_bid_2     number;
   v_penalty_score number;
   v_penalty_id    penalty_history.penalty_id%type;
   v_name          user_profile.user_name%type;
   v_ssn           user_profile.user_ssn%type;
   v_phone         user_profile.user_phone%type;
   v_email         user_profile.user_email%type;
   v_zipcode       user_profile.user_zipcode%type;
   v_address       user_profile.user_address%type;
   v_detail        user_profile.user_address_detail%type;
   err_has_active_auction exception;
   err_has_active_bid exception;
   err_has_active_winning exception;
   err_has_money exception;
   err_has_penalty exception;
begin
    -- 진행 중인 경매 검사

   open cur_user_auction;
   loop
      fetch cur_user_auction into v_auction_id;
      exit when cur_user_auction%notfound;
      if ( fn_is_auction_finished(v_auction_id) = 0 ) then
         close cur_user_auction;
         raise err_has_active_auction;
      end if;
   end loop;
   close cur_user_auction;
        
    -- 진행 중인 입찰 검사
        -- 입찰 참여 테이블에서 USER_ID로 조회해서 나온 경매코드들로
        -- 그 경매코드가 진행중인지 검사

   open cur_user_bid;
   loop
      fetch cur_user_bid into v_auction_id;
      exit when cur_user_bid%notfound;
      if ( fn_is_auction_finished(v_auction_id) = 0 ) then
         close cur_user_bid;
         raise err_has_active_bid;
      end if;
   end loop;
   close cur_user_bid;

        -- 진행 중인 낙찰 검사
   select count(*)
     into v_has_bid
     from auction_winning_result awr
     join auction_bid_participation abp
   on awr.bid_id = abp.bid_id
    where abp.user_id = p_user_id
      and awr.bid_result_id not in (
      select bid_result_id
        from bid_failure_history
   ) -- 실패 이력 없고
      and awr.bid_result_id not in ( -- 거래 완료 이력도 없는 것 카운트
      select bid_result_id
        from auction_winning_payment awp
        join delivery_completed dc
      on awp.payment_id = dc.payment_id
        join purchase_confirm_history pch
      on dc.shipping_id = pch.shipping_id
        join transaction_completed tc
      on pch.purchase_confirm_id = tc.purchase_confirm_id
   );

   if v_has_bid > 0 then
      raise err_has_active_winning;
   end if;
        
    -- 잔여머니가 있는지
   if ( fn_get_user_money_balance(p_user_id) > 0 ) then
      raise err_has_money;
   end if;
    
    -- 회원의 상태가 영구정지 상태인지
   select nvl(
      sum(penalty_score),
      0
   )
     into v_penalty_score
     from penalty_history
    where user_id = p_user_id
      and penalty_id not in (
      select penalty_id
        from penalty_cancel
   );

   if v_penalty_score >= 4 then
      raise err_has_penalty;
   end if;

    
    -- USER_PROFILE 조회
   select user_name,
          user_ssn,
          user_email,
          user_phone,
          user_zipcode,
          user_address,
          user_address_detail
     into
      v_name,
      v_ssn,
      v_email,
      v_phone,
      v_zipcode,
      v_address,
      v_detail
     from user_profile
    where user_id = p_user_id;

    -- DELETED_USER INSERT
   insert into deleted_user (
      user_id,
      user_name,
      user_ssn,
      user_email,
      user_phone,
      user_zipcode,
      user_address,
      user_address_detail
   ) values ( p_user_id,
              v_name,
              v_ssn,
              v_email,
              v_phone,
              v_zipcode,
              v_address,
              v_detail );
    
    -- USER_PROFILE DELETE
   delete from user_profile
    where user_id = p_user_id;

    -- ACCOUNT_EVENT_HISTORY INSERT
   insert into account_event_history values ( account_event_history_seq.nextval,
                                              p_user_id,
                                              2,
                                              sysdate );

exception
   when err_has_active_auction then
      rollback;
      raise_application_error(
         -20016,
         '진행 중인 경매가 존재합니다.'
      );
   when err_has_active_bid then
      rollback;
      raise_application_error(
         -20026,
         '진행 중인 입찰이 존재합니다.'
      );
   when err_has_active_winning then
      rollback;
      raise_application_error(
         -20027,
         '진행 중인 낙찰이 존재합니다.'
      );
   when err_has_penalty then
      rollback;
      raise_application_error(
         -20028,
         '영구정지 회원은 탈퇴가 불가능합니다.'
      );
   when err_has_money then
      rollback;
      raise_application_error(
         -20029,
         '잔여머니가 존재합니다.'
      );
end;
/


-- 뷰 목록 ======================================================================

-- 1. 회원 정보 조회 뷰 VW_USER_INFO
<<<<<<< HEAD

create or replace view vw_user_info as
   select u.user_id,
          ua.user_login_id,
          ua.user_password,
          up.user_name,
          up.user_ssn,
          up.user_email,
          up.user_phone,
          up.user_zipcode,
          up.user_address,
          up.user_address_detail,
          fn_get_user_money_balance(u.user_id) as total_money
     from users u
     join user_account ua
   on u.user_id = ua.user_id
     join user_profile up
   on ua.user_id = up.user_id;

select *
  from vw_user_info;
/

-- 2. 상품 통합 조회  VW_PRODUCT_LIST

create or replace view vw_product_list as
   select p.product_id,
          p.user_id,
          p.manufacturer_id,
          pm.manufacturer_name,
          pm.product_country_id,
          pc.product_country_name,
          p.product_grade_id,
          pg.product_grade_name,
          p.product_genre_id,
          pgr.product_genre_name,
          p.product_size_id,
          ps.product_size_name,
          p.product_release_name,
          p.product_alias,
          p.work_name,
          p.character_name,
          p.purchase_datetime,
          case
             when p.is_opened = 0 then
                '개봉'
             else
                '미개봉'
          end as is_opened,
          case
             when p.is_parts_missing = 0 then
                '정상'
             else
                '누락'
          end as is_parts_missing,
          p.descriptions,
          p.image_path_1,
          p.image_path_2,
          p.image_path_3,
          max(decode(
             pi.image_order,
             1,
             pi.file_path
          )) as image_path_4,
          max(decode(
             pi.image_order,
             2,
             pi.file_path
          )) as image_path_5,
          max(decode(
             pi.image_order,
             3,
             pi.file_path
          )) as image_path_6,
          max(decode(
             pi.image_order,
             4,
             pi.file_path
          )) as image_path_7,
          max(decode(
             pi.image_order,
             5,
             pi.file_path
          )) as image_path_8,
          max(decode(
             pi.image_order,
             6,
             pi.file_path
          )) as image_path_9,
          max(decode(
             pi.image_order,
             7,
             pi.file_path
          )) as image_path_10,
          case
             when p.is_public = 0 then
                '비공개'
             else
                '공개'
          end as is_public,
          to_char(
             p.created_at,
             'YYYY-MM-DD'
          ) as created_at
     from product p
     join product_manufacturer pm
   on p.manufacturer_id = pm.manufacturer_id
     join product_country pc
   on pm.product_country_id = pc.product_country_id
     join product_grade pg
   on p.product_grade_id = pg.product_grade_id
     join product_genre pgr
   on p.product_genre_id = pgr.product_genre_id
     join product_size ps
   on p.product_size_id = ps.product_size_id
     left join product_image pi
   on p.product_id = pi.product_id
    group by p.product_id,
             p.user_id,
             p.manufacturer_id,
             pm.manufacturer_name,
             pm.product_country_id,
             pc.product_country_name,
             p.product_grade_id,
             pg.product_grade_name,
             p.product_genre_id,
             pgr.product_genre_name,
             p.product_size_id,
             ps.product_size_name,
             p.product_release_name,
             p.product_alias,
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
=======
CREATE OR REPLACE VIEW VW_USER_INFO
AS
SELECT U.USER_ID, UA.USER_LOGIN_ID, UA.USER_PASSWORD
, UP.USER_NAME, UP.USER_SSN, UP.USER_EMAIL, UP.USER_PHONE
, UP.USER_ZIPCODE, UP.USER_ADDRESS, UP.USER_ADDRESS_DETAIL
, FN_GET_USER_MONEY_BALANCE(U.USER_ID) AS TOTAL_MONEY
FROM USERS U JOIN USER_ACCOUNT UA
ON U.USER_ID = UA.USER_ID
JOIN USER_PROFILE UP
ON UA.USER_ID = UP.USER_ID;

SELECT *
FROM VW_USER_INFO;
/

-- 2. 상품 통합 조회  VW_PRODUCT_LIST
CREATE OR REPLACE VIEW VW_PRODUCT_LIST
AS
SELECT 
    P.PRODUCT_ID, P.USER_ID, P.MANUFACTURER_ID, PM.MANUFACTURER_NAME, PM.PRODUCT_COUNTRY_ID, PC.PRODUCT_COUNTRY_NAME
    , P.PRODUCT_GRADE_ID, PG.PRODUCT_GRADE_NAME, P.PRODUCT_GENRE_ID, PGR.PRODUCT_GENRE_NAME, P.PRODUCT_SIZE_ID, PS.PRODUCT_SIZE_NAME
    , P.PRODUCT_RELEASE_NAME, P.PRODUCT_ALIAS, P.WORK_NAME, P.CHARACTER_NAME, P.PURCHASE_DATETIME
    ,CASE WHEN P.IS_OPENED = 0 THEN '개봉' ELSE '미개봉' END AS IS_OPENED
    ,CASE WHEN P.IS_PARTS_MISSING = 0 THEN '정상' ELSE '누락' END AS IS_PARTS_MISSING
    ,P.DESCRIPTIONS
    ,P.IMAGE_PATH_1
    ,P.IMAGE_PATH_2
    ,P.IMAGE_PATH_3
    ,MAX(DECODE(PI.IMAGE_ORDER, 1, PI.FILE_PATH)) AS IMAGE_PATH_4
    ,MAX(DECODE(PI.IMAGE_ORDER, 2, PI.FILE_PATH)) AS IMAGE_PATH_5
    ,MAX(DECODE(PI.IMAGE_ORDER, 3, PI.FILE_PATH)) AS IMAGE_PATH_6
    ,MAX(DECODE(PI.IMAGE_ORDER, 4, PI.FILE_PATH)) AS IMAGE_PATH_7
    ,MAX(DECODE(PI.IMAGE_ORDER, 5, PI.FILE_PATH)) AS IMAGE_PATH_8
    ,MAX(DECODE(PI.IMAGE_ORDER, 6, PI.FILE_PATH)) AS IMAGE_PATH_9
    ,MAX(DECODE(PI.IMAGE_ORDER, 7, PI.FILE_PATH)) AS IMAGE_PATH_10
    ,CASE WHEN P.IS_PUBLIC = 0 THEN '비공개' ELSE '공개' END AS IS_PUBLIC
    ,TO_CHAR(P.CREATED_AT, 'YYYY-MM-DD') AS CREATED_AT
FROM PRODUCT P
    JOIN PRODUCT_MANUFACTURER PM ON P.MANUFACTURER_ID = PM.MANUFACTURER_ID
    JOIN PRODUCT_COUNTRY PC      ON PM.PRODUCT_COUNTRY_ID = PC.PRODUCT_COUNTRY_ID
    JOIN PRODUCT_GRADE PG        ON P.PRODUCT_GRADE_ID = PG.PRODUCT_GRADE_ID
    JOIN PRODUCT_GENRE PGR       ON P.PRODUCT_GENRE_ID = PGR.PRODUCT_GENRE_ID
    JOIN PRODUCT_SIZE PS         ON P.PRODUCT_SIZE_ID = PS.PRODUCT_SIZE_ID
    LEFT JOIN PRODUCT_IMAGE PI   ON P.PRODUCT_ID = PI.PRODUCT_ID
GROUP BY 
    P.PRODUCT_ID, P.USER_ID,
    P.MANUFACTURER_ID, PM.MANUFACTURER_NAME, PM.PRODUCT_COUNTRY_ID, PC.PRODUCT_COUNTRY_NAME, 
    P.PRODUCT_GRADE_ID, PG.PRODUCT_GRADE_NAME,
    P.PRODUCT_GENRE_ID, PGR.PRODUCT_GENRE_NAME, 
    P.PRODUCT_SIZE_ID, PS.PRODUCT_SIZE_NAME, 
    P.PRODUCT_RELEASE_NAME, P.PRODUCT_ALIAS, P.WORK_NAME, P.CHARACTER_NAME,
    P.PURCHASE_DATETIME, P.IS_OPENED, P.IS_PARTS_MISSING, P.DESCRIPTIONS,
    P.IMAGE_PATH_1, P.IMAGE_PATH_2, P.IMAGE_PATH_3, P.IS_PUBLIC, P.CREATED_AT;
>>>>>>> 02706d13cfda250fcb449d8a7307b6f65bbc423a
    
    





-- 뷰	경매 목록 조회 뷰	VW_AUCTION_LIST
/*
CREATE OR REPLACE VIEW VW_AUCTION_LIST
AS
SELECT 
    AR.AUCTION_ID, AR.AUCTION_TITLE, AR.AUCTION_CONTENT, AR.START_PRICE,
    AR.AUCTION_PERIOD_ID, AP.AUCTION_PERIOD_NAME,
    TO_CHAR(AR.CREATED_AT, 'YYYY-MM-DD HH24:MI') AS AUCTION_START_DATE,
    FN_GET_AUCTION_DUE_DATE(AR.AUCTION_ID) AS AUCTION_END_DATE,
    CASE WHEN FN_IS_AUCTION_FINISHED(AR.AUCTION_ID) = 0 THEN '경매 진행중'
        ELSE '경매 마감' 
        END AS IS_FINISHED,
    VPI.PRODUCT_ID, VPI.PRODUCT_RELEASE_NAME, VPI.PRODUCT_ALIAS,
    VPI.MANUFACTURER_NAME, VPI.PRODUCT_GRADE_NAME, VPI.IMAGE_PATH_1,
    (
        SELECT BID_PRICE
        FROM (
            SELECT BID_PRICE, 
                   ROW_NUMBER() OVER (ORDER BY BID_PRICE DESC, CREATED_AT ASC) AS RANK
            FROM AUCTION_BID_PARTICIPATION
            WHERE AUCTION_ID = AR.AUCTION_ID
        )
        WHERE RANK = 2
    ) AS BID_CURRENT_PRICE, 
    (SELECT MAX(BID_PRICE) FROM AUCTION_BID_PARTICIPATION WHERE AUCTION_ID = AR.AUCTION_ID) AS BID_MAX_PRICE,
    (SELECT COUNT(*) FROM AUCTION_BID_PARTICIPATION WHERE AUCTION_ID = AR.AUCTION_ID) AS BID_COUNT
FROM AUCTION_REGISTRATION AR
    JOIN VW_PRODUCT_LIST VPI ON AR.PRODUCT_ID = VPI.PRODUCT_ID
    JOIN AUCTION_PERIOD AP   ON AR.AUCTION_PERIOD_ID = AP.AUCTION_PERIOD_ID
;
*/

create or replace view vw_auction_list as
   with bid_rank as (
      select auction_id,
             bid_price,
             row_number()
             over(partition by auction_id
                  order by bid_price desc,
                           bid_time asc
             ) as rk
        from auction_bid_participation
   )
   select ar.auction_id,
          ar.auction_title,
          ar.auction_content,
          ar.start_price,
          ar.auction_period_id,
          ap.auction_period_name,
          to_char(
             ar.created_at,
             'YYYY-MM-DD HH24:MI'
          ) as auction_start_date,
          fn_get_auction_due_date(ar.auction_id) as auction_end_date,
          case
             when fn_is_auction_finished(ar.auction_id) = 0 then
                '경매 진행중'
             else
                '경매 마감'
          end as is_finished,
          vpi.product_id,
          vpi.product_release_name,
          vpi.product_alias,
          vpi.manufacturer_name,
          vpi.product_grade_name,
          vpi.image_path_1,
          nvl(
             (
                select bid_price
                  from bid_rank
                 where auction_id = ar.auction_id
                   and rk = 2
             ),
             ar.start_price
          ) as bid_current_price,
          (
             select bid_price
               from bid_rank
              where auction_id = ar.auction_id
                and rk = 1
          ) as bid_max_price,
          (
             select count(*)
               from bid_rank
              where auction_id = ar.auction_id
          ) as bid_count
     from auction_registration ar
     join vw_product_list vpi
   on ar.product_id = vpi.product_id
     join auction_period ap
   on ar.auction_period_id = ap.auction_period_id;

<<<<<<< HEAD
select *
  from vw_auction_list;
=======
CREATE OR REPLACE VIEW VW_AUCTION_LIST
AS
WITH BID_RANK AS (
    SELECT 
        AUCTION_ID, BID_PRICE,
        ROW_NUMBER() OVER (PARTITION BY AUCTION_ID ORDER BY BID_PRICE DESC, BID_TIME ASC) AS RK
    FROM AUCTION_BID_PARTICIPATION
)
SELECT 
    AR.AUCTION_ID, AR.AUCTION_TITLE, AR.AUCTION_CONTENT, AR.START_PRICE,
    AR.AUCTION_PERIOD_ID, AP.AUCTION_PERIOD_NAME,
    TO_CHAR(AR.CREATED_AT, 'YYYY-MM-DD HH24:MI') AS AUCTION_START_DATE,
    FN_GET_AUCTION_DUE_DATE(AR.AUCTION_ID) AS AUCTION_END_DATE,
    CASE WHEN FN_IS_AUCTION_FINISHED(AR.AUCTION_ID) = 0 THEN '진행중'
         ELSE '마감' 
    END AS IS_FINISHED,
    VPI.PRODUCT_ID, VPI.PRODUCT_RELEASE_NAME, VPI.PRODUCT_ALIAS,
    VPI.MANUFACTURER_NAME, VPI.PRODUCT_GRADE_NAME, VPI.IMAGE_PATH_1,
    NVL((SELECT BID_PRICE FROM BID_RANK WHERE AUCTION_ID = AR.AUCTION_ID AND RK = 2), AR.START_PRICE) AS BID_CURRENT_PRICE,
    (SELECT BID_PRICE FROM BID_RANK WHERE AUCTION_ID = AR.AUCTION_ID AND RK = 1) AS BID_MAX_PRICE,
    (SELECT COUNT(*) FROM BID_RANK WHERE AUCTION_ID = AR.AUCTION_ID) AS BID_COUNT
FROM AUCTION_REGISTRATION AR
JOIN VW_PRODUCT_LIST VPI ON AR.PRODUCT_ID = VPI.PRODUCT_ID
JOIN AUCTION_PERIOD AP   ON AR.AUCTION_PERIOD_ID = AP.AUCTION_PERIOD_ID;

SELECT *
FROM VW_AUCTION_LIST;
>>>>>>> 02706d13cfda250fcb449d8a7307b6f65bbc423a



-- 입찰 통합 뷰 (어떤 상품, 어떤 경매, 누가입찰, 입찰 순위, 입찰가, 
CREATE OR REPLACE VIEW VW_BID_LIST
AS
WITH BID_RANKING AS (
    -- 모든 입찰 기록에 대해 실시간 순위를 매김
    SELECT 
        BID_ID, AUCTION_ID, USER_ID, BID_PRICE, BID_TIME,
        ROW_NUMBER() OVER (PARTITION BY AUCTION_ID ORDER BY BID_PRICE DESC, BID_TIME ASC) AS RK
    FROM AUCTION_BID_PARTICIPATION
)
SELECT 
    BR.BID_ID, BR.BID_PRICE,
    TO_CHAR(BR.BID_TIME, 'YYYY-MM-DD HH24:MI:SS.FF3') AS BID_TIME,
    BR.RK AS BID_RANK,
    CASE WHEN BR.RK = 1 THEN '낙찰유력' 
         WHEN BR.RK >4 THEN '순위권'
        ELSE '입찰중' END AS BID_STATUS,
    BR.USER_ID AS BIDDER_ID, UP.USER_ID , UA.USER_LOGIN_ID,
    AR.AUCTION_ID, AR.AUCTION_TITLE, AR.START_PRICE,
    FN_GET_AUCTION_DUE_DATE(AR.AUCTION_ID) AS AUCTION_END_DATE,
    CASE WHEN FN_IS_AUCTION_FINISHED(AR.AUCTION_ID) = 0 THEN '진행중' ELSE '마감' END AS AUCTION_STATUS,
    VPL.PRODUCT_ID, VPL.PRODUCT_RELEASE_NAME, VPL.MANUFACTURER_NAME,
    NVL(
        (SELECT BID_PRICE FROM BID_RANKING WHERE AUCTION_ID = AR.AUCTION_ID AND RK = 2),
        AR.START_PRICE
    ) AS CURRENT_PRICE
FROM BID_RANKING BR
JOIN AUCTION_REGISTRATION AR ON BR.AUCTION_ID = AR.AUCTION_ID
JOIN USER_PROFILE UP ON BR.USER_ID = UP.USER_ID
JOIN USER_ACCOUNT UA ON UP.USER_ID = UA.USER_ID
JOIN VW_PRODUCT_LIST VPL ON AR.PRODUCT_ID = VPL.PRODUCT_ID;

SELECT *
FROM VW_BID_LIST;




--CREATE OR REPLACE VIEW VW_PENALTY_LIST
--AS
--SELECT 
--    PH.USER_ID, PH.PENALTY_ID, PH.PENALTY_SCORE,
--    FN_GET_USER_PENALTY_SCORE(PH.USER_ID) AS TOTAL_SCORE,
--    TO_CHAR(PS.PENALTY_START_DATE, 'YYYY-MM-DD HH24:MI') AS START_DATE,
--    TO_CHAR(PS.PENALTY_END_DATE, 'YYYY-MM-DD HH24:MI') AS END_DATE,
--    CASE WHEN PS.PENALTY_END_DATE > SYSDATE THEN 'Y' ELSE 'N' END AS IS_CURRENTLY_BANNED,
--    CASE WHEN PC.PENALTY_ID IS NOT NULL THEN 'Y' ELSE 'N' END AS IS_CANCEL
--FROM PENALTY_HISTORY PH
--     JOIN PENALTY_STATUS PS ON PH.PENALTY_ID = PS.PENALTY_ID
--     JOIN PENALTY_CANCEL PC ON PH.PENALTY_ID = PC.PENALTY_ID;
--     
--SELECT *
--FROM VW_PENALTY_LIST;


CREATE OR REPLACE VIEW VW_PENALTY_LIST
AS
WITH RAW_HISTORY AS (
    SELECT 
        PH.USER_ID, PH.PENALTY_ID, PH.PENALTY_SCORE, PH.CREATED_AT,
        SUM(CASE WHEN PC.PENALTY_ID IS NULL THEN PH.PENALTY_SCORE ELSE 0 END) 
            OVER (PARTITION BY PH.USER_ID ORDER BY PH.CREATED_AT ASC) AS ACCUMULATED_SCORE,
        PC.PENALTY_ID AS CANCEL_ID, PC.CANCEL_REASON
    FROM PENALTY_HISTORY PH
    LEFT JOIN PENALTY_CANCEL PC ON PH.PENALTY_ID = PC.PENALTY_ID
)
SELECT 
    RH.USER_ID, RH.PENALTY_ID, RH.PENALTY_SCORE AS GIVEN_SCORE,
    RH.ACCUMULATED_SCORE AS ACCUMULATED_SCORE,
    FN_GET_USER_PENALTY_SCORE(RH.USER_ID) AS TOTAL_SCORE,
    CASE 
        WHEN RH.CANCEL_ID IS NOT NULL THEN '취소'
        WHEN RH.ACCUMULATED_SCORE = 1 THEN '경고'
        WHEN RH.ACCUMULATED_SCORE = 2 THEN '7일 정지'
        WHEN RH.ACCUMULATED_SCORE = 3 THEN '30일 정지'
        WHEN RH.ACCUMULATED_SCORE >= 4 THEN '영구 정지'
        ELSE '정상'
    END AS PENALTY_STATUS,
    TO_CHAR(PS.PENALTY_START_DATE, 'YYYY-MM-DD HH24:MI') AS START_DATE,
    TO_CHAR(PS.PENALTY_END_DATE, 'YYYY-MM-DD HH24:MI') AS END_DATE,
    CASE 
        WHEN RH.CANCEL_ID IS NOT NULL THEN '취소완료'
        WHEN PS.PENALTY_END_DATE < SYSDATE THEN '기간만료'
        ELSE '제재 중'
    END AS HISTORY_STATUS
FROM RAW_HISTORY RH
LEFT JOIN PENALTY_STATUS PS ON RH.PENALTY_ID = PS.PENALTY_ID;


SELECT *
FROM VW_PENALTY_LIST;



CREATE OR REPLACE VIEW VW_AUCTION_BID_RANK
AS
SELECT 
    AUCTION_ID, USER_ID, BID_PRICE, 
    TO_CHAR(BID_TIME, 'YYYY-MM-DD HH24:MI:SS.FF3') AS BID_TIME,
    ROW_NUMBER() OVER (PARTITION BY AUCTION_ID ORDER BY BID_PRICE DESC, BID_TIME ASC) AS CURRENT_RANK,
    COUNT(*) OVER (PARTITION BY AUCTION_ID) AS TOTAL_BIDDERS
FROM AUCTION_BID_PARTICIPATION;

-- VW_MONEY_HISTORY

CREATE OR REPLACE VIEW VW_MONEY_HISTORY
AS
SELECT 
    USER_ID,
    '충전' AS TRANSACTION_TYPE, 
    CHARGE_AMOUNT AS AMOUNT,     
    TO_CHAR(CHARGED_AT, 'YYYY-MM-DD HH24:MI:SS') AS TRANSACTION_DATE,
    MCM.MONEY_CHARGE_METHOD_NAME AS DESCRIPTION 
FROM MONEY_CHARGE_HISTORY MCH
JOIN MONEY_CHARGE_METHOD MCM ON MCH.MONEY_CHARGE_METHOD_ID = MCM.MONEY_CHARGE_METHOD_ID
UNION ALL
SELECT 
    USER_ID,
    MT.MONEY_TYPE_NAME AS TRANSACTION_TYPE, 
    AMOUNT,                 
    TO_CHAR(CREATED_AT, 'YYYY-MM-DD HH24:MI:SS') AS TRANSACTION_DATE,
    MT.MONEY_TYPE_NAME AS DESCRIPTION     
FROM MONEY_TRANSACTION_HISTORY MTH
JOIN MONEY_TYPE MT ON MTH.MONEY_TYPE_ID = MT.MONEY_TYPE_ID;




-- 뷰 목록 ======================================================================


CREATE OR REPLACE VIEW VW_AUCTION_URGENT_LIST
AS
SELECT VA.AUCTION_ID, VA.AUCTION_TITLE, VA.IMAGE_PATH_1, VA.BID_CURRENT_PRICE, UA.USER_LOGIN_ID, VA.AUCTION_END_DATE
   , ROW_NUMBER() OVER(ORDER BY VA.AUCTION_END_DATE DESC) AS RK
FROM VW_AUCTION_LIST VA 
    JOIN PRODUCT P ON VA.PRODUCT_ID = P.PRODUCT_ID
    JOIN USER_ACCOUNT UA ON P.USER_ID = UA.USER_ID
WHERE TO_DATE(AUCTION_END_DATE,'YYYY-MM-DD HH24:MI:SS') > SYSDATE;



--ROW_NUMBER() OVER (PARTITION BY AUCTION_ID ORDER BY BID_PRICE DESC, BID_TIME ASC) AS RK



SELECT *
FROM VW_AUCTION_LIST;

-- 낙찰 입찰코드 조회 함수
-- 경매 마감이 된 건에 대해 auction_id, 입찰테이블을 줄세우기해서 1위 뽑아내기
CREATE OR REPLACE FUNCTION FN_GET_WINNING_BID_ID
( P_AUCTION_ID IN NUMBER
)
RETURN NUMBER
IS
    V_WINNIG_ID NUMBER;
BEGIN
    SELECT BID_ID INTO V_WINNIG_ID
    FROM VW_BID_LIST
    WHERE AUCTION_ID = P_AUCTION_ID AND BID_RANK = 1;
    
    RETURN V_WINNIG_ID;
    
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN -1;
        WHEN OTHERS THEN
            RETURN -1;

END;

SELECT *
FROM VW_BID_LIST;



-- 낙찰 실패 처리 프로시저
-- 낙찰결과테이블에서 낙찰결과코드가 유효한지 확인
-- 낙찰결과코드를 보고 언제 등록됐는지 확인 후
-- 낙찰 포기 눌렀을 때나 
-- 24시간이 지났으면서 낙찰입금테이블에 낙찰결과코드가 없다면
-- 낙찰 실패 이력에 insert






-- 신고 처리 프로시저
-- 신고 신청 테이블이 생성되면 그 목록을 보고 관리자가 처리를 한다
-- 신고신청코드(FK)
--관리자계정번호(FK)
--신고처리결과코드(FK)
--처리사유
--처리일자
-- 신고처리 결과 코드에 따라 승인이라면 신고 신청 코드를 가지고 신고대상코드가 상품이라면 상품테이블조회
-- 경매라면 신고경매테이블을 조회해서 각각의 코드에 따라가서 유저 아이디를 찾는다
-- 그리고 패널티 부여를 함(패널티 부여 프로시저)
-- 반려라면 그냥 인서트하고 끝
CREATE OR REPLACE PROCEDURE PRC_REPORT_PROCESS
(P_REPORT_SUBMISSION_ID IN REPORT_SUBMISSION.REPORT_SUBMISSION_ID%TYPE
, P_ADMIN_ACCOUNT_ID    IN ADMIN_ACCOUNT.ADMIN_ACCOUNT_ID%TYPE
, P_REPORT_RESULT_ID    IN REPORT_RESULT.REPORT_RESULT_ID%TYPE
, P_PROCESSED_REASON    IN REPORT_PROCESS.PROCESS_REASON%TYPE
)
IS
    V_TARGET_ID NUMBER;
    V_PRODUCT_ID PRODUCT.PRODUCT_ID%TYPE;
    V_AUCTION_ID AUCTION_REGISTRATION.AUCTION_ID%TYPE;
    V_USER_ID USERS.USER_ID%TYPE;
BEGIN
  
    IF (P_REPORT_RESULT_ID = 1) THEN
    
        SELECT REPORT_TARGET_ID INTO V_TARGET_ID
        FROM REPORT_SUBMISSION
        WHERE REPORT_SUBMISSION_ID = P_REPORT_SUBMISSION_ID;
        
        IF (V_TARGET_ID = 1) THEN
            
            SELECT PRODUCT_ID INTO V_PRODUCT_ID
            FROM PRODUCT_REPORT
            WHERE REPORT_SUBMISSION_ID = P_REPORT_SUBMISSION_ID;
            
            SELECT USER_ID INTO V_USER_ID
            FROM PRODUCT
            WHERE PRODUCT_ID = V_PRODUCT_ID;
            
        ELSIF (V_TARGET_ID = 2) THEN
        
            SELECT AUCTION_ID INTO V_AUCTION_ID
            FROM AUCTION_REPORT
            WHERE REPORT_SUBMISSION_ID = P_REPORT_SUBMISSION_ID;
            
            SELECT PRODUCT_ID INTO V_PRODUCT_ID
            FROM AUCTION_REGISTRATION
            WHERE AUCTION_ID = V_AUCTION_ID;
            
            SELECT USER_ID INTO V_USER_ID
            FROM PRODUCT
            WHERE PRODUCT_ID = V_PRODUCT_ID;
        END IF;
        
        -- 패널티 부여
        IF V_USER_ID IS NOT NULL THEN
            PRC_PENALTY_ASSIGN(V_USER_ID, P_ADMIN_ACCOUNT_ID, 1, 1);
        END IF;
    END IF;
    
    INSERT INTO REPORT_PROCESS(REPORT_PROCESS_ID, REPORT_SUBMISSION_ID, ADMIN_ACCOUNT_ID, REPORT_RESULT_ID, PROCESS_REASON, PROCESSED_AT)
    VALUES(REPORT_PROCESS_SEQ.NEXTVAL, P_REPORT_SUBMISSION_ID, P_ADMIN_ACCOUNT_ID, P_REPORT_RESULT_ID, P_PROCESSED_REASON, SYSDATE);
    
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20030, '해당 신고 내역이나 대상자를 찾을 수 없습니다.');
        WHEN OTHERS THEN
            ROLLBACK;
    
END;
/

DESC REPORT_PROCESS;




CREATE OR REPLACE PROCEDURE PRC_PENALTY_ASSIGN
( V_USER_ID             IN      USERS.USER_ID%TYPE
, V_ADMIN_ACCOUNT_ID    IN      ADMIN_ACCOUNT.ADMIN_ACCOUNT_ID%TYPE
, V_PENALTY_TYPE_ID     IN      PENALTY_HISTORY.PENALTY_SCORE%TYPE
, V_PENALTY_SCORE       IN      PENALTY_HISTORY.PENALTY_SCORE%TYPE
)
IS
	V_FLAG_ACTIVE_USER			CHAR(1);
	V_FLAG_BANNED_USER			CHAR(1);

	-- V_PENALTY_ID                PENALTY_HISTORY.PENALTY_ID%TYPE;
    V_TOTAL_PENALTY_SCORE       PENALTY_HISTORY.PENALTY_SCORE%TYPE;
    V_PENALTY_END_DATE          PENALTY_STATUS.PENALTY_END_DATE%TYPE;
    
    ERR_PENALTY_TO_DEACTIVATED_USER EXCEPTION;
    ERR_PENALTY_TO_BANNED_USER EXCEPTION;
    
BEGIN
	-- 회원 유효성 체크) 활동 회원인지 확인
	SELECT
		CASE WHEN EXISTS(SELECT 1 FROM USER_PROFILE WHERE USER_ID = V_USER_ID)
		     THEN 'Y'
		     
		     ELSE 'N'
		END INTO V_FLAG_ACTIVE_USER
	FROM DUAL;

	-- 활동하지 않는 회원이라면(=탈퇴한 회원이라면) 예외 발생 처리
	IF V_FLAG_ACTIVE_USER = 'N' THEN
		RAISE ERR_PENALTY_TO_DEACTIVATED_USER;
	END IF;
	

	-- 회원 유효성 체크) 영구 정지 처리된 회원이지 확인
	-- 유저의 현재 패널티 총점 확인
    SELECT SUM(PH.PENALTY_SCORE) INTO V_TOTAL_PENALTY_SCORE
    FROM PENALTY_HISTORY PH LEFT OUTER JOIN PENALTY_CANCEL PC
         ON PH.PENALTY_ID = PC.PENALTY_ID
    WHERE PH.USER_ID = V_USER_ID
      AND PENALTY_CANCEL_ID IS NULL;

	-- 영구 정지 점수(4점 이상)면 이미 영구 정지된 회원이므로 예외 발생
	IF V_TOTAL_PENALTY_SCORE >= 4 THEN
		RAISE ERR_PENALTY_TO_BANNED_USER;
	END IF;
	
	
	
	-- 회원 유효성 검사 이후) 패널티 부여 로직 수행
    -- 패널티 점수 부여
	--  ㄴ 패널티 점수 부여 후 정지 처리는 트리거로 수행
    INSERT INTO PENALTY_HISTORY (PENALTY_ID, USER_ID, PENALTY_TYPE_ID, ADMIN_ACCOUNT_ID, PENALTY_SCORE, CREATED_AT)
    VALUES (PENALTY_SEQ.NEXTVAL, V_USER_ID, V_PENALTY_TYPE_ID, V_ADMIN_ACCOUNT_ID, V_PENALTY_SCORE, SYSDATE);

	
	EXCEPTION
		-- 활동하지 않는 회원(=탈퇴 회원)에게 패널티 부여 시도
		WHEN ERR_PENALTY_TO_DEACTIVATED_USER
		THEN RAISE_APPLICATION_ERROR(-21000, '탈퇴한 회원에게는 패널티 부여가 불가능합니다.');
		
		-- 이미 영구정지된 회원에게 추가 패널티 부여 시도(=의미 없는 패널티 부여)
		WHEN ERR_PENALTY_TO_BANNED_USER
		THEN RAISE_APPLICATION_ERROR(-21001, '이미 영구 정지 처리된 회원에게는 추가 패널티 부여가 불가능합니다.');
		
		WHEN OTHERS
		THEN RAISE; -- 에러 전파 (ROLLBACK 은 프로시저 호출단에서 컨트롤)
END;






select *
from VW_USER_INFO;

SELECT *
FROM USER_PROFILE;


SELECT COUNT(*) AS COUNT
FROM USER_ACCOUNT
WHERE USER_LOGIN_ID = ? AND USER_PASSWORD;

UPDATE USER_PROFILE
SET USER_EMAIL = ? , USER_PHONE = ?, USER_ZIPCODE = ?, USER_ADDRESS =?, USER_ADDRESS_DETAIL = ?
WHERE USER_ID = ?
;

UPDATE USER_ACCOUNT
SET USER_PASSWORD = ?
WHERE USER_LOGIN_ID = ?
;

SELECT *
FROM USER_ACCOUNT;

SELECT *
FROM VW_PRODUCT_LIST;


SELECT COUNT(*) AS COUNT
FROM PRODUCT
WHERE USER_ID = ?
;

SELECT NUM, NAME, SUBJECT, HITCOUNT
					     , TO_CHAR(REG_DATE, 'YYYY-MM-DD') REG_DATE
					FROM BBS
					ORDER BY NUM DESC
					OFFSET ? ROWS FETCH FIRST ? ROWS ONLY
                    
                    
SELECT PRODUCT_ID, PRODUCT_RELEASE_NAME, PRODUCT_ALIAS, IMAGE_PATH_1, IS_PUBLIC, CREATED_AT   
FROM PRODUCT
WHERE USER_ID = ?
ORDER BY PRODUCT_ID DESC
OFFSET ? ROWS FETCH FIRST ? ROWS ONLY

select *
from product;
--0 비공개 1 공개 number

select *
from common;

select *
from product;

desc product;

/*
CREATE OR REPLACE PROCEDURE PRC_PRODUCT_INSERT
(
      P_USER_ID              IN PRODUCT.USER_ID%TYPE              -- 회원고유키 (NN)
    , P_PRODUCT_RELEASE_NAME IN PRODUCT.PRODUCT_RELEASE_NAME%TYPE -- 상품 발매명
    , P_PRODUCT_ALIAS        IN PRODUCT.PRODUCT_ALIAS%TYPE        -- 상품 별칭
    , P_MANUFACTURER_ID      IN PRODUCT.MANUFACTURER_ID%TYPE      -- 제조사 코드
    , P_PRODUCT_GRADE_ID     IN PRODUCT.PRODUCT_GRADE_ID%TYPE     -- 등급 코드 (NN)
    , P_PRODUCT_GENRE_ID     IN PRODUCT.PRODUCT_GENRE_ID%TYPE     -- 장르 코드 (NN)
    , P_PRODUCT_SIZE_ID      IN PRODUCT.PRODUCT_SIZE_ID%TYPE      -- 사이즈 코드 (NN)
    , P_WORK_NAME            IN PRODUCT.WORK_NAME%TYPE            -- 작품명
    , P_CHARACTER_NAME       IN PRODUCT.CHARACTER_NAME%TYPE       -- 캐릭터명
    , P_PURCHASE_DATETIME    IN PRODUCT.PURCHASE_DATETIME%TYPE    -- 구매일시
    , P_IS_OPENED            IN PRODUCT.IS_OPENED%TYPE            -- 개봉여부 (NN)
    , P_IS_PARTS_MISSING     IN PRODUCT.IS_PARTS_MISSING%TYPE     -- 파츠 누락 여부 (NN)
    , P_DESCRIPTIONS         IN PRODUCT.DESCRIPTIONS%TYPE         -- 상세설명
    , P_IMAGE_PATH_1         IN PRODUCT.IMAGE_PATH_1%TYPE         -- 이미지 1 (NN)
    , P_IMAGE_PATH_2         IN PRODUCT.IMAGE_PATH_2%TYPE         -- 이미지 2 (NN)
    , P_IMAGE_PATH_3         IN PRODUCT.IMAGE_PATH_3%TYPE         -- 이미지 3 (NN)
    , P_IS_PUBLIC            IN PRODUCT.IS_PUBLIC%TYPE            -- 공개 여부 (NN)
)
*/

exec prc_product_insert(1, '디즈니 주토피아:새로운 모험 시리즈', '주토피아랜덤피규어', 4, 1,2,3,'주토피아','닉', '2026-01-01', 0, 0, '귀여운 주토피아 피규어입니다.','images/nick1.jpg','images/nick2.jpg','images/judy1.jpg',0);

