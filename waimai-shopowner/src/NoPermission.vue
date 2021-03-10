<template>
    <div>
    <van-nav-bar title="无权限访问"
                 @click-left="$router.go(-1)"
                 left-arrow
                 style="overflow: auto;background: #fff6ef">
    </van-nav-bar>
    <div>
        <p>无权访问，请回吧。</p>
    </div>
    </div>
</template>

<script>
    export default {
        name: "NoPermission"
    }
</script>

<style scoped>

</style>