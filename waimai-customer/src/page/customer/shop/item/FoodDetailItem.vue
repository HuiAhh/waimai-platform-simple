<template>
    <van-cell>
        <template #right-icon>
            <van-row align="center" :gutter="5">
                <van-col>
                    <van-button
                            @click="minus"
                            :class="{'hidden-elem':food.numbers<=0||food.numbers===undefined}"
                            round size="small" icon="minus" color="#c2a078"/>
                </van-col>
                <van-col>
                    <span
                            style="font-size: 12px;"
                            :class="{'hidden-elem':food.numbers<=0||food.numbers===undefined}"
                    >
                        {{food.numbers}}
                    </span>
                </van-col>
                <van-col>
                    <van-button
                            @click="plus"
                            round size="small" icon="plus" color="#c2a078"/>
                </van-col>
            </van-row>
        </template>
        <template #title>
            <van-row gutter="20">
                <van-col>
                    <van-image lazy-load width="60" height="60" fit="cover" :src="food.cover"/>
                </van-col>
                <van-col>
                    <div>
                        <span>{{food.title}}</span>
                        <van-row gutter="5">
                            <van-col>
                                <van-rate color="#9c95fb" allow-half v-model="fiveStarRate" size="small"></van-rate>
                            </van-col>
                            <van-col><span>{{fiveStarRate}}({{food.totalSales}})</span></van-col>
                        </van-row>
                        <van-row>
                        </van-row>
                        <van-row gutter="5">
                            <van-col>
                                <span>￥{{twoDecimal(food.sellPrice)}}</span>
                            </van-col>
                            <van-col>
                                <span v-if="food.sellPrice!==food.originPrice"
                                      style="text-decoration:line-through;color:darkgray">￥{{twoDecimal(food.originPrice)}}</span>
                            </van-col>
                        </van-row>
                    </div>
                </van-col>
            </van-row>
        </template>
    </van-cell>

</template>

<script>
    import {changeTwoDecimal_f} from '../../../../utils/money-converter.js'
    import {mapGetters, mapMutations} from "vuex";

    export default {
        name: "FoodDetailItem",
        props: ['food'],
        data: () => ({}),
        computed: {
            fiveStarRate() {
                return Math.round(this.food.praiseRate / 2) / 10
            },
            ...mapGetters('customer', {
                getCartListByShopId: 'getCartListByShopId',
                cartList: 'cartList',
                updateFlag: 'updateFlag'
            })
        },
        watch: {
            updateFlag() {
                this.$forceUpdate()
            }
        },
        methods: {
            twoDecimal(x) {
                return changeTwoDecimal_f(x)
            },
            ...mapMutations('customer', {
                setCartList: 'SET_CART_LIST',
                changeFlag: 'CHANGE_CART_UPDATE_FLAG',
                plusCartItem: 'PLUS_CART_ITEM',
                minusCartItem: 'MINUS_CART_ITEM',
                updateLocalCart: 'SET_SHOP_CART_LIST_BY_SHOP_ID',
                calculateTotalCost:'CALCULATE_TOTAL_COST',

            }),
            plus() {
                this.plusCartItem({shopId: this.$route.params.shopId, foodId: this.food.id})
                this.updateLocalCart(this.$route.params.shopId)
                this.changeFlag()
                this.calculateTotalCost()

                this.$forceUpdate()

            },
            minus() {
                this.minusCartItem({shopId: this.$route.params.shopId, foodId: this.food.id})
                this.updateLocalCart(this.$route.params.shopId)
                this.changeFlag()
                this.calculateTotalCost()

                this.$forceUpdate()


            }
        }
    }
</script>

<style scoped>
    .hidden-elem {
        visibility: hidden;
    }
</style>