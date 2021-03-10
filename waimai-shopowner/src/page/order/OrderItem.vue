<template>
    <div>
        <v-card>
            <v-card-title>{{item.shopShopname+'   #'+item.id}}</v-card-title>
            <v-card-subtitle>{{modifiedTime(new Date(item.gmtCreate))}}</v-card-subtitle>
            <v-card-text>
                <OrderFoodTable :order="item" ref="foodTable"/>
                <v-container>
                    <v-row>包装费：￥{{twoDecimal(item.boxCost)}}</v-row>
                    <v-row>配送费：￥{{twoDecimal(item.sendCost)}}</v-row>
                    <v-row>本单收入：￥{{twoDecimal(item.totalMoney-item.sendCost-2)}}</v-row>
                    <v-row>{{getDate(new Date(item.gmtCreate))}}</v-row>
                </v-container>
            </v-card-text>
            <v-card-actions>
                <v-btn
                        @click="createRefundFromShopowner"
                        v-if="haveControl" color="#ff3333"
                ><span style="color: #ebebeb">退款操作</span></v-btn>
            </v-card-actions>
        </v-card>
        <v-dialog v-model="activeRefundDialog" persistent max-width="800px">
            <v-form>
                <v-card>
                    <v-app-bar>
                        <v-btn
                                icon
                                color="indigo"
                                @click="activeRefundDialog=false"
                        >
                            <v-icon>mdi-close</v-icon>
                        </v-btn>

                        <v-toolbar-title>快速订单退款</v-toolbar-title>
                        <v-spacer></v-spacer>
                        <v-btn
                                icon
                                color="indigo"
                                @click="beforeCommitUpdate"
                        >
                            <v-icon>mdi-content-save</v-icon>
                        </v-btn>
                    </v-app-bar>
                    <v-list
                            subheader
                    >
                        <v-subheader>退款菜品</v-subheader>
                        <v-list-item>
                            <v-list-item-content>
                                <span style="color:green">对未送达订单，要全额退款建议联系顾客，由顾客发起退单请求</span><br/>
                                <span style="color:green">勾选菜品+填入份数</span>
                            </v-list-item-content>
                        </v-list-item>
                        <v-simple-table>
                            <template v-slot:default>
                                <thead>
                                <tr>
                                    <th>
                                        <v-checkbox
                                                v-model="selectedAll"
                                                :indeterminate="selectAllIndeterminate"
                                        ></v-checkbox>
                                    </th>
                                    <th>
                                    </th>
                                    <th class="text-left">
                                        菜品
                                    </th>
                                    <th class="text-left" style="color:red">
                                        退款份数
                                    </th>
                                    <th class="text-left">
                                        原份数
                                    </th>
                                    <th>单价</th>
                                    <th>原价</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr
                                        v-for="(item,index) in $refs.foodTable.foods"
                                        :key="index"
                                >
                                    <td>
                                        <v-checkbox v-model="selectItems" :value="item"></v-checkbox>
                                    </td>
                                    <td>
                                        <v-img
                                                :src="item.cover"
                                                max-width="40"
                                                max-height="40"
                                        >
                                        </v-img>
                                    </td>
                                    <td>{{ item.title }}</td>
                                    <td>
                                        <v-text-field
                                                :rules="[v=>(v>0&&v<=item.numbers&&!!v)||'请输入不大于原份数的正整值']"
                                                type="number" v-model="item.refundNumbers">
                                        </v-text-field>
                                    </td>
                                    <td>{{ item.numbers }}</td>
                                    <td>￥{{twoDecimal(item.sellPrice)}}</td>
                                    <td>￥{{twoDecimal(item.originPrice)}}</td>
                                </tr>
                                </tbody>
                            </template>
                        </v-simple-table>
                        <v-list-item>
                            <v-list-item-content>
                                <v-text-field
                                        prepend-inner-icon="mdi-file-document-edit-outline"
                                        label="退款原因"
                                        clearable
                                        v-model="refundReason"
                                        :counter="50">

                                </v-text-field>
                            </v-list-item-content>
                        </v-list-item>
                    </v-list>
                </v-card>
            </v-form>
        </v-dialog>
        <v-dialog v-model="reConfirmDialog" max-width="400px">
            <v-card>
                <v-card-title>确认退款</v-card-title>
                <v-card-subtitle>
                    <p v-if="haveNoNumberItem"><span style="color:red">注意</span>：有菜品<span style="color:red">没有</span>
                        填入退款份数，将<span style="color:red">不</span>对此商品进行退款操作!!!<br/>
                    </p>
                    确认主动发起退款
                    <span style="color:red">￥{{twoDecimal(this.refundPrice)}}</span>
                    ，操作无法恢复
                </v-card-subtitle>
                <v-card-actions>
                    <v-btn text color="red accent-4" @click="commitUpdate">确认</v-btn>
                    <v-btn text color="brown darken-4" @click="reConfirmDialog=false">取消</v-btn>
                </v-card-actions>
            </v-card>
        </v-dialog>
        <v-snackbar top v-model="successRefund" color="success">
            <v-alert type="success">
                退款成功
            </v-alert>
        </v-snackbar>
        <v-snackbar top v-model="failedRefund" color="info">
            <v-alert type="info">
                退款失败
            </v-alert>
        </v-snackbar>
        <v-snackbar top v-model="noControlRefund" color="info">
            <v-alert type="info">
                退款未生成，退款金额为￥0.00
            </v-alert>
        </v-snackbar>
    </div>
</template>
<script>
    import OrderFoodTable from "./OrderFoodTable"
    import {changeTwoDecimal_f, dateFormat} from "../../util";

    export default {
        name: 'OrderItem',
        components: {OrderFoodTable},
        props: {
            haveControl: {},
            item: {type: Object}
        },
        data() {
            return {
                activeRefundDialog: false,
                selectItems: [],
                selectedAll: false,
                selectAllIndeterminate: false,
                reConfirmDialog: false,
                refundPrice: 0,
                haveNoNumberItem: false,
                refundReason:'',
                successRefund:false,
                failedRefund:false,
                noControlRefund:false
            }
        },
        watch: {
            selectedAll(to) {
                console.log('watched ====>' + to)
                if (to) {
                    console.log('watched ====>' + to)
                    this.selectItems = [...this.$refs.foodTable.foods]
                    this.selectAllIndeterminate = false
                } else {
                    console.log('watched ====>' + to)
                    this.selectItems = []
                    this.selectAllIndeterminate = false
                }
            },
            selectItems() {
                console.log('watched select item change====')

                this.selectAllIndeterminate = this.selectItems.length > 0 &&
                    this.selectItems.length < this.$refs.foodTable.foods.length;
                if (this.selectItems.length === 0) {
                    this.selectedAll = false
                }
                if (this.selectItems.length === this.$refs.foodTable.foods.length) {
                    this.selectedAll = true
                }
            }
        },
        methods: {
            modifiedTime(date) {
                // date.setHours(date.getHours()+8)
                return dateFormat('HH:MM', date)
            },
            getDate(date) {
                // date.setHours(date.getHours()+8)
                return dateFormat('mm月dd日', date)
            },
            twoDecimal(money) {
                return changeTwoDecimal_f(money)
            },
            createRefundFromShopowner() {
                this.activeRefundDialog = true
            },
            commitUpdate() {
                let data={
                    "completestatus": 1,
                    "orderId": this.item.id,
                    "payMoney": this.refundPrice,
                    "refundReason": this.refundReason,
                    "serviceCost": 0.1,
                    "userId": this.item.userId,
                    "username": this.item.userUsername
                }
                console.log(data)
                if(data.payMoney===0){
                    this.noControlRefund=true
                    this.reConfirmDialog=false
                    return
                }
                this.axios({
                    method: 'post',
                    url: '/orderrefund/objective-save',
                    data: data,
                    headers: {'content-type': 'application/json'}
                }).then(
                    res => {
                        if (res.data.code === 0) {
                            this.successRefund = true
                            this.reConfirmDialog=false
                            this.activeRefundDialog=false
                        }
                    }
                ).catch(
                    () => {
                        this.failedRefund = true
                    }
                )
            },
            beforeCommitUpdate() {
                this.reConfirmDialog = true
                // console.log(this.selectItems)
                let totalResult = 0
                let haveNoNumberFlag = 0
                for (let i = 0; i < this.selectItems.length; i++) {
                    let res = this.selectItems[i].sellPrice * this.selectItems[i].refundNumbers
                    if (res) {
                        totalResult += res
                    }
                    console.log('isNaN(res)===>'+isNaN(res))
                    if (isNaN(res)) {
                        haveNoNumberFlag++
                    }
                }
                this.refundPrice = totalResult
                this.haveNoNumberItem = haveNoNumberFlag > 0;
            },
        }
    }
</script>