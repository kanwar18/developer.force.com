public with sharing class ButtonDisablerController {
	public PageReference search () {
		Integer count = 1;
		while (count < 100000) {
			count++;
		}
		
		ApexPages.addMessage( new ApexPages.Message( ApexPages.Severity.INFO, 'Hi'));

        return null;
	}

}