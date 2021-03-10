<template>
    <v-card>
        <v-card-title>
            店铺管理
            <v-btn @click="preRegisterDialog=true" icon large>
                <v-icon>mdi-plus</v-icon>
            </v-btn>
            <v-btn
                    icon
                    @click="refresh"
            >
                <v-icon>mdi-cached</v-icon>
            </v-btn>
        </v-card-title>
        <v-card-text>
            <ShopDisplayList ref="shopDisplayList"/>
        </v-card-text>
        <RegisterShopDialog
                :changeDialogStatus="changeDialogStatus"
                :activeEditDialog="preRegisterDialog"
        />
    </v-card>

</template>

<script>
    import ShopDisplayList from "./ShopDisplayList";
    import RegisterShopDialog from "./RegisterShopDialog";

    export default {
        name: "ShopPage",
        components: {ShopDisplayList,RegisterShopDialog},
        data: () => ({

            preRegisterDialog:false
        }),
        methods:{
            refresh(){
                this.$refs.shopDisplayList.refreshShop()
            },
            changeDialogStatus() {
                this.preRegisterDialog = !this.preRegisterDialog
            },
        }
    }
</script>

