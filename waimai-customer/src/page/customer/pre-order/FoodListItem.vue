<template>
    <van-cell>
        <template #title>
            <van-row gutter="20">
                <van-col>
                    <van-image lazy-load width="60" height="60" fit="cover" :src="food.cover"/>
                </van-col>
                <van-col>
                    <div>
                        <span>{{food.title}}</span>
                        <van-row>
                        </van-row>
                        <van-row gutter="5">
                            <van-col>
                                <span>￥{{twoDecimal(food.sellPrice*food.numbers)}}</span>
                            </van-col>
                            <van-col>
                                <span v-if="food.sellPrice!==food.originPrice"
                                      style="text-decoration:line-through;color:darkgray">￥{{twoDecimal(food.originPrice*food.numbers)}}</span>
                            </van-col>
                        </van-row>
                    </div>
                </van-col>
            </van-row>
        </template>
        <template #extra>
            <span>x{{food.numbers}}</span>
        </template>
    </van-cell>
</template>

<script>
    import {changeTwoDecimal_f} from "../../../utils/money-converter";

    export default {
        name: "FoodListItem",
        props:['food'],
        data: () => ({
            // food: {
            //     "id": 1,
            //     "shopId": 1,
            //     "cateId": 1,
            //     "title": "正信鸡排",
            //     "describle": "好吃不贵",
            //     "discount": 10,
            //     "cover": "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604723110205&di=7ba9224df0eb69f5470d91f5ea3a659e&imgtype=0&src=http%3A%2F%2Fe.hiphotos.baidu.com%2Fbainuo%2Fcrop%3D0%2C37%2C470%2C285%3Bw%3D470%3Bq%3D80%2Fsign%3D6c621e39b5de9c82b22aa3cf51b1ac39%2F8694a4c27d1ed21bf0ced4e5ab6eddc451da3faf.jpg",
            //     "originPrice": 18,
            //     "sellPrice": 12,
            //     "showstatus": 0,
            //     "selection": "大份",
            //     "totalSales": 1035,
            //     "praiseRate": 85,
            //     "gmtCreate": "2020-11-07 09:36:11",
            //     "gmtModified": "2020-11-07 09:36:13",
            //     numbers: 3
            // }
        }),
        computed: {
            sellPrice() {
                return changeTwoDecimal_f(this.food.sellPrice)
            },
            originalPrice() {
                return changeTwoDecimal_f(this.food.originPrice)
            },
        },
        methods: {
            totalPrice: (each, price) => {
                return changeTwoDecimal_f(price * each)
            },
            twoDecimal(price) {
                return changeTwoDecimal_f(price)
            }
        }
    }
</script>

<style scoped>

</style>