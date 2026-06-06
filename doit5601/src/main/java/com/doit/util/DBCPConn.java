package com.doit.util;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBCPConn
{
	//private static Connection connection = null;

	
	public static Connection getConnection()
	{
		// 지역변수로 바꿈
		Connection conn = null;
		
		if(conn==null)
		{
			try
			{
				Context ctx = new InitialContext();
				Context evt = (Context)ctx.lookup("java:/comp/env");
				DataSource ds = (DataSource)evt.lookup("jdbc/myOracle");
				conn = ds.getConnection();
				
			}
			catch(Exception e)
			{
				System.out.println(e.toString());
			}
		}
		
		return conn;
	}
	
	public static void close(Connection conn)
	{
		if(conn!=null) {
			try
			{
				if(!conn.isClosed()) {
					conn.close();
				}
			}
			catch(Exception e)
			{
				System.out.println(e.toString());
			}
		}
		conn = null;
	}

	
}
