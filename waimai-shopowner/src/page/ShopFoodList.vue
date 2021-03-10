<template>
    <v-card>
        <v-app-bar
                absolute
                color="blue lighten-5"
                scroll-target="#scrolling-techniques-6"
        >
            <v-toolbar-title>xxxx酸菜鱼</v-toolbar-title>
            <v-spacer></v-spacer>
            <v-btn icon large>
                <v-icon>mdi-plus</v-icon>
            </v-btn>
            <v-btn icon>
                <v-icon>
                    mdi-pencil
                </v-icon>
            </v-btn>

        </v-app-bar>

        <v-card-title>
            11111111111111111111
        </v-card-title>
        <v-card-text>
            <v-row>
                <v-col :sm="6" :md="3" v-for="item in [1,2,3,4,5,6,7,8]" :key="item">
                    <v-card>
                        <v-img width="100%" height="100%" max-width="300" max-height="300"
                            src="https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1954214095,921715647&fm=26&gp=0.jpg"
                        >
                        </v-img>
                        <v-card-title>单人份酸菜鱼</v-card-title>
                        <v-card-subtitle>￥36</v-card-subtitle>
                        <v-card-text>
                            <p>销量: 9999</p>
                            <v-row
                                    align="center"
                                    class="mx-0"
                            >
                                <v-rating
                                        v-model="rating"
                                        background-color="green lighten-3"
                                        color="green"
                                        half-increments
                                        size="14"
                                        dense
                                        readonly
                                ></v-rating>
                                <div  class="grey--text ml-4">
                                    <span>3.5 (6790)</span>
                                </div>
                            </v-row>
                        </v-card-text>
                        <v-card-actions>
                            <v-btn>修改</v-btn>
                            <v-btn>下架</v-btn>
                        </v-card-actions>
                    </v-card>
                </v-col>
            </v-row>
        </v-card-text>
    </v-card>
</template>

<script>
    export default {
        name: "ShopFoodList",
        data: () => ({
            rating: 3.5
        })
    }
</script>

<style scoped>

</style>