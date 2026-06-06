package com.doit.dto;

public class PenaltyAssignTypeDTO
{
	private int penaltyTypeId;             // 패널티 부여 구분 코드 (PK)
	private String penaltyTypeName;        // 패널티 부여 구분명

	public PenaltyAssignTypeDTO() {}

	public int getPenaltyTypeId()
	{
		return penaltyTypeId;
	}

	public void setPenaltyTypeId(int penaltyTypeId)
	{
		this.penaltyTypeId = penaltyTypeId;
	}

	public String getPenaltyTypeName()
	{
		return penaltyTypeName;
	}

	public void setPenaltyTypeName(String penaltyTypeName)
	{
		this.penaltyTypeName = penaltyTypeName;
	}
}
