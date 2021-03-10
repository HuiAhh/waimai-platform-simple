<template>
    <van-card>
        <template #title>
            <van-row gutter="20">
                <van-col>
                    <van-image
                            round cover
                            lazy-load :width="60" :height="60"
                            src="https://dss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3050508999,1465904396&fm=26&gp=0.jpg"
                    />
                </van-col>
                <van-col>
                    <van-row>
                        <span style="font-size: 20px;">{{userInfo.username}}</span>
                    </van-row>
                    <van-row>
                        <span style="color:grey">uid: {{userInfo.id}}</span>
                    </van-row>
                </van-col>
            </van-row>
        </template>
    </van-card>
</template>
<script>
    export default {
        name: 'UserInfoCard',
        props: {
            userInfo: {}
        }
    }
</script>
