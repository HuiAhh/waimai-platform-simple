import * as types from "./mutation-types";
import {changeTwoDecimal_f} from "../../utils/money-converter";

export default {
    //base
    [types.SET_MODULE](state, data) {
        state.module = data;
    },
    [types.SET_NAME](state, data) {
        state.name = data;
    },

    //shop query
    [types.SET_HOME_PAGE_SHOP_LIST](state, data) {
        state.homePageShopResult = data
    },
    [types.SET_SEARCH_PAGE_SHOP_LIST](state, data) {
        state.searchPageShopResult = data
    },
    [types.SET_SHOP_BY_ID_RESULT](state, data) {
        state.shopById = data
    },

    //food query
    [types.SET_SHOP_FOODS_LIST](state, data) {
        state.shopFoodsResult = data
    },

    //cart management
    [types.CHANGE_CART_UPDATE_FLAG](state) {
        state.updateFlag++
    },
    [types.SET_CART_LIST](state, data) {
        state.cartList = data
    },
    [types.SET_SHOP_CART_LIST_BY_SHOP_ID](state, shopId) {
        let queryed = state.cartList
            .filter(
                el => {
                    return el.shopId === shopId
                }
            )
        if (queryed.length > 0) {
            state.cartListByShopId = queryed[0].cart.filter(
                el => {
                    return el.numbers > 0
                }
            )
        }
        state.updateFlag++

    },
    [types.SET_SHOP_CART_LIST_NULL](state) {
        state.cartListByShopId = []
    },

    [types.PLUS_CART_ITEM](state, payload) {
        for (let i = 0; i < state.cartList.length; i++) {
            if (state.cartList[i].shopId == payload.shopId) {
                for (let j = 0; j < state.cartList[i].cart.length; j++) {
                    if (state.cartList[i].cart[j].id == payload.foodId) {
                        state.cartList[i].cart[j].numbers++
                        state.updateFlag++

                        break
                    }
                }
                break
            }
        }
    },
    [types.MINUS_CART_ITEM](state, payload) {
        for (let i = 0; i < state.cartList.length; i++) {
            if (state.cartList[i].shopId == payload.shopId) {
                for (let j = 0; j < state.cartList[i].cart.length; j++) {
                    if (state.cartList[i].cart[j].id == payload.foodId) {
                        state.cartList[i].cart[j].numbers--
                        state.updateFlag++

                        break
                    }
                }
                break
            }
        }
    },
    [types.CALCULATE_TOTAL_COST](state) {
        let sell = 0
        let origin = 0

        sell = state.cartListByShopId.reduce(
            function (prev, cur) {
                let ret = {sellPrice: 0}
                ret.sellPrice = prev.sellPrice + cur.sellPrice * cur.numbers
                return ret
            }, {sellPrice: 0, numbers: 0}
        )

        origin = state.cartListByShopId.reduce(
            function (prev, cur) {
                let ret = {originPrice: 0}
                ret.originPrice = prev.originPrice + cur.originPrice * cur.numbers
                return ret
            }, {originPrice: 0, numbers: 0}
        )

        sell = sell.sellPrice
        origin = origin.originPrice
        if (typeof sell !== 'number') {
            sell = 0
        }
        if (typeof origin !== 'number') {
            origin = 0
        }
        let originalStr = changeTwoDecimal_f(origin)
        state.shopCartTotalPrice = {
            sellPrice: sell * 100,
            originalPrice: originalStr === '0.00' ? '' : originalStr
        }
    },
    [types.CLEAR_TOTAL_COST](state) {
        state.shopCartTotalPrice = {
            sellPrice: 0,
            originalPrice: ''
        }
    },

    [types.SET_USER_ADDRESS_LIST](state, data) {
        state.userAddressList = data
    },

    //commit order
    [types.SET_ADDRESS_SELECTED](state, data) {
        state.userAddressSelected = data
    },
    [types.SET_COMMIT_FOOD_LIST](state, data) {
        state.commitFoodList = data
    },

    //user order list
    [types.SET_ORDER_LIST](state,data){
        state.ordersByUserId=data
    }
};