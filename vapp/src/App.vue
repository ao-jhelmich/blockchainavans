<template>
  <div v-if="isDrizzleInitialized" id="app">
    <div class="min-h-screen bg-gray-100">
      <div class="bg-indigo-600 pb-52">
        <nav class="bg-indigo-600 border-b border-indigo-300 border-opacity-25 lg:border-none">
          <div class="max-w-7xl mx-auto px-2 sm:px-4 lg:px-8">
            <div class="relative h-16 flex items-center justify-between lg:border-b lg:border-indigo-400 lg:border-opacity-25">
              <div class="px-2 flex items-center lg:px-0">
                <div class="hidden lg:block">
                  <div class="flex space-x-4">
                      <router-link 
                            active-class="bg-indigo-700 text-white rounded-md py-2 px-3 text-sm font-medium"
                            exact-path
                            class="text-white hover:bg-indigo-500 hover:bg-opacity-75 rounded-md py-2 px-3 text-sm font-medium"
                            to="/products">Producten</router-link>
                      <router-link 
                            active-class="bg-indigo-700 text-white rounded-md py-2 px-3 text-sm font-medium"
                            exact-path
                            class="text-white hover:bg-indigo-500 hover:bg-opacity-75 rounded-md py-2 px-3 text-sm font-medium"
                            to="/products/create">Product toevoegen</router-link>
                      <router-link 
                            active-class="bg-indigo-700 text-white rounded-md py-2 px-3 text-sm font-medium"
                            exact-path
                            class="text-white hover:bg-indigo-500 hover:bg-opacity-75 rounded-md py-2 px-3 text-sm font-medium"
                            to="/products/search">Zoeken</router-link>
                  </div>

                </div>
              </div>
            </div>
          </div>
        </nav>
      </div>

      <main class="-mt-48">
        <div class="max-w-7xl mx-auto pb-12 sm:px-6 lg:px-8">
          <router-view></router-view>
        </div>
      </main>
    </div>

  </div>

  <div v-else class="flex items-center justify-center h-screen">
    <div class="text-indigo-700 font-bold">
      Loading....
    </div>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'

export default {
  name: 'app',

  computed: mapGetters('drizzle', ['isDrizzleInitialized'])
}
</script>
