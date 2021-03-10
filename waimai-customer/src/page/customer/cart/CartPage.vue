<template>
    <div>
        <van-swipe-cell>
            <van-card
                    num="2"
                    price="2.00"
                    desc="描述信息"
                    title="商品标题"
                    class="goods-card"
                    thumb="https://img.yzcdn.cn/vant/cat.jpeg"
            />
            <template #right>
                <van-button square text="删除" type="danger" class="delete-button" />
            </template>
        </van-swipe-cell>
    </div>
</template>

<script>
    export default {
        name: "CartPage"
    }
</script>

<style scoped>

</style>