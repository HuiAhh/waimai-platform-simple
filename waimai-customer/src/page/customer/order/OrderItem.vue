<template>
    <van-cell style="background: #EFF0F1">
        <van-card
                :price="totalPrice(order.totalMoney)"
                :title="order.shopShopname"
        >
            <template #tags>
                <van-cell v-for="item in orderFoods" :key="item.id">
                    <van-card
                            :price="totalPrice(item.sellPrice,item.numbers)"
                            :origin-price="totalPrice(item.originPrice,item.numbers)"
                            :title="item.title+'  x'+item.numbers"
                            :thumb="item.cover"
                    >
                    </van-card>
                </van-cell>
            </template>
            <template #footer>
                <!-- 申请退款中 -->
                <van-button
                        color="#ff3333"
                        @click="abortDialog=true"
                        v-if="order.completestatus==='商家已接单'"
                        size="small">取消订单
                </van-button>
                <van-button
                        color="#ff3333"
                        @click="refundDialog=true"
                        :disabled="order.completestatus==='申请退款中'"
                        v-if="order.completestatus==='配送中' ||
                            order.completestatus==='已完成'||
                            order.completestatus==='申请退款中'"
                        size="small">退款申请
                </van-button>
                <van-button
                        @click="preDeliverSent"
                        v-if="order.completestatus==='配送中'"
                        color="#ff8000" size="small">收货
                </van-button>
            </template>
            <template #price-top>
                <span>{{modifiedTime(new Date(order.gmtCreate))}}</span><br/>
                <span>{{getDate(new Date(order.gmtCreate))}}</span><br/>
                <span>状态：{{order.completestatus}}</span>
                <br/>
                <span>合计：</span>
            </template>
        </van-card>
        <van-dialog
                @confirm="sendRefund"
                v-model="refundDialog" title="退款申请" show-cancel-button>
            <van-field
                    placeholder="退款理由往这里填"
                    autofocus label="退款理由"
                    v-model="refundReason"
                    type="textarea"
                    maxlength="50"
                    show-word-limit
            ></van-field>
        </van-dialog>
        <van-dialog
                @confirm="abortOrderStatus"
                v-model="abortDialog" title="确定撤单" show-cancel-button>
        </van-dialog>
    </van-cell>
</template>

<script>
    import {changeTwoDecimal_f, dateFormat} from '../../../utils/money-converter.js'
    import {Dialog, Toast} from "vant";

    export default {
        name: "OrderItem",
        props: ['order', 'removeItemFromParent', 'childRefresh'],
        computed: {},
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
            deliverSent(orderId) {
                this.axios
                    .get('/deliver/complete/' + orderId)
                    .then(
                        res => {
                            if (res.data.code === 0) {
                                Toast({message: '订单已完成', type: 'success'})
                                // this.removeItemFromParent(this.key)
                            }
                        }
                    ).catch(
                    () => {
                        Toast({message: '未知问题，请重试', type: 'fail'})
                    }
                )
            },
            preDeliverSent() {
                Dialog.confirm({
                    title: '订单送达',
                    message: '确认货品到手上才按收货哦',
                    confirmButtonText: '收货'
                })
                    .then(() => {
                        this.deliverSent(this.order.id)
                    })
                    .catch(() => {
                        // on cancel
                    });
            },
            apiChangeOrderStatus() {
                let refundEntity = {
                    "orderId": this.order.id,
                    "userId": this.order.userId,
                    "username": this.order.userUsername,
                    "refundReason": this.refundReason,
                    "serviceCost": 0.1,
                    "completestatus": 0,
                }
                this.axios(
                    {
                        url: '/orderdetail/refund/' + this.order.id,
                        method: 'put',
                        data: refundEntity,
                        headers: {'content-type': 'application/json'}
                    })
                    .then(
                        res => {
                            if (res.data.code === 0) {
                                Toast({message: '发起成功', type: 'success'})
                            } else {
                                Toast({message: '发起失败', type: 'fail'})
                            }
                        }
                    ).catch(
                    () => Toast({message: '发起失败', type: 'fail'})
                )
            },
            // 只有要让商家看到的申请要用到这个
            apiCommitRefund() {
                let refundEntity = {
                    "orderId": this.order.id,
                    "userId": this.order.userId,
                    "username": this.order.userUsername,
                    "refundReason": this.refundReason,
                    "serviceCost": 0.1,
                    "completestatus": 0,
                }
                this.axios({
                    url: '/user/refund/',
                    method: 'post',
                    data: refundEntity,
                    headers: {'content-type': 'application/json'}
                })
                    .then(
                        res => {
                            if (res.data.code === 0) {
                                Toast({message: '发起成功', type: 'success'})
                            } else {
                                Toast({message: '发起失败', type: 'fail'})
                            }
                        }
                    ).catch(
                    () => Toast({message: '发起失败', type: 'fail'})
                )
            },
            sendRefund() {
                this.apiCommitRefund()
                this.apiChangeOrderStatus()
                this.childRefresh()
            },
            abortOrderStatus() {
                this.apiChangeOrderStatus()
                this.childRefresh()
            }
        },
        data() {
            return {
                orderFoods: [],
                refundDialog: false,
                refundReason: '',
                abortDialog: false
            }
        },
        mounted() {
            this.apiRequestFoods(this.order.id)
        },
        beforeRouteLeave(to, from, next) {
            this.orderFoods = []
            next()
        }
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