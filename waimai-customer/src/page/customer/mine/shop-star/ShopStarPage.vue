<template>
    <div>
        <van-nav-bar title="店铺收藏" @click-left="$router.go(-1)" left-arrow style="overflow: auto;background: #fff6ef"/>
        <van-list style="margin-bottom: 20%;">
            <van-cell v-for="item in [1,2,3,4]" :key="item" is-link>
                <template #title>
                    <van-row gutter="20">
                        <van-col>
                            <van-icon name="photo-o" size="60px"/>
                        </van-col>
                        <van-col>
                            <div>
                                <p>肯德基</p>
                                <p>起送: 50</p>
                                <p>评分: 3.7</p>
                                <p>营业状态: 休息 几点开店</p>
                            </div>
                            <van-row>
                                <van-col>
                                    <van-col>
                                        <van-icon name="photo-o" size="60px"/>
                                    </van-col>
                                    <van-col>
                                        <van-icon name="photo-o" size="60px"/>
                                    </van-col>
                                    <van-col>
                                        <van-icon name="photo-o" size="60px"/>
                                    </van-col>
                                </van-col>
                            </van-row>
                        </van-col>
                    </van-row>
                </template>
            </van-cell>
        </van-list>
    </div>
</template>

<script>
    export default {
        name: "ShopStarPage"
    }
</script>

<style scoped>

</style>