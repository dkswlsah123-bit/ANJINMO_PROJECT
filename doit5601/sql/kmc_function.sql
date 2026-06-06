

--●경매 현재가 조회 함수 
CREATE OR REPLACE FUNCTION FN_GET_AUCTION_CURRENT_PRICE
(
    P_AUCTION_ID IN NUMBER
)
RETURN NUMBER
IS
    V_CURRENT_PRICE NUMBER;
    V_START_PRICE   NUMBER;
    V_BID_COUNT     NUMBER;
BEGIN

    -- 경매 시작가 조회
    SELECT START_PRICE INTO V_START_PRICE
    FROM AUCTION_REGISTRATION
    WHERE AUCTION_ID = P_AUCTION_ID;

    -- 입찰자 수 확인
    SELECT COUNT(*) INTO V_BID_COUNT
    FROM AUCTION_BID_PARTICIPATION
    WHERE AUCTION_ID = P_AUCTION_ID;

    -- 0명 또는 1명이면 시작가 반환
    IF V_BID_COUNT <= 1 THEN
        RETURN V_START_PRICE;
    END IF;

    -- 2명 이상부터  →2등 금액 가져오기
    SELECT BID_PRICE INTO V_CURRENT_PRICE
    FROM AUCTION_BID_PARTICIPATION
    WHERE AUCTION_ID = P_AUCTION_ID
    ORDER BY BID_PRICE DESC
    OFFSET 1 ROW FETCH NEXT 1 ROW ONLY;

    RETURN V_CURRENT_PRICE;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 0;
    WHEN OTHERS THEN
        RAISE;
END;
--------------------------------------------------------------------------------

--●경매 입찰 단위 조회 함수 

CREATE OR REPLACE FUNCTION FN_GET_BID_UNIT
(
    P_START_PRICE IN NUMBER  -- 경매 시작가
)
RETURN NUMBER
IS
    V_BID_UNIT NUMBER;
BEGIN
      
    IF P_START_PRICE < 1000000 THEN
        -- 100만원 미만
        V_BID_UNIT := 1000;
        
    ELSIF P_START_PRICE < 10000000 THEN
        -- 100만원 이상 ~ 1,000만원 미만
        V_BID_UNIT := 10000;
        
    ELSE
        -- 1,000만원 이상
        V_BID_UNIT := 100000;
        
    END IF;

    RETURN V_BID_UNIT;
END;

--------------------------------------------------------------------------------

--●경매 입찰 상한가 조회 함수

CREATE OR REPLACE FUNCTION FN_GET_BID_MAX_LIMIT
(
    P_AUCTION_ID IN NUMBER
)
RETURN NUMBER
IS
    V_CURRENT_PRICE NUMBER;
BEGIN
    -- 현재가 조회 (2순위 금액)
    V_CURRENT_PRICE := FN_GET_AUCTION_CURRENT_PRICE(P_AUCTION_ID);

    -- 현재가의 2배
    RETURN V_CURRENT_PRICE * 2;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 0;
    WHEN OTHERS THEN
        RAISE;
END;

--------------------------------------------------------------------------------

--●경매 최초 입찰 여부 확인 함수
-- 'Y', 'N' 반환

CREATE OR REPLACE FUNCTION FN_IS_FIRST_BIDDER
(
    P_AUCTION_ID IN NUMBER
)
RETURN CHAR 
IS
    V_COUNT NUMBER;
    V_RESULT CHAR(1);
BEGIN
    -- 입찰 참여 테이블에서 해당 경매의 입찰 기록 개수를 카운트
    SELECT COUNT(*) INTO V_COUNT
    FROM AUCTION_BID_PARTICIPATION
    WHERE AUCTION_ID = P_AUCTION_ID;

    -- 0이면 최초 입찰(Y), 0보다 크면 입찰 기록 있음(N)
    IF V_COUNT = 0 THEN
        V_RESULT := 'Y';
    ELSE
        V_RESULT := 'N';
    END IF;

    RETURN V_RESULT;

EXCEPTION
    WHEN OTHERS THEN
        RETURN 'N'; -- 에러 발생 시 입찰취소로 예외 처리
END;

--------------------------------------------------------------------------------

--● 회원 진행중 입찰 건수 조회 함수

CREATE OR REPLACE FUNCTION FN_GET_ACTIVE_BID_COUNT
(
    P_USER_ID IN NUMBER
)
RETURN NUMBER
IS
    V_COUNT NUMBER;
BEGIN
    -- 1. 내가 입찰한 모든 기록 중에서
    -- 2. 그 경매가 '진행 중(0)'인 것만 개수를 셉니다.
    SELECT COUNT(*) INTO V_COUNT
    FROM AUCTION_BID_PARTICIPATION
    WHERE USER_ID = P_USER_ID
    AND FN_IS_AUCTION_FINISHED(AUCTION_ID) = 0; -- 0이면 경매 진행중

    RETURN V_COUNT;

EXCEPTION
    WHEN OTHERS THEN
        RETURN 0;
END;

--------------------------------------------------------------------------------



