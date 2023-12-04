package com.edoc.dao;

import java.sql.Connection;
import java.sql.SQLException;

public class GetDbConnection {
	static Connection con = null;

	//--------------START----------database connection ------------
			/**
			 *
			 * @author: Sreejith N S
			 * @Date: 28.11.2023
			 * @version : 1.0
			 * @purpose : database connection
			 * @param : Nothing
			 * @throws : ClassNotFoundException, SQLException
			 * @return: Connection
			 */
	public static Connection getDbConnection() throws ClassNotFoundException, SQLException {
		
		try {
			DBDAO.connect();
			con = DBDAO.getDbCon();

		} catch (ClassNotFoundException ex) {
			ex.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}
	//------------------END-------------database connection---------
}
