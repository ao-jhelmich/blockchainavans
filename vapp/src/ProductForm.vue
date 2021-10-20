<template>
  <div class="bg-white rounded-lg shadow px-5 py-6 sm:px-6">
    <div v-if="isDrizzleInitialized">
       <form action="#" method="POST">
          <div class="grid grid-cols-6 gap-6">
              <div class="col-span-6 sm:col-span-4">
                <label for="barcode" class="block text-sm font-medium text-gray-700">Barcode</label>
                <input 
                    type="number" 
                    v-model="form.barcode"
                    name="barcode" 
                    id="barcode" 
                    class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md">
              </div>

              <div class="col-span-6 sm:col-span-4">
                <label for="name" class="block text-sm font-medium text-gray-700">Naam</label>
                <input 
                    type="text" 
                    v-model="form.name"
                    name="name" 
                    id="name" 
                    class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md">
              </div>

              <div class="col-span-6 sm:col-span-4">
                <label for="location" class="block text-sm font-medium text-gray-700">Locatie</label>
                <input 
                    type="text" 
                    v-model="form.location"
                    name="location" 
                    id="location" 
                    class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md">
              </div>
            </div>

            <div class="flex justify-end mt-5">
                <button 
                    type="button" 
                    @click.prevent="onSubmit"
                    class="py-2 px-4 border border-transparent shadow-sm text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                    Save
                </button>
            </div>

            <drizzle-contract
              contractName="Flip"
              method="get"
              label="Value"
            />

             <drizzle-contract-form
              contractName="Flip"
              method="flip"
              :placeholders="['Value']"
            />

            <div>{{form.location}}</div>
            <div>{{form.name}}</div>
            <div>{{form.barcode}}</div>
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
      form: {
        barcode: null,
        location: null,
        name: null,
      }
    }
  },

  computed: {
    ...mapGetters('drizzle', ['drizzleInstance', 'isDrizzleInitialized']),

    abi() {
      const di = this.drizzleInstance
      return di.contracts['Flip'].abi.find(
        item => item.name === this.method
      )
    },

    abiInputs() {
      console.log(this.api)
      return this.abi.inputs
    },

    utils() {
      return this.drizzleInstance.web3.utils
    }
  },
  

  methods: {
    onSubmit() {
      this.drizzleInstance.contracts['ProductContract'].methods[
        'add'
      ].cacheSend(this.form.barcode, this.form.location, this.form.name)
    }
  }
}
</script>