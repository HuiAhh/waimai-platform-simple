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
    <el-form-item label="商铺ID" prop="shopId">
      <el-input v-model="dataForm.shopId" placeholder="商铺ID"></el-input>
    </el-form-item>
    <el-form-item label="餐盒费" prop="boxCost">
      <el-input v-model="dataForm.boxCost" placeholder="餐盒费"></el-input>
    </el-form-item>
    <el-form-item label="配送费" prop="sendCost">
      <el-input v-model="dataForm.sendCost" placeholder="配送费"></el-input>
    </el-form-item>
    <el-form-item label="总价" prop="totalMoney">
      <el-input v-model="dataForm.totalMoney" placeholder="总价"></el-input>
    </el-form-item>
    <el-form-item label="订单创建时间" prop="gmtCreate">
      <el-input v-model="dataForm.gmtCreate" placeholder="订单创建时间"></el-input>
    </el-form-item>
    <el-form-item label="限定的时间" prop="demandTime">
      <el-input v-model="dataForm.demandTime" placeholder="限定的时间"></el-input>
    </el-form-item>
    <el-form-item label="状态" prop="status">
      <el-input v-model="dataForm.status" placeholder="状态"></el-input>
    </el-form-item>
    <el-form-item label="订单更新时间" prop="gmtModified">
      <el-input v-model="dataForm.gmtModified" placeholder="订单更新时间"></el-input>
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
          shopId: '',
          boxCost: '',
          sendCost: '',
          totalMoney: '',
          gmtCreate: '',
          demandTime: '',
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
          shopId: [
            { required: true, message: '商铺ID不能为空', trigger: 'blur' }
          ],
          boxCost: [
            { required: true, message: '餐盒费不能为空', trigger: 'blur' }
          ],
          sendCost: [
            { required: true, message: '配送费不能为空', trigger: 'blur' }
          ],
          totalMoney: [
            { required: true, message: '总价不能为空', trigger: 'blur' }
          ],
          gmtCreate: [
            { required: true, message: '订单创建时间不能为空', trigger: 'blur' }
          ],
          demandTime: [
            { required: true, message: '限定的时间不能为空', trigger: 'blur' }
          ],
          status: [
            { required: true, message: '状态不能为空', trigger: 'blur' }
          ],
          gmtModified: [
            { required: true, message: '订单更新时间不能为空', trigger: 'blur' }
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
              url: this.$http.adornUrl(`/waimai/order/info/${this.dataForm.id}`),
              method: 'get',
              params: this.$http.adornParams()
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.dataForm.orderId = data.order.orderId
                this.dataForm.userId = data.order.userId
                this.dataForm.shopId = data.order.shopId
                this.dataForm.boxCost = data.order.boxCost
                this.dataForm.sendCost = data.order.sendCost
                this.dataForm.totalMoney = data.order.totalMoney
                this.dataForm.gmtCreate = data.order.gmtCreate
                this.dataForm.demandTime = data.order.demandTime
                this.dataForm.status = data.order.status
                this.dataForm.gmtModified = data.order.gmtModified
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
              url: this.$http.adornUrl(`/waimai/order/${!this.dataForm.id ? 'save' : 'update'}`),
              method: 'post',
              data: this.$http.adornData({
                'id': this.dataForm.id || undefined,
                'orderId': this.dataForm.orderId,
                'userId': this.dataForm.userId,
                'shopId': this.dataForm.shopId,
                'boxCost': this.dataForm.boxCost,
                'sendCost': this.dataForm.sendCost,
                'totalMoney': this.dataForm.totalMoney,
                'gmtCreate': this.dataForm.gmtCreate,
                'demandTime': this.dataForm.demandTime,
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
