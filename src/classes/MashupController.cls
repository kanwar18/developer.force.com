public class MashupController {
	
	public List<Contact> getMyContacts() {
    return [SELECT Id, Name, Account.Name FROM Contact 
                              ORDER BY LastModifiedDate DESC LIMIT 10];
}
String result='Click on an account to fetch the data';

public String getFetchedData() {
return result;
}

	public PageReference invokeService() {
	   Id id = System.currentPageReference().getParameters().get('id');
	   result = [SELECT Name FROM Contact WHERE Id=:id].Name;
	   //returning null indicates the same page should be returned - in place change
	   return null;
	}

	
	
}