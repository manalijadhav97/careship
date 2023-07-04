/**
 * @description       : Controller for contactList LWC
 * @last modified on  : 07-04-2023
 **/
public with sharing class ContactController {
  /**
   * @description : fetchs all contacts from contact object.
   * @author manali | 07-04-2023
   * @return List<Contact>
   **/
  @AuraEnabled(cacheable=true)
  public static List<Contact> getContacts() {
    try {
      return [
        SELECT Id, FirstName, LastName, Email
        FROM Contact
        WITH USER_MODE
        LIMIT 1000
      ];
    } catch (Exception e) {
      throw new AuraHandledException(e.getMessage());
    }
  }
}
