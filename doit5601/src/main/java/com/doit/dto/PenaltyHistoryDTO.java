package com.doit.dto;

public class PenaltyHistoryDTO
{
	// 패널티 등록 정보
	private int penaltyId;                 // 패널티 코드 (PK)
	private int userId;                    // 회원 고유키 (FK)
	private int penaltyTypeId;             // 패널티 부여 구분 코드 (FK)
	private int adminAccountId;            // 관리자 계정 번호 (FK)
	private int penaltyScore;              // 패널티 점수
	//private Date createdAt;                // 등록 일자
	private String createdAt;                // 등록 일자
	
	// 패널티 취소 정보
	//-- PenaltyCancelDTO 를 병합.
	//   패널티 목록 화면에서 취소 정보까지 한번에 조회 및 처리할 수
	//   있어야 하는 상황이 발생하여 DTO 구조 변경.
	
	private int penaltyCancelId;           // 패널티 취소 코드 (PK)
	//private int penaltyId;                 // 패널티 코드 (FK)
	private int cancelAdminAccountId;            // 관리자 계정 번호 (FK)
	private String cancelReason;           // 취소 사유
	//private Date canceledAt;               // 취소 일자
	private String canceledAt;               // 취소 일자

	
	public PenaltyHistoryDTO() {}


	public int getPenaltyId()
	{
		return penaltyId;
	}


	public void setPenaltyId(int penaltyId)
	{
		this.penaltyId = penaltyId;
	}


	public int getUserId()
	{
		return userId;
	}


	public void setUserId(int userId)
	{
		this.userId = userId;
	}


	public int getPenaltyTypeId()
	{
		return penaltyTypeId;
	}


	public void setPenaltyTypeId(int penaltyTypeId)
	{
		this.penaltyTypeId = penaltyTypeId;
	}


	public int getAdminAccountId()
	{
		return adminAccountId;
	}


	public void setAdminAccountId(int adminAccountId)
	{
		this.adminAccountId = adminAccountId;
	}


	public int getPenaltyScore()
	{
		return penaltyScore;
	}


	public void setPenaltyScore(int penaltyScore)
	{
		this.penaltyScore = penaltyScore;
	}


	public String getCreatedAt()
	{
		return createdAt;
	}


	public void setCreatedAt(String createdAt)
	{
		this.createdAt = createdAt;
	}


	public int getPenaltyCancelId()
	{
		return penaltyCancelId;
	}


	public void setPenaltyCancelId(int penaltyCancelId)
	{
		this.penaltyCancelId = penaltyCancelId;
	}


	public int getCancelAdminAccountId()
	{
		return cancelAdminAccountId;
	}


	public void setCancelAdminAccountId(int cancelAdminAccountId)
	{
		this.cancelAdminAccountId = cancelAdminAccountId;
	}


	public String getCancelReason()
	{
		return cancelReason;
	}


	public void setCancelReason(String cancelReason)
	{
		this.cancelReason = cancelReason;
	}


	public String getCanceledAt()
	{
		return canceledAt;
	}


	public void setCanceledAt(String canceledAt)
	{
		this.canceledAt = canceledAt;
	}
}