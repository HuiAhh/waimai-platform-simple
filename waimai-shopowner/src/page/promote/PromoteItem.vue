<template>
    <v-col :md="4">
        <v-card>
            <v-card-title>{{shopInfo.shopname}}</v-card-title>
            <v-card-text>推广时间：{{promote.applayTime}}天</v-card-text>
            <v-card-text>推广状态：{{promote.promoteStatus}}</v-card-text>
            <v-card-text>开始时间：{{getDate(new Date(promote.gmtCreate))}}</v-card-text>
        </v-card>
    </v-col>
</template>
<script>
    import {dateFormat} from "../../util";

    export default {
        name: 'PromoteItem',
        props: ['promote'],
        data() {
            return {
                shopInfo: {}
            }
        },
        created() {
            this.apiRequestShopId()
        },
        methods: {
            modifiedTime(date) {
                // date.setHours(date.getHours()+8)
                return dateFormat('HH:MM', date)
            },
            getDate(date) {
                // date.setHours(date.getHours()+8)
                return dateFormat('mm月dd日', date)
            },
            apiRequestShopId() {
                this.axios.get('/shopinfo/info/' + this.promote.shopId)
                    .then(
                        res => {
                            this.shopInfo =res.data.shopInfo
                        }
                    )
            }
        }
    }
</script>
