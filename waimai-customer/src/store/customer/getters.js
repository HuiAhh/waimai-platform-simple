export default {
    //base
    module: state => state.module,
    name: state => state.name,

    //shop query
    homePageShopResult: state => state.homePageShopResult,
    searchPageShopResult: state => state.searchPageShopResult,
    shopById: state => state.shopById,

    //food query
    shopFoodsResult: state => state.shopFoodsResult,

    //cart management
    cartList: state => state.cartList,
    getCartListByShopId: state => state.cartListByShopId,
    updateFlag:state=>state.updateFlag,
    /**
     * cartList:[
             {},
             {
        shopId:
        cart:[
        {FOOD_ITEM, numbers}
        ]
        },
     */
    shopCartTotalPrice:state=>state.shopCartTotalPrice,

    //user address
    userAddressList:state=>state.userAddressList,

    //commit order
    userAddressSelected:state=>state.userAddressSelected,
    commitFoodList:state=>state.commitFoodList,

    //user order list
    ordersByUserId:state=>state.ordersByUserId,
    sortByTimeOrderList: state => {
        let copyOrderList = [...state.ordersByUserId]
        copyOrderList.sort((a, b) => {
            return b.id - a.id
        })
        return copyOrderList
    },
}