<template>
    <div>
        <keep-alive>
            <router-view v-if="$route.meta.keepAlive"></router-view>
        </keep-alive>
        <router-view v-if="!$route.meta.keepAlive"></router-view>
        <van-tabbar v-model="active">
            <van-tabbar-item replace to="/" icon="home-o">主页</van-tabbar-item>
            <van-tabbar-item replace to="/order" icon="orders-o">订单</van-tabbar-item>
            <van-tabbar-item replace to="/mine" icon="user-o">我的</van-tabbar-item>
        </van-tabbar>
    </div>
</template>

<script>
    export default {
        name: "Main",
        data() {
            return {
                active: 0
            }
        },
        beforeRouteEnter(to, from, next) {
            console.log('beforeRouteUpdate')
            console.log('beforeRouteUpdate==>from===>' + from.fullPath)
            if (from.fullPath === '/login') {
                console.log('into beforeRouteUpdate')
                next(
                    vm => {
                        if (to.fullPath === '/mine') {
                            vm.active = 2
                        } else if (to.fullPath === '/order') {
                            vm.active = 1
                        } else {
                            vm.active = 0
                        }
                    }
                )
            }
            next()
        }
    }
</script>

<style scoped>

</style>