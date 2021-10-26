<template>
  <div>
    <div class="mt-2 grid grid-cols-1 gap-5 sm:grid-cols-3">
      <div class="bg-white overflow-hidden shadow rounded-lg">
        <div class="px-4 py-5 sm:p-6">
          <dl>
            <dt class="text-sm leading-5 font-medium text-gray-500 truncate">
              Totaal toegevoegde producten
            </dt>
            <dd class="mt-1 text-3xl leading-9 font-semibold text-gray-900">
              {{ count }}
            </dd>
          </dl>
        </div>
      </div>
    </div>

    <div class="mt-5 bg-white shadow overflow-hidden sm:rounded-md">
      <ul role="list" class="divide-y divide-gray-200">
        <li v-for="(barcode, index) in products" :key="index">
          <router-link :to="`/products/${barcode}/show`" class="block hover:bg-gray-50">
            <div class="px-4 py-4 sm:px-6">
              <div class="flex items-center justify-between">
                <p class="text-sm font-medium text-pink-400 truncate">
                  Product
                </p>
              </div>
              <div class="mt-2 sm:flex sm:justify-between">
                <div class="sm:flex">
                  <p class="flex items-center text-sm text-gray-500">
                    <!-- Heroicon name: solid/users -->
                    <svg
                      xmlns="http://www.w3.org/2000/svg"
                      class="flex-shrink-0 mr-1.5 h-5 w-5 text-gray-400"
                      fill="none"
                      viewBox="0 0 24 24"
                      stroke="currentColor"
                    >
                      <path
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        stroke-width="2"
                        d="M12 4v1m6 11h2m-6 0h-2v4m0-11v3m0 0h.01M12 12h4.01M16 20h4M4 12h4m12 0h.01M5 8h2a1 1 0 001-1V5a1 1 0 00-1-1H5a1 1 0 00-1 1v2a1 1 0 001 1zm12 0h2a1 1 0 001-1V5a1 1 0 00-1-1h-2a1 1 0 00-1 1v2a1 1 0 001 1zM5 20h2a1 1 0 001-1v-2a1 1 0 00-1-1H5a1 1 0 00-1 1v2a1 1 0 001 1z"
                      />
                    </svg>
                    {{ barcode }}
                  </p>
                </div>
                <div
                  class="mt-2 flex items-center text-sm text-gray-500 sm:mt-0"
                >
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    class="flex-shrink-0 mr-1.5 h-5 w-5 text-gray-400"
                    fill="none"
                    viewBox="0 0 24 24"
                    stroke="currentColor"
                  >
                    <path
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      stroke-width="2"
                      d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"
                    />
                    <path
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      stroke-width="2"
                      d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"
                    />
                  </svg>

                  Show
                </div>
              </div>
            </div>
          </router-link>
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
import { mapGetters } from "vuex";

export default {
  name: "ProductOverview",

  data() {
    return {
      count: 0,
      products: [],
    };
  },

  computed: mapGetters("drizzle", ["isDrizzleInitialized", "drizzleInstance"]),

  async created() {
    this.count = await this.drizzleInstance.contracts.ProductContract.methods
      .count()
      .call();

    this.products = await this.drizzleInstance.contracts.ProductContract.methods
      .all()
      .call();
  },
};
</script>