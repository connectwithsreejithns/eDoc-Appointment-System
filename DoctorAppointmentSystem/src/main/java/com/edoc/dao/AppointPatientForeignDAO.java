package com.edoc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.edoc.beans.AppointPatientForeignBean;


public class AppointPatientForeignDAO {

	static Connection con = null;
	static PreparedStatement pst = null;
	static ResultSet rs = null;

	public static Connection returnConnection() throws ClassNotFoundException, SQLException {
		return GetDbConnection.getDbConnection();
	}
	// --------------START--------------------

			/**
			 *
			 * @author: Sreejith N S
			 * @Date: 5.12.2023
			 * @version : 1.0
			 */
	public static ArrayList<AppointPatientForeignBean> appointmentDetail(AppointPatientForeignBean appo) throws ClassNotFoundException, SQLException {
		con = StaffLoginDAO.returnConnection();
		ArrayList<AppointPatientForeignBean> list = new ArrayList<AppointPatientForeignBean>();

		try {
			
			pst = con.prepareStatement("SELECT app_id,pers_name,pers_gender,pers_age,app_status,pers_add,pers_phone\r\n"
					+ "				FROM appointments a\r\n" + "				INNER JOIN patient_personal p\r\n"
					+ "				ON a.fk_pat_id=p.pat_id\r\n" + "				AND a.fk_doc_id=? AND a.app_status=\"Scheduled\"");

			pst.setInt(1, appo.getFkDocId());
			rs = pst.executeQuery();
			while (rs.next()) {
				AppointPatientForeignBean app = new AppointPatientForeignBean();
				app.setAppId(rs.getInt(1));
				app.setPersName(rs.getString(2));
				app.setPersGender(rs.getString(3));
				app.setPersAge(rs.getInt(4));
				app.setAppStatus(rs.getString(5));
				app.setPersAdd(rs.getString(6));
				app.setPersPhone(rs.getString(7));

				list.add(app);

			}

		} catch (SQLException sql) {
			sql.printStackTrace();
		}
		return list;
	}
	// --------------END--------------------

}
