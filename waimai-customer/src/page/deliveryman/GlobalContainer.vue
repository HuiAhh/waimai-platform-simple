<template>
    <div>
        <keep-alive>
            <router-view v-if="$route.meta.keepAlive"></router-view>
        </keep-alive>
        <router-view v-if="!$route.meta.keepAlive"></router-view>
        <van-tabbar v-model="active">
            <van-tabbar-item replace to="/deliveryman" icon="home-o">主页</van-tabbar-item>
            <van-tabbar-item replace to="/deliveryman/queue" icon="todo-list-o">送单队列</van-tabbar-item>
            <van-tabbar-item replace to="/deliveryman/mine" icon="user-o">我的</van-tabbar-item>
        </van-tabbar>
    </div>
</template>

<script>
    export default {
        name: "GlobalContainer",
        data(){
            return {
                active:0
            }
        }
    }
</script>

<style scoped>

</style>