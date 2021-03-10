import Vue from 'vue'
import App from './App.vue'
import store from './store'
import router from './router/permission'

import Vant from 'vant';
import 'vant/lib/index.css';
import '@vant/touch-emulator'
import axios from 'axios'
import VueAxios from 'vue-axios'

import { Lazyload } from 'vant';


// 响应时间
axios.defaults.timeout = 10 * 1000
// 配置cookie
// axios.defaults.withCredentials = true
// 配置请求头
axios.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded;charset=UTF-8'
// 静态资源
// Vue.prototype.$static = ''

// 配置接口地址
axios.defaults.baseURL = '/waimai/'

Vue.use(VueAxios, axios)
Vue.use(Vant);
Vue.use(Lazyload);

Vue.config.productionTip = false

new Vue({
  store,
  router,
  render: h => h(App)
}).$mount('#app')


export {
  Vue
}