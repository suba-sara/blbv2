package Domain;


public class Donator {
	private int id;
   
	private String name;
    private String nic;
    private String status;
    private String address;
    private String gender;
    private String dob;
    private int contactNo;
    private String bloodGroup;
    
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public int getContactNo() {
		return contactNo;
	}
	public void setContcatNo(int contactNo) {
		this.contactNo = contactNo;
	}
	public String getBloodGroup() {
		return bloodGroup;
	}
	public void setBloodGroup(String bloodGroup) {
		this.bloodGroup = bloodGroup;
	}
   
	
	public Donator( int id,String name,String nic,String address, String gender ,String dob,String bloodGroup,int contactNo,String status) {
		
		this.id=id;
        this.name=name;
        this.nic=nic;
        this.status=status;
        this.address=address;
        this. gender=gender;
        this.dob=dob;
        this.contactNo =contactNo;
        this.bloodGroup=bloodGroup;
	}

	public Donator( String name,String nic,String address, String gender ,String dob,String bloodGroup,int contactNo) {
		
		
        this.name=name;
        this.nic=nic;
        this.address=address;
        this. gender=gender;
        this.dob=dob;
        this.contactNo =contactNo;
        this.bloodGroup=bloodGroup;
	}
	
}

