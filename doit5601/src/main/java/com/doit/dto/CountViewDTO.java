package com.doit.dto;

public class CountViewDTO
{
	private int total,fail,unpayment,unshipping,shipping,confirm;

	public CountViewDTO() {}
	
	public CountViewDTO(int total, int fail, int unpayment, int unshipping, int shipping, int confirm)
	{
		this.total = total;
		this.fail = fail;
		this.unpayment = unpayment;
		this.unshipping = unshipping;
		this.shipping = shipping;
		this.confirm = confirm;
	}

	public int getTotal()
	{
		return total;
	}

	public void setTotal(int total)
	{
		this.total = total;
	}

	public int getFail()
	{
		return fail;
	}

	public void setFail(int fail)
	{
		this.fail = fail;
	}

	public int getUnpayment()
	{
		return unpayment;
	}

	public void setUnpayment(int unpayment)
	{
		this.unpayment = unpayment;
	}

	public int getUnshipping()
	{
		return unshipping;
	}

	public void setUnshipping(int unshipping)
	{
		this.unshipping = unshipping;
	}

	public int getShipping()
	{
		return shipping;
	}

	public void setShipping(int shipping)
	{
		this.shipping = shipping;
	}

	public int getConfirm()
	{
		return confirm;
	}

	public void setConfirm(int confirm)
	{
		this.confirm = confirm;
	}
}
