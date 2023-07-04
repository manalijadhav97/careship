@IsTest
private class ContactControllerTest {

    @TestSetup
    static void makeData(){
        List<Contact> contactList = new List<Contact>();

        for(Integer i=0; i < 10 ; i++) {
            contactList.add(new Contact(FirstName = 'Test First Name ' +i, LastName = 'LN '+ i, Email = 'test'+i+'@example.com'));
        }

        insert contactList;

    }

    @IsTest
    private static void testGetContacts(){
        Test.startTest();
        List<Contact> contactList = ContactController.getContacts();
        Test.stopTest();
        Assert.isTrue(!contactList.isEmpty(), 'there are more than zero contacts');
        Assert.areEqual(contactList.size(), 10, 'there are total 10 contacts');
    }
}
