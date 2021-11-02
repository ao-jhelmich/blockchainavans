<template>
  <div class="bg-white rounded-lg shadow px-5 py-6 sm:px-6">
    <div class="py-2">
      <h3 class="text-lg leading-6 font-medium text-gray-900">
        Openstaande Boetes
      </h3>
      <p class="mt-1 max-w-2xl text-sm text-gray-500">
        Openstaande boete bedrag is: <span v-text="penalty" class="text-pink-500"></span>
      </p>
    </div>
    <div class="mb-4">
      <div class="font-medium text-red-600">
        {{ errors }}
      </div>
    </div>

    <form action="#">
      <div class="grid grid-cols-6 gap-6">
        <div class="col-span-6 sm:col-span-4">
          <label for="amount" class="block text-sm font-medium text-gray-700">
            Bedrag af betalen
          </label>

          <input
            type="number"
            min="0"
            v-model="form.amount"
            name="amount"
            id="amount"
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
          Betalen
        </button>
      </div>
    </form>
  </div>
</template>

<script>
import { mapGetters } from "vuex";

export default {
  name: "UserPenalty",
  data() {
    return {
      errors: null,
      penalty: {
        amount: null,
      },
      form: {
        amount: null,
      },
    };
  },

  computed: {
    ...mapGetters("drizzle", ["drizzleInstance", "isDrizzleInitialized"]),
  },

  async created() {
    await this.setPenalty()
  },  

  mounted() {
    this.$drizzleEvents.$on('drizzle/contractEvent', async payload => {
      const { data } = payload
      
      this.$vToastify.success(`${data._message}`);

      this.form.amount = null

      await this.setPenalty()
    })
  },
  
  methods: {
    async setPenalty() {
      this.penalty = await this.drizzleInstance.contracts.ProductContract.methods
        .penalty()
        .call();
    },

    onSubmit() {
      if (!this.validateForm()) {
        return;
      }

      this.drizzleInstance.contracts.ProductContract.methods
        .payPenalty()
        .send({ value: this.convertedWei() });
    },

    convertedWei() {
      return this.drizzleInstance.web3.utils.toWei(this.form.amount.toString(), 'ether');
    },

    validateForm() {
      if (!this.form.amount) {
        this.errors = "Niet alle velden zijn ingevuld";

        return false;
      }

      this.errors = "";
      return true;
    },
  },
};
</script>
