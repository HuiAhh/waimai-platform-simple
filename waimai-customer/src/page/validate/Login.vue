<template>
    <div>
        <van-nav-bar
                title="登录"
                @click-left="$router.push('/')"
                left-arrow style="overflow: auto;background: #fff6ef"
                right-text="注册"
                @click-right="$router.push('/register')"
        />
        <van-form @submit="loginAndBackToPrevPage">
            <van-field
                    v-model="username"
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
            <van-field name="checkbox" label="自动登录">
                <template #input>
                    <van-checkbox v-model="rememberMe" shape="square"/>
                </template>
            </van-field>
            <div style="margin: 16px;">
                <van-button round block type="info" native-type="submit">
                    登录
                </van-button>
            </div>
        </van-form>
    </div>
</template>

<script>
    import {mapActions} from "vuex";

    export default {
        name: "Login",
        data: () => ({
            username: '',
            password: '',
            rememberMe: true
        }),
        methods: {
            ...mapActions('validate', {
                userLogin: 'userLogin'
            }),
            loginAndBackToPrevPage() {
                this.userLogin(
                    {
                        username: this.username,
                        password: this.password,
                        'remember-me': this.rememberMe
                    }
                )
                this.$router.go(-1)
            }
        }
    }
</script>

<style scoped>

</style>