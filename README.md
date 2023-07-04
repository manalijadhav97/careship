# Technical Design Document 

# Introduction:
This technical document provides step-by-step instructions on creating a Lightning web component that utilizes the @wire decorator to retrieve contact records from an Apex controller. The retrieved contact records are then displayed in a lightning-datatable component. Additionally, we will add the component to a new App page.

# Lightning App

 - Lightning App : Contacts_App created.
 - Lightning App Page : Contacts created.
    - Users with System Admin Profile will have access to this App & page. 

# Apex Component

- ContactController - This class is  the controller class for the LWC components. 
    - We have implemented the best practices like try, catch block 
    - thrown AuraHandledException , which is elegantly handled by the LWC component. 
    - In terms of security the class runs in with sharing mode preserving the users persmissions to sharing. 
    - Field-level security (FLS) and object permissions of the running user are respected in user mode, hence the query is run with respect to USER_MODE, agains the standard way of system mode.

- ContactControllerTest class is implememted to unit-test.

# Lightning Web Component 

- ContactList 
    - We have implemented getContacts()  wire method to get the contacts and displayed in the UI with the help of Lightning-datatable. 
    - Incase of any error/expections are handled on client level too in the js. 

- error-panel 
    - error panel componet handles the errors one might encounter.

# Testing  

Setup --> Navigate to Contact_ App --> Contacts Page --> All the conatcts will be shown. 

# Output 

