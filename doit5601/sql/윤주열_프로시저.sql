
-- DBMS 출력 기능 활성화
SET SERVEROUTPUT ON;

SELECT *
FROM USERS;
/*
   USER_ID
----------
         1
         2
*/

SELECT *
FROM USER_ACCOUNT
/*
   USER_ID USER_LOGIN_ID                                      USER_PASSWORD                                                                                       
---------- -------------------------------------------------- ----------------------------------------------------------------------------------------------------
         1 user01                                             0123456789                                                                                          
         2 user02                                             0123456789                                                                                          

*/

SELECT *
FROM USER_PROFILE;
/*
   USER_ID USER_NAME                                          USER_SSN      USER_EMAIL                                                                                           USER_PHONE  USER_ZI USER_ADDRESS                                                                                                                                                                                                                                                                                                 USER_ADDRESS_DETAIL                                                                                                                                                                                                                                                                                         
---------- -------------------------------------------------- ------------- ---------------------------------------------------------------------------------------------------- ----------- ------- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
         1 홍길동                                             9001011234567 hong@test.com                                                                                        01012345678 06035   서울 강남구 가로수길                                                                                                                                                                                                                                                                                           101호                                                                                                                                                                                                                                                                                                       
         2 김철수                                             9205052345678 kim@test.com  
*/


<<<<<<< HEAD
-- 경매 등록 프로시저
CREATE OR REPLACE PROCEDURE PRC_AUCTION_CREATE(
    P_USER_ID           NUMBER,              --회원 고유키
    P_PRODUCT_ID        NUMBER,              --상품코드
    P_AUCTION_TITLE     VARCHAR2,            --경매제목
    P_CONTENT           VARCHAR2,            --경매 글
    P_START_PRICE       NUMBER,              --시작가
    P_PERIOD_CODE       NUMBER               --경매기간
)
IS
    -- 에러 번호 변수 선언
    ERR_LACK_MONEY      CONSTANT NUMBER := -20004;
    ERR_UNKNOWN         CONSTANT NUMBER := -20009;
=======
>>>>>>> 02706d13cfda250fcb449d8a7307b6f65bbc423a

EXEC PRC_USER_SIGNUP('user05', '0123456789', '0123456789', '테스트5', 9709231234568, 'wnduf0924@test.com', '01012345678', '06035','서울 강남구 가로수길','102호');
--==>> 세 개 테이블 INSERT 확인 완료

-- 스케쥴러 생성 권한 부여
GRANT CREATE JOB TO mytest

commit;

select * from VW_PENALTY_LIST;


-- 유저 DELETE 프로시저
-- EXEC PRC_USER_DELETE(2);
--==>> 잔여 머니가 존재합니다.


EXEC PRC_USER_DELETE(3);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

SELECT *
FROM DELETED_USER;
--==>> 3	윤주열	9709231234567	wnduf0923@test.com	01012345678	06035	서울 강남구 가로수길	102호

SELECT *
FROM PRODUCT;
--==>> 1	Hot Toys Iron Man Mark 85	핫토이 마크85	1	12	1	1	1	어벤져스: 엔드게임	아이언맨		1	0	단순 개봉 풀박스입니다. 상태 매우 좋습니다.	images/ironman_1.png	images/ironman_2.png	images/ironman_3.png	1	26/04/21

-- 상품 등록 프로시저
EXEC PRC_PRODUCT_INSERT(1,'명철로봇','개쩌는로봇',1, 2, 1 ,1, '에반게리온', '초호기', SYSDATE,1,1,'박스 깠고 팔 한짝 날아갔어욤ㅋㅋ','images/evangerion_1.png', 'images/evangerion_2.png','images/evangerion_3.png','1');
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.


SELECT *
FROM PRODUCT;
/*
2	건담로봇	개쩌는로봇	1	1	2	1	1	에반게리온	초호기	26/04/22	1	1	박스 깠고 팔 한짝 날아갔어욤ㅋㅋ	images/evangerion_1.png	images/evangerion_2.png	images/evangerion_3.png	1	26/04/22
1	Hot Toys Iron Man Mark 85	핫토이 마크85	1	12	1	1	1	어벤져스: 엔드게임	아이언맨		1	0	단순 개봉 풀박스입니다. 상태 매우 좋습니다.	images/ironman_1.png	images/ironman_2.png	images/ironman_3.png	1	26/04/21
*/

-- 다른 유저의 상품 수정 테스트
-- EXEC PRC_PRODUCT_UPDATE(2, 2, '칸탐로봇', '존나쩌는로봇', 2, 1, 1, 1, '짱구', '2호기', SYSDATE, 0, 0, '미친존나쩌는로봇입니다','images/evangerion_1.png', 'images/evangerion_2.png','images/evangerion_3.png','1');
--==>> ORA-20021: 해당 상품이 없거나 수정 권한이 없습니다

-- 본인의 상품 수정
EXEC PRC_PRODUCT_UPDATE(2, 1, '칸탐로봇', '존나쩌는로봇', 2, 1, 1, 1, '짱구', '2호기', SYSDATE, 0, 0, '미친존나쩌는로봇입니다','images/evangerion_1.png', 'images/evangerion_2.png','images/evangerion_3.png','1');
-- PL/SQL 프로시저가 성공적으로 완료되었습니다.
/*
2	칸탐로봇	존나쩌는로봇	1	2	1	1	1	짱구	2호기	26/04/22	0	0	미친존나쩌는로봇입니다	images/evangerion_1.png	images/evangerion_2.png	images/evangerion_3.png	1	26/04/22
1	Hot Toys Iron Man Mark 85	핫토이 마크85	1	12	1	1	1	어벤져스: 엔드게임	아이언맨		1	0	단순 개봉 풀박스입니다. 상태 매우 좋습니다.	images/ironman_1.png	images/ironman_2.png	images/ironman_3.png	1	26/04/21
*/


-- 상품 경매 등록
EXEC PRC_AUCTION_CREATE(1, 6, '개쩌는명철로봇팝니다', '건담 팔 날아갑니다 졸라쎄고멋집니다 꼭사세요', 20000, 7);
-- PL/SQL 프로시저가 성공적으로 완료되었습니다.

-- 경매 테이블 조회
SELECT *
FROM AUCTION_REGISTRATION;
/*
2	2	존나쩌는건담로봇팝니다	건담 팔 날아갑니다 졸라쎄고멋집니다 꼭사세요	20000	26/04/22	7
1	1	실시간 EXEC 테스트	간단하게 테스트 중	400000	26/04/21	7
*/

-- 경매 취소 프로시저
EXEC PRC_AUCTION_CANCEL(5, 1, '명철로봇 취소 드가자');
-- PL/SQL 프로시저가 성공적으로 완료되었습니다.

SELECT *
FROM AUCTION_CANCEL_HISTORY;
-- 8	3	하 중복데이터	26/04/22

-- EXEC PRC_AUCTION_CREATE(1, 1, '존나쩌는건담로봇팝니다', '건담 팔 날아갑니다 졸라쎄고멋집니다 꼭사세요', 20000, 7);
-- ORA-20017: 해당 상품으로 진행 중인 경매가 이미 존재합니다.

SELECT *
FROM MONEY_TRANSACTION_HISTORY;
-- 10만원 충전 후 3건 등록됨
/*
3	1	2	2	-30000	26/04/22
4	1	2	3	-30000	26/04/22
13	1	7	3	0	26/04/22
1	1	1		100000	26/04/21
2	1	2	1	-30000	26/04/21
*/


-- 유저 잔여 머니 조회
DECLARE
    v_result NUMBER;
BEGIN
    v_result := FN_GET_USER_MONEY_BALANCE(2);
    DBMS_OUTPUT.PUT_LINE('결과: ' || v_result);
END;
-- 결과 : 210000

SELECT *
FROM PENALTY_HISTORY;
-- 8	1	1		1	26/04/22

SELECT *
FROM PENALTY_STATUS;
-- 8	8	26/04/22	26/04/22


-- 등록된 1번의 유저의 5번 경매에 2번 유저 입찰 시도
DECLARE
    v_out_msg VARCHAR2(1000); -- P_RESULT를 담을 변수 선언
BEGIN
    -- PRC_AUCTION_BID_CREATE(경매ID, 유저ID, 입찰가, 결과변수)
    PRC_AUCTION_BID_CREATE(5, 2, 40000, v_out_msg); 
    
    DBMS_OUTPUT.PUT_LINE('프로시저 결과: ' || v_out_msg);
END;

-- 입찰 기록 조회
SELECT *
FROM AUCTION_BID_PARTICIPATION;


--취소했을 때 
--1번 유저 500000원 찍히고 2번 유저 180000원 찍히는 상태..
-- 530000원 확인 완료
-- 입찰 및 취소까지 테스트 완료..........................

----------------------낙찰 테스트 영역-----------------------------------

-- 등록 된 경매건 확인
SELECT *
FROM AUCTION_REGISTRATION;
/*
5	6	개쩌는명철로봇팝니다	건담 팔 날아갑니다 졸라쎄고멋집니다 꼭사세요	20000	26/04/23	7
2	2	존나쩌는건담로봇팝니다	건담 팔 날아갑니다 졸라쎄고멋집니다 꼭사세요	20000	26/04/22	7
3	2	존나쩌는건담로봇팝니다	건담 팔 날아갑니다 졸라쎄고멋집니다 꼭사세요	20000	26/04/22	7
1	1	실시간 EXEC 테스트	간단하게 테스트 중	400000	26/04/21	7
*/

-- 5번 경매의 종료 시간을 어제로 변경 (강제 마감 처리)
UPDATE AUCTION_REGISTRATION
SET CREATED_AT = SYSDATE - 8
WHERE AUCTION_ID = 5;
COMMIT;



-------------------------------------------------------------------------

EXEC PRC_REPORT_CREATE(2,4,6,1,'로봇 이름이 이상함');
/*
-- 신고 중복 처리 방지 완료
1	5	6
2	6	6
*/



SELECT *
FROM 


-- 신고 이력
SELECT *
FROM REPORT_SUBMISSION;

-- 상품신고 테이블
SELECT *
FROM PRODUCT_REPORT;

-- 경매신고 테이블
SELECT *
FROM AUCTION_REPORT;

-- 관리자 계정 조회
SELECT *
FROM ADMIN_ACCOUNT;

-- 관리자 프로필 등록
INSERT INTO ADMIN_PROFILE (EMPLOYEE_ID, EMPLOYEE_NAME, DEPARTMENT)
VALUES (1001, '관리자1', '운영팀');

-- 관리자 계정 등록
INSERT INTO ADMIN_ACCOUNT (ADMIN_ACCOUNT_ID, ADMIN_ROLE_ID, ADMIN_LOGIN_ID, ADMIN_PASSWORD)
VALUES (ADMIN_ACCOUNT_SEQ.NEXTVAL, 1, 'admin', 'admin1234');

-- 관리자 조회
SELECT *
FROM ADMIN_PROFILE;
-- 1001	관리자1	운영팀

-- 신고 처리 프로세스
EXEC PRC_REPORT_PROCESS(6,1,1,'내맘임');

-- 신고 처리 내역
SELECT *
FROM REPORT_PROCESS;
-- 1	6	1	1	내맘임	26/04/23

-- 신고 처리 결과 (처리완료)
SELECT *
FROM PENALTY_HISTORY;
/*
14	1	1		1	26/04/23
15	1	1	1	1	26/04/23
8	1	1		1	26/04/22
*/


-- 경매 취소 프로시저
CREATE OR REPLACE PROCEDURE PRC_AUCTION_CANCEL(
    P_AUCTION_ID    NUMBER,
    P_USER_ID       NUMBER,
    P_CANCEL_REASON VARCHAR2
)
IS
    V_PENALTY_ID      NUMBER;
    V_TOTAL_SCORE     NUMBER := 0;
    V_END_DATE        DATE;        -- 정지 종료일
    
    CURSOR BIDDER_LIST IS
        SELECT DISTINCT USER_ID FROM AUCTION_BID_PARTICIPATION WHERE AUCTION_ID = P_AUCTION_ID;
BEGIN
    -- 1. 입찰자 전원 보증금 환급 
    FOR R IN BIDDER_LIST LOOP
        INSERT INTO MONEY_TRANSACTION_HISTORY (
            MONEY_ID, USER_ID, MONEY_TYPE_ID, AUCTION_ID, AMOUNT, CREATED_AT
        ) VALUES (
            MONEY_TRANSACTION_SEQ.NEXTVAL, R.USER_ID, 5, P_AUCTION_ID, 30000, SYSDATE
        );
    END LOOP;

    -- 2. 판매자 보증금 몰수 기록
    INSERT INTO MONEY_TRANSACTION_HISTORY (
        MONEY_ID, USER_ID, MONEY_TYPE_ID, AUCTION_ID, AMOUNT, CREATED_AT
    ) VALUES (
        MONEY_TRANSACTION_SEQ.NEXTVAL, P_USER_ID, 7, P_AUCTION_ID, 0, SYSDATE
    );
    
    -- 3. 패널티 점수 계산 로직 (누적 점수 - 취소 점수)
    SELECT (
        (SELECT NVL(SUM(PENALTY_SCORE), 0) FROM PENALTY_HISTORY WHERE USER_ID = P_USER_ID) -
        (SELECT NVL(SUM(PH.PENALTY_SCORE), 0) 
         FROM PENALTY_CANCEL PC 
         JOIN PENALTY_HISTORY PH ON PC.PENALTY_ID = PH.PENALTY_ID 
         WHERE PH.USER_ID = P_USER_ID)
    ) INTO V_TOTAL_SCORE FROM DUAL;

    V_TOTAL_SCORE := V_TOTAL_SCORE + 1;

    -- 4. 패널티 단계별 정지 종료일 설정
    IF V_TOTAL_SCORE = 1 THEN
        V_END_DATE := SYSDATE; 
    ELSIF V_TOTAL_SCORE = 2 THEN
        V_END_DATE := SYSDATE + 7;
    ELSIF V_TOTAL_SCORE = 3 THEN
        V_END_DATE := SYSDATE + 30;
    ELSE
        V_END_DATE := TO_DATE('9999-12-31', 'YYYY-MM-DD');
    END IF;

    -- 5. 패널티 이력 INSERT
    V_PENALTY_ID := PENALTY_SEQ.NEXTVAL;
    INSERT INTO PENALTY_HISTORY (
        PENALTY_ID, USER_ID, PENALTY_TYPE_ID, ADMIN_ACCOUNT_ID, PENALTY_SCORE, CREATED_AT
    ) VALUES (
        V_PENALTY_ID, P_USER_ID, 1, NULL, 1, SYSDATE 
    );

    -- 6. 패널티 상태 기록
    INSERT INTO PENALTY_STATUS (
        PENALTY_STATUS_ID, PENALTY_ID, PENALTY_START_DATE, PENALTY_END_DATE
    ) VALUES (
        PENALTY_STATUS_SEQ.NEXTVAL, V_PENALTY_ID, SYSDATE, V_END_DATE
    );

    -- 7. 경매 취소 이력 기록
    INSERT INTO AUCTION_CANCEL_HISTORY (
        AUCTION_CANCEL_ID, AUCTION_ID, CANCEL_REASON, CANCEL_AT
    ) VALUES (
        AUCTION_CANCEL_SEQ.NEXTVAL, P_AUCTION_ID, P_CANCEL_REASON, SYSDATE
    );

    -- COMMIT; 
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        
        IF SQLCODE BETWEEN -20999 AND -20000 THEN
            RAISE; -- 이미 정의된 커스텀 에러는 그대로 통과
        ELSE
            RAISE_APPLICATION_ERROR(ERR_UNKNOWN, '예상치 못한 오류가 발생했습니다');
        END IF;
END;






--회원 패널티 누적 점수 조회 함수
CREATE OR REPLACE FUNCTION FN_GET_USER_PENALTY_SCORE (
    P_USER_ID NUMBER
) 
RETURN NUMBER
IS
    -- 총 점수 0으로 초기화
    V_TOTAL_SCORE       NUMBER := 0;            -- 총 패널티 누적 점수
    ERR_UNKNOWN         CONSTANT NUMBER := -20009;
    
BEGIN

    -- 전체 누적 점수에서 취소된 점수를 뺀 값을 계산
    SELECT (
        (SELECT NVL(SUM(PENALTY_SCORE), 0) 
         FROM PENALTY_HISTORY 
         WHERE USER_ID = P_USER_ID) 
        - 
        (SELECT NVL(SUM(PH.PENALTY_SCORE), 0) 
         FROM PENALTY_CANCEL PC 
         JOIN PENALTY_HISTORY PH ON PC.PENALTY_ID = PH.PENALTY_ID 
         WHERE PH.USER_ID = P_USER_ID)
    ) INTO V_TOTAL_SCORE
    FROM DUAL;

    -- 패널티 누적 점수 반환
    RETURN V_TOTAL_SCORE;
EXCEPTION
     WHEN OTHERS THEN
        RETURN 0;
        
        IF SQLCODE BETWEEN -20999 AND -20000 THEN
            RAISE; -- 이미 정의된 커스텀 에러는 그대로 통과
        ELSE
            RAISE_APPLICATION_ERROR(ERR_UNKNOWN, '예상치 못한 오류가 발생했습니다');
        END IF; 
END;


-- 회원 패널티 활성 상태 조회 함수
CREATE OR REPLACE FUNCTION FN_GET_USER_PENALTY_STATUS (
    P_USER_ID NUMBER
)
RETURN NUMBER
IS
    V_STATUS    NUMBER;        -- 0이면 활성, 1이면 비활성
    ERR_UNKNOWN  CONSTANT NUMBER := -20009;

BEGIN
    IF FN_GET_USER_PENALTY_SCORE(P_USER_ID) > 0
    THEN V_STATUS := 0;
    ELSE
        V_STATUS := 1;
    END IF;
    
    RETURN V_STATUS;
EXCEPTION

     WHEN OTHERS THEN     
        IF SQLCODE BETWEEN -20999 AND -20000 THEN
            RAISE; -- 이미 정의된 커스텀 에러는 그대로 통과
        ELSE
            RAISE_APPLICATION_ERROR(ERR_UNKNOWN, '예상치 못한 오류가 발생했습니다');
        END IF; 
END;
    
    
    
-- 신고 등록 프로시저
CREATE OR REPLACE PROCEDURE PRC_REPORT_CREATE (
    P_USER_ID       NUMBER,         -- 신고자 ID
    P_REPORT_TYPE   NUMBER,         -- 도배 광고 개인정보기재 기타 1 2 3 4
    P_TARGET_ID     NUMBER,         -- 상품코드 혹은 경매코드
    P_TARGET_TYPE   NUMBER,         -- 상품 OR 경매     
    P_REPORT_REASON  VARCHAR2       -- 신고 사유
)
IS
    V_NEW_REPORT_ID  NUMBER;    -- 새롭게 생성된 신고신청코드
    ERR_UNKNOWN      CONSTANT NUMBER := -20009;
BEGIN

     V_NEW_REPORT_ID := REPORT_SEQ.NEXTVAL;
    -- 1. 신고 신청(부모) INSERT
    INSERT INTO REPORT_SUBMISSION(
        REPORT_SUBMISSION_ID, USER_ID, REPORT_TARGET_ID, REPORT_TYPE_ID, REPORT_REASON, CREATED_AT)
    VALUES(V_NEW_REPORT_ID, P_USER_ID, P_TARGET_ID, P_REPORT_TYPE, P_REPORT_REASON, SYSDATE);
    
    -- 2. 신고 대상(상품, 경매) 분기 처리 후 해당 테이블 INSERT
    
    IF P_TARGET_TYPE = 1 
    THEN 
        INSERT INTO PRODUCT_REPORT(
          PRODUCT_REPORT_ID, REPORT_SUBMISSION_ID, PRODUCT_ID)
        VALUES(
          PRODUCT_REPORT_SEQ.NEXTVAL, V_NEW_REPORT_ID, P_TARGET_ID);
    
    ELSIF P_TARGET_TYPE = 2
    THEN
        INSERT INTO AUCTION_REPORT(
          AUCTION_REPORT_ID, REPORT_SUBMISSION_ID, AUCTION_ID)
        VALUES(
          AUCTION_REPORT_SEQ.NEXTVAL, V_NEW_REPORT_ID, P_TARGET_ID);
    END IF;
    
    EXCEPTION
     WHEN OTHERS THEN     
        ROLLBACK;
        IF SQLCODE BETWEEN -20999 AND -20000 THEN
            RAISE; -- 이미 정의된 커스텀 에러는 그대로 통과
        ELSE
            RAISE_APPLICATION_ERROR(ERR_UNKNOWN, '예상치 못한 오류가 발생했습니다');
        END IF; 
END;

    
    

    
    
    



