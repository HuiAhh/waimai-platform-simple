import * as types from "./mutation-types";

export default {
    //base
    [types.SET_MODULE](state, data) {
        state.module = data;
    },
    [types.SET_NAME](state, data) {
        state.name = data;
    },

    //login
    [types.SET_USER_INFO](state, data) {
        state.userInfo = data;
    },

    //shop
    [types.SET_SHOP_LIST](state, data) {
        state.shops = data;
    },
    [types.SET_SHOP_BY_SHOP_ID](state, {shop,id}) {
        let shops=[...state.shops]
        for (let i = 0; i < shops; i++) {
            if(shops[i].id===id){
                shops[i]=shop
                state.shops=shops
                break
            }
        }
    },
}