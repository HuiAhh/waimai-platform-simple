<template>
    <div>
        <van-search v-model="shopname"
                    shape="round"
                    background="#66CCFF"
                    placeholder="请输入搜索关键词"
                    clearable
                    show-action
                    @search="onSearch"
        >
            <template #left>
                <van-icon @click="$router.go(-1)" name="arrow-left" size="20" style="margin-right:15px;"/>
            </template>
            <template #action>
                <div @click="onSearch">搜索</div>
            </template>
        </van-search>
        <ShopList ref="shopList"/>
    </div>
</template>

<script>
    import ShopList from "./ShopList";
    export default {
        name: "Search",
        components: {ShopList},
        data() {
            return {
                shopname: null
            }
        },
        methods: {
            onSearch() {
                this.$refs.shopList.onRefresh({shopname:this.shopname,cateId:0})
            }
        }
    }
</script>

<style scoped>

</style>