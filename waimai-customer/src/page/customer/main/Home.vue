<template>
    <div>
        <van-nav-bar style="overflow: auto;background: #8a91ff">
            <template #left>
                <van-icon name="wap-nav" size="18"
                          color="#ffffff"
                          @click="showLeftMenu=true"
                />
            </template>
            <template #title>
                <van-search v-model="value"
                            @focus="goSearchPage"
                            shape="round"
                            background="#8a91ff"
                            placeholder="店铺名或菜品名"/>
            </template>
            <template #right>
                <van-icon style="margin-left: 20px;" name="plus" size="18"
                          color="#ffffff"
                          @click="showPlusMenu=true"

                />
            </template>
        </van-nav-bar>
        <van-swipe class="my-swipe"
                   :autoplay="3000"
                   height="200px"
                   indicator-color="white">
            <van-swipe-item
                    v-for="item in swipePromoteList"
                    :key="item.id"
                    @click="$router.push({path:'/shop/'+item.shopId,query:{shopname:getShop(item.shopId).shopname}})"
            >
                <van-image
                        fit="cover"
                        height="200px"
                        width="100%"
                        lazy-load
                        :src="getShop(item.shopId).logoImg"/>
                <span class="custom-indicator">
                    {{getShop(item.shopId).shopname}}
                </span>
            </van-swipe-item>
        </van-swipe>
        <ShopCategoriesGrid/>
        <HomeShopList/>
        <van-popup
                v-model="showLeftMenu"
                position="left"
                :style="{ height: '100%',width:'50%' }"
                closeable
        >

            <div style="height:100%">
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
        </van-popup>
        <van-popup
                v-model="showPlusMenu"
                position="right"
                :style="{ height: '100%',width:'50%' }"
                closeable
        >
            <div style="height:100%">
                <UserInfoCard style="margin-top:50px;" :user-info="userInfo"/>
                <span v-if="!userInfo.id">未登录状态</span>
                <van-cell-group>
                    <van-cell title="登录" is-link to="/login"/>
                    <van-cell title="取消登录" is-link @click="logout"/>
                </van-cell-group>
            </div>
        </van-popup>
    </div>
</template>

<script>
    import HomeShopList from "./home/HomeShopList";
    import ShopCategoriesGrid from "./home/ShopCategoriesGrid";
    import {mapGetters} from "vuex";
    import UserInfoCard from "./UserInfoCard";
    import {Dialog} from "vant";

    export default {
        name: "Home",
        components: {ShopCategoriesGrid, HomeShopList, UserInfoCard},
        data() {
            return {
                value: '',
                count: 0,
                showPlusMenu: false,
                showLeftMenu: false,
                swipePromoteList: [],
                current: {
                    shopId:-99
                }
            }
        },
        methods: {
            goSearchPage() {
                this.$router.push('/search')
            },
            logout() {
                Dialog.confirm({
                    title: '退出登录',
                    message: '确定退出登录',
                })
                    .then(() => {
                        window.localStorage.removeItem('uid')
                    })
                    .catch(() => {
                        // on cancel
                    });
                this.showPlusMenu = false
            },
            toShopownerPage() {
                window.open('http://47.103.192.205:10000/shopowner/index.html')
            },
            apiRequestPromoteList() {
                this.axios.get('/promote/list')
                    .then(res => {
                        this.swipePromoteList = res.data.list
                    })
            },
            getShop(shopId) {
                return this.homePageShopResult.filter(
                    el => el.id === shopId
                )[0]
            }
        },
        computed: {
            ...mapGetters('validate', {
                userInfo: 'userInfo'
            }),
            ...mapGetters('customer', {
                homePageShopResult: 'homePageShopResult'
            })
        },
        mounted() {
            this.apiRequestPromoteList()
        }
    }
</script>

<style scoped>
    /*.my-swipe .van-swipe-item {*/
    /*    color: #fff;*/
    /*    font-size: 20px;*/
    /*    line-height: 150px;*/
    /*    text-align: center;*/
    /*    background-color: #39a9ed;*/
    /*}*/
    .custom-indicator {
        position: absolute;
        right: 5px;
        bottom: 5px;
        padding: 2px 5px;
        font-size: 20px;
        background: rgba(0, 0, 0, 0.9);
        color: #f6ffdf;
    }
</style>