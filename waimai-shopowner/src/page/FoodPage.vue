<template>
    <v-card>
        <v-card-title>
            <v-app-bar-nav-icon @click.stop="drawer = !drawer"></v-app-bar-nav-icon>
            菜品管理
        </v-card-title>
        <v-card-text>
            <v-navigation-drawer
                    v-model="drawer"
                    fixed
                    style="margin-top:100px"
                    mobile-breakpoint="500"
            >
                <v-list dense nav>
                    <v-subheader>店铺</v-subheader>
                    <v-list-item-group
                            v-model="shopName"
                            color="primary"
                    >
                        <v-list-item
                                v-for="(item, i) in shops"
                                :key="i"
                        >
                            <v-list-item-content>
                                <v-list-item-title v-text="item.name"></v-list-item-title>
                            </v-list-item-content>
                        </v-list-item>
                    </v-list-item-group>
                </v-list>
            </v-navigation-drawer>

            <v-row class="food-list-items">
                <v-col>
                    <v-tabs-items v-model="shopName">
                        <v-tab-item
                                v-for="item in shops"
                                :key="item.name"
                        >
                            <ShopFoodList/>
                        </v-tab-item>
                    </v-tabs-items>
                </v-col>
            </v-row>
        </v-card-text>
    </v-card>
</template>

<script>
    import ShopFoodList from "./ShopFoodList";

    export default {
        name: "FoodPage",
        components: {ShopFoodList},
        data() {
            return {
                shopName: 1,
                shops: [
                    {name: 'xxxx水煮鱼'},
                    {name: 'xxxx超市'},
                    {name: 'xxxx水果铺'},
                ],
                drawer:true
            }
        }
    }
</script>

<style scoped>
    .food-list-items{
        margin-left:260px;
        margin-top:-50px;
    }

    @media screen and (max-width: 500px){
        .food-list-items{
            margin-left: 10px;
            margin-top:-20px;
        }
    }
</style>