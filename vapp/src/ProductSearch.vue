<template>
  <div class="bg-white rounded-lg shadow px-5 py-6 sm:px-6">
    <div class="py-2">
      <h3 class="text-lg leading-6 font-medium text-gray-900">
        Product opzoeken
      </h3>
      <p class="mt-1 max-w-2xl text-sm text-gray-500">
        Op basis van barcode
      </p>
    </div>
    <div class="mb-4">
      <div class="font-medium text-red-600">
        {{ errors }}
      </div>
    </div>
    
    <form action="#" method="POST">
      <div class="grid grid-cols-6 gap-6">
        <div class="col-span-6 sm:col-span-4">
          <label for="barcode" class="block text-sm font-medium text-gray-700"
            >Barcode</label
          >

          <input
            type="number"
            min="0"
            placeholder="99999999"
            v-model="form.barcode"
            name="barcode"
            id="barcode"
            class="
              mt-1
              focus:ring-pink-500 focus:border-pink-500
              block
              w-full
              shadow-sm
              sm:text-sm
              border-gray-300
              rounded-md
            "
          />
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
          Zoeken
        </button>
      </div>
    </form>
  </div>
</template>

<script>
import { mapGetters } from "vuex";

export default {
  name: "ProductSearch",
  data() {
    return {
      errors: null,
      form: {
        barcode: null,
      },
    };
  },

  computed: {
    ...mapGetters("drizzle", ["drizzleInstance", "isDrizzleInitialized"]),
  },

  methods: {
    onSubmit() {
      if (!this.validateForm()) {
        return;
      }

      if (!this.validateBarcode()) {
        return;
      }

      this.$router.push(`/products/${this.form.barcode}/show`);
    },

    validateForm() {
      if (!this.form.barcode) {
        this.errors = "Niet alle velden zijn ingevuld";

        return false;
      }

      this.errors = "";
      return true;
    },

    validateBarcode() {
      return true;
      // @TODO check if product exists
    },
  },
};
</script>
