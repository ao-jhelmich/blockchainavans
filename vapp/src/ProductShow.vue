<template>
  <div class="bg-white shadow overflow-hidden sm:rounded-lg">
  <div class="px-4 py-5 sm:px-6">
    <h3 class="text-lg leading-6 font-medium text-gray-900">
      Product Informatie ({{ barcode }})
    </h3>
    <p class="mt-1 max-w-2xl text-sm text-gray-500">
      Omschrijving, locatie en barcode
    </p>
  </div>
  <div class="border-t border-gray-200">
    <dl>
      <div class="bg-gray-50 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
        <dt class="text-sm font-medium text-gray-500">
          Omschrijving
        </dt>
        <dd class="mt-1 text-sm text-gray-900 sm:mt-0 sm:col-span-2">
          {{ name }}
        </dd>
      </div>
      <div class="bg-white px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
        <dt class="text-sm font-medium text-gray-500">
          Locatie
        </dt>
        <dd class="mt-1 text-sm text-gray-900 sm:mt-0 sm:col-span-2">
          {{ location }}
        </dd>
      </div>
      <div class="bg-gray-50 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
        <dt class="text-sm font-medium text-gray-500">
          Barcode
        </dt>
        <dd class="mt-1 text-sm text-gray-900 sm:mt-0 sm:col-span-2">
          {{ barcode }}
        </dd>
      </div>
    </dl>
  </div>
</div>
</template>

<script>
import { mapGetters } from 'vuex'
export default {
  name: 'ProductShow',
  data() {
    return {
      name: null,
      location: null,
    }
  },

  computed: {
    ...mapGetters("drizzle", ["isDrizzleInitialized", "drizzleInstance"]),

    barcode() {
       return this.$route.params.barcode
    }
  },

  async created() {
      this.name = await this.drizzleInstance.contracts.ProductContract.methods
        .getName(this.barcode)
        .call();

      this.location = await this.drizzleInstance.contracts.ProductContract.methods
        .getLocation(this.barcode)
        .call();

  }
}
</script>
