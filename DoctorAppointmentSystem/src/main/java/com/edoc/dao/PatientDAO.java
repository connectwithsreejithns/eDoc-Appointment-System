package com.edoc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.edoc.beans.PatientBean;

public class PatientDAO {
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
	public static Boolean checkLogin(PatientBean pat) throws ClassNotFoundException, SQLException {
		con = StaffLoginDAO.returnConnection();

		int patId=0;
		try {

			pst = con.prepareStatement("SELECT pat_id FROM patient WHERE pat_uname=(?) AND pat_pass=(?)");

			String uname = pat.getPatUname();
			pst.setString(1, uname);
			pst.setString(2, pat.getPatPass());
			rs = pst.executeQuery();

			if (rs.next()) {
				patId = rs.getInt(1);
				return true;
			}
	
		} catch (SQLException sql) {
			sql.printStackTrace();
		}
		return false;
	}
	// --------------END---------------------
		// --------------START---------------------

				/**
				 *
				 * @author: Sreejith N S
				 * @Date: 5.12.2023
				 * @version : 1.0
				 */
	public static int PatientLogin(PatientBean pat) throws ClassNotFoundException, SQLException {
		con = StaffLoginDAO.returnConnection();
		int flag=0;
		try {

			pst = con.prepareStatement("INSERT INTO patient(pat_uname, pat_pass) VALUES (?,?)");

			pst.setString(1, pat.getPatUname());
			pst.setString(2, pat.getPatPass());
			flag = pst.executeUpdate();
			return flag;
	
		} catch (SQLException sql) {
			sql.printStackTrace();
		}
		return flag;
	}
	// --------------END---------------------
		// --------------START---------------------

				/**
				 *
				 * @author: Sreejith N S
				 * @Date: 5.12.2023
				 * @version : 1.0
				 */
	public static int GetId(PatientBean pat) throws ClassNotFoundException, SQLException {
		con = StaffLoginDAO.returnConnection();

		int patId=0;
		try {

			pst = con.prepareStatement("SELECT pat_id FROM patient WHERE pat_uname=(?) AND pat_pass=(?)");

			String uname = pat.getPatUname();
			pst.setString(1, uname);
			pst.setString(2, pat.getPatPass());
			rs = pst.executeQuery();

			if (rs.next()) {
				patId = rs.getInt(1);
				return patId;
			}
	
		} catch (SQLException sql) {
			sql.printStackTrace();
		}
		return patId;
	}
	
	// --------------END---------------------
		// --------------START---------------------

				/**
				 *
				 * @author: Sreejith N S
				 * @Date: 5.12.2023
				 * @version : 1.0
				 */
	public static int GetIdByName(PatientBean pat) throws ClassNotFoundException, SQLException {
		con = StaffLoginDAO.returnConnection();

		int patId=0;
		try {

			pst = con.prepareStatement("SELECT pat_id FROM patient WHERE pat_uname=(?)");
			String uname = pat.getPatUname();
			pst.setString(1, uname);
			rs = pst.executeQuery();

			if (rs.next()) {
				patId = rs.getInt(1);
				return patId;
			}
	
		} catch (SQLException sql) {
			sql.printStackTrace();
		}
		return patId;
		// --------------END---------------------
		
	}

}
