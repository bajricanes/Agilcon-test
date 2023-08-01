import { LightningElement, track } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import validateEMSO from '@salesforce/apex/CreateStudentController.ValidateEMSO';

export default class CreateStudent extends LightningElement {
    @track showPayer = false;
    validationOutput; 
    error;

    async handleSubmit(event){
       
        event.preventDefault();

        await this.validateEmso(event.detail.fields.EMSO__c);

        if(this.validationOutput === 'OK'){
            this.template.querySelector('lightning-record-edit-form').submit(event.detail.fields);
        }
        else{
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Error',
                    message: this.validationOutput,
                    variant: 'error'
                })
            );
        }
    }

    handleSuccess(){
        this.dispatchEvent(
            new ShowToastEvent({
                title: 'Success',
                message: 'Student was created',
                variant: 'success'
            })
        );
    }

    handleTypeOfStudyChange(event){
        if(event.detail.value !== null && event.detail.value !== undefined && event.detail.value !== '')
            this.showPayer = true;
        else
            this.showPayer = false;
            
    }

    async validateEmso(emso){
        await validateEMSO({EMSO : emso})
        .then((result) => {
          this.validationOutput = result;
          this.error = undefined;
        })
        .catch((error) => {
          this.error = error;
        });
    }

}
