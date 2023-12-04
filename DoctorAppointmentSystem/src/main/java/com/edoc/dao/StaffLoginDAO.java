package com.edoc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.edoc.beans.StaffLoginBean;

public class StaffLoginDAO {
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
	public static String checkLogin(StaffLoginBean staff) throws ClassNotFoundException, SQLException {
		con = StaffLoginDAO.returnConnection();

		String staffType = null;

		try {

			pst = con.prepareStatement("SELECT staff_type FROM staff_login WHERE staff_uname=(?) AND staff_pass=(?)");

			String uname = staff.getStaffUname();
			pst.setString(1, uname);
			pst.setString(2, staff.getStaffPass());
			rs = pst.executeQuery();

			while (rs.next()) {
				staffType = rs.getString(1);
			}
		} catch (SQLException sql) {
			sql.printStackTrace();
		}
		
		if (staffType==null) {
			return "Patient";
		} else {
			return staffType;
		}

	}
	// --------------END---------------------
		// --------------START---------------------

				/**
				 *
				 * @author: Sreejith N S
				 * @Date: 5.12.2023
				 * @version : 1.0
				 */
	public static int InsertDoctorLogin(StaffLoginBean staff) throws ClassNotFoundException, SQLException {
		con = StaffLoginDAO.returnConnection();
		int staffId = 0;
		try {
			pst = con.prepareStatement("INSERT INTO staff_login (staff_uname,staff_pass,staff_type) VALUES(?,?,?)");
			pst.setString(1, staff.getStaffUname());
			pst.setString(2, staff.getStaffPass());
			pst.setString(3, "doctor");
			pst.executeUpdate();

			pst = null;

			pst = con.prepareStatement("SELECT staff_id FROM staff_login WHERE staff_uname=(?) AND staff_pass=(?)");

			String uname = staff.getStaffUname();
			pst.setString(1, uname);
			pst.setString(2, staff.getStaffPass());
			rs = pst.executeQuery();

			while (rs.next()) {
				staffId = rs.getInt(1);
			}

			return staffId;

		} catch (SQLException sql) {
			sql.printStackTrace();
		}
		return staffId;
	}
	// --------------END---------------------
		// --------------START---------------------

				/**
				 *
				 * @author: Sreejith N S
				 * @Date: 5.12.2023
				 * @version : 1.0
				 */
	public static int GetStaffId(StaffLoginBean staff) throws ClassNotFoundException, SQLException {
		con = StaffLoginDAO.returnConnection();
		int staffId = 0;
		try {
			
			pst = con.prepareStatement("SELECT staff_id FROM staff_login WHERE staff_uname=?");

			String uname = staff.getStaffUname();
			pst.setString(1, uname);
			rs = pst.executeQuery();

			while (rs.next()) {
				staffId = rs.getInt(1);
				return staffId;
			}

			

		} catch (SQLException sql) {
			sql.printStackTrace();
		}
		return staffId;
	}
	// --------------END---------------------
		
}
