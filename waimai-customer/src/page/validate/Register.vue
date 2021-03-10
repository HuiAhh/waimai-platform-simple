<template>
    <div>
        <van-nav-bar
                title="注册"
                @click-left="$router.go(-1)"
                left-arrow style="overflow: auto;background: #fff6ef"
        />
        <van-form @submit="registerUser">
            <van-field
                    v-model="mobile"
                    name="手机号"
                    label="手机号"
                    placeholder="手机号"
                    :rules="[{ required: true, message: '请填写手机号' }]"
            />
            <van-field
                    v-model="password"
                    type="password"
                    name="密码"
                    label="密码"
                    placeholder="密码"
                    :rules="[{ required: true, message: '请填写密码' }]"
            />
            <van-field
                    v-model="rePassword"
                    type="password"
                    name="确认密码"
                    label="确认密码"
                    placeholder="确认密码"
                    :rules="[{ required: true, message: '请确认密码' },
                        { validator:rePasswordValidate, message: '两次输入密码不一致' }
                    ]"
            />
            <van-collapse v-model="enhance">
                <van-collapse-item title="高级选项/骑手/商家注册" name="enhanceActive">
                    <van-tabs v-model="identity" color="#ff8000">
                        <van-tab :name="0" title="顾客">
                            <van-field
                                    v-model="username"
                                    name="昵称"
                                    label="昵称"
                                    placeholder="昵称"
                            />
                            <van-field
                                    name="性别"
                                    label="性别"
                            >
                                <template #input>
                                    <van-radio-group v-model="gender" direction="horizontal">
                                        <van-radio checked-color="#ff9933" name="男">男</van-radio>
                                        <van-radio checked-color="#ff9933" name="女">女</van-radio>
                                    </van-radio-group>
                                </template>
                            </van-field>
                            <van-field
                                    v-model="truename"
                                    name="真实姓名"
                                    label="真实姓名"
                                    placeholder="真实姓名"
                            />
                        </van-tab>
                        <van-tab :name="1" title="骑手">
                            <van-field
                                    v-model="username"
                                    name="昵称"
                                    label="昵称"
                                    placeholder="昵称"
                                    :rules="[{ validator:userNameValidate, message: '请填写昵称' }]"
                            />
                            <van-field
                                    name="性别"
                                    label="性别"
                                    :rules="[{ validator:genderValidate, message: '请选择性别' }]"

                            >
                                <template #input>
                                    <van-radio-group v-model="gender" direction="horizontal">
                                        <van-radio checked-color="#ff9933" name="男">男</van-radio>
                                        <van-radio checked-color="#ff9933" name="女">女</van-radio>
                                    </van-radio-group>
                                </template>
                            </van-field>
                            <van-field
                                    v-model="truename"
                                    name="真实姓名"
                                    label="真实姓名"
                                    placeholder="真实姓名"
                                    :rules="[{ validator:trueNameValidate, message: '请填写真实姓名' }]"

                            />
                        </van-tab>
                        <van-tab :name="2" title="商家">
                            <van-field
                                    v-model="username"
                                    name="昵称"
                                    label="昵称"
                                    placeholder="昵称"
                                    :rules="[{ validator:userNameValidate, message: '请填写昵称' }]"
                            />
                            <van-field
                                    name="性别"
                                    label="性别"
                                    :rules="[{ validator:genderValidate, message: '请选择性别' }]"

                            >
                                <template #input>
                                    <van-radio-group v-model="gender" direction="horizontal">
                                        <van-radio checked-color="#ff9933" name="男">男</van-radio>
                                        <van-radio checked-color="#ff9933" name="女">女</van-radio>
                                    </van-radio-group>
                                </template>
                            </van-field>
                            <van-field
                                    v-model="truename"
                                    name="真实姓名"
                                    label="真实姓名"
                                    placeholder="真实姓名"
                                    :rules="[{ validator:trueNameValidate, message: '请填写真实姓名' }]"

                            />
                        </van-tab>
                    </van-tabs>
                </van-collapse-item>
            </van-collapse>
            <div style="margin: 16px;">
                <van-button
                        round
                        block
                        native-type="submit"
                        color="#ff9933"
                >
                    注册
                </van-button>
            </div>
        </van-form>
    </div>
</template>

<script>
    import {Toast} from "vant";

    export default {
        name: "Register",
        data: () => ({
            mobile: '',
            password: '',
            rePassword: '',
            rememberMe: true,
            identity: 0,
            enhance: [],
            username: '',
            truename: '',
            gender: null
        }),
        methods: {
            rePasswordValidate() {
                return this.rePassword === this.password
            },
            userNameValidate() {
                if (this.identity === 0) {
                    return true
                }
                return this.username !== ''
            },
            genderValidate() {
                if (this.identity === 0) {
                    return true
                }
                return this.gender !== null
            },
            trueNameValidate() {
                if (this.identity === 0) {
                    return true
                }
                return this.truename !== ''
            },
            registerUser() {
                let upload = {
                    username: this.username,
                    mobile: this.mobile,
                    password: this.password,
                    truename: this.truename,
                    gender: this.gender,
                    identity: this.identity
                }
                this.axios({
                    method: 'post',
                    url: '/user/register',
                    data: upload,
                    headers: {'content-type': 'application/json'}
                })
                    .then(
                        res => {
                            if (res.data.code === 0) {
                                Toast({message: '注册成功', type: 'success'})
                                if(upload.identity===1||upload.identity===2){
                                    setTimeout(
                                        ()=>this.toastPreRegister(),
                                        1000
                                    )
                                }
                            } else {
                                Toast({message: '注册失败', type: 'fail'})
                            }
                        }
                    ).catch(
                    () => Toast({message: '注册失败', type: 'fail'})
                )
            },
            toastPreRegister(){
                Toast({message: '当前申请用户角色待审核', type: 'success'})
            }

        }
    }
</script>

<style>

</style>
