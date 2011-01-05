/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 */
@isTest
private class TestHandleProductPriceChange {

    static testMethod void testPriceChange() {
        Invoice_Statement__c invoice = new Invoice_Statement__c(Status__c = 'Negotiating');
        insert invoice;
        Merchandise__c[] products = new Merchandise__c[] {
        	new Merchandise__c(Name = 'item 1', Description__c = 'test product 1', Price__c = 10, Total_Inventory__c = 10),
        	new Merchandise__c(Name = 'item 2', Description__c = 'test product 2', Price__c = 11, Total_Inventory__c = 10)
        };
        insert products;
        System.debug('Hi Dave' + invoice);
        Line_Item__c[] lineItems = new Line_Item__c [] {
        	new Line_Item__c(Name='Line1', Invoice_Statement__c=invoice.id, Merchandise__c = products[0].id, Unit_Price__c = 10, Units_Sold__c = 3),
        	new Line_Item__c(Name='Line2', Invoice_Statement__c=invoice.id, Merchandise__c = products[1].id, Unit_Price__c = 11, Units_Sold__c = 6),        		
        	new Line_Item__c(Name='Line3', Invoice_Statement__c=invoice.id, Merchandise__c = products[1].id, Unit_Price__c = 11, Units_Sold__c = 1)        		
        
        };
        
        insert lineItems;
        products[0].price__c = 2;
        products[1].Total_Inventory__c = 500;
        Test.startTest();
        update products;
        Test.stopTest();
        lineItems = [
        SELECT id, unit_price__c 
        FROM Line_Item__c 
        WHERE ID IN :lineItems];
        system.assert(lineItems[0].unit_price__c == 2);
    }
}