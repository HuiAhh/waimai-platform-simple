export default [
    {
        path: '/deliveryman',
        name:'Deliveryman module',
        redirect:'/deliveryman/index',
        component: ()=>import(/* webpackChunkName: "delivery-home" */ "../../../page/deliveryman/GlobalContainer"),
        children: [
            {
                path: 'index', name: 'Deliveryman Home and Recommended Orders List',
                component: ()=>import(/* webpackChunkName: "delivery-home" */"../../../page/deliveryman/main/Home"),
            },
            {
                path: 'queue', name: 'Deliveryman Queue of Goods',
                component:()=>import(/* webpackChunkName: "delivery-tab-page" */"../../../page/deliveryman/main/Queue")
            },
            {
                path: 'mine', name: 'Deliveryman Mine',
                component:()=>import(/* webpackChunkName: "delivery-tab-page" */"../../../page/deliveryman/main/Mine")
            }
        ]
    }
]