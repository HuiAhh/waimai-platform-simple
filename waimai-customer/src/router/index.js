import Vue from 'vue'
import VueRouter from 'vue-router'
// import Home from '../views/Home.vue'
// import Main from "../page/Main";
// import Home from "../page/main/Home";
// import Search from "../page/main/Search";
// import Mine from "../page/main/Mine";
// import CartPage from "../page/cart/CartPage";
// import Order from "../page/main/Order";
// import SettingPage from "../page/setting/SettingPage";
// import ShopStarPage from "../page/mine/shop-star/ShopStarPage";
// import LocationPage from "../page/mine/location-management/LocationPage";

import RouterModule from './modules' // 引入业务逻辑模块
import RouterCommon from './common' // 引入通用模块



Vue.use(VueRouter)

// const routes = [
//   {
//     path: '/',
//     name: 'Main',
//     component: Main,
//     children:[
//       {path:'',component:Home,name:'Home'},
//       {path:'search',component:Search,name:'Search'},
//       {path:'mine',component:Mine,name:'Mine'},
//       {path:'order',component:Order,name:'Order'}
//     ]
//   },
//   {path: '/setting', name: 'Settings', component: SettingPage},
//   {path: '/mine/shop-star',component: ShopStarPage},
//   {path: '/mine/location',component: LocationPage},
//
//   {
//     path: '/cart-page',
//     name: 'Cart Page',
//     component: CartPage
//   },
//   {
//     path: '/about',
//     name: 'About',
//     // route level code-splitting
//     // this generates a separate chunk (about.[hash].js) for this route
//     // which is lazy-loaded when the route is visited.
//     component: () => import(/* webpackChunkName: "about" */ '../views/About.vue')
//   }
// ]



const router = new VueRouter({
  scrollBehavior(to, from, savedPosition) {
    if (savedPosition) { //如果savedPosition存在，滚动条会自动跳到记录的值的地方
      return savedPosition
    } else {
      return { x: 0, y: 0 } //savedPosition也是一个记录x轴和y轴位置的对象
    }
  },
  routes:[
      ...RouterCommon,
      ...RouterModule
  ]
})

export default router
