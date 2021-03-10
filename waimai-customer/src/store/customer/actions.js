import * as types from "./mutation-types";
import {Notify, Toast} from 'vant'
import {Vue} from '../../main'

export default {
    //base
    setModuleInfo({commit}, params) {
        commit(types.SET_MODULE, params.module);
        commit(types.SET_NAME, params.name);
    },

    //shop query
    requestHomePageShopList({commit}) {
        Vue.axios
            .get('/shop/list')
            .then(
                res => {
                    commit(types.SET_HOME_PAGE_SHOP_LIST, res.data.list)
                }
            )
            .catch(
                err => {
                    Notify({type: 'warning', message: '请求错误' + err})
                }
            )
    },
    requestSearchPageShopList({commit}, params) {
        Vue.axios
            .get('/shop/query', {
                params: params
            })
            .then(
                res => {
                    commit(types.SET_SEARCH_PAGE_SHOP_LIST, res.data.list)
                }
            )
    },
    requestShopById({commit}, shopId) {
        Vue.axios
            .get('/shopinfo/info/' + shopId)
            .then(
                res => {
                    commit(types.SET_SHOP_BY_ID_RESULT, res.data.shopInfo)
                }
            )
    },

    //food query
    requestShopFoodsResult({commit}, shopId) {
        Vue.axios
            .get('/food/shop/' + shopId)
            .then(
                res => {
                    commit(types.SET_SHOP_FOODS_LIST, res.data.list)
                }
            )
    },

    //food query
    requestUserAddressList({commit}, userId) {
        Vue.axios
            .get('/useraddress/' + userId)
            .then(
                res => {
                    commit(types.SET_USER_ADDRESS_LIST, res.data.list)
                }
            )
    },

    //commit order
    //todo 调用api
    requestUserOrderCommit() {

    },

    //user order list
    getOrdersByUserId({commit}, userId) {
        Vue.axios
            .get('/order/consumer-list/' + userId)
            .then(
                res => {
                    commit(types.SET_ORDER_LIST, res.data.list)
                }
            ).catch(
            ()=>
                Toast('请刷新订单页')
        )
    }
};