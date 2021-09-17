package Domain;

public class User {
	
	private int id;
    private String name;
    private String nic;
    private String status;
    private String password;
    public User(){}
	public User( int l,String name,String nic,String status, String password) {
		
		this.id=l;
        this.name=name;
        this.nic=nic;
        this.status=status;
        this.password=password;
	}
	
	public User(String name,String nic,String password){
        this.name = name;
        this.nic = nic;
        this.password = password;
    }

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNic() {
		return nic;
	}

	public void setNic(String nic) {
		this.nic = nic;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
