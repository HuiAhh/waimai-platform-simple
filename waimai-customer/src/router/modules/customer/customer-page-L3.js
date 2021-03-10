import ShopFoodDetailPage from "../../../page/customer/shop/ShopFoodDetailPage";
import PreOrderPage from "../../../page/customer/pre-order/PreOrderPage";

export default [
    {
        path:'/shop/:shopId',
        name:'Shop Display Foods',
        component:ShopFoodDetailPage,
        meta:{
            keepAlive:true
        }
    },
    {
        path:'/pre-order/:shopId',
        name:'Pre Order Foods',
        component:PreOrderPage
    }
]