package model;

public class Person {
	private String name = null;
	private String job = null;
	private String id = null;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public void setName(String s) {
		name = s;
	}
}
