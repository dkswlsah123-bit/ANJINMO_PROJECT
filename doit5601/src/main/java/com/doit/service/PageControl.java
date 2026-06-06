package com.doit.service;

public class PageControl
{
	public int totalPage(int totalContent, int viewCount)
	{
		int result = 0;
		
		result = totalContent / viewCount;
		
		if(totalContent % viewCount != 0)
		{
			result += 1;
		}
		
		return result;
	}

}
