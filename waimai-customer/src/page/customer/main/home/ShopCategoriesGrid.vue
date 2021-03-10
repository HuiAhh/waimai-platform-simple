<template>
    <van-grid>
        <van-grid-item text="饮品"
                       :to="{path:'/category',query:{cateId:1}}"
        >
            <van-image lazy-load width="60" height="60" fit="cover"
                       round
                       src="https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3525007079,3194907489&fm=26&gp=0.jpg"
            />
            <span style="font-size: 12px">饮品</span>
        </van-grid-item>
        <van-grid-item text="简餐"
                       :to="{path:'/category',query:{cateId:2}}"
        >
            <van-image lazy-load width="60" height="60" fit="cover"
                       round

                       src="https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2705377172,1246204023&fm=26&gp=0.jpg"
            />
            <span style="font-size: 12px">简餐</span>
        </van-grid-item>
        <van-grid-item text="商超"
                       :to="{path:'/category',query:{cateId:3}}"
        >
            <van-image lazy-load width="60" height="60" fit="cover"
                       round

                       src="https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=215524058,3910018350&fm=26&gp=0.jpg"
            />
            <span style="font-size: 12px">商超</span>
        </van-grid-item>
        <van-grid-item text="果蔬"
                       :to="{path:'/category',query:{cateId:4}}"
        >
            <van-image lazy-load width="60" height="60" fit="cover"
                       round

                       src="https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3517678817,113111947&fm=26&gp=0.jpg"
            />
            <span style="font-size: 12px">果蔬</span>
        </van-grid-item>
    </van-grid>
</template>
<script>
    export default {
        name: 'ShopCategoriesGrid'
    }
</script>
