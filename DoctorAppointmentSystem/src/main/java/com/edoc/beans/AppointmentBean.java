package com.edoc.beans;

public class AppointmentBean {
	int appId;
	int fkDocId;
	int fkPatId;
	int timeId;
	String appDate;
	String appStatus;

	public int getAppId() {
		return appId;
	}

	public void setAppId(int appId) {
		this.appId = appId;
	}

	public int getFkDocId() {
		return fkDocId;
	}

	public void setFkDocId(int fkDocId) {
		this.fkDocId = fkDocId;
	}

	public int getFkPatId() {
		return fkPatId;
	}

	public void setFkPatId(int fkPatId) {
		this.fkPatId = fkPatId;
	}

	public String getAppStatus() {
		return appStatus;
	}

	public void setAppStatus(String appStatus) {
		this.appStatus = appStatus;
	}

	public int getTimeId() {
		return timeId;
	}

	public void setTimeId(int timeId) {
		this.timeId = timeId;
	}

	public String getAppDate() {
		return appDate;
	}

	public void setAppDate(String appDate) {
		this.appDate = appDate;
	}

}
