<template>
    <div>
        <van-nav-bar title="我的" style="overflow: auto;background: #fff6ef">
            <template #right>
                <van-icon @click="$router.push('/deliveryman/setting')" name="setting-o" size="25">
                </van-icon>
            </template>
        </van-nav-bar>
        <van-card>
            <template #title>
                <van-row gutter="20">
                    <van-col>
                        <van-icon name="photo-o" size="40" />
                    </van-col>
                    <van-col>
                        <p>用户名</p>
                        <p>送餐员ID</p>
                        <p>饿死就算了。</p>
                    </van-col>
                </van-row>
            </template>
        </van-card>
        <van-grid :column-num="3">
            <van-grid-item icon="balance-list-o" to="/deliveryman/mine/shop-star"
                           text="每日收入"/>
            <van-grid-item icon="balance-pay" text="钱包"/>
            <van-grid-item icon="service-o" text="客服"/>
        </van-grid>
        <van-cell-group title="已完成订单，下拉刷新">
            <van-pull-refresh v-model="isLoading" @refresh="onRefresh">
                <van-list style="margin-bottom: 20%;">
                    <van-cell v-for="item in [1,2,3,4]" :key="item">
                        <template #title>
                            <van-row>
                                <span>11月2日 12:36</span>
                            </van-row>
                            <van-row>
                                <van-col><span>店铺名</span></van-col> <van-col><span>地址：xxxxxxxx</span></van-col>
                            </van-row>
                            <van-row>
                                <van-col><span>顾客地址：xxxxxxxx</span></van-col>
                            </van-row>
                        </template>
                        
                    </van-cell>
                    <van-cell v-for="item in [1,2,3,4]" :key="item">
                        <template #title>
                            <van-row>
                                <span>几分钟前</span>
                            </van-row>
                            <van-row>
                                <van-col><span>店铺名</span></van-col> <van-col><span>地址：xxxxxxxx</span></van-col>
                            </van-row>
                            <van-row>
                                <van-col><span>顾客地址：xxxxxxxx</span></van-col>
                            </van-row>
                        </template>
                        
                    </van-cell>
                </van-list>
            </van-pull-refresh>
        </van-cell-group>

    </div>
</template>

<script>
    export default {
        name: "Mine"
    }
</script>

<style scoped>

</style>