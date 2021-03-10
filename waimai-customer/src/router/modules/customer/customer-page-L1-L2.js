import Main from "../../../page/customer/Main";
import Home from "../../../page/customer/main/Home";
import Search from "../../../page/customer/main/search/Search";
import Mine from "../../../page/customer/main/Mine";
// import CartPage from "../../../page/customer/cart/CartPage";
import Order from "../../../page/customer/main/Order";
import CategoriesShopPage from "../../../page/customer/main/categories/CategoriesShopPage";

export default [
    {
        path:'/',
        component: Main,
        redirect:'/index',
        children: [
            {path: 'index', component: Home, name: 'Home',title:'customer home',meta:{keepAlive:true}},
            {path: 'search', component: Search, name: 'Search',meta:{keepAlive:true}},
            {path: 'mine', component: Mine, name: 'Mine',meta:{keepAlive:true}},
            {path: 'order', component: Order, name: 'Order',meta:{keepAlive:true}},
            {
                path: 'category',
                component: CategoriesShopPage,
                name: 'Categories Shop Page'
            }
        ]
    },
    {
        path: '/setting',
        name: 'Settings',
        component: ()=>import(/* webpackChunkName: "customer-setting" */'../../../page/customer/setting/SettingPage')
    },
    {
        path: '/mine/shop-star',
        name:'StarList',
        component: ()=>import(/* webpackChunkName: "customer-tab-page" */'../../../page/customer/mine/shop-star/ShopStarPage')
    },
    {
        path: '/mine/location',
        name:'MineLocationList',
        component: ()=>import(/* webpackChunkName: "customer-tab-page" */'../../../page/customer/mine/location-management/LocationPage')

    },
    // {
    //     path: '/cart-page',
    //     name: 'Cart Page',
    //     component: CartPage
    // },
]