<template>
    <v-row>
        <v-col :md="6" v-for="item in refundList" :key="item.id">
            <v-card>
                <OrderItem :refresh="refresh" :item="item" :have-control="true"/>
            </v-card>
        </v-col>
    </v-row>
</template>
<script>
    import OrderItem from "./OrderItem";

    export default {
        name: 'OrderList',
        components: {OrderItem},
        props: ['refundList', 'haveControl','refresh'],
    }
</script>
