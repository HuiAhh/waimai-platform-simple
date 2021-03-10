<template>
    <van-cell style="background: #EFF0F1">
        <van-card
                :price="totalPrice(order.sendCost+2)"
        >
            <template #title>
                <van-collapse v-model="activeNames">
                    <van-collapse-item :title="order.shopShopname" name="1">
                        <van-cell v-for="item in orderFoods" :key="item.id">
                            <van-card
                                    :price="totalPrice(item.sellPrice,item.numbers)"
                                    :origin-price="totalPrice(item.originPrice,item.numbers)"
                                    :title="item.title+'  x'+item.numbers"
                                    :thumb="item.cover"
                            >
                            </van-card>
                        </van-cell>
                        <span>合计：￥{{totalPrice(order.totalMoney)}}</span>
                    </van-collapse-item>
                </van-collapse>
            </template>
            <template #tags>
                <span>商家：{{order.shopAddress}}</span><br/>
                <span>顾客：{{order.userAddress}}</span><br/>
                <span>{{order.userUsername}}</span><br/>
                <span>{{order.userMobile}}</span><br/>
            </template>
            <template #footer>
                <span v-if="order.completestatus==='已取消'||order.completestatus==='已退款'">此为失效订单，可撤单/召回</span>
                <span v-if="order.completestatus==='申请退款中'">此为争议订单，可正常配送</span>
                <van-button @click="deliverReceive" v-if="order.completestatus==='商家已接单'" color="#005ce6" size="small">
                    接单
                </van-button>
                <van-button
                        @click="preDeliverSent"
                        v-if="order.completestatus==='配送中'||
                        order.completestatus==='申请退款中'"
                        color="#005ce6" size="small">确认送达</van-button>
            </template>
            <template #price-top>
                <span>{{modifiedTime(new Date(order.gmtCreate))}}</span><br/>
                <span>{{getDate(new Date(order.gmtCreate))}}</span><br/>
                <span>状态：{{order.completestatus}}</span>
                <br/>
                <span>此单收入：</span>
            </template>
        </van-card>
    </van-cell>
</template>

<script>
    import {changeTwoDecimal_f, dateFormat} from '../../../utils/money-converter.js'
    import {mapGetters} from "vuex";
    import {Dialog, Toast} from "vant";

    export default {
        name: "OrderItem",
        props: ['order','removeItemFromParent'],
        watch: {
            updateFlag() {
                this.$forceUpdate()
            }
        },
        methods: {
            totalPrice: (price, amount = 1) => {
                return changeTwoDecimal_f(price * amount)
            },
            apiRequestFoods(orderId) {
                this.axios
                    .get('/orderfood/' + orderId)
                    .then(
                        res => {
                            this.orderFoods = res.data.list
                        }
                    )
            },
            modifiedTime(date) {
                // date.setHours(date.getHours()+8)
                return dateFormat('HH:MM', date)
            },
            getDate(date) {
                // date.setHours(date.getHours()+8)
                return dateFormat('mm月dd日', date)
            },
            deliverReceive() {
                this.axios({
                    url: '/deliver/receive/' + this.userInfo.id,
                    method: 'post',
                    data: {...this.order, deliverName: this.userInfo.truename},
                    headers: {'content-type': 'application/json'}
                }).then(
                    res => {
                        if (res.data.code === 0) {
                            Toast({message: '接单成功', type: 'success'})
                            this.removeItemFromParent(this.key)
                        }
                    }
                ).catch(
                    () => {
                        Toast({message: '接单失败，请重试', type: 'fail'})
                    }
                )
            },
            preDeliverSent() {
                Dialog.confirm({
                    title: '订单送达',
                    message: '确定订单已送达顾客',
                })
                    .then(() => {
                        this.deliverSent(this.order.id)
                    })
                    .catch(() => {
                        // on cancel
                    });
            },
            deliverSent(orderId) {
                this.axios
                    .get('/deliver/complete/' + orderId)
                    .then(
                        res => {
                            if (res.data.code === 0) {
                                Toast({message: '订单已完成', type: 'success'})
                                this.removeItemFromParent(this.key)
                            }
                        }
                    ).catch(
                    () => {
                        Toast({message: '未知问题，请重试', type: 'fail'})
                    }
                )
            },
        },
        data() {
            return {
                orderFoods: [],
                activeNames: []
            }
        },
        mounted() {
            this.apiRequestFoods(this.order.id)
        },
        computed: {
            ...mapGetters('validate', {
                userInfo: 'userInfo'
            })
        },
    }
</script>

<style scoped>
    .van-card__thumb {
        position: relative;
        -webkit-box-flex: 0;
        -webkit-flex: none;
        flex: none;
        width: 40px;
        height: 40px;
        margin-right: 8px;
    }

    .van-card__content {
        position: relative;
        display: -webkit-box;
        display: -webkit-flex;
        display: flex;
        -webkit-box-flex: 1;
        -webkit-flex: 1;
        flex: 1;
        -webkit-box-orient: vertical;
        -webkit-box-direction: normal;
        -webkit-flex-direction: column;
        flex-direction: column;
        -webkit-box-pack: justify;
        -webkit-justify-content: space-between;
        justify-content: space-between;
        min-width: 0;
        min-height: 50px;
    }
</style>