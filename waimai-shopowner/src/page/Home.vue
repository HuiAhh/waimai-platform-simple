<template>
    <v-card>
        <v-tabs
                v-model="tab"
                background-color="transparent"
                color="basil"
                grow
                show-arrows
        >
            <!-- logo -->
            <span>xx外卖商家平台</span>
            <v-tab
                    v-for="item in items"
                    :key="item"
            >
                {{ item }}
            </v-tab>
            <v-btn text @click="logout">退出登录</v-btn>
        </v-tabs>

        <v-tabs-items v-model="tab">
            <v-tab-item key="订单">
                <OrderPage/>
            </v-tab-item>
            <v-tab-item key="菜品">
                <FoodPage/>
            </v-tab-item>
            <v-tab-item key="店铺">
                <ShopPage/>
            </v-tab-item>
            <v-tab-item key="退款">
                <RefundPage/>
            </v-tab-item>
            <v-tab-item key="商家中心">
                <InfoPage/>
            </v-tab-item>
        </v-tabs-items>
    </v-card>
</template>

<script>
    import OrderPage from "./OrderPage";
    import FoodPage from "./FoodPage";
    import ShopPage from "./shop/ShopPage";
    import RefundPage from "./RefundPage";
    import InfoPage from "./InfoPage";
    export default  {
        name: "Home",
        components: {InfoPage, RefundPage, ShopPage, FoodPage, OrderPage},
        data(){
            return{
                tab:'',
                text:'balabala',
                items:[
                    '订单',
                    '菜品',
                    '店铺',
                    '退款',
                    '商家中心'
                ]
            }
        },
        methods:{
            logout(){
                window.localStorage.removeItem('uid')
                // window.localStorage.removeItem('isUser')
                this.$router.replace('/login')
            }
        }
    }
</script>

<style scoped>

</style>