<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
    <el-form-item label="订单ID" prop="orderId">
      <el-input v-model="dataForm.orderId" placeholder="订单ID"></el-input>
    </el-form-item>
    <el-form-item label="商铺ID" prop="shopId">
      <el-input v-model="dataForm.shopId" placeholder="商铺ID"></el-input>
    </el-form-item>
    <el-form-item label="商铺名称" prop="shopname">
      <el-input v-model="dataForm.shopname" placeholder="商铺名称"></el-input>
    </el-form-item>
    <el-form-item label="商品ID" prop="foodId">
      <el-input v-model="dataForm.foodId" placeholder="商品ID"></el-input>
    </el-form-item>
    <el-form-item label="商品标题" prop="title">
      <el-input v-model="dataForm.title" placeholder="商品标题"></el-input>
    </el-form-item>
    <el-form-item label="商品封面" prop="cover">
      <el-input v-model="dataForm.cover" placeholder="商品封面"></el-input>
    </el-form-item>
    <el-form-item label="原价" prop="originPrice">
      <el-input v-model="dataForm.originPrice" placeholder="原价"></el-input>
    </el-form-item>
    <el-form-item label="售价" prop="sellPrice">
      <el-input v-model="dataForm.sellPrice" placeholder="售价"></el-input>
    </el-form-item>
    <el-form-item label="下单数量" prop="number">
      <el-input v-model="dataForm.number" placeholder="下单数量"></el-input>
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
          shopId: '',
          shopname: '',
          foodId: '',
          title: '',
          cover: '',
          originPrice: '',
          sellPrice: '',
          number: '',
          gmtCreate: '',
          gmtModified: ''
        },
        dataRule: {
          orderId: [
            { required: true, message: '订单ID不能为空', trigger: 'blur' }
          ],
          shopId: [
            { required: true, message: '商铺ID不能为空', trigger: 'blur' }
          ],
          shopname: [
            { required: true, message: '商铺名称不能为空', trigger: 'blur' }
          ],
          foodId: [
            { required: true, message: '商品ID不能为空', trigger: 'blur' }
          ],
          title: [
            { required: true, message: '商品标题不能为空', trigger: 'blur' }
          ],
          cover: [
            { required: true, message: '商品封面不能为空', trigger: 'blur' }
          ],
          originPrice: [
            { required: true, message: '原价不能为空', trigger: 'blur' }
          ],
          sellPrice: [
            { required: true, message: '售价不能为空', trigger: 'blur' }
          ],
          number: [
            { required: true, message: '下单数量不能为空', trigger: 'blur' }
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
              url: this.$http.adornUrl(`/waimai/orderfood/info/${this.dataForm.id}`),
              method: 'get',
              params: this.$http.adornParams()
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.dataForm.orderId = data.orderFood.orderId
                this.dataForm.shopId = data.orderFood.shopId
                this.dataForm.shopname = data.orderFood.shopname
                this.dataForm.foodId = data.orderFood.foodId
                this.dataForm.title = data.orderFood.title
                this.dataForm.cover = data.orderFood.cover
                this.dataForm.originPrice = data.orderFood.originPrice
                this.dataForm.sellPrice = data.orderFood.sellPrice
                this.dataForm.number = data.orderFood.number
                this.dataForm.gmtCreate = data.orderFood.gmtCreate
                this.dataForm.gmtModified = data.orderFood.gmtModified
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
              url: this.$http.adornUrl(`/waimai/orderfood/${!this.dataForm.id ? 'save' : 'update'}`),
              method: 'post',
              data: this.$http.adornData({
                'id': this.dataForm.id || undefined,
                'orderId': this.dataForm.orderId,
                'shopId': this.dataForm.shopId,
                'shopname': this.dataForm.shopname,
                'foodId': this.dataForm.foodId,
                'title': this.dataForm.title,
                'cover': this.dataForm.cover,
                'originPrice': this.dataForm.originPrice,
                'sellPrice': this.dataForm.sellPrice,
                'number': this.dataForm.number,
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
