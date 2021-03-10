<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="180px">
    <el-form-item label="商店拥有者ID" prop="shopownerId">
      <el-input v-model="dataForm.shopownerId" placeholder="商店拥有者ID"></el-input>
    </el-form-item>
    <el-form-item label="商店名称" prop="shopname">
      <el-input v-model="dataForm.shopname" placeholder="商店名称"></el-input>
    </el-form-item>
    <el-form-item label="联系人" prop="contactMan">
      <el-input v-model="dataForm.contactMan" placeholder="联系人"></el-input>
    </el-form-item>
    <el-form-item label="联系电话" prop="contactMobile">
      <el-input v-model="dataForm.contactMobile" placeholder="联系电话"></el-input>
    </el-form-item>
    <el-form-item label="门店类型" prop="cateid">
      <el-input v-model="dataForm.cateid" placeholder="门店类型"></el-input>
    </el-form-item>
    <el-form-item label="营业开始时间" prop="beginTime">
      <el-input v-model="dataForm.beginTime" placeholder="营业开始时间"></el-input>
    </el-form-item>
    <el-form-item label="营业结束时间" prop="endTime">
      <el-input v-model="dataForm.endTime" placeholder="营业结束时间"></el-input>
    </el-form-item>
    <el-form-item label="logo图片" prop="logoImg">
      <el-input v-model="dataForm.logoImg" placeholder="logo图片"></el-input>
    </el-form-item>
    <el-form-item label="详细地址" prop="address">
      <el-input v-model="dataForm.address" placeholder="详细地址"></el-input>
    </el-form-item>
    <el-form-item label="外卖电话" prop="mobile">
      <el-input v-model="dataForm.mobile" placeholder="外卖电话"></el-input>
    </el-form-item>
    <el-form-item label="商家公告" prop="notice">
      <el-input v-model="dataForm.notice" placeholder="商家公告"></el-input>
    </el-form-item>
    <el-form-item label="平均评分" prop="score">
      <el-input v-model="dataForm.score" placeholder="平均评分"></el-input>
    </el-form-item>
    <el-form-item label="配送时间" prop="sendTime">
      <el-input v-model="dataForm.sendTime" placeholder="配送时间"></el-input>
    </el-form-item>
    <el-form-item label="餐盒费用" prop="boxCost">
      <el-input v-model="dataForm.boxCost" placeholder="餐盒费用"></el-input>
    </el-form-item>
    <el-form-item label="配送费用" prop="sendCost">
      <el-input v-model="dataForm.sendCost" placeholder="配送费用"></el-input>
    </el-form-item>
    <el-form-item label="起送消费" prop="floorSendCost">
      <el-input v-model="dataForm.floorSendCost" placeholder="起送消费"></el-input>
    </el-form-item>
    <el-form-item label="店铺状态" prop="showStatus">

        <el-switch
          v-model="dataForm.showStatus"
          active-color="#13ce66"
          inactive-color="#ff4949">
        </el-switch>

    </el-form-item>
    </el-form>
    <span slot="footer" class="dialog-footer">
      <el-button @click="visible = false">取消</el-button>
      <el-button type="primary" @click="dataFormSubmit()">确定</el-button>
    </span>
  </el-dialog>
</template>

<script>
  export default {
    data () {
      return {
        visible: false,
        dataForm: {
          id: 0,
          shopownerId: '',
          shopname: '',
          contactMan: '',
          contactMobile: '',
          cateid: '',
          beginTime: '',
          endTime: '',
          logoImg: '',
          address: '',
          mobile: '',
          notice: '',
          score: '',
          sendTime: '',
          boxCost: '',
          sendCost: '',
          floorSendCost: '',
          showStatus: ''
        },
        dataRule: {
          shopownerId: [
            { required: true, message: '商店拥有者ID不能为空', trigger: 'blur' }
          ],
          shopname: [
            { required: true, message: '商店名称不能为空', trigger: 'blur' }
          ],
          contactMan: [
            { required: true, message: '联系人不能为空', trigger: 'blur' }
          ],
          contactMobile: [
            { required: true, message: '联系电话不能为空', trigger: 'blur' }
          ],
          cateid: [
            { required: true, message: '门店类型不能为空', trigger: 'blur' }
          ],
          beginTime: [
            { required: true, message: '营业开始时间不能为空', trigger: 'blur' }
          ],
          endTime: [
            { required: true, message: '营业结束时间不能为空', trigger: 'blur' }
          ],
          logoImg: [
            { required: true, message: 'logo图片不能为空', trigger: 'blur' }
          ],
          address: [
            { required: true, message: '详细地址不能为空', trigger: 'blur' }
          ],
          mobile: [
            { required: true, message: '外卖电话不能为空', trigger: 'blur' }
          ],
          notice: [
            { required: true, message: '商家公告不能为空', trigger: 'blur' }
          ],
          score: [
            { required: true, message: '平均评分不能为空', trigger: 'blur' }
          ],
          sendTime: [
            { required: true, message: '配送时间不能为空', trigger: 'blur' }
          ],
          boxCost: [
            { required: true, message: '餐盒费用不能为空', trigger: 'blur' }
          ],
          sendCost: [
            { required: true, message: '配送费用不能为空', trigger: 'blur' }
          ],
          floorSendCost: [
            { required: true, message: '起送消费不能为空', trigger: 'blur' }
          ],
          showStatus: [
            { required: true, message: '店铺状态 ，0关门，1营业不能为空', trigger: 'blur' }
          ]
        }
      }
    },
    methods: {
      init (id) {
        this.dataForm.id = id || 0
        this.visible = true
        this.$nextTick(() => {
          this.$refs['dataForm'].resetFields()
          if (this.dataForm.id) {
            this.$http({
              url: this.$http.adornUrl(`/waimai/shopinfo/info/${this.dataForm.id}`),
              method: 'get',
              params: this.$http.adornParams()
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.dataForm.shopownerId = data.shopInfo.shopownerId
                this.dataForm.shopname = data.shopInfo.shopname
                this.dataForm.contactMan = data.shopInfo.contactMan
                this.dataForm.contactMobile = data.shopInfo.contactMobile
                this.dataForm.cateid = data.shopInfo.cateid
                this.dataForm.beginTime = data.shopInfo.beginTime
                this.dataForm.endTime = data.shopInfo.endTime
                this.dataForm.logoImg = data.shopInfo.logoImg
                this.dataForm.address = data.shopInfo.address
                this.dataForm.mobile = data.shopInfo.mobile
                this.dataForm.notice = data.shopInfo.notice
                this.dataForm.score = data.shopInfo.score
                this.dataForm.sendTime = data.shopInfo.sendTime
                this.dataForm.boxCost = data.shopInfo.boxCost
                this.dataForm.sendCost = data.shopInfo.sendCost
                this.dataForm.floorSendCost = data.shopInfo.floorSendCost
                this.dataForm.showStatus = data.shopInfo.showStatus
              }
            })
          }
        })
      },
      // 表单提交
      dataFormSubmit () {
        this.$refs['dataForm'].validate((valid) => {
          if (valid) {
            this.$http({
              url: this.$http.adornUrl(`/waimai/shopinfo/${!this.dataForm.id ? 'save' : 'update'}`),
              method: 'post',
              data: this.$http.adornData({
                'id': this.dataForm.id || undefined,
                'shopownerId': this.dataForm.shopownerId,
                'shopname': this.dataForm.shopname,
                'contactMan': this.dataForm.contactMan,
                'contactMobile': this.dataForm.contactMobile,
                'cateid': this.dataForm.cateid,
                'beginTime': this.dataForm.beginTime,
                'endTime': this.dataForm.endTime,
                'logoImg': this.dataForm.logoImg,
                'address': this.dataForm.address,
                'mobile': this.dataForm.mobile,
                'notice': this.dataForm.notice,
                'score': this.dataForm.score,
                'sendTime': this.dataForm.sendTime,
                'boxCost': this.dataForm.boxCost,
                'sendCost': this.dataForm.sendCost,
                'floorSendCost': this.dataForm.floorSendCost,
                'showStatus': this.dataForm.showStatus
              })
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.$message({
                  message: '操作成功',
                  type: 'success',
                  duration: 1500,
                  onClose: () => {
                    this.visible = false
                    this.$emit('refreshDataList')
                  }
                })
              } else {
                this.$message.error(data.msg)
              }
            })
          }
        })
      }
    }
  }
</script>
