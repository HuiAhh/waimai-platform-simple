<template>
    <v-row>
        <v-col :sm="6" :md="3" v-for="item in shops" :key="item.id">
            <v-card>
                <v-img width="100%" height="100%" max-width="300" max-height="200"
                       :src="item.logoImg"
                >
                </v-img>
                <v-card-title>{{item.shopname}}</v-card-title>
                <v-card-subtitle>{{item.address}}</v-card-subtitle>
                <v-card-text>
                    <p>主营: {{category[item.cateid]}}</p>
                    <v-row
                            align="center"
                            class="mx-0"
                    >
                        <v-rating
                                v-model="item.score"
                                background-color="green lighten-3"
                                color="yellow darken-4"
                                half-increments
                                size="14"
                                dense
                                readonly
                        ></v-rating>
                        <div class="grey--text ml-4">
                            <span>{{item.score}}</span>
                        </div>
                    </v-row>
                </v-card-text>
                <v-card-actions>
                    <v-btn @click="intoEdit(item)">修改</v-btn>
                    <v-btn @click="offShopStatus(item.id)" v-if="item.showStatus===1" text color="red darken-2">关店</v-btn>
                    <v-btn @click="apiRequestUpdateStatus(item.id)" v-if="item.showStatus===0" text color="success">开店
                    </v-btn>
                </v-card-actions>
            </v-card>

        </v-col>
        <v-dialog v-model="shopOffDialog" max-width="400px">
            <v-card>
                <v-card-title>确认关店</v-card-title>
                <v-card-subtitle>
                    <p>确定在营业时间关店</p>
                </v-card-subtitle>
                <v-card-actions>
                    <v-btn text color="red accent-4" @click="commitOff">确认</v-btn>
                    <v-btn text color="brown darken-4" @click="shopOffDialog=false">取消</v-btn>
                </v-card-actions>
            </v-card>
        </v-dialog>
        <EditShopDialog
                :shop="editingShop"
                :changeDialogStatus="changeDialogStatus"
                :activeEditDialog="activeEditDialog"
        />
        <v-snackbar centered v-model="successControl" color="success">
            <v-alert type="success">
                操作成功
            </v-alert>
        </v-snackbar>
        <v-snackbar centered v-model="failedControl" color="info">
            <v-alert type="info">
                操作失败
            </v-alert>
        </v-snackbar>
    </v-row>
</template>
<script>
    import {mapGetters, mapMutations} from "vuex";
    import EditShopDialog from './EditShopDialog'

    export default {
        name: 'ShopDisplayList',
        components: {
            EditShopDialog
        },
        data: () => ({
            category: ['未分类', '饮品', '简餐', '商超', '果蔬'],
            activeEditDialog: false,
            editingShop: [],
            successControl: false,
            failedControl: false,
            shopOffDialog: false,
            handlingShopId:null
        }),
        computed: {
            ...mapGetters('validate', {
                shops: 'shops',
                userInfo: 'userInfo'
            })
        },
        methods: {
            ...mapMutations('validate', {
                setShopList: 'SET_SHOP_LIST'
            }),
            changeDialogStatus() {
                this.activeEditDialog = !this.activeEditDialog
            },
            intoEdit(item) {
                this.activeEditDialog = true
                this.editingShop = item
            },
            apiRequestUpdateStatus(shopId) {
                this.axios.get('/shopinfo/updatestatus/' + shopId)
                    .then(
                        res => {
                            if (res.data.code === 0) {
                                this.successControl = true
                                this.refreshShop()
                            }
                        }
                    )
                    .catch(
                        () => this.failedControl = true
                    )
            },
            offShopStatus(shopId) {
                this.handlingShopId=shopId
                this.shopOffDialog = true
            },
            commitOff() {
                this.apiRequestUpdateStatus(this.handlingShopId)
                this.shopOffDialog = false
            },
            apiGetShopList(shopownerid) {
                this.axios.get('/shopinfo/list/' + shopownerid)
                    .then(
                        res => {
                            let data = res.data
                            if (data.code !== 402 && data.code !== 403) {
                                this.setShopList(data.list)
                            }
                        }
                    ).catch(
                    () => {
                        this.failedControl = true
                    }
                )
            },
            refreshShop() {
                let refreshShop = this.apiGetShopList(this.userInfo.id)
                this.setShopList(refreshShop)
            }
        }
    }
</script>
