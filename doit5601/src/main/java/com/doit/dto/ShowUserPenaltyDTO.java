package com.doit.dto;

public class ShowUserPenaltyDTO
{
	private String userId;           // 사용자 ID
	private String userLoginId;		 // 유저 로그인 id
    private int penaltyId;           // 패널티 고유 ID
    private int givenScore;          // 부여된 점수
    private int accumulatedScore;    // 해당 시점 누적 점수
    private int totalScore;          // 현재 총 패널티 점수
    private String penaltyStatus;    // 경고, 7일 정지 등 상태
    private String startDate;        // 제재 시작일
    private String endDate;          // 제재 종료일
    private String historyStatus;
    
	
    
    public String getUserLoginId()
	{
		return userLoginId;
	}
	public void setUserLoginId(String userLoginId)
	{
		this.userLoginId = userLoginId;
	}
	public String getUserId()
	{
		return userId;
	}
	public void setUserId(String userId)
	{
		this.userId = userId;
	}
	public int getPenaltyId()
	{
		return penaltyId;
	}
	public void setPenaltyId(int penaltyId)
	{
		this.penaltyId = penaltyId;
	}
	public int getGivenScore()
	{
		return givenScore;
	}
	public void setGivenScore(int givenScore)
	{
		this.givenScore = givenScore;
	}
	public int getAccumulatedScore()
	{
		return accumulatedScore;
	}
	public void setAccumulatedScore(int accumulatedScore)
	{
		this.accumulatedScore = accumulatedScore;
	}
	public int getTotalScore()
	{
		return totalScore;
	}
	public void setTotalScore(int totalScore)
	{
		this.totalScore = totalScore;
	}
	public String getPenaltyStatus()
	{
		return penaltyStatus;
	}
	public void setPenaltyStatus(String penaltyStatus)
	{
		this.penaltyStatus = penaltyStatus;
	}
	public String getStartDate()
	{
		return startDate;
	}
	public void setStartDate(String startDate)
	{
		this.startDate = startDate;
	}
	public String getEndDate()
	{
		return endDate;
	}
	public void setEndDate(String endDate)
	{
		this.endDate = endDate;
	}
	public String getHistoryStatus()
	{
		return historyStatus;
	}
	public void setHistoryStatus(String historyStatus)
	{
		this.historyStatus = historyStatus;
	}
    
    
    
}
