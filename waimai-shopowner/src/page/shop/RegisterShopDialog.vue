<template>
    <v-container>
        <v-dialog v-model="activeEditDialog" persistent max-width="800px">
            <v-form ref="submitForm">
                <v-card>
                    <v-app-bar>
                        <v-btn
                                icon
                                color="indigo"
                                @click="changeDialogStatus"
                        >
                            <v-icon>mdi-close</v-icon>
                        </v-btn>

                        <v-toolbar-title>开店申请</v-toolbar-title>
                        <v-spacer></v-spacer>
                        <v-btn
                                icon
                                color="indigo"
                                @click="commitRegister"
                        >
                            <v-icon>mdi-content-save</v-icon>
                        </v-btn>
                    </v-app-bar>
                    <v-list subheader>
                        <v-list-item>
                            <v-text-field
                                    label="店铺名"
                                    v-model="register.shopname"
                                    :counter="15"
                                    :rules="[v => !!v || '店铺名不能为空']"
                            >
                            </v-text-field>
                        </v-list-item>
                        <v-list-item>
                            <v-text-field
                                    label="地址"
                                    v-model="register.adress"
                                    :counter="25"
                                    :rules="[v => !!v || '地址不能为空']"
                            >
                            </v-text-field>
                        </v-list-item>
                        <v-list-item>
                            <v-radio-group row label="店铺品类" v-model="register.cateid">
                                <v-radio label="饮品" :value="1"></v-radio>
                                <v-radio label="简餐" :value="2"></v-radio>
                                <v-radio label="商超" :value="3"></v-radio>
                                <v-radio label="果蔬" :value="4"></v-radio>
                            </v-radio-group>
                        </v-list-item>
<!--                        <v-list-item>-->
<!--                            <v-text-field-->
<!--                                    label="商家logo图片URL"-->
<!--                                    v-model="register.images"-->
<!--                                    clearable-->
<!--                            >-->
<!--                            </v-text-field>-->
<!--                        </v-list-item>-->
                        <v-subheader>可选部分</v-subheader>
                        <v-list-item>
                            <v-text-field
                                    label="许可证URL"
                                    v-model="register.permitImg"
                            >
                            </v-text-field>
                        </v-list-item>
                    </v-list>
                </v-card>
            </v-form>
        </v-dialog>
        <v-snackbar top v-model="successSaved" color="success">
            <v-alert type="success">
                发起成功
            </v-alert>
        </v-snackbar>
        <v-snackbar top v-model="failedSaved" color="info">
            <v-alert type="info">
                发起申请失败，请检查网络
            </v-alert>
        </v-snackbar>
    </v-container>
</template>

<script>
    import {mapGetters, mapMutations} from "vuex";

    export default {
        name: "RegisterShopDialog",
        props: ['activeEditDialog', 'changeDialogStatus'],
        data() {
            return {
                register: {
                    "shopownerId": null,
                    "cateid": 2,
                    "shopname": "",
                    "adress": "",
                    "permitImg":null,
                    "images":null
                },
                activeEditDialogTest: true,
                timePickerStart: false,
                timePickerEnd: false,
                successSaved: false,
                failedSaved: false,
                "exampleShopregister": {
                    "shopownerId": 2,
                    "cateid": 1,
                    "shopname": "张记早点铺",
                    "adress": "天河区迎龙路225号",

                },
            }
        },
        methods: {
            commitRegister() {
                if(!this.$refs.submitForm.validate()){
                    return
                }
                this.register.shopownerId=this.userInfo.id
                if(this.register.images===""){
                    this.register.images=null
                }
                if(this.register.permitImg===""){
                    this.register.permitImg=null
                }
                console.log(this.register)
                this.axios({
                    method: 'post',
                    url: '/shopregister/save',
                    data: this.register,
                    headers: {'content-type': 'application/json'}
                }).then(
                    res => {
                        if (res.data.code === 0) {
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
            }),
        },
        computed: {
            ...mapGetters('validate', {
                userInfo: 'userInfo'
            })
        },
        watch: {},
        mounted() {
        }
    }
</script>

<style scoped>

</style>