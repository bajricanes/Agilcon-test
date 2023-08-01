import { LightningElement, wire, track, api} from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import getExamRegistrationsByExamId from  '@salesforce/apex/ExamRegistrationsHelper.GetExamRegistrationsByExamId';
import { deleteRecord } from 'lightning/uiRecordApi';
import { refreshApex } from '@salesforce/apex';

const columns = [
    { label: 'Student', fieldName: 'Student_Name__c', initialWidth: 420},
    {
        type:"button",
            initialWidth: 120,
             typeAttributes: {
                 label: 'Deregister',
                 name: 'Deregister'
             }
    },
];

export default class ExamRegistrations extends LightningElement {
    @api recordId;
    columns = columns;

    @track error;
    @track examRegistrations ;
    @track examRegistrationsResult;

    @wire(getExamRegistrationsByExamId, {examID : '$recordId' })
        wiredGetExamRegistrations(result) {
            this.examRegistrationsResult = result;
            if (result.data) {
                this.examRegistrations = result.data;
                this.error = undefined;
            } else if (result.error) {
                this.error = result.error;
                this.examRegistrations = undefined;
            }
        }

    handleDeregisterClicked(event){
        let deleteId = event.detail.row.Id;
        deleteRecord(deleteId)
        .then(() => {
            this.dispatchEvent(
            new ShowToastEvent({
                title: "Success",
                message: "Student deregistered",
                variant: "success",
            }),
            );   
            refreshApex(this.examRegistrationsResult);
        })
        .catch((error) => {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: "Success",
                    message: error,
                    variant: "success",
                }),
                ); 
        });
    }
}
