import Vue from 'vue'
import App from './App'
import store from './store'
import router from './router/permission'

import axios from 'axios'
import VueAxios from 'vue-axios'
import vuetify from './plugins/vuetify';
import 'vuetify/dist/vuetify.min.css'

// 响应时间
axios.defaults.timeout = 100 * 1000
// 配置cookie
// axios.defaults.withCredentials = true
// 配置请求头
axios.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded;charset=UTF-8'
// 静态资源
// Vue.prototype.$static = ''

// 配置接口地址
axios.defaults.baseURL = '/waimai/'

Vue.config.productionTip = false

Vue.use(VueAxios, axios)

new Vue({
  store,
  router,
  vuetify,
  render: h => h(App)
}).$mount('#app')

export {
  Vue
}