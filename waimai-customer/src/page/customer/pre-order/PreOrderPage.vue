<template>
    <div>
        <van-nav-bar
                title="订单确认"
                @click-left="exit"
                left-arrow style="overflow: auto;background: #fff6ef"/>
        <ChooseAddress ref="address" />
        <van-cell-group title="预览">
            <van-cell>
                <template #title>
                    <span style="color:#626262">{{shop.shopname}}</span>
                </template>
            </van-cell>
            <FoodListItem v-for="food in getCartListByShopId" :key="food.id" :food="food"/>
            <van-cell>
                <template #title>
                    <van-row type="flex" justify="end"><span>包装费：￥{{twoDecimal(shop.boxCost)}}</span></van-row>
                    <van-row type="flex" justify="end"><span>配送费：￥{{twoDecimal(shop.sendCost)}}</span></van-row>
                    <van-row type="flex" justify="end"><span>总价：
                        <span style="color: #e60000">￥{{twoDecimal(shop.boxCost+shop.sendCost+shopCartTotalPrice.sellPrice/100)}}</span>
                    </span>
                    </van-row>
                </template>
            </van-cell>
        </van-cell-group>
        <van-cell-group title="备注" style="margin-bottom: 60px;">
            <van-cell>
                <van-field
                        v-model="note"
                        type="textarea"
                        clearable
                        placeholder="要对商家或骑手提的额外需求"
                ></van-field>
            </van-cell>
        </van-cell-group>
        <CommitOrderBar :commitOrder="commitOrder"/>
    </div>
</template>

<script>
    import ChooseAddress from "./ChooseAddress";
    import {mapActions, mapGetters, mapMutations} from "vuex";
    import FoodListItem from "./FoodListItem";
    import CommitOrderBar from './CommitOrderBar'
    import {changeTwoDecimal_f} from "../../../utils/money-converter";
    import {Toast} from "vant";

    export default {
        name: "PreOrderPage",
        components: {ChooseAddress, FoodListItem, CommitOrderBar},
        methods: {
            ...mapActions('customer', {
                requestUserAddressList: 'requestUserAddressList',
                requestUserOrderCommit: 'requestUserOrderCommit',
                requestShopById:'requestShopById'
            }),
            ...mapMutations('customer', {
                setUserAddressList: 'SET_USER_ADDRESS_LIST'
            }),
            exit() {
                this.$router.go(-1)
                this.setUserAddressList([])
            },
            commitOrder() {
                let address = this.userAddressList[this.$refs.address.selectAddress]
                console.log('address===>' + address)
                console.log('address type===>' + typeof address)
                if (address === undefined) {
                    console.log('undefined into this brunch===>' + address)
                    Toast({message:'请选择地址',type:'fail'})
                    return
                }
                // console.log({
                //     id: this.userInfo.id,
                //     order: {
                //         note: this.note,
                //         userAddress: address.adress,
                //         userAddressId: address.id,
                //         userId: this.userInfo.id,
                //         userMobile: address.mobile,
                //         userUsername: address.username
                //     },
                //     foods: this.getCartListByShopId
                // })
                this.apiRequestCommitOrder({
                    id: this.userInfo.id,
                    order: {
                        note: this.note,
                        userAddress: address.adress,
                        userAddressId: address.id,
                        userId: this.userInfo.id,
                        userMobile: address.mobile,
                        userUsername: address.username,
                        shopId:this.shop.id,
                        totalMoney:this.shop.boxCost+this.shop.sendCost+this.shopCartTotalPrice.sellPrice/100
                    },
                    foods: this.getCartListByShopId
                })
            },
            apiRequestCommitOrder(payload){
                this.axios({
                    method: 'post',
                    url: '/order/' + payload.id,
                    data: {
                        orderDetailEntity:payload.order,
                        orderFoodEntities:payload.foods
                    },
                    headers: {
                        'content-type': 'application/json'
                    }
                })
                    .then(
                        res => {
                            if (res.data.code === 0) {
                                Toast({message: '下单成功', type: 'success'})
                                this.$router.push('/index')
                            } else if(res.data.code===1000){
                                Toast({message:res.data.msg,type:'fail'})
                            } else {
                                console.log(res.data)
                                Toast({message: '请求失败', type: 'fail'})
                            }
                        }
                    )
            }
        },
        mounted() {
            console.log('this.$route.params.shopId===>' + this.$route.params.shopId)
            this.requestUserAddressList(this.userInfo.id)
            this.requestShopById(this.$route.params.shopId)
        },
        data: () => ({
            twoDecimal(price) {
                return changeTwoDecimal_f(price)
            },
            note: ''
        }),
        computed: {
            ...mapGetters('customer', {
                shopCartTotalPrice: 'shopCartTotalPrice',
                userAddressList: 'userAddressList',
                getCartListByShopId: 'getCartListByShopId',
                shop:'shopById'
            }),
            ...mapGetters('validate', {
                userInfo: 'userInfo'
            }),
        },
        // beforeRouteEnter(to,from,next){
        //     let isUser=window.localStorage.getItem('isUser')
        //     if(!isUser){
        //         Toast({message:'请登录'})
        //         next('/login')
        //     }
        //     next()
        // }
    }
</script>

<style scoped>

</style>