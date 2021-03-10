<template>
    <div>
        <iframe src="https://apip.weatherdt.com/v2/h5.html?bg=3&md=0&lc=auto&key=MM9wfmemO9"
                width="100%" height="320" frameborder="0"
                scrolling="no" id="iframename" name="iframename">
        </iframe>
        <!--        <van-cell-group title="待接单列表，下拉刷新">-->
        <!--            <van-pull-refresh v-model="isLoading" @refresh="onRefresh">-->
        <van-pull-refresh v-model="isLoading" @refresh="onRefresh">
            <van-list style="margin-bottom: 20%;">
                <van-cell-group title="tips:下拉可手动刷新">
                    <OrderItem
                            :removeItemFromParent="removeItemFromParent"
                            v-for="item in preTaskOrderList"
                            :key="item.id"
                            :order="item"
                    />
                </van-cell-group>
            </van-list>
        </van-pull-refresh>
        <!--            </van-pull-refresh>-->
        <!--        </van-cell-group>-->
    </div>
</template>

<script>
    import OrderItem from "../pre-task/OrderItem";
    import {Toast} from "vant";

    export default {
        name: "Home",
        components: {OrderItem},
        data() {
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
                preTaskOrderList: [],
                isLoading: false,
            }
        },
        methods: {
            apiRequestPreTaskOrderList() {
                this.axios.get('/deliver/orderlist')
                    .then(
                        res => {
                            this.preTaskOrderList = res.data.list
                        }
                    ).catch(
                    () => Toast('请刷新列表')
                )
            },
            onRefresh(){
                setTimeout(() => {
                    this.apiRequestPreTaskOrderList()
                    this.isLoading = false
                }, 1000)
            },
            removeItemFromParent(key){
                let index=0;
                for (let i = 0; i < this.preTaskOrderList.length; i++) {
                    if(this.preTaskOrderList[i].id===key){
                        index=i
                        break
                    }
                }
                this.preTaskOrderList.splice(index,1)
            }
        },
        mounted() {
            this.onRefresh()
        }
    }
</script>

<style scoped>

</style>