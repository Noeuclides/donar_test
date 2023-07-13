import ApplicationController from './application_controller'

/* This is the custom StimulusReflex controller for the Counter Reflex.
 * Learn more at: https://docs.stimulusreflex.com
 */
export default class extends ApplicationController {
    /*
     * Regular Stimulus lifecycle methods
     * Learn more at: https://stimulusjs.org/reference/lifecycle-callbacks
     *
     * If you intend to use this controller as a regular stimulus controller as well,
     * make sure any Stimulus lifecycle methods overridden in ApplicationController call super.
     *
     * Important:
     * By default, StimulusReflex overrides the -connect- method so make sure you
     * call super if you intend to do anything else when this controller connects.
    */

    static targets = ['form', 'cardToken'];

    connect() {
        super.connect()
        // add your code here, if applicable
    }

    async encryptData(event) {
        event.preventDefault(); // Prevent default form submission

        console.log("dfjadjfdajfajdfjajdfa")
        console.log(this.formTarget)
        console.log("dfjadjfdajfajdfjajdfa")
        const formData = new FormData(this.formTarget);
        const data = JSON.stringify(Object.fromEntries(formData));
        const encoder = new TextEncoder();
        const dataBuffer = encoder.encode(data);

        const key = await window.crypto.subtle.generateKey(
            {
                name: 'AES-GCM',
                length: 256,
            },
            true,
            ['encrypt']
        );

        const encryptedDataBuffer = await window.crypto.subtle.encrypt(
            {
                name: 'AES-GCM',
                iv: window.crypto.getRandomValues(new Uint8Array(12)),
            },
            key,
            dataBuffer
        );

        const encryptedDataArray = Array.from(new Uint8Array(encryptedDataBuffer));
        const encryptedData = encryptedDataArray.map(byte => String.fromCharCode(byte)).join('');

        this.cardTokenTarget.value = btoa(encryptedData);

        delete this.formTarget.franchise
        delete this.formTarget.card_number
        this.formTarget.submit();
    }

}
