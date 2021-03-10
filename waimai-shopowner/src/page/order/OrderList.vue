<template>
    <v-row>
        <v-col :md="3" v-for="item in orderList" :key="item.id">
            <OrderItem :item="item" :have-control="haveControl"/>
        </v-col>
    </v-row>
</template>
<script>
    import OrderItem from "./OrderItem";

    export default {
        name: 'OrderList',
        components: {OrderItem},
        props: ['orderList', 'haveControl'],
    }
</script>
