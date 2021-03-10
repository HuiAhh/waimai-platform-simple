<template>
    <div>
        <van-nav-bar title="订单" style="overflow: auto;background: #fff6ef">
        </van-nav-bar>
        <van-pull-refresh v-model="isLoading" @refresh="onRefresh">
            <van-list style="margin-bottom: 20%;">
                <van-cell-group title="tips:下拉可手动刷新">
                    <OrderItem
                            :child-refresh="onRefresh"
                            :removeItemFromParent="removeItemFromParent"
                            v-for="item in sortByTimeOrderList"
                            :key="item.id"
                            :order="item"
                    />
                </van-cell-group>
            </van-list>
        </van-pull-refresh>
    </div>
</template>

<script>
    import OrderItem from "../order/OrderItem";
    import {mapActions, mapGetters, mapMutations} from "vuex";

    export default {
        name: "Order",
        components: {
            OrderItem
        },
        data() {
            return {
                isLoading: false
            }
        },
        methods: {
            onRefresh() {
                setTimeout(() => {
                    this.getOrdersByUserId(this.userInfo.id)
                    this.isLoading = false
                }, 1000)
            },
            ...mapActions('customer', {
                getOrdersByUserId: 'getOrdersByUserId'
            }),
            removeItemFromParent(key){
                let index=0;
                for (let i = 0; i < this.sortByTimeOrderList.length; i++) {
                    if(this.sortByTimeOrderList[i].id===key){
                        index=i
                        break
                    }
                }
                let removed=[...this.sortByTimeOrderList].splice(index,1)
                this.setOrderList(removed)
            }
        },
        computed: {
            ...mapGetters('customer', {
                ordersByUserId: 'ordersByUserId',
                sortByTimeOrderList:'sortByTimeOrderList'
            }),
            ...mapGetters('validate', {
                userInfo: 'userInfo'
            }),
            ...mapMutations('customer',{
                setOrderList:'SET_ORDER_LIST'
            })
        },
        created() {
            if (this.userInfo.id) {
                this.onRefresh()
            }
        },
        // beforeRouteEnter(to,from,next){
        //     if (!this.userInfo.id) {
        //         this.onRefresh()
        //     }
        //     next()
        // }
    }
</script>

<style scoped>

</style>