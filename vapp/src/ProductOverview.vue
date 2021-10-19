<template>
  <div class="bg-white rounded-lg shadow px-5 py-6 sm:px-6">
    <div v-if="isDrizzleInitialized">
      <h1>ProductOverview</h1>
    </div>

    <div v-else>Loading...</div>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'

export default {
  name: 'ProductOverview',

  computed: mapGetters('drizzle', ['isDrizzleInitialized']),
}
</script>