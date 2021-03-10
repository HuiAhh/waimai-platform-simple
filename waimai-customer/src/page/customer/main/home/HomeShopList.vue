<template>
    <van-pull-refresh v-model="isLoading" @refresh="onRefresh">
            <van-list style="margin-bottom: 20%;">
                <van-cell-group title="tips:下拉可手动刷新">

                <ShopListItem v-for="item in queryedShopList" :key="item.id" :shop="item"/>
                </van-cell-group>

            </van-list>
    </van-pull-refresh>
</template>
<script>
    import ShopListItem from "./item/ShopListItem";
    import {mapActions, mapGetters} from "vuex";

    export default {
        name: 'HomeShopList',
        components: {ShopListItem},
        props: {},
        data() {
            return {
                isLoading: false,
                queryedShopList: [],
                exampleData: {
                    "id": 1,
                    "shopownerId": 2,
                    "shopname": "正信鸡排",
                    "contactMan": "张小蕊",
                    "contactMobile": "18752151002",
                    "cateid": 2,
                    "beginTime": "08:30:00",
                    "endTime": "23:20:00",
                    "logoImg": "1156a",
                    "address": "迎龙路01号",
                    "mobile": "18152554901",
                    "notice": "可送，等你",
                    "score": 4.8,
                    "sendTime": "20",
                    "boxCost": 2,
                    "sendCost": 1,
                    "floorSendCost": 1,
                    "showStatus": 1
                }
            }
        },
        computed:{
            ...mapGetters('customer',{
                homePageResult:'homePageShopResult'
            }),
        },
        watch:{
            homePageResult() {
                this.queryedShopList = this.homePageResult
            }
        },
        methods: {
            ...mapActions('customer',[
                'requestHomePageShopList'
            ]),
            onRefresh() {
                setTimeout(() => {
                    this.requestHomePageShopList()
                    this.isLoading = false
                }, 1000)
            }
        },
        mounted() {
            this.requestHomePageShopList()

        }
    }
</script>
