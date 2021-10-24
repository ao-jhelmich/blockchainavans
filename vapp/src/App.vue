<template>
  <div v-if="isDrizzleInitialized" id="app">
    <div class="min-h-screen bg-gray-100">
      <div class="bg-indigo-600 pb-32">
        <nav class="bg-indigo-600 border-b border-indigo-300 border-opacity-25 lg:border-none">
          <div class="max-w-7xl mx-auto px-2 sm:px-4 lg:px-8">
            <div class="relative h-16 flex items-center justify-between lg:border-b lg:border-indigo-400 lg:border-opacity-25">
              <div class="px-2 flex items-center lg:px-0">
                <div class="flex-shrink-0">
                  <img class="block h-8 w-8" src="https://tailwindui.com/img/logos/workflow-mark-indigo-300.svg" alt="Workflow">
                </div>
                <div class="hidden lg:block lg:ml-10">
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
                            to="/products/search">Product checken</router-link>
                  </div>

                </div>
              </div>
              
              <drizzle-account></drizzle-account>
            </div>
          </div>
        </nav>

        <header class="py-10">
          <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <h1 class="text-3xl font-bold text-white">
              Header
            </h1>
          </div>
        </header>
      </div>

      <main class="-mt-32">
        <div class="max-w-7xl mx-auto pb-12 px-4 sm:px-6 lg:px-8">
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
// import TutorialToken from './TutorialToken'
import { mapGetters } from 'vuex'

export default {
  name: 'app',
  components: {
    // ComplexStorage,
  },

  computed: mapGetters('drizzle', ['isDrizzleInitialized'])
}
</script>
