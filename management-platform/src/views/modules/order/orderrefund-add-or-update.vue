<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
    <el-form-item label="订单ID" prop="orderId">
      <el-input v-model="dataForm.orderId" placeholder="订单ID"></el-input>
    </el-form-item>
    <el-form-item label="用户ID" prop="userId">
      <el-input v-model="dataForm.userId" placeholder="用户ID"></el-input>
    </el-form-item>
    <el-form-item label="用户姓名" prop="username">
      <el-input v-model="dataForm.username" placeholder="用户姓名"></el-input>
    </el-form-item>
    <el-form-item label="需要退回的款项" prop="payMoney">
      <el-input v-model="dataForm.payMoney" placeholder="需要退回的款项"></el-input>
    </el-form-item>
    <el-form-item label="退款原因" prop="refundReason">
      <el-input v-model="dataForm.refundReason" placeholder="退款原因"></el-input>
    </el-form-item>
    <el-form-item label="协商的需要扣除的手续费" prop="serviceCost">
      <el-input v-model="dataForm.serviceCost" placeholder="协商的需要扣除的手续费"></el-input>
    </el-form-item>
    <el-form-item label="" prop="gmtCreate">
      <el-input v-model="dataForm.gmtCreate" placeholder=""></el-input>
    </el-form-item>
    <el-form-item label="状态，0：等待处理 1：商家已退款 2：商家不同意退款" prop="status">
      <el-input v-model="dataForm.status" placeholder="状态，0：等待处理 1：商家已退款 2：商家不同意退款"></el-input>
    </el-form-item>
    <el-form-item label="卖家处理时间" prop="gmtModified">
      <el-input v-model="dataForm.gmtModified" placeholder="卖家处理时间"></el-input>
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
          orderId: '',
          userId: '',
          username: '',
          payMoney: '',
          refundReason: '',
          serviceCost: '',
          gmtCreate: '',
          status: '',
          gmtModified: ''
        },
        dataRule: {
          orderId: [
            { required: true, message: '订单ID不能为空', trigger: 'blur' }
          ],
          userId: [
            { required: true, message: '用户ID不能为空', trigger: 'blur' }
          ],
          username: [
            { required: true, message: '用户姓名不能为空', trigger: 'blur' }
          ],
          payMoney: [
            { required: true, message: '需要退回的款项不能为空', trigger: 'blur' }
          ],
          refundReason: [
            { required: true, message: '退款原因不能为空', trigger: 'blur' }
          ],
          serviceCost: [
            { required: true, message: '协商的需要扣除的手续费不能为空', trigger: 'blur' }
          ],
          gmtCreate: [
            { required: true, message: '不能为空', trigger: 'blur' }
          ],
          status: [
            { required: true, message: '状态，0：等待处理 1：商家已退款 2：商家不同意退款不能为空', trigger: 'blur' }
          ],
          gmtModified: [
            { required: true, message: '卖家处理时间不能为空', trigger: 'blur' }
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
              url: this.$http.adornUrl(`/waimai/orderrefund/info/${this.dataForm.id}`),
              method: 'get',
              params: this.$http.adornParams()
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.dataForm.orderId = data.orderRefund.orderId
                this.dataForm.userId = data.orderRefund.userId
                this.dataForm.username = data.orderRefund.username
                this.dataForm.payMoney = data.orderRefund.payMoney
                this.dataForm.refundReason = data.orderRefund.refundReason
                this.dataForm.serviceCost = data.orderRefund.serviceCost
                this.dataForm.gmtCreate = data.orderRefund.gmtCreate
                this.dataForm.status = data.orderRefund.status
                this.dataForm.gmtModified = data.orderRefund.gmtModified
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
              url: this.$http.adornUrl(`/waimai/orderrefund/${!this.dataForm.id ? 'save' : 'update'}`),
              method: 'post',
              data: this.$http.adornData({
                'id': this.dataForm.id || undefined,
                'orderId': this.dataForm.orderId,
                'userId': this.dataForm.userId,
                'username': this.dataForm.username,
                'payMoney': this.dataForm.payMoney,
                'refundReason': this.dataForm.refundReason,
                'serviceCost': this.dataForm.serviceCost,
                'gmtCreate': this.dataForm.gmtCreate,
                'status': this.dataForm.status,
                'gmtModified': this.dataForm.gmtModified
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
