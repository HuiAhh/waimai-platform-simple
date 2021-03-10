<template>
    <div>
        <van-nav-bar title="我的" style="overflow: auto;background: #fff6ef">
            <template #right>
                <van-icon @click="$router.push('/setting')" name="setting-o" size="25">
                </van-icon>
            </template>
        </van-nav-bar>
        <UserInfoCard :user-info="userInfo"/>
        <van-grid>
            <van-grid-item icon="star-o" to="/mine/shop-star" text="店铺收藏"/>
            <van-grid-item icon="location-o" to="/mine/location" text="地址管理"/>
            <van-grid-item icon="balance-pay" text="钱包"/>
            <van-grid-item icon="service-o" text="客服"/>
        </van-grid>
        <van-cell-group title="骑手服务">
            <van-cell title="骑手专区" to="/deliveryman" is-link>
            </van-cell>
        </van-cell-group>
        <van-cell-group title="商家服务">
            <van-cell title="商家专区"
                      @click="toShopownerPage"
                      is-link>
            </van-cell>
        </van-cell-group>
    </div>
</template>

<script>
    import {mapGetters} from "vuex";
    import UserInfoCard from "./UserInfoCard";

    export default {
        name: "Mine",
        components: {UserInfoCard},
        computed:{
            ...mapGetters('validate',{
                userInfo:'userInfo'
            })
        },
        methods:{
            toShopownerPage(){
                window.open('http://47.103.192.205:10000/shopowner/index.html')
            }
        }
    }
</script>

