import * as types from "./mutation-types";
import {Vue} from '../../main'

export default {
    shopAction({ commit }, params) {
        commit(types.SET_MODULE, params.module);
        commit(types.SET_NAME, params.name);
    },

    // order
    getOrderByShopIds({commit},shopIds){
        for (let i = 0; i < shopIds.length; i++) {
            Vue.axios
                .put('/shop/orderlist/'+shopIds[i])
                .then(
                    res=>{
                        let data=res.data
                        if(data.list){
                            commit(types.APPEND_ORDER_LIST,data.list)
                        }
                    }
                )
        }
        // commit(types.FILTER_ORDER,[])
    }
};