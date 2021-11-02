import Vue from 'vue'
import App from './App.vue'
import Vuex from 'vuex'
import VModal from 'vue-js-modal'
import VueRouter from 'vue-router'
import drizzleVuePlugin from '@drizzle/vue-plugin'
import drizzleOptions from './drizzleOptions'

import ProductOverview from './ProductOverview'
import ProductForm from './ProductForm'
import ProductSearch from './ProductSearch'
import ProductShow from './ProductShow'
import Register from './Register'
import UserPenalty from './UserPenalty'


Vue.use(Vuex)
Vue.use(VueRouter)
Vue.use(VModal)
const store = new Vuex.Store({ state: {} })

Vue.use(drizzleVuePlugin, { store, drizzleOptions })

Vue.config.productionTip = false

const router = new VueRouter({
  routes: [
    { path: '/', redirect: '/products' },
    { path: '/products', component: ProductOverview },
    { path: '/products/create', component: ProductForm },
    { path: '/products/search', component: ProductSearch },
    { path: '/products/:barcode/show', component: ProductShow },
    { path: '/register', component: Register },
    { path: '/penalties', component: UserPenalty },
  ]
})

// Dirty hack to get the origin, used in the QR code.
Vue.prototype.origin = window.location.origin;

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
