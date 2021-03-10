<template>
    <div>
        <van-cell :to="{path:'/shop/'+shop.id,query:{shopname:shop.shopname}}" is-link>
            <template #title>
                <van-row gutter="20">
                    <van-col>
                        <van-image lazy-load width="60" height="60" fit="cover" :src="shop.logoImg"/>
                    </van-col>
                    <van-col>
                        <div>
                            <span>{{shop.shopname}}</span>
                            <van-row>
                                <van-col><van-rate color="#9c95fb" allow-half v-model="shop.score" size="small"></van-rate></van-col>
                                <van-col><span>{{shop.score}}</span></van-col>
                            </van-row>
                            <span>起送: ￥{{shop.floorSendCost}}</span>
                            <van-row>
                                <van-tag v-if="shop.showStatus===1" color="green">营业中</van-tag>
                                <van-tag v-if="shop.showStatus===0" color="grey">休息中</van-tag>
                            </van-row>
                        </div>
                    </van-col>
                </van-row>
            </template>
        </van-cell>
    </div>
</template>
<script>
    export default {
        name: 'ShopListItem',
        props: ['shop']
    }
</script>