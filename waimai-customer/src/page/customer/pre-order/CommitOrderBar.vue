<template>
    <van-submit-bar
            :price="shopCartTotalPrice.sellPrice"
            label="总价："
            :suffix-label="shopCartTotalPrice.originalPrice"
            button-text="下单"
            button-type="warning"
            @submit="commitOrder"
    >
    </van-submit-bar>
</template>

<script>
    import {mapGetters} from "vuex";

    export default {
        name: "CommitOrderBar",
        props:['commitOrder'],
        computed:{
            ...mapGetters('customer',{
                shopCartTotalPrice:'shopCartTotalPrice'
            })
        },
    }
</script>

<style scoped>

</style>