<template>
    <div>
        <van-nav-bar title="送单队列" style="overflow: auto;background: #fff6ef">
        </van-nav-bar>
        <van-pull-refresh v-model="isLoading" @refresh="onRefresh">
            <van-list style="margin-bottom: 20%;">
                <van-cell-group title="tips:下拉可手动刷新">
                    <OrderItem
                            :removeItemFromParent="removeItemFromParent"
                            v-for="item in queueOrderList"
                            :key="item.id"
                            :order="item"
                    />
                </van-cell-group>
            </van-list>
        </van-pull-refresh>
    </div>
</template>

<script>
    import {Toast} from "vant";
    import {mapGetters} from "vuex";
    import OrderItem from "../pre-task/OrderItem";

    export default {
        name: "Queue",
        components:{OrderItem},
        data(){
            return {
                "exampleOrderlist": [
                    {
                        "id": 9,
                        "userId": 1,
                        "userUsername": "吴sir",
                        "userMobile": "18752151001",
                        "userAddressId": 2,
                        "userAddress": "广东金融学院北苑北教广场xxxxxxxxxxxxxxxxxxxxx",
                        "note": "啊哈哈哈嘎嘎嘎嘎嘎噶",
                        "shopShopname": "正信鸡排",
                        "shopMobile": "18752151002",
                        "shopAddress": "迎龙路01号",
                        "deliverId": null,
                        "deliverName": null,
                        "deliverMobile": null,
                        "shopId": 1,
                        "boxCost": 2,
                        "sendCost": 1,
                        "totalMoney": 30,
                        "completestatus": "商家已接单",
                        "gmtCreate": "2020-11-08 07:06:36",
                        "gmtModified": "2020-11-08 07:06:36"
                    },
                ],
                queueOrderList: [],
                isLoading: false,
            }
        },
        methods: {
            apiRequestQueueOrderList(deliverId) {
                this.axios.get('/deliver/orderlist/'+deliverId)
                    .then(
                        res => {
                            this.queueOrderList = res.data.list
                        }
                    ).catch(
                    () => Toast('请刷新列表')
                )
            },
            onRefresh(){
                setTimeout(() => {
                    this.apiRequestQueueOrderList(this.userInfo.id)
                    this.isLoading = false
                }, 1000)
            },
            removeItemFromParent(key){
                let index=0;
                for (let i = 0; i < this.queueOrderList.length; i++) {
                    if(this.queueOrderList[i].id===key){
                        index=i
                        break
                    }
                }
                this.queueOrderList.splice(index,1)
            }
        },
        computed:{
            ...mapGetters('validate',{
                userInfo:'userInfo'
            })
        },
        mounted() {
            this.onRefresh()
        }
    }
</script>

<style scoped>

</style>