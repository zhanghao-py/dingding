package cn.edu.bjut.weichat.core.web.action.dto;

public class StatusInfo {

	public final static int SUCCESS = 0;
	public final static int FAILED = 1;
	
	public final static String SUCCESS_MSG = "success";
	
	private int status = SUCCESS;
	private String statusInfo = "";
	private Object data = "";

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getStatusInfo() {
		return statusInfo;
	}

	public void setStatusInfo(String statusInfo) {
		this.statusInfo = statusInfo;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}

}
