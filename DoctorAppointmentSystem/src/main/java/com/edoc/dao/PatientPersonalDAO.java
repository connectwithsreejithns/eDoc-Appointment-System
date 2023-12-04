package com.edoc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.edoc.beans.PatientBean;
import com.edoc.beans.PatientPersonalBean;

public class PatientPersonalDAO {
	static Connection con = null;
	static PreparedStatement pst = null;
	static ResultSet rs = null;

	public static Connection returnConnection() throws ClassNotFoundException, SQLException {
		return GetDbConnection.getDbConnection();
	}
	
		// --------------START---------------------

				/**
				 *
				 * @author: Sreejith N S
				 * @Date: 5.12.2023
				 * @version : 1.0
				 */
	public static int insertPersonals(PatientPersonalBean pat) throws ClassNotFoundException, SQLException {
		con = StaffLoginDAO.returnConnection();
		int flag = 0;
		try {
			pst = con.prepareStatement(
					"INSERT INTO patient_personal(pers_name,pers_add,pers_age, pers_phone, pat_id,pers_gender) VALUES (?,?,?,?,?,?)");
			pst.setString(1, pat.getPersName());
			pst.setString(2, pat.getPersAdd());
			pst.setString(3, pat.getPersAge());
			pst.setString(4, pat.getPersPhone());
			pst.setInt(5, pat.getPatId());
			pst.setString(6, pat.getPersGender());
			
			flag = pst.executeUpdate();
			return flag;

		} catch (SQLException sql) {
			sql.printStackTrace();
		}
		return flag;
	}
	// --------------END---------------------
		
}
