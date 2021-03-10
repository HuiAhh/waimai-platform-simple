<template>
    <van-card
            :num="food.numbers"
            :price="totalPrice(sellPrice,food.numbers)"
            :title="food.title"
            :thumb="food.cover"
            :origin-price="totalPrice(originalPrice,food.numbers)"
    >
        <template #tags>

        </template>
        <template #footer>
            <van-button
                    @click="minus"
                    size="mini" color="#ff3333" round icon>
                <van-icon name="minus" size="14"></van-icon>
            </van-button>
            <van-button
                    @click="plus"
                    size="mini" color="#ff3333" round icon>
                <van-icon name="plus" size="14"></van-icon>
            </van-button>
        </template>
    </van-card>
</template>

<script>
    import {changeTwoDecimal_f} from '../../../../utils/money-converter.js'
    import {mapGetters, mapMutations} from "vuex";

    export default {
        name: "CartItem",
        props: ['food'],
        computed: {
            sellPrice() {
                return changeTwoDecimal_f(this.food.sellPrice)
            },
            originalPrice() {
                return changeTwoDecimal_f(this.food.originPrice)
            },
            ...mapGetters('customer', {
                shopFoodsResult: 'shopFoodsResult',
                cartList: 'cartList',
                updateFlag: 'updateFlag'
            }),
        },
        watch: {
            updateFlag() {
                this.$forceUpdate()
            }
        },
        methods: {
            totalPrice:(each,price)=> {
                return changeTwoDecimal_f(price * each)
            },
            ...mapMutations('customer', {
                setCartList: 'SET_CART_LIST',
                changeFlag: 'CHANGE_CART_UPDATE_FLAG',
                plusCartItem: 'PLUS_CART_ITEM',
                minusCartItem: 'MINUS_CART_ITEM',
                updateLocalCart:'SET_SHOP_CART_LIST_BY_SHOP_ID',
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

</style>