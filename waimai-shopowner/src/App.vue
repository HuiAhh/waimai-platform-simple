<template>
    <div id="app">
        <v-app>
            <router-view/>
            <v-snackbar v-model="informReLogin">
                登录过期，请重新登录
                <template v-slot:action="{attrs}">
                    <v-btn
                        text
                        color="red"
                        v-bind="attrs"
                        @click="$router.replace('/login')"
                    >
                        登录
                    </v-btn>
                </template>
            </v-snackbar>
            <v-snackbar v-model="loginedInfo">
                登录成功
            </v-snackbar>
        </v-app>
    </div>
</template>

<script>
    import {mapActions, mapGetters, mapMutations} from "vuex";

    export default {
        name: "App",
        created() {
            let userId = window.localStorage.getItem("shopId")
            console.log('userId=====>value:' + userId + "   ==>type:  " + typeof userId)
            if (userId !== null &&
                (typeof userId === 'number' || typeof userId === 'string')
            ) {
                console.log('logging into action==>')
                this.apiGetUserInfo(userId)
                this.apiGetShopList(userId)
                // fixme null array [] shopIds
                // this.apiGetOrderByShopIds(this.localShopIds)
            }else{
                this.informReLogin=true
            }
        },
        methods: {
            ...mapActions('validate', {
                getShopList: 'getShopList',
            }),
            ...mapActions('shopowner', {
                getOrderByShopIds: 'getOrderByShopIds'
            }),
            ...mapMutations('shopowner', {
                // filterNewAndHistoryOrder: 'FILTER_ORDER',
                setOrderList:'SET_ORDER_LIST',
                updateOrder:'SET_UPDATE_ORDER_FLAG'
            }),
            ...mapMutations('validate', {
                setUserInfo: 'SET_USER_INFO',
                setShopList: 'SET_SHOP_LIST',
            }),
            apiGetUserInfo(userId) {
                this.axios.get('/user/info/' + userId)
                    .then(
                        res => {
                            let data = res.data
                            if (data.user !== null || data.code !== 402 || data.code !== 403 || data.code !== 300) {
                                this.informReLogin=true
                                this.setUserInfo(data.user)
                            }
                            this.informReLogin=true
                        }
                    ).catch(
                    () => {
                        this.informReLogin=true
                    }
                )
            },
            apiGetShopList(shopownerid) {
                this.axios.get('/shopinfo/list/' + shopownerid)
                    .then(
                        res => {
                            let data = res.data
                            if (data.code !== 402&&data.code!==403) {
                                this.setShopList(data.list)
                                // this.localShopIds=data.list.map(el=>el.id)
                                this.apiGetOrderByShopIds(data.list.map(el=>el.id))
                                this.loginedInfo=true
                            }else{
                                // window.localStorage.removeItem("isUser")
                                this.informReLogin=true
                            }
                        }
                    ).catch(
                        ()=>{
                            // window.localStorage.removeItem("isUser")
                            this.informReLogin=true
                        }
                )
            },
            apiGetOrderByShopIds(shopIds) {
                let orderList=[]
                for (let i = 0; i < shopIds.length; i++) {
                    this.axios
                        .put('/shop/orderlist/'+shopIds[i])
                        .then(
                            res=>{
                                let data=res.data
                                if(data.list){
                                    orderList.push(...data.list)
                                }
                            }
                        )
                }
                this.setOrderList(orderList)
                this.updateOrder()
            },
        },
        computed: {
            ...mapGetters('validate', {
                userInfo: 'userInfo',
                shopIds: 'shopIds'
            }),
            ...mapGetters('shopowner', {
                sortByTimeOrderList: 'sortByTimeOrderList',
            })
        },
        data:()=>({
            informReLogin:false,
            loginedInfo:false,
            // localShopIds:[]
        })
    }
</script>

<style scoped>

</style>