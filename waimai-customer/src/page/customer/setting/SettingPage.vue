<template>
    <div>
        <van-nav-bar title="账户设置" @click-left="$router.go(-1)" left-arrow style="overflow: auto;background: #fff6ef">
        </van-nav-bar>
        <van-cell-group title="基本信息">
            <van-cell title="手机号" :value="userInfo.mobile"></van-cell>
            <van-cell title="头像">
                <template #label>
                    <van-image
                            round cover
                            lazy-load  :width="60" :height="60"
                            src="https://dss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3050508999,1465904396&fm=26&gp=0.jpg"
                    />
                </template>
            </van-cell>
        </van-cell-group>
        <van-cell-group title="可修改部分">
            <van-cell title="昵称" :value="userInfo.username" is-link>
            </van-cell>
            <van-cell title="性别" :value="userInfo.gender" is-link>
            </van-cell>
            <van-cell title="密码" is-link>
            </van-cell>
        </van-cell-group>
    </div>
</template>

<script>
    import {mapGetters} from "vuex";

    export default {
        name: "SettingPage",
        computed:{
            ...mapGetters('validate',{
                userInfo:'userInfo'
            })
        }
    }
</script>

<style scoped>

</style>