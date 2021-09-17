package Domain;

public class Donation{
	private int id;
    private String donationId;
    private String location;
    private String timeStamp;
    private String status;
    private int donator;
    private int user;
    private String donatorBloodGroup;
    
	public String getDonatorBloodGroup() {
		return donatorBloodGroup;
	}
	public void setDonatorBloodGroup(String donatorBloodGroup) {
		this.donatorBloodGroup = donatorBloodGroup;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	

	public String getDonationId() {
		return donationId;
	}
	public void setDonationId(String donationId) {
		this.donationId = donationId;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getTimeStamp() {
		return timeStamp;
	}
	public void setTimeStamp(String timeStamp) {
		this.timeStamp = timeStamp;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getDonator() {
		return donator;
	}
	public void setDonator(int donator) {
		this.donator = donator;
	}
	public int getUser() {
		return user;
	}
	public void setUser(int user) {
		this.user = user;
	}
	
	
public Donation( String donationId,String location,int donator, int user, String donatorBloodGroup) {
		
        this.donationId=donationId;
        this.location=location;
        this.donator=donator;
        this. user=user;
        this. donatorBloodGroup=donatorBloodGroup;
       
	}
public Donation(int id, String donationId,String location,String timeStamp,int donator, int user) {
	
    this.id=id;
    this.timeStamp=timeStamp;
    this.donationId=donationId;
    this.location=location;
    this.donator=donator;
    this. user=user;
   
}
	
}
