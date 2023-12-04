package com.edoc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.edoc.beans.DoctorBean;
import com.edoc.beans.StaffLoginBean;

public class DoctorDAO {
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
	public static ArrayList<DoctorBean> getDocList() throws ClassNotFoundException, SQLException {
		ArrayList<DoctorBean> doctorBean = new ArrayList<DoctorBean>();
		con = StaffLoginDAO.returnConnection();
		try {
			pst = con.prepareStatement("SELECT * FROM doctor d");
			rs = pst.executeQuery();

			while (rs.next()) {
				DoctorBean doc = new DoctorBean();
				doc.setDocId(rs.getInt(1));
				doc.setDocName(rs.getString(2));
				doc.setDocPhone(rs.getString(3));
				doc.setDocDep(rs.getString(4));
				doc.setDocStatus(rs.getString(5));
				doc.setDocFkStaffId(rs.getInt(6));
				doc.setDocadd(rs.getString(7));
				doctorBean.add(doc);
			}

		} catch (SQLException sql) {
			sql.printStackTrace();
		}
		return doctorBean;
	}
	// --------------END---------------------
	// --------------START---------------------

			/**
			 *
			 * @author: Sreejith N S
			 * @Date: 5.12.2023
			 * @version : 1.0
			 */
	public static int InsertDoctorLogin(DoctorBean doctorBean) throws ClassNotFoundException, SQLException {
		con = StaffLoginDAO.returnConnection();
		int rs = 0;
		try {
			pst = con.prepareStatement(
					"INSERT INTO doctor (doc_name,doc_phone,doc_dep,doc_add,fk_staff_id) VALUES(?,?,?,?,?)");

			pst.setString(1, doctorBean.getDocName());
			pst.setString(2, doctorBean.getDocPhone());
			pst.setString(3, doctorBean.getDocDep());
			pst.setString(4, doctorBean.getDocadd());
			pst.setInt(5, doctorBean.getDocId());

			rs = pst.executeUpdate();

			return rs;

		} catch (SQLException sql) {
			sql.printStackTrace();
		}
		return rs;
	}
	// --------------END---------------------
	// --------------START---------------------

			/**
			 *
			 * @author: Sreejith N S
			 * @Date: 5.12.2023
			 * @version : 1.0
			 */
	public static ArrayList<DoctorBean> getDoc(int id) throws ClassNotFoundException, SQLException {
		ArrayList<DoctorBean> doctorBean = new ArrayList<DoctorBean>();
		con = StaffLoginDAO.returnConnection();
		try {
			pst = con.prepareStatement("SELECT * FROM doctor d WHERE ");
			rs = pst.executeQuery();

			while (rs.next()) {
				DoctorBean doc = new DoctorBean();
				doc.setDocId(rs.getInt(1));
				doc.setDocName(rs.getString(2));
				doc.setDocPhone(rs.getString(3));
				doc.setDocDep(rs.getString(4));
				doc.setDocStatus(rs.getString(5));
				doc.setDocadd(rs.getString(7));
				doctorBean.add(doc);
			}

		} catch (SQLException sql) {
			sql.printStackTrace();
		}
		return doctorBean;
	}
	// --------------END---------------------
	// --------------START---------------------

			/**
			 *
			 * @author: Sreejith N S
			 * @Date: 5.12.2023
			 * @version : 1.0
			 */
	public static Boolean deleteDoc(DoctorBean doctorBean) throws ClassNotFoundException, SQLException {
		con = StaffLoginDAO.returnConnection();
		int rs = 0;
		try {
			pst = con.prepareStatement("DELETE FROM doctor WHERE fk_staff_id=?");
			pst.setInt(1, doctorBean.getDocFkStaffId());
			rs = pst.executeUpdate();
			pst = null;
			if (rs == 1) {
				pst = con.prepareStatement("DELETE FROM staff_login WHERE staff_id=?");
				pst.setInt(1, doctorBean.getDocFkStaffId());
				rs = 0;
				rs = pst.executeUpdate();
				if (rs == 1) {
					return true;
				}
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
	public static ArrayList<DoctorBean> getDocByDept(DoctorBean doc) throws ClassNotFoundException, SQLException {
		ArrayList<DoctorBean> doctorBean = new ArrayList<DoctorBean>();
		con = StaffLoginDAO.returnConnection();
		try {

			pst = con.prepareStatement("SELECT doc_name FROM doctor d WHERE doc_dep=?");
			pst.setString(1, doc.getDocDep());
			rs = pst.executeQuery();
			while (rs.next()) {

				DoctorBean doct = new DoctorBean();
				doct.setDocName(rs.getString(1));
				doctorBean.add(doct);

			}

		} catch (SQLException sql) {
			sql.printStackTrace();
		}
		return doctorBean;
	}
	// --------------END---------------------
	// --------------START---------------------

			/**
			 *
			 * @author: Sreejith N S
			 * @Date: 5.12.2023
			 * @version : 1.0
			 */
	public static int getDocId(DoctorBean doctorBean) throws ClassNotFoundException, SQLException {
		con = StaffLoginDAO.returnConnection();
		int staffId = 0;
		try {	
			System.out.println("????????????????///"+doctorBean.getDocName());
			pst = con.prepareStatement("SELECT fk_staff_id FROM doctor d WHERE doc_name=?");
			pst.setString(1, doctorBean.getDocName());
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
