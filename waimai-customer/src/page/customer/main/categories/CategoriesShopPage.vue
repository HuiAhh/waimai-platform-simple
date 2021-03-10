<template>
    <div>
    <van-nav-bar style="overflow: auto;background: #8a91ff">
        <template #left>
            <van-icon name="arrow-left" color="#ffffff" @click="exit">
            </van-icon>
        </template>
        <template #title>
            <span style="color: #ffffff">{{title}}</span>
            </template>
    </van-nav-bar>
    <ShopList ref="shopList"/>
    </div>
</template>

<script>
    import ShopList from "../search/ShopList";
    import {Toast} from "vant";

    export default {
        name: "CategoriesShopPage",
        components: {ShopList},
        data:()=>({
              cateId:0,
              title:''
        }),

        methods:{
            load(){
                switch (this.cateId) {
                    case '1': this.title='饮品';break;
                    case '2': this.title='简餐';break;
                    case '3': this.title='商超';break;
                    case '4': this.title='果蔬';break;
                    default: this.title=''
                }
                Toast.loading({
                    message:'加载中'
                })

                this.$refs.shopList.onRefresh({shopname:'',cateId:this.cateId})
            },
            exit(){
                this.$router.go(-1);
                this.$destroy()
            }
        },
        mounted() {
            this.cateId=this.$route.query.cateId
            this.load()
        },
        beforeRouteLeave(to,from,next){
            this.$destroy()
            next()
        },
    }
</script>

<style scoped>

</style>