<template>
    <van-cell-group title="地址选择 tips:<----向左滑列表项可进行删改操作">
        <van-cell is-link @click="openAddDialog">
            <template #title>
                <van-row :gutter="20">
                    <van-col>
                        <span style="font-size: 36px;color: #c2a078">+</span>
                    </van-col>
                    <van-col>
                        <span style="font-size: 18px;color: #cac4c4">添加地址</span>
                    </van-col>
                </van-row>
            </template>
        </van-cell>
        <van-dialog
                @confirm="handleCommit"
                v-model="addAddressDialog" title="增改地址" show-cancel-button>
            <van-form>
                <van-field
                        placeholder="姓名往这填"
                        autofocus label="姓名"
                        :rules="[{ required: true, message: '请填写姓名' }]"
                        v-model="newAddress.username"
                        clearable
                ></van-field>
                <van-field
                        name="称谓"
                        label="称谓"
                >
                    <template #input>
                        <van-radio-group v-model="newAddress.gender" direction="horizontal">
                            <van-radio name="先生">先生</van-radio>
                            <van-radio name="女士">女士</van-radio>
                        </van-radio-group>
                    </template>
                </van-field>
                <van-field
                        placeholder="电话往这填"
                        autofocus label="电话"
                        v-model="newAddress.mobile"
                        :rules="[{ required: true, message: '请填写电话' }]"
                        clearable
                ></van-field>
                <van-field
                        placeholder="地址往这填"
                        autofocus label="地址"
                        :rules="[{ required: true, message: '请填写地址' }]"
                        v-model="newAddress.adress"
                        maxlength="25"
                        show-word-limit
                        clearable
                ></van-field>
            </van-form>
        </van-dialog>
        <van-swipe-cell v-for="(item,index) in userAddressList" :key="item.id">
            <template #right>
                <van-button @click="removeAddress(item.id)" style="height:100%" square type="danger" text="删除"/>
                <van-button @click="alterAddress(item)" style="height:100%" square type="warning" text="修改"/>
            </template>
            <van-cell>
                <template #title>
                    <van-row :gutter="20">
                        <van-col>
                            <van-radio-group v-model="selectAddress">
                                <van-radio :name="index"></van-radio>
                            </van-radio-group>
                        </van-col>
                        <van-col :span="20">
                            <van-row>
                                <span style="font-size: 16px;">{{item.adress}}</span>
                            </van-row>
                            <van-row :gutter="5">
                                <van-col :offset="2">
                                    <span style="font-size: 20px;">{{item.username}}</span>
                                </van-col>
                                <van-col>
                                    <span style="font-size:10px;color:#696969">{{item.gender}}</span>
                                </van-col>
                                <van-col>
                                    <span>{{item.mobile}}</span>
                                </van-col>
                            </van-row>
                        </van-col>
                    </van-row>
                </template>
            </van-cell>
        </van-swipe-cell>
    </van-cell-group>
</template>

<script>
    import {mapActions, mapGetters} from "vuex";
    import {Toast} from "vant";

    export default {
        name: "ChooseAddress",
        computed: {
            ...mapGetters('customer', {
                userAddressList: 'userAddressList'
            }),
            ...mapGetters('validate', {
                userInfo: 'userInfo'
            })
        },
        data: () => ({
            selectAddress: null,
            addAddressDialog: false,
            newAddress: {
                "userId": null,
                "username": "",
                "gender": "先生",
                "mobile": "",
                "adress": ""
            },
            dialogType: 'add'
        }),
        methods: {
            ...mapActions('customer', {
                requestUserAddressList: 'requestUserAddressList',
            }),
            apiRequestAddAddress() {
                let address = this.newAddress
                address.userId = this.userInfo.id
                console.log(address)
                this.axios({
                    url: '/useraddress/save',
                    method: 'post',
                    data: address,
                    headers: {'content-type': 'application/json'}
                })
                    .then(
                        res => {
                            if (res.data.code === 0) {
                                Toast('已添加')
                                this.requestUserAddressList(this.userInfo.id)
                            } else {
                                Toast({message: '添加失败', type: 'fail'})
                            }
                        }
                    ).catch(
                    ()=>{
                        Toast({message: '添加异常', type: 'fail'})

                    }
                )
            },
            removeAddress(addressId) {
                this.axios.delete('/useraddress/' + addressId)
                    .then(
                        res => {
                            if (res.data.code === 0) {
                                this.requestUserAddressList(this.userInfo.id)
                            }
                        }
                    )
                    .catch(
                        () => Toast('删除失败')
                    )
            },
            alterAddress(address) {
                this.dialogType = 'update'
                this.newAddress = {...address}
                this.addAddressDialog = true
            },
            openAddDialog() {
                this.dialogType = 'add'
                this.addAddressDialog = true
            },
            handleCommit() {
                if (this.dialogType === 'add') {
                    this.apiRequestAddAddress()
                } else if (this.dialogType === 'update') {
                    this.apiRequestUpdateAddress()
                }
            },
            apiRequestUpdateAddress() {
                let address = this.newAddress
                address.userId = this.userInfo.id
                this.axios({
                    method:'put',
                    url:'/useraddress/update',
                    data:address,
                    headers: {'content-type': 'application/json'}
                }).then(
                    res => {
                        if (res.data.code === 0) {
                            Toast('修改成功')
                            this.requestUserAddressList(this.userInfo.id)
                        } else {
                            Toast({message: '修改失败', type: 'fail'})
                        }
                    }
                ).catch(
                    ()=>{
                        Toast({message: '修改异常', type: 'fail'})
                    }
                )
            }
        },
    }
</script>

<style scoped>

</style>