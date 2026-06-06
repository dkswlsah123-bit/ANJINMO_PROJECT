package com.doit.dto;

public class CommonDTO
{
	private int commonYnId;                // 공통 여부 코드 (PK)
	private String commonYnName;           // 공통 여부명 (Y/N)

	public CommonDTO() {}

	public int getCommonYnId()
	{
		return commonYnId;
	}

	public void setCommonYnId(int commonYnId)
	{
		this.commonYnId = commonYnId;
	}

	public String getCommonYnName()
	{
		return commonYnName;
	}

	public void setCommonYnName(String commonYnName)
	{
		this.commonYnName = commonYnName;
	}
}
