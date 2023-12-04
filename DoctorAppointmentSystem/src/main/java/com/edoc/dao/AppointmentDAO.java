package com.edoc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import com.edoc.beans.AppointmentBean;
import com.edoc.beans.DoctorBean;
import com.edoc.beans.PatientPersonalBean;

public class AppointmentDAO {
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
	public static Boolean fixAppointment(AppointmentBean appBean) throws ClassNotFoundException, SQLException {
		con = StaffLoginDAO.returnConnection();
		
		
		try {
			
			pst = con.prepareStatement(
					"SELECT * FROM appointments WHERE fk_doc_id=? AND time_id=? AND app_date=?");
			pst.setInt(1, appBean.getFkDocId());
			pst.setInt(2, appBean.getTimeId());
			pst.setString(3, appBean.getAppDate());
			rs = pst.executeQuery();
			
			if(rs.next()) {
				return false;
			}else {
				int rs=1;
				pst = con.prepareStatement(
						"INSERT INTO appointments (fk_doc_id,fk_pat_id,time_id,app_date) VALUES(?,?,?,?)");

				pst.setInt(1, appBean.getFkDocId());
				pst.setInt(2, appBean.getFkPatId());
				pst.setInt(3, appBean.getTimeId());
				pst.setString(4, appBean.getAppDate());
				rs = pst.executeUpdate();
				return true;
			}
		} catch (SQLException sql) {
			sql.printStackTrace();
		}
		return false;

	}
	// --------------END--------------------
	// --------------START---------------------

			/**
			 *
			 * @author: Sreejith N S
			 * @Date: 5.12.2023
			 * @version : 1.0
			 */
	public static Boolean cancelApp(AppointmentBean appBean) throws ClassNotFoundException, SQLException {
		con = StaffLoginDAO.returnConnection();
		
		
		try {
				int rs=1;
				pst = con.prepareStatement(
						"UPDATE appointments\r\n"
						+ "SET app_status = \"Cancelled\"\r\n"
						+ "WHERE app_id=?");

				pst.setInt(1, appBean.getAppId());

				rs = pst.executeUpdate();
				return true;
	
		} catch (SQLException sql) {
			sql.printStackTrace();
		}
		return false;

	}
	// --------------END---------------
}
