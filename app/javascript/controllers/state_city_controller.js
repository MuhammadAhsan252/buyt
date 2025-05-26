// app/javascript/controllers/state_city_controller.js

import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "state", "city", "country" ]

  connect() {
    console.log("StateCityController connected")
  }

  fetchCities() {
    const selectedCountry = this.countryTarget.value
    const selectedState = this.stateTarget.value

    if (selectedState) {
      fetch(`/cities?country=${selectedCountry}&state=${selectedState}`)
        .then(response => response.json())
        .then(cities => {
          this.cityTarget.innerHTML = '<option value="">Select a city</option>'
          cities.forEach(city => {
            const option = new Option(city, city)
            this.cityTarget.add(option)
          })
        })
    } else {
      this.cityTarget.innerHTML = '<option value="">Select a city</option>'
    }
  }

  fetchStates() {
    const selectedCountry = this.countryTarget.value
  
    if (selectedCountry) {
      fetch(`/states?country=${selectedCountry}`)
        .then(response => response.json())
        .then(states => {
          this.stateTarget.innerHTML = '<option value="">Select a state</option>'
  
          // Iterate over the key-value pairs
          for (const [key, value] of Object.entries(states)) {
            const option = new Option(value, key)
            this.stateTarget.add(option)
          }
  
          this.fetchCities() // Fetch cities for the first state
        })
        .catch(error => {
          console.error('Error fetching states:', error)
          this.stateTarget.innerHTML = '<option value="">Select a state</option>'
          this.cityTarget.innerHTML = '<option value="">Select a city</option>'
        })
    } else {
      this.stateTarget.innerHTML = '<option value="">Select a state</option>'
      this.cityTarget.innerHTML = '<option value="">Select a city</option>'
    }
  }
  
}