<template>
  <div class="bg-white rounded-lg shadow px-5 py-6 sm:px-6">
    <div v-if="isDrizzleInitialized">
      <div class="mb-4">
        <div class="font-medium text-red-600">
          {{ errors }}
        </div>
      </div>
       <form action="#" method="POST">
          <div class="grid grid-cols-6 gap-6">
              <div class="col-span-6 sm:col-span-4">
                <label for="barcode" class="block text-sm font-medium text-gray-700">Barcode</label>
                
                <input 
                    type="number" 
                    min="0"
                    placeholder="99999999"
                    v-model="form.barcode"
                    name="barcode" 
                    id="barcode" 
                    class="mt-1 focus:ring-pink-500 focus:border-pink-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md">
              </div>

              <div class="col-span-6 sm:col-span-4">
                <label for="name" class="block text-sm font-medium text-gray-700">Naam</label>

                <input 
                    type="text" 
                    v-model="form.name"
                    placeholder="Red label"
                    name="name" 
                    id="name" 
                    class="mt-1 focus:ring-pink-500 focus:border-pink-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md">
              </div>

              <div class="col-span-6 sm:col-span-4">
                <label for="location" class="block text-sm font-medium text-gray-700">Locatie</label>
                <input 
                    type="text" 
                    v-model="form.location"
                    placeholder="Duitsland" 
                    name="location" 
                    id="location" 
                    class="mt-1 focus:ring-pink-500 focus:border-pink-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md">
              </div>
            </div>

            <div class="flex justify-end mt-5">
                <button 
                    type="button" 
                    @click.prevent="onSubmit"
                    class="py-2 px-4 border border-transparent shadow-sm text-sm font-medium rounded-md text-white bg-pink-600 hover:bg-pink-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-pink-500">
                    Toevoegen
                </button>
            </div>
      </form>
    </div>
    
    <div v-else>Loading...</div>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'

export default {
  name: 'ProductForm',
  data() {
    return {
      errors: null,
      form: {
        barcode: null,
        location: null,
        name: null,
      }
    }
  },

  computed: {
    ...mapGetters('drizzle', ['drizzleInstance', 'isDrizzleInitialized']),
  },
  

  methods: {
    onSubmit() {
      if (! this.validateForm()) {
        return;
      }

      this.drizzleInstance.contracts['ProductContract'].methods['add'].cacheSend(
        this.form.barcode, 
        this.form.location, 
        this.form.name
      )

      this.form.barcode = null
      this.form.location = null
      this.form.name = null
      // @TODO listen for add event, then clear input
    }, 

    validateForm() {
      if (! this.form.barcode || ! this.form.location || ! this.form.name) {
        this.errors = 'Niet alle velden zijn ingevuld'

        return false;
      }

      this.errors = ''
      return true
    }
  }
}
</script>
