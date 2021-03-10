<template>
    <v-expansion-panels>
        <v-card>
            <v-expansion-panel>
                <v-expansion-panel-header>
                    <v-banner>
                        总价：￥{{twoDecimal(order.totalMoney)}}
                    </v-banner>
                </v-expansion-panel-header>
                <v-expansion-panel-content>
                    状态：{{order.completestatus}}
                    <v-banner>
                        备注： {{order.note}}
                    </v-banner>
                    <v-banner>地址：{{order.userAddress}}</v-banner>
                    <v-card-title>
                        <v-banner>{{order.userUsername}}</v-banner>
                    </v-card-title>
                    <v-card-subtitle>
                        <v-banner>{{order.userMobile}}</v-banner>
                    </v-card-subtitle>
                    <v-simple-table>
                        <template v-slot:default>
                            <thead>
                            <tr>
                                <th>
                                </th>
                                <th class="text-left">
                                    菜品
                                </th>
                                <th class="text-left">
                                    份数
                                </th>
                                <th>单价</th>
                                <th>原价</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr
                                    v-for="(item,index) in foods"
                                    :key="index"
                            >
                                <td>
                                    <v-img
                                            :src="item.cover"
                                            max-width="40"
                                            max-height="40"
                                    >
                                    </v-img>
                                </td>
                                <td>{{ item.title }}</td>
                                <td>{{ item.numbers }}</td>
                                <td>￥{{twoDecimal(item.sellPrice)}}</td>
                                <td>￥{{twoDecimal(item.originPrice)}}</td>
                            </tr>
                            </tbody>
                        </template>
                    </v-simple-table>
                </v-expansion-panel-content>
            </v-expansion-panel>
        </v-card>

    </v-expansion-panels>

</template>


<script>
    import {changeTwoDecimal_f} from "../../util";

    export default {
        name: "OrderFoodTable",
        props: ['item'],
        data() {
            return {
                foods: [],
                order:{}
            }
        },
        methods: {
            twoDecimal(money) {
                return changeTwoDecimal_f(money)
            },
            apiRequestGetFoodsByOrderId() {
                let orderId = this.item.orderId
                this.axios
                    .get('/orderfood/' + orderId)
                    .then(
                        res => {
                            this.foods = res.data.list
                        }
                    )
            },
            apiRequestOrderByOrderId() {
                let orderId = this.item.orderId
                this.axios
                    .get('/orderdetail/info/' + orderId)
                    .then(
                        res => {
                            this.order = res.data.orderDetail
                        }
                    )
            }
        },
        mounted() {
            this.apiRequestOrderByOrderId()
            this.apiRequestGetFoodsByOrderId()
        }
    }
</script>

<style scoped>

</style>