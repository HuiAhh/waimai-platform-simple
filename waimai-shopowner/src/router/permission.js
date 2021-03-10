// import Vue from 'vue'
import router from './index'
import NProgress from 'nprogress'
import 'nprogress/nprogress.css'

NProgress.configure({
    easing: 'ease', // 动画方式
    speed: 500, // 递增进度条的速度
    showSpinner: false, // 是否显示加载ico
    trickleSpeed: 200, // 自动递增间隔
    minimum: 0.3 // 初始化时的最小百分比
})

const cancelAxios = (next) => {
    let axiosPromiseArr = window.__axiosPromiseArr;
    if (!!axiosPromiseArr && axiosPromiseArr.length) {
        // console.log(axiosPromiseArr);
        let len = axiosPromiseArr.length;
        while (len--) { //从后向前终止请求，并删除 cancelToken，避免数组索引带来的问题
            axiosPromiseArr[len].cancel('cancel');
            axiosPromiseArr.splice(len, 1);
        }
        //或者：window.__axiosPromiseArr = [];
    }
    next();
}

router.beforeEach((to, from, next) => {
    // 每次切换页面时，调用进度条
    NProgress.start();
    if (to.matched.some(record => record.meta.requiresAuth)) { // 哪些需要验证
        if (!sessionStorage.getItem("token")) { // token存在条件
            next({
                path: '/nopermission', // 验证失败要跳转的页面
                query: {
                    redirect: to.fullPath // 要传的参数
                }
            })
        } else {
            cancelAxios(next);
        }
    } else {
        cancelAxios(next);
    }

    // auto into home page

    // into home page vaildate
    // let isUser=window.localStorage.getItem('isUser')

    // if(to.fullPath==='/home'&&!isUser){
    //     next('/login')
    // }else if(to.fullPath==='/login'&&isUser){
    //     next('/home')
    // }
    next()
})

router.afterEach((to) => {
    // 在即将进入新的页面组件前，关闭掉进度条
    NProgress.done()
    document.title = to.name || ''
})

export default router