import { LightningElement,wire } from 'lwc';
import getContacts from '@salesforce/apex/ContactController.getContacts';
export default class ContactList extends LightningElement {
    
    columns = [
        { label: 'First Name', fieldName: 'firstName', hideDefaultActions : true },
        { label: 'Last Name', fieldName: 'lastName', hideDefaultActions : true  },
        { label: 'Email', fieldName: 'email', type: 'email', hideDefaultActions : true },
    ];

    contactInfo = [];
    error;

    @wire(getContacts)
    wiredContacts({data , error}){
        if (error) {
            this.contactInfo = undefined;
            if (Array.isArray(error.body)) {
                this.error = error.body.map(e => e.message).join(', ');
            } else if (typeof error.body.message === 'string') {
                this.error = error.body.message;
            }
        } else if (data) {
            if(Array.from(data).length === 0){
                this.error = 'There are no Contacts to display!';
                this.contactInfo = undefined;
                return;
            }
            this.contactInfo = [...data].map(ele => {
                return {id: ele.Id, firstName : ele.FirstName, lastName: ele.LastName, email:ele.Email}
            });
            
        }
    }
    
}