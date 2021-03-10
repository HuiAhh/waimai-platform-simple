<template>
    <v-card>
        <v-card-title>退款列表
            <v-btn
                    icon
                    @click="apiRequestRefundQueue"
            >
                <v-icon>mdi-cached</v-icon>
            </v-btn>
        </v-card-title>
        <v-container>
            <v-row>
                <v-card-title>
                    <h5>待处理</h5>
                </v-card-title>
                <v-card-text>
                    <RefundList :refresh="apiRequestRefundQueue" :refund-list="refundQueueList"/>
                </v-card-text>
            </v-row>
        </v-container>
        <v-snackbar v-model="errorBarDisplay" color="info">
            <span>获取退款列表失败</span>
        </v-snackbar>
    </v-card>

</template>

<script>
    import RefundList from "./refund/RefundList";
    import {mapGetters} from "vuex";

    export default {
        name: "RefundPage",
        components: {RefundList},
        methods: {
            apiRequestRefundQueue() {
                this.axios.get('/orderrefund/refundlist/' + this.userInfo.id)
                    .then(
                        res => {
                            if (res.data.code === 0) {
                                this.refundQueueList = res.data.list
                            } else {
                                this.errorBarDisplay = true

                            }
                        }
                    )
            }
        },
        computed: {
            ...mapGetters('validate', {
                userInfo: 'userInfo',
                shopIds: 'shopIds'
            }),
        },
        data() {
            return {
                errorBarDisplay: false,
                refundQueueList: [],
                exampleQueueList: [
                    {
                        "id": 2,
                        "orderId": "108",
                        "userId": 2,
                        "username": "渣渣龟",
                        "payMoney": 30,
                        "refundReason": "",
                        "serviceCost": 0.1,
                        "completestatus": 0,
                        "gmtCreate": "2020-11-12 16:48:11",
                        "gmtModified": "2020-11-12 16:48:11"
                    }
                ]
            }
        },
        mounted() {
            this.apiRequestRefundQueue()
        }
    }
</script>

<style scoped>

</style>