<template>
    <div>
        <van-nav-bar :title="$route.query.shopname" @click-left="exit" left-arrow style="overflow: auto;background: #fff6ef"/>
        <van-pull-refresh v-model="isLoading" @refresh="onRefresh">
            <van-list style="margin-bottom: 20%;">
                <van-cell-group title="tips:下拉可手动刷新">
                    <FoodDetailItem v-for="item in shopFoodsList"
                                    :key="item.id"
                                    :food="item"
                                    ref="foodItem"
                    />
                    <van-cell v-if="shopFoodsList.length===0" title="呜呜呜没数据～～"></van-cell>
                </van-cell-group>
            </van-list>
        </van-pull-refresh>
        <ShopFoodPageSubmitBar :send-limit="sendLimit" :nextPage="goPreOrder" :clickCartButton="clickCartButton"/>
        <van-action-sheet :round="false"
                          v-model="showCart"
                          title="购物车">
            <div style="margin-bottom: 90px;">
                <CartItem
                        v-for="item in getCartListByShopId"
                        :key="item.id"
                        :food="item"
                />
            </div>
            <ShopFoodPageSubmitBar :send-limit="sendLimit" :nextPage="goPreOrder" :clickCartButton="clickCartButton"/>
        </van-action-sheet>
    </div>
</template>

<script>
    import {mapActions, mapGetters, mapMutations} from "vuex";
    import FoodDetailItem from "./item/FoodDetailItem";
    import {Toast} from "vant";
    import CartItem from "./item/CartItem";
    import ShopFoodPageSubmitBar from "./ShopFoodPageSubmitBar";

    export default {
        name: "ShopFoodDetailPage",
        components:{ShopFoodPageSubmitBar, CartItem, FoodDetailItem},
        data() {
            return {
                exampleShopFoodDetailItem: {
                    "id": 1,
                    "shopId": 1,
                    "cateId": 1,
                    "title": "鸡排",
                    "describle": "炸",
                    "discount": 10,
                    "cover": "https://goss.veer.com/creative/vcg/veer/800water/veer-167615731.jpg",
                    "originPrice": 18,
                    "sellPrice": 12,
                    "showstatus": 0,
                    "selection": "大",
                    "totalSales": 542,
                    "praiseRate": 88,
                    "gmtCreate": "2020-11-03 09:46:50",
                    "gmtModified": "2020-11-04 13:35:37",
                },
                shopFoodsList:[],
                shopId:null,
                isLoading: false,
                showCart:false
            }
        },
        computed:{
            ...mapGetters('customer',{
                shopFoodsResult:'shopFoodsResult',
                cartList:'cartList',
                getCartListByShopId:'getCartListByShopId',
                shopCartTotalPrice:'shopCartTotalPrice',
                shop:'shopById'
            }),
            ...mapGetters('validate',{
                userInfo:'userInfo'
            }),
            sendLimit(){
                return this.shopCartTotalPrice.sellPrice/100>=this.shop.floorSendCost
            }
        },
        watch:{
            shopFoodsResult(){
                this.shopFoodsList=this.shopFoodsResult

                    let preCartList = this.shopFoodsList.filter(() => true)
                    for (let i = 0; i < preCartList.length; i++) {
                        preCartList[i].numbers = 0
                    }
                    let newGlobalCartList=[...this.cartList]
                    newGlobalCartList.push({shopId:this.$route.params.shopId,cart:preCartList})
                    this.setCartList(newGlobalCartList)


                this.setShopCart(this.$route.params.shopId)

            },
        },
        methods: {
            ...mapActions('customer',[
                'requestShopFoodsResult','requestShopById'
            ]),
            ...mapMutations('customer',{
                setShopFoodsResult:'SET_SHOP_FOODS_LIST',
                setCartList:'SET_CART_LIST',
                setShopCart:'SET_SHOP_CART_LIST_BY_SHOP_ID',
                setShopCartEmpty:'SET_SHOP_CART_LIST_NULL',
                clearTotalCost:'CLEAR_TOTAL_COST'
            }),
            apiRequestShopFoods(){
                this.requestShopFoodsResult(this.$route.params.shopId)
            },

            onRefresh() {
                setTimeout(() => {
                    this.apiRequestShopFoods()
                    this.isLoading = false
                }, 1000)
            },
            exit(){
                this.$router.go(-1)
                this.setShopFoodsResult([])
                this.setShopCartEmpty()
                this.setCartList([])
                this.clearTotalCost()
                this.$route.meta.keepAlive=false
                this.$destroy()
            },
            clickCartButton(){
                this.showCart=!this.showCart
            },
            goPreOrder(){
                this.$router.push('/pre-order/'+this.$route.params.shopId)
            }
        },
        created() {
            Toast.loading({
                message:'加载中'
            })
            this.requestShopById(this.$route.params.shopId)
            this.onRefresh()
            console.log(this.userInfo.id+'   this.userInfo typeof ==>'+typeof this.userInfo.id)
            if(!this.userInfo.id) {
                Toast('未登录')
            }
        }
    }
</script>

<style scoped>

</style>