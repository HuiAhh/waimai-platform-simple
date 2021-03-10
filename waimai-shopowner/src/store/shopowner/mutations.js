import * as types from "./mutation-types";

export default {
    [types.SET_MODULE](state, data) {
        state.module = data;
    },
    [types.SET_NAME](state, data) {
        state.name = data;
    },

    //order
    [types.APPEND_ORDER_LIST](state,data){
        state.orderList.push(...data)
    },
    // [types.FILTER_ORDER]({state},data){
    //     let originData=[...data]
    //     state.newOrderList=originData.filter(el=>el.completestatus==='商家已接单')
    //     state.historyOrderList=originData.filter(
    //         el=>
    //             el.completestatus==='已完成'||
    //             el.completestatus==='配送中'
    //
    //     )
    // },
    [types.SET_ORDER_LIST](state,data){
        state.orderList=data
    },
    [types.SET_UPDATE_ORDER_FLAG](state){
        state.updateOrderFlag++
    }
};