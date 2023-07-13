import ApplicationController from 'controllers/application_controller'
import StimulusReflex from 'stimulus_reflex'

export default class extends ApplicationController {

    connect() {
        super.connect()
    }

    display_modal(event) {
        const donationId = event.currentTarget.id
        const modal = document.querySelector(`#modal-${donationId}`)
        modal.classList.remove('hidden');
    }

    close_modal(event) {
        const donationId = event.currentTarget.id.split('-')[2];
        const modal = document.querySelector(`#modal-${donationId}`)
        modal.classList.add('hidden');
    }
}
