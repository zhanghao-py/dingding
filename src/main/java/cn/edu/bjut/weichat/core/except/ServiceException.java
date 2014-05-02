package cn.edu.bjut.weichat.core.except;

public class ServiceException extends Exception {

	private static final long serialVersionUID = -3058065981384115752L;

	public ServiceException() {
		super();
	}
	
	public ServiceException(String msg) {
		super(msg);
	}
}
