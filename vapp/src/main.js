import Vue from 'vue'
import App from './App.vue'
import Vuex from 'vuex'
import ProductOverview from './ProductOverview'
import ProductForm from './ProductForm'
import ProductSearch from './ProductSearch'
import ProductShow from './ProductShow'

import VueRouter from 'vue-router'

import drizzleVuePlugin from '@drizzle/vue-plugin'
import drizzleOptions from './drizzleOptions'

Vue.use(Vuex)
Vue.use(VueRouter)
const store = new Vuex.Store({ state: {} })

Vue.use(drizzleVuePlugin, { store, drizzleOptions })

Vue.config.productionTip = false

const router = new VueRouter({
  routes: [
    { path: '/products', component: ProductOverview },
    { path: '/products/create', component: ProductForm },
    { path: '/products/search', component: ProductSearch },
    { path: '/products/:barcode/show', component: ProductShow },
  ] 
})

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
