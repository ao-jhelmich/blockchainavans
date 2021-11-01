<template>
  <div class="bg-white rounded-lg shadow px-5 py-6 sm:px-6">
    <div v-if="isDrizzleInitialized">
      <div v-if="errors" class="mb-4">
        <div class="font-medium text-red-600">
          {{ errors }}
        </div>
      </div>

      <div v-if="registered">
        <p class="text-gray-700 text-2xl">Account is al reeds aangemeld, voor: <span v-text="registered"></span></p>
      </div>

      <form v-else action="#" method="POST">
        <div class="grid grid-cols-6 gap-6">
          <div class="col-span-6 sm:col-span-4">
            <label for="barcode" class="block text-sm font-medium text-gray-700"
              >Continent</label
            >

            <select
              v-model="form.country"
              class="
                mt-1
                block
                w-full
                pl-3
                pr-10
                py-2
                text-base
                border-gray-300
                focus:outline-none focus:ring-indigo-500 focus:border-indigo-500
                sm:text-sm
                rounded-md
              "
            >
              <option
                v-for="country in countries"
                :key="country"
                :value="country"
                v-text="country"
              ></option>
            </select>
          </div>
        </div>

        <div class="flex justify-end mt-5">
          <button
            type="button"
            @click.prevent="onSubmit"
            class="
              py-2
              px-4
              border border-transparent
              shadow-sm
              text-sm
              font-medium
              rounded-md
              text-white
              bg-pink-600
              hover:bg-pink-700
              focus:outline-none
              focus:ring-2
              focus:ring-offset-2
              focus:ring-pink-500
            "
          >
            Registreren
          </button>
        </div>
      </form>
    </div>

    <div v-else>Loading...</div>
  </div>
</template>

<script>
import { mapGetters } from "vuex";

export default {
  name: "ProductForm",
  data() {
    return {
      countries: ["azie", "europa", "amerika", "oceanie", "arika"],
      registered: false,
      errors: null,
      form: {
        country: null,
      },
    };
  },

  computed: {
    ...mapGetters("drizzle", ["drizzleInstance", "isDrizzleInitialized"]),
  },

  async created() {
    this.registered =
      await this.drizzleInstance.contracts.ProductContract.methods
        .checkUser()
        .call();
  },

  methods: {
    onSubmit() {
      if (!this.validateForm()) {
        return;
      }

      this.drizzleInstance.contracts["ProductContract"].methods[
        "addUser"
      ].cacheSend(this.form.country);

      // @TODO listen for add event, then clear input
      this.form.country = null;
    },

    validateForm() {
      if (!this.form.country) {
        this.errors = "Niet alle velden zijn ingevuld";

        return false;
      }

      this.errors = "";
      return true;
    },
  },
};
</script>
