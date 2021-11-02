<template>
  <div class="bg-white shadow overflow-hidden sm:rounded-lg">
  <div class="px-4 py-5 sm:px-6">
    <h3 class="text-lg leading-6 font-medium text-gray-900">
      Product Informatie ({{ barcode }})
    </h3>

    <div v-if="error" v-text="error" class="bg-pink-100 text-pink-500 p-4 mt-5 border border-pink-500">

    </div>

    <p v-else class="mt-1 max-w-2xl text-sm text-gray-500">
      Omschrijving, locatie en barcode
    </p>
  </div>
  <div class="border-t border-gray-200">
    <dl v-if="product">
      <div class="bg-gray-50 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
        <dt class="text-sm font-medium text-gray-500">
          Omschrijving
        </dt>
        <dd class="mt-1 text-sm text-gray-900 sm:mt-0 sm:col-span-2">
          {{ product.name }}
        </dd>
      </div>
      <div class="bg-white px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
        <dt class="text-sm font-medium text-gray-500">
          Locatie
        </dt>
        <dd class="mt-1 text-sm text-gray-900 sm:mt-0 sm:col-span-2">
          {{ product.location }}
        </dd>
      </div>
      <div class="bg-gray-50 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
        <dt class="text-sm font-medium text-gray-500">
          Barcode
        </dt>
        <dd class="mt-1 text-sm text-gray-900 sm:mt-0 sm:col-span-2">
          {{ product.barcode }}
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
      error: null,
      product: null,
    }
  },

  computed: {
    ...mapGetters("drizzle", ["isDrizzleInitialized", "drizzleInstance"]),

    barcode() {
       return this.$route.params.barcode
    }
  },

  mounted() {
    this.$drizzleEvents.$on('drizzle/contractEvent', payload => {
      const { data } = payload
      
      this.$vToastify.success(`${data._message}`);

      this.form.country = null;
    })
  },

  async created() {
      this.product = await this.drizzleInstance.contracts.ProductContract.methods
        .getProduct
        .cacheSend(this.barcode);
  }
}
</script>
