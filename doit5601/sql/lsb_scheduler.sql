-- 경매 종료 처리 스케줄러

-- 스케쥴러에 사용할 프로시저 생성
-- 경매 모니터링 및 마감 처리 프로시저
CREATE OR REPLACE PROCEDURE PRC_AUCTION_MONITORING
IS
	CURSOR CUR_CLOSED_AUCTION
	IS
	SELECT AUCTION_ID
	FROM VW_AUCTION_WINNING_RESULT		-- 뷰 사용
	WHERE AUCTION_STATUS = 'Closed';

	V_RESULT		VARCHAR2(300);		-- 프로시저의 OUT 변수 바인딩용 변수 (스케쥴러에서 실제 사용하진 않음)
BEGIN

	FOR V_AUCTION_REC IN CUR_CLOSED_AUCTION LOOP
		PRC_AUCTION_CLOSE(P_AUCTION_ID => V_AUCTION_REC.AUCTION_ID, P_RESULT => V_RESULT);
	END LOOP;
	
END;


-- 1. 프로그램 정의
BEGIN
    DBMS_SCHEDULER.CREATE_PROGRAM (
        program_name     => 'PROG_AUCTION_MONITORING'
        , program_type   => 'STORED_PROCEDURE'
        , program_action => 'PRC_AUCTION_MONITORING'
        , enabled        => TRUE
        , comments       => '마감 경매 낙찰 처리'
    );
END;

-- 2. 일정 정의
BEGIN
    DBMS_SCHEDULER.CREATE_SCHEDULE (
        schedule_name     => 'SCH_AUCTION_MONITORING_EVERY_MINUTE'
        , start_date      => SYSTIMESTAMP						-- 현재 시점에서 바로 시작
        , repeat_interval => 'FREQ=MINUTELY; INTERVAL=1'		-- 1분마다 작업
        , comments        => '매 분마다 경매 모니터링'
    );
END;

-- 3. Job 생성 및 연결
BEGIN
    DBMS_SCHEDULER.CREATE_JOB (
        job_name          => 'SCH_AUCTION_MONITORING'
        , program_name    => 'PROG_AUCTION_MONITORING'
        , schedule_name   => 'SCH_AUCTION_MONITORING_EVERY_MINUTE'
        , enabled         => TRUE			-- 생성 즉시 활성화
        , auto_drop       => FALSE			-- 작업 완료 후에도 삭제되지 않음
        , comments        => '매 분마다 경매 모니터링 및 마감 경매 낙찰 처리'
    );
END;
