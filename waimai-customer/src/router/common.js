import Login from "../page/validate/Login";
import Register from "../page/validate/Register";

export default [
    // 默认页面
    // {
    //     path: '/',
    //     redirect: '/index',
    // },
    // 无权限页面
    //login
    {
        path:'/login',
        name:'Login Page',
        component: Login
    },
    //register
    {
        path:'/register',
        name:'Register Page',
        component: Register
    },
    {
        path: '/nopermission',
        name:'No Permission Page',
        title: '无权限页面',
        component: ()=>import(/* webpackChunkName: "group-common" */ '../NoPermission')
    },
    // 404
    {
        path: '*',
        name:'NO FOUND',
        title:'404',
        component: ()=>import(/* webpackChunkName: "group-common" */ '../NoFound')
    },

]