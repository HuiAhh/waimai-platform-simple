<template>
    <v-container>
        <v-dialog v-model="activeEditDialog" persistent max-width="800px">
            <v-form>
                <v-card>
                    <v-app-bar>
                        <v-btn
                                icon
                                color="indigo"
                                @click="changeDialogStatus()"
                        >
                            <v-icon>mdi-close</v-icon>
                        </v-btn>

                        <v-toolbar-title>{{shop.shopname}}</v-toolbar-title>
                        <v-spacer></v-spacer>
                        <v-btn
                                icon
                                color="indigo"
                                @click="commitUpdate"
                        >
                            <v-icon>mdi-content-save</v-icon>
                        </v-btn>
                    </v-app-bar>
                    <v-list
                            subheader
                    >
                        <v-subheader>可直接修改部分</v-subheader>
                        <v-list-item>
                            <v-text-field
                                    label="公告"
                                    v-model="cachedShop.notice"
                                    prepend-inner-icon="mdi-clipboard-outline"
                                    :counter="50"
                            ></v-text-field>
                        </v-list-item>
                        <v-list-item>
                            <v-text-field
                                    label="商家电话号码"
                                    v-model="cachedShop.mobile"
                                    prepend-inner-icon="mdi-cellphone-basic"
                                    :counter="11"
                            ></v-text-field>
                        </v-list-item>
                        <v-list-item>
                            <v-menu
                                    ref="startTimeMenu"
                                    v-model="timePickerStart"
                                    :close-on-content-click="false"
                                    :nudge-right="40"
                                    :return-value.sync="cachedShop.beginTime"
                                    transition="scale-transition"
                                    offset-y
                                    max-width="290px"
                                    min-width="290px"
                            >
                                <template v-slot:activator="{ on, attrs }">
                                    <v-text-field
                                            v-model="cachedShop.beginTime"
                                            label="开店时间"
                                            prepend-inner-icon="mdi-clock-time-four-outline"
                                            readonly
                                            v-bind="attrs"
                                            v-on="on"
                                    ></v-text-field>
                                </template>
                                <v-time-picker
                                        v-if="timePickerStart"
                                        v-model="cachedShop.beginTime"
                                        full-width
                                        format="24hr"
                                        ampm-in-title
                                        use-seconds
                                >
                                    <v-btn text color="blue" @click="$refs.startTimeMenu.save(cachedShop.beginTime)">确定
                                    </v-btn>
                                    <v-btn text color="grey" @click="timePickerEnd=false">取消</v-btn>
                                </v-time-picker>
                            </v-menu>
                        </v-list-item>
                        <v-list-item>
                            <v-menu
                                    ref="endTimeMenu"
                                    v-model="timePickerEnd"
                                    :close-on-content-click="false"
                                    :nudge-right="40"
                                    :return-value.sync="cachedShop.endTime"
                                    transition="scale-transition"
                                    offset-y
                                    max-width="290px"
                                    min-width="290px"
                            >
                                <template v-slot:activator="{ on, attrs }">
                                    <v-text-field
                                            v-model="cachedShop.endTime"
                                            label="关店时间"
                                            prepend-inner-icon="mdi-clock-time-four-outline"
                                            readonly
                                            v-bind="attrs"
                                            v-on="on"
                                    ></v-text-field>
                                </template>
                                <v-time-picker
                                        v-if="timePickerEnd"
                                        v-model="cachedShop.endTime"
                                        full-width
                                        format="24hr"
                                        ampm-in-title
                                        use-seconds
                                >
                                    <v-btn text color="blue" @click="$refs.endTimeMenu.save(cachedShop.endTime)">确定
                                    </v-btn>
                                    <v-btn text color="grey" @click="timePickerEnd=false">取消</v-btn>
                                </v-time-picker>
                            </v-menu>
                        </v-list-item>

                        <v-list-item>
                            <v-text-field
                                    v-model="cachedShop.sendTime"
                                    label="运送时长"
                                    prepend-inner-icon="mdi-av-timer"
                                    :counter="2"
                                    suffix="分钟"
                            ></v-text-field>
                        </v-list-item>
                        <v-list-item>
                            <v-text-field
                                    v-model="cachedShop.floorSendCost"
                                    label="起送价"
                                    prepend-inner-icon="mdi-source-commit-start"
                                    prefix="￥"
                            ></v-text-field>
                        </v-list-item>
                        <v-list-item>
                            <v-text-field
                                    v-model="cachedShop.boxCost"
                                    label="包装费"
                                    prepend-inner-icon="mdi-package-variant"
                                    prefix="￥"
                            ></v-text-field>
                        </v-list-item>

                        <v-subheader>需审核部分</v-subheader>

                        <v-list-item>
                            <v-text-field
                                    v-model="cachedShop.shopname"
                                    label="店铺名"
                                    prepend-inner-icon="mdi-store"
                                    :counter="15"
                            ></v-text-field>
                        </v-list-item>
                        <v-list-item>
                            <v-text-field
                                    v-model="cachedShop.address"
                                    label="地址"
                                    prepend-inner-icon="mdi-office-building-marker-outline"
                                    :counter="30"
                            ></v-text-field>
                        </v-list-item>
                        <v-list-item>
                            <v-text-field
                                    label="商家logo图片URL"
                                    :rules="[v=>!!v||'需要输入url']"
                                    v-model="cachedShop.logoImg"
                                    clearable
                            >
                            </v-text-field>
                        </v-list-item>
                        <v-subheader>不可修改部分</v-subheader>
                        <v-list three-line>
                            <v-list-item>
                                <v-list-item-content>
                                    <v-list-item-title>联系人</v-list-item-title>
                                    <v-list-item-subtitle>{{shop.contactMan}}</v-list-item-subtitle>
                                </v-list-item-content>
                            </v-list-item>
                            <v-list-item>
                                <v-list-item-content>
                                    <v-list-item-title>联系电话</v-list-item-title>
                                    <v-list-item-subtitle>{{shop.contactMobile}}</v-list-item-subtitle>
                                </v-list-item-content>
                            </v-list-item>
                            <v-list-item>
                                <v-list-item-content>

                                    <v-list-item-title>营业执照</v-list-item-title>
                                    <v-list-item-subtitle>
                                        <v-img :src="shop.permitImg"/>
                                    </v-list-item-subtitle>
                                </v-list-item-content>
                            </v-list-item>
                        </v-list>
                    </v-list>
                </v-card>
            </v-form>
        </v-dialog>
        <v-snackbar top v-model="successSaved" color="success">
            <v-alert type="success">
                保存成功
            </v-alert>
        </v-snackbar>
        <v-snackbar top v-model="failedSaved" color="info">
            <v-alert type="info">
                保存失败，请检查网络
            </v-alert>
        </v-snackbar>
    </v-container>
</template>

<script>
    import {mapMutations} from "vuex";

    export default {
        name: "EditShopDialog",
        props: ['activeEditDialog', 'changeDialogStatus', 'shop'],
        data() {
            return {
                cachedShop: {},
                activeEditDialogTest: true,
                timePickerStart: false,
                timePickerEnd: false,
                successSaved: false,
                failedSaved: false
            }
        },
        methods: {
            commitUpdate() {
                this.axios({
                    method: 'post',
                    url: '/shopinfo/update',
                    data: this.cachedShop,
                    headers: {'content-type': 'application/json'}
                }).then(
                    res => {
                        if (res.data.code === 0) {
                            this.setShopByShopId({
                                shop: this.cachedShop,
                                id: this.shop.id
                            })
                            this.successSaved = true
                            this.changeDialogStatus()
                        }
                    }
                ).catch(
                    () => {
                        this.failedSaved = true
                    }
                )
            },
            ...mapMutations('validate', {
                setShopByShopId: 'SET_SHOP_BY_SHOP_ID'
            })
        },
        watch: {
            activeEditDialog(to) {
                if (!to) {
                    // console.log('change the item to default')
                    this.cachedShop = {...this.shop}
                }
            },
            shop() {
                // console.log('changed item')
                this.cachedShop = {...this.shop}
            }
        },
        mounted() {
        }
    }
</script>

<style scoped>

</style>