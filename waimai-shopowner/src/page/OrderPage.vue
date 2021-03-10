<template>
    <v-card>
        <v-card-title>订单列表
            <v-btn
                    icon
                    @click="updateOrderList"
            >
                <v-icon>mdi-cached</v-icon>
            </v-btn>
        </v-card-title>
        <v-container>
            <v-row>
                <v-card-title>
                    <h5>已接单</h5>
                </v-card-title>
                <v-card-text>
                    <OrderList :orderList="newOrderList" :haveControl="true"/>
                </v-card-text>
            </v-row>
            <v-row>
                <v-card-title>
                    <h5>历史订单</h5>
                </v-card-title>
                <v-card-text>
                    <OrderList :orderList="historyOrderList" :haveControl="true"/>
                </v-card-text>
            </v-row>
        </v-container>
    </v-card>
</template>

<script>
    import OrderList from "./order/OrderList";
    import {mapActions, mapGetters, mapMutations} from "vuex";

    export default {
        name: "OrderPage",
        components: {OrderList},
        mounted() {
            // this.apiGetOrderByShopIds(this.shopIds)
        },
        computed: {
            ...mapGetters('validate', {
                shops: 'shops',
                shopIds: 'shopIds'
            }),
            ...mapGetters('shopowner', {
                // newOrderList: 'newOrderList',
                // historyOrderList: 'historyOrderList',
                sortByTimeOrderList: 'sortByTimeOrderList',
                updateOrderFlag: 'updateOrderFlag'
            })
        },
        watch: {
            sortByTimeOrderList() {
                this.newOrderList = this.sortByTimeOrderList.filter(el => el.completestatus === '商家已接单')
                this.historyOrderList = this.sortByTimeOrderList.filter(
                    el =>
                        el.completestatus === '已完成' ||
                        el.completestatus === '配送中' ||
                        el.completestatus === '等待骑手取单'
                )
            },
            updateOrderFlag() {
                this.newOrderList = this.sortByTimeOrderList.filter(el => el.completestatus === '商家已接单')
                this.historyOrderList = this.sortByTimeOrderList.filter(
                    el =>
                        el.completestatus === '已完成' ||
                        el.completestatus === '配送中' ||
                        el.completestatus === '等待骑手取单'
                )
            }
        },
        methods: {
            ...mapActions('shopowner', {
                    getOrderByShopIds: 'getOrderByShopIds'
                }
            ),
            ...mapMutations('shopowner', {
                setOrderList: 'SET_ORDER_LIST',
                updateOrder:'SET_UPDATE_ORDER_FLAG'
            }),
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
            updateOrderList(){
                this.apiGetOrderByShopIds(this.shopIds)
            }
        },
        data() {
            return {
                newOrderList: [],
                historyOrderList: [],
                //     let originData=[...data]
                //     state.newOrderList=originData.filter(el=>el.completestatus==='商家已接单')
                //     state.historyOrderList=originData.filter(
                //         el=>
                //             el.completestatus==='已完成'||
                //             el.completestatus==='配送中'
                //
                //     )
            }
        }
    }
</script>

