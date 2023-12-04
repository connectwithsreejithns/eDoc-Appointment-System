package com.edoc.beans;

public class AppointPatientForeignBean {
	int AppId;
	String PersName;
	String PersGender;
	int PersAge;
	int FkDocId;

	String AppStatus;
	String PersAdd;
	String PersPhone;

	public int getAppId() {
		return AppId;
	}

	public void setAppId(int appId) {
		AppId = appId;
	}

	public String getPersName() {
		return PersName;
	}

	public void setPersName(String persName) {
		PersName = persName;
	}

	public String getPersGender() {
		return PersGender;
	}

	public void setPersGender(String persGender) {
		PersGender = persGender;
	}

	public int getPersAge() {
		return PersAge;
	}

	public void setPersAge(int persAge) {
		PersAge = persAge;
	}

	public int getFkDocId() {
		return FkDocId;
	}

	public void setFkDocId(int fkDocId) {
		FkDocId = fkDocId;
	}

	public String getAppStatus() {
		return AppStatus;
	}

	public void setAppStatus(String appStatus) {
		AppStatus = appStatus;
	}

	public String getPersAdd() {
		return PersAdd;
	}

	public void setPersAdd(String persAdd) {
		PersAdd = persAdd;
	}

	public String getPersPhone() {
		return PersPhone;
	}

	public void setPersPhone(String persPhone) {
		PersPhone = persPhone;
	}
}
