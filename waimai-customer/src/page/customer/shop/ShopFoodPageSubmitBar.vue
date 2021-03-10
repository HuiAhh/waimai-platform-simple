<template>
    <van-submit-bar
            :price="shopCartTotalPrice.sellPrice"
            label="总价："
            :suffix-label="shopCartTotalPrice.originalPrice"
            button-text="下单"
            button-type="warning"
            @submit="nextPage"
            :disabled="!sendLimit"
    >
        <template #tip>
            <span v-if="!sendLimit">未到达起送价：￥{{twoDecimal(shop.floorSendCost)}}，还差￥{{twoDecimal(shop.floorSendCost-shopCartTotalPrice.sellPrice/100)}}</span>
            <span v-if="sendLimit">已达起送价</span>
        </template>
        <template #default>
            <van-button icon color="#80bfff" @click="clickCartButton">
                <van-icon
                        name="shopping-cart-o"
                        size="40"
                />
            </van-button>
        </template>
    </van-submit-bar>
</template>
<script>
    import {mapGetters} from "vuex";
    import {changeTwoDecimal_f} from "../../../utils/money-converter";

    export default {
        name: 'ShopFoodPageSubmitBar',
        props: {
            clickCartButton:{type:Function},
            nextPage:{type:Function},
            sendLimit:{type:Boolean}
        },
        computed:{
            ...mapGetters('customer',{
                shopCartTotalPrice:'shopCartTotalPrice',
                shop:'shopById'
            })
        },
        data(){
            return{

            }
        },
        methods:{
            twoDecimal(price) {
                return changeTwoDecimal_f(price)
            }
        }
    }
</script>
<style>
    .van-submit-bar__suffix-label{
    text-decoration:line-through;
    color:darkgray
    }
</style>
