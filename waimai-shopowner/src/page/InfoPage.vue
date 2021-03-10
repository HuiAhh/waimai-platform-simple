<template>
    <v-card>
        <v-card-title>推广列表
            <v-btn
                    @click="apiRequestPromoteList"
                    icon
            >
                <v-icon>mdi-cached</v-icon>
            </v-btn>
            <v-btn icon @click="activeAddPromote=true" large>
                <v-icon>mdi-plus</v-icon>
            </v-btn>
        </v-card-title>
        <v-card-subtitle>目前平台所有推广</v-card-subtitle>
        <v-card-text>
            <v-row>
                <PromoteItem v-for="item in promoteList" :key="item.id" :promote="item"/>
            </v-row>
        </v-card-text>
        <v-snackbar v-model="errorBarDisplay" color="info">
            <span>获取推广状态失败</span>
        </v-snackbar>
        <v-snackbar top v-model="successApply" color="success">
            <v-alert type="success">
                申请发起成功
            </v-alert>
        </v-snackbar>
        <v-snackbar top v-model="failApply" color="info">
            <v-alert type="info">
                申请发起失败
            </v-alert>
        </v-snackbar>
        <v-dialog v-model="activeAddPromote" persistent max-width="800px">
            <v-form>
                <v-card>
                    <v-app-bar>
                        <v-btn
                                icon
                                color="indigo"
                                @click="activeAddPromote=false"
                        >
                            <v-icon>mdi-close</v-icon>
                        </v-btn>

                        <v-toolbar-title>申请推广</v-toolbar-title>
                        <v-spacer></v-spacer>
                        <v-btn
                                icon
                                color="indigo"
                                @click="apiRequestCreatePromote"
                        >
                            <v-icon>mdi-content-save</v-icon>
                        </v-btn>
                    </v-app-bar>
                    <v-list>
                        <v-list-item>
                            <v-radio-group row label="店铺品类" v-model="promoteCreateForm.shopId">
                                <v-radio v-for="item in shops" :label="item.shopname" :key="item.id"
                                         :value="item.id"></v-radio>
                            </v-radio-group>
                        </v-list-item>
                        <v-list-item>
                            <v-text-field label="申请时长" type="number" suffix="天"
                                          v-model="promoteCreateForm.applayTime"></v-text-field>
                        </v-list-item>
                        <v-list-item>
                            <v-text-field label="期望申请费用" type="number" prefix="￥"
                                          v-model="promoteCreateForm.willingpay"></v-text-field>
                        </v-list-item>
                    </v-list>
                </v-card>
            </v-form>
        </v-dialog>
    </v-card>
</template>

<script>
    import {mapGetters} from "vuex";
    import PromoteItem from "./promote/PromoteItem";

    export default {
        name: "InfoPage",
        components: {PromoteItem},
        methods: {
            apiRequestPromoteList() {
                this.axios.get('/promote/list')
                    .then(
                        res => {
                            this.promoteList = res.data.list
                        }
                    ).catch(
                    () => this.errorBarDisplay = false
                )
            },
            apiRequestCreatePromote() {
                this.axios({
                    method:'post',
                    url: '/promoteapplay/save',
                    data: this.promoteCreateForm,
                    headers: {'content-type': 'application/json'}
                })
                    .then(
                        res => {
                            if (res.data.code === 0) {
                                this.successApply = true
                                this.activeAddPromote = false
                            } else {
                                this.failApply = true
                                this.activeAddPromote = false
                            }
                        }
                    ).catch(
                    () => {
                        this.failApply = true
                        this.activeAddPromote = false
                    }
                )
            }
        },
        data() {
            return {
                promoteList: [],
                errorBarDisplay: false,
                activeAddPromote: false,
                successApply: false,
                failApply: false,
                example: {
                    "id": 14,
                    "shopId": 12,
                    "applayTime": 111,
                    "startPromote": "2020-11-13 00:00:00",
                    "promoteStatus": "推广中",
                    "gmtCreate": "2020-11-13 07:58:56",
                    "gmtModified": "2020-11-13 07:59:02"
                },
                exampleForm: {
                    "applayStatus": "string",
                    "applayTime": 0,
                    "shopId": 0,
                    "willingpay": 0
                },
                promoteCreateForm: {
                    "applayTime": 5,
                    "shopId": null,
                    "willingpay": 500
                },
            }
        },
        computed: {
            ...mapGetters('validate', {
                userInfo: 'userInfo',
                shops: 'shops'
            }),
        },
        mounted() {
            this.apiRequestPromoteList()
        }
    }
</script>

