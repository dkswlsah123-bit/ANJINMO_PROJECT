package com.doit.dto;

import java.sql.Date;

public class PenaltyStatusDTO
{
	private int penaltyStatusId;           // 패널티 상태 코드 (PK)
	private int penaltyId;                 // 패널티 코드 (FK)
	private Date penaltyStartDate;         // 패널티 적용 개시 일자
	private Date penaltyEndDate;           // 패널티 적용 종료 일자

	public PenaltyStatusDTO() {}

	public int getPenaltyStatusId()
	{
		return penaltyStatusId;
	}

	public void setPenaltyStatusId(int penaltyStatusId)
	{
		this.penaltyStatusId = penaltyStatusId;
	}

	public int getPenaltyId()
	{
		return penaltyId;
	}

	public void setPenaltyId(int penaltyId)
	{
		this.penaltyId = penaltyId;
	}

	public Date getPenaltyStartDate()
	{
		return penaltyStartDate;
	}

	public void setPenaltyStartDate(Date penaltyStartDate)
	{
		this.penaltyStartDate = penaltyStartDate;
	}

	public Date getPenaltyEndDate()
	{
		return penaltyEndDate;
	}

	public void setPenaltyEndDate(Date penaltyEndDate)
	{
		this.penaltyEndDate = penaltyEndDate;
	}
}
