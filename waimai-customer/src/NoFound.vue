<template>
    <div>
    <van-nav-bar title="看，外星人"
                 @click-left="$router.go(-1)"
                 left-arrow
                 style="overflow: auto;background: #fff6ef">
    </van-nav-bar>
    <div>
        <p>404了。世界和平，没有所谓的UFO，请回吧。</p>
    </div>
    </div>
</template>

<script>
    export default {
        name: "NoFound"
    }
</script>

<style scoped>

</style>