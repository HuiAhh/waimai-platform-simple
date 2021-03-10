<template>
    <div id="app">
        <keep-alive>
            <router-view v-if="$route.meta.keepAlive"></router-view>
        </keep-alive>
        <router-view v-if="!$route.meta.keepAlive"></router-view>
    </div>
</template>

<style>
    #nprogress .bar {
        background: yellow !important;
    }

    #nprogress .peg {
        box-shadow: 0 0 10px yellow, 0 0 5px yellow !important;

    }

    #nprogress .spinner-icon {
        border-top-color: yellow !important;
        border-left-color: yellow !important;
    }
</style>

<script>
    import {mapGetters,mapActions} from "vuex";
    import {Toast} from "vant";

    export default {
        name:'App',
        created() {
            let userId = window.localStorage.getItem("uid")
            console.log('userId=====>value:'+userId+"   ==>type:  "+typeof userId)
            if (userId !== null &&
                (typeof userId === 'number' || typeof userId === 'string')
            ) {
                console.log('logging into action==>1')
                this.getUserInfo(userId)
            }else{
                Toast('未登录')
            }
        },
        methods: {
            ...mapActions('validate', {
                getUserInfo: 'getUserInfo'
            })
        },
        computed:{
            ...mapGetters('validate',{
                userInfo:'userInfo'
            })
        }
    }
</script>
