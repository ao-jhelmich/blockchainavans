<template>
  <div class="bg-white rounded-lg shadow px-5 py-6 sm:px-6">
    <div v-if="isDrizzleInitialized">
       <form action="#" method="POST">
          <div class="grid grid-cols-6 gap-6">
              <div class="col-span-6 sm:col-span-4">
                <label for="barcode" class="block text-sm font-medium text-gray-700">Barcode</label>
                <input 
                    type="text" 
                    v-model="barcode"
                    name="barcode" 
                    id="barcode" 
                    class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md">
              </div>

              <div class="col-span-6 sm:col-span-4">
                <label for="location" class="block text-sm font-medium text-gray-700">Locatie</label>
                <input 
                    type="text" 
                    v-model="location"
                    name="location" 
                    id="location" 
                    class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md">
              </div>
            </div>

            <div class="flex justify-end mt-5">
                <button type="submit" class="py-2 px-4 border border-transparent shadow-sm text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
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

            <div>{{location}}</div>
            <div>{{barcode}}</div>
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
      barcode: null,
      location: null,
    }
  },

  computed: mapGetters('drizzle', ['isDrizzleInitialized']),
}
</script>