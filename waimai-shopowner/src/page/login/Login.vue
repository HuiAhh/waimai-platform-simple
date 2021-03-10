<template>
    <v-card>
        <v-card-title>商家登录</v-card-title>
        <v-card-text>
            <template>
                <v-form @submit="loginAndValidate" ref="form">
                    <v-container>
                        <v-row>
                            <v-col :offset-sm="3" :offset-md="3" :sm="6" :md="6">
                                <v-text-field
                                        v-model="username"
                                        :rules="notEmptyUserName"
                                        label="用户名"
                                        required
                                        clearable
                                ></v-text-field>
                            </v-col>
                        </v-row>
                        <v-row>
                            <v-col :offset-sm="3" :offset-md="3" :sm="6" :md="6">
                                <v-text-field
                                        v-model="password"
                                        :rules="notEmptyPassword"
                                        type="password"
                                        label="密码"
                                        required
                                        clearable
                                ></v-text-field>
                            </v-col>
                        </v-row>
                        <v-row>
                            <v-col :offset-sm="3" :offset-md="3" :sm="6" :md="6">
                                <v-checkbox v-model="rememberMe" label="自动登录"/>
                            </v-col>
                        </v-row>
                        <v-row>
                            <v-col :offset-sm="3" :offset-md="3" :sm="3" :md="3">
                                <v-btn color="success" type="submit">登录</v-btn>
                            </v-col>
                        </v-row>
                    </v-container>
                </v-form>
            </template>
        </v-card-text>
    </v-card>
</template>

<script>
    import {mapActions} from "vuex";

    export default {
        name: "Login",
        data: () => ({
            valid: false,
            username: '',
            password: '',
            rememberMe:true,
            notEmptyUserName: [
                v => !!v || '用户名不能为空'
            ],
            notEmptyPassword: [
                v => !!v || '密码不能为空'
            ]
        }),
        methods: {
            loginAndValidate() {
                if(this.$refs.form.validate()) {
                    this.userLogin(
                        {
                            username: this.username,
                            password: this.password,
                            'remember-me': this.rememberMe
                        }
                    )
                    this.$router.push('/home')
                    setTimeout(this.successAndReloadApp,2000)
                    // this.successAndReloadApp()
                }
            },
            successAndReloadApp(){
                location.reload()
            },
            ...mapActions('validate', {
                userLogin: 'userLogin'
            }),
        }
    }
</script>

<style scoped>

</style>