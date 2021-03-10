import * as types from "./mutation-types";
import {Vue} from '../../main'
import qs from 'qs'

export default {
    //base
    setModuleInfo({commit}, params) {
        commit(types.SET_MODULE, params.module);
        commit(types.SET_NAME, params.name);
    },

    //login
    setUserInfo({commit}, user) {
        commit(types.SET_USER_INFO, user)
    },

    userLogin({commit}, params) {
        Vue.axios({
            method: 'post',
            url: '/user/login',
            data: qs.stringify(params),
            headers: {'content-type': 'application/x-www-form-urlencoded'},
        })
            .then(
                res => {
                    let data = res.data
                    if (data.code === 300) {
                        // Notify({message: data.msg, type: 'warning'})
                        // window.localStorage.removeItem('isUser')
                    } else if (data.user.identity === 2) {
                        commit(types.SET_USER_INFO, data.user)
                        window.localStorage.setItem("shopId", data.user.id)
                        // Notify({message: '登录成功', type: 'primary'})
                        // window.localStorage.setItem("isUser", '1')
                    } else {
                        // Notify({message: data.msg, type: 'warning'})
                        // window.localStorage.removeItem('isUser')
                    }
                    // window.localStorage.removeItem("isUser")
                }
            ).catch(
            () => {
                // window.localStorage.removeItem("isUser")
            }
        )
    },

    getUserInfo({commit}, userId) {
        Vue.axios.get('/user/info/' + userId)
            .then(
                res => {
                    let data = res.data
                    if (data.user === null || data.code === 402 || data.code === 300) {
                        // Notify({message: '登录状态已失效，请重新登录', type: 'warning'})
                        // window.localStorage.removeItem("isUser")
                    } else {
                        commit(types.SET_USER_INFO, data.user)
                        // window.localStorage.setItem("isUser", '1')

                        // Notify({message: '欢迎回来', color: '#ad0000',
                        //     background: '#ffe1e1',})
                    }
                    // window.localStorage.removeItem("isUser")
                }
            ).catch(
            () => {
                // window.localStorage.removeItem("isUser")
            }
        )
    },

    //shop
    getShopList({commit}, shopownerid) {
        Vue.axios.get('/shopinfo/list/' + shopownerid)
            .then(
                res => {
                    let data = res.data
                    if (data.code !== 402) {
                        commit(types.SET_SHOP_LIST, data.list)
                    }
                }
            )
            .catch(
                err=>{
                    console.log('failed:===>::'+err)
                }
            )
    }
}
