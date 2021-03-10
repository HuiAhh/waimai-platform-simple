<template>
    <div>
        <van-nav-bar title="地址管理"
                     @click-left="$router.go(-1)"
                     left-arrow
                     style="overflow: auto;background: #fff6ef"

        >
            <template #right>
                <van-icon style="margin-left: 20px;" name="plus" size="18"
                          />
            </template>
        </van-nav-bar>
        <van-cell-group title="tips: 列表项可以左右滑动，向右滑动选地址，向左滑动删除/更新">
            <van-cell :title="item" v-for="item in [1,2,3]" :key="item">
                <template #extra>
            <van-swipe-cell>
                <template #left>
                    <van-button style="height:100%" square type="primary" text="选为主地址" />
                </template>
                <template #right>
                    <van-button style="height:100%" square type="danger" text="删除" />
                    <van-button style="height:100%" square type="warning" text="修改" />
                </template>
                <van-cell title="地址" value="广东金融学院北苑北教广场xxxxxxxxxxxxxxxxxxxxx">
                    <template #label>
                        <span>此地址已选用为主地址</span>
                    </template>
                </van-cell>
                <van-cell title="姓名" value="喳喳喳喳">
                </van-cell>
                <van-cell title="称谓">
                    <template #label>
                        <van-radio-group v-model="gender" direction="horizontal">
                            <van-radio name="先生">先生</van-radio>
                            <van-radio name="女士">女士</van-radio>
                        </van-radio-group>
                    </template>
                </van-cell>
                <van-cell title="电话" value="135xxxxxxxx">
                </van-cell>
            </van-swipe-cell>
                </template>
            </van-cell>
        </van-cell-group>
    </div>
</template>

<script>
    export default {
        name: "LocationPage",
        data(){
            return {
                gender:''
            }
        }
    }
</script>

<style scoped>

</style>