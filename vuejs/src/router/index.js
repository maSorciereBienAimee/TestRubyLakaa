import Vue from 'vue'
import Router from 'vue-router'
import AddCollect from '@/components/AddCollect.vue'
import SeeCollects from '@/components/SeeCollects.vue'
import Acceuil from '@/components/Acceuil.vue'
import SetIndicator from '@/components/SetIndicator.vue'

Vue.use(Router)
window.Vue = Vue
export default new Router({
  mode: 'history',
  routes: [
    {
      path: '/',
      name: 'Accueil',
      component: Acceuil
    },
    {
      path: '/AddCollect',
      name: 'AddCollect',
      component: AddCollect
    },
    {
      path: '/SeeCollects',
      name: 'SeeCollects',
      component: SeeCollects
    },
    {
      path: '/SetIndicator',
      name: 'SetIndicator',
      component: SetIndicator
    }
  ]
})
