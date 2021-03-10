export default [
    // 默认页面
    {
        path: '/',
        redirect: '/home',
    },
    // 无权限页面
    {
        path: '/nopermission',
        name: '无权限页面',
        component: ()=>import(/* webpackChunkName: "group-common" */ '../NoPermission')
    },
    // 404
    {
        path: '*',
        component: ()=>import(/* webpackChunkName: "group-common" */ '../NoFound')
    }
]