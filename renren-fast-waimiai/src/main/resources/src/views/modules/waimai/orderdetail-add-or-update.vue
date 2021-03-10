<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
    <el-form-item label="订单ID" prop="orderId">
      <el-input v-model="dataForm.orderId" placeholder="订单ID"></el-input>
    </el-form-item>
    <el-form-item label="用户名" prop="userUsername">
      <el-input v-model="dataForm.userUsername" placeholder="用户名"></el-input>
    </el-form-item>
    <el-form-item label="用户联系电话" prop="userMobile">
      <el-input v-model="dataForm.userMobile" placeholder="用户联系电话"></el-input>
    </el-form-item>
    <el-form-item label="用户地址ID" prop="userAddressId">
      <el-input v-model="dataForm.userAddressId" placeholder="用户地址ID"></el-input>
    </el-form-item>
    <el-form-item label="用户详细地址" prop="userAddress">
      <el-input v-model="dataForm.userAddress" placeholder="用户详细地址"></el-input>
    </el-form-item>
    <el-form-item label="订单备注" prop="note">
      <el-input v-model="dataForm.note" placeholder="订单备注"></el-input>
    </el-form-item>
    <el-form-item label="商铺名字" prop="shopShopname">
      <el-input v-model="dataForm.shopShopname" placeholder="商铺名字"></el-input>
    </el-form-item>
    <el-form-item label="商铺联系电话" prop="shopMobile">
      <el-input v-model="dataForm.shopMobile" placeholder="商铺联系电话"></el-input>
    </el-form-item>
    <el-form-item label="商铺详细地址" prop="shopAddress">
      <el-input v-model="dataForm.shopAddress" placeholder="商铺详细地址"></el-input>
    </el-form-item>
    <el-form-item label="送餐员ID" prop="deliverId">
      <el-input v-model="dataForm.deliverId" placeholder="送餐员ID"></el-input>
    </el-form-item>
    <el-form-item label="送餐员姓名" prop="deliverName">
      <el-input v-model="dataForm.deliverName" placeholder="送餐员姓名"></el-input>
    </el-form-item>
    <el-form-item label="送餐员联系电话" prop="deliverMobile">
      <el-input v-model="dataForm.deliverMobile" placeholder="送餐员联系电话"></el-input>
    </el-form-item>
    <el-form-item label="" prop="gmtCreate">
      <el-input v-model="dataForm.gmtCreate" placeholder=""></el-input>
    </el-form-item>
    <el-form-item label="" prop="gmtModified">
      <el-input v-model="dataForm.gmtModified" placeholder=""></el-input>
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
          userUsername: '',
          userMobile: '',
          userAddressId: '',
          userAddress: '',
          note: '',
          shopShopname: '',
          shopMobile: '',
          shopAddress: '',
          deliverId: '',
          deliverName: '',
          deliverMobile: '',
          gmtCreate: '',
          gmtModified: ''
        },
        dataRule: {
          orderId: [
            { required: true, message: '订单ID不能为空', trigger: 'blur' }
          ],
          userUsername: [
            { required: true, message: '用户名不能为空', trigger: 'blur' }
          ],
          userMobile: [
            { required: true, message: '用户联系电话不能为空', trigger: 'blur' }
          ],
          userAddressId: [
            { required: true, message: '用户地址ID不能为空', trigger: 'blur' }
          ],
          userAddress: [
            { required: true, message: '用户详细地址不能为空', trigger: 'blur' }
          ],
          note: [
            { required: true, message: '订单备注不能为空', trigger: 'blur' }
          ],
          shopShopname: [
            { required: true, message: '商铺名字不能为空', trigger: 'blur' }
          ],
          shopMobile: [
            { required: true, message: '商铺联系电话不能为空', trigger: 'blur' }
          ],
          shopAddress: [
            { required: true, message: '商铺详细地址不能为空', trigger: 'blur' }
          ],
          deliverId: [
            { required: true, message: '送餐员ID不能为空', trigger: 'blur' }
          ],
          deliverName: [
            { required: true, message: '送餐员姓名不能为空', trigger: 'blur' }
          ],
          deliverMobile: [
            { required: true, message: '送餐员联系电话不能为空', trigger: 'blur' }
          ],
          gmtCreate: [
            { required: true, message: '不能为空', trigger: 'blur' }
          ],
          gmtModified: [
            { required: true, message: '不能为空', trigger: 'blur' }
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
              url: this.$http.adornUrl(`/waimai/orderdetail/info/${this.dataForm.id}`),
              method: 'get',
              params: this.$http.adornParams()
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.dataForm.orderId = data.orderDetail.orderId
                this.dataForm.userUsername = data.orderDetail.userUsername
                this.dataForm.userMobile = data.orderDetail.userMobile
                this.dataForm.userAddressId = data.orderDetail.userAddressId
                this.dataForm.userAddress = data.orderDetail.userAddress
                this.dataForm.note = data.orderDetail.note
                this.dataForm.shopShopname = data.orderDetail.shopShopname
                this.dataForm.shopMobile = data.orderDetail.shopMobile
                this.dataForm.shopAddress = data.orderDetail.shopAddress
                this.dataForm.deliverId = data.orderDetail.deliverId
                this.dataForm.deliverName = data.orderDetail.deliverName
                this.dataForm.deliverMobile = data.orderDetail.deliverMobile
                this.dataForm.gmtCreate = data.orderDetail.gmtCreate
                this.dataForm.gmtModified = data.orderDetail.gmtModified
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
              url: this.$http.adornUrl(`/waimai/orderdetail/${!this.dataForm.id ? 'save' : 'update'}`),
              method: 'post',
              data: this.$http.adornData({
                'id': this.dataForm.id || undefined,
                'orderId': this.dataForm.orderId,
                'userUsername': this.dataForm.userUsername,
                'userMobile': this.dataForm.userMobile,
                'userAddressId': this.dataForm.userAddressId,
                'userAddress': this.dataForm.userAddress,
                'note': this.dataForm.note,
                'shopShopname': this.dataForm.shopShopname,
                'shopMobile': this.dataForm.shopMobile,
                'shopAddress': this.dataForm.shopAddress,
                'deliverId': this.dataForm.deliverId,
                'deliverName': this.dataForm.deliverName,
                'deliverMobile': this.dataForm.deliverMobile,
                'gmtCreate': this.dataForm.gmtCreate,
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
