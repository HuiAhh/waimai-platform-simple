<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
    <el-form-item label="商家id" prop="shopownerId">
      <el-input v-model="dataForm.shopownerId" placeholder="商家id"></el-input>
    </el-form-item>
    <el-form-item label="商店类型" prop="cateid">
      <el-input v-model="dataForm.cateid" placeholder="商店类型"></el-input>
    </el-form-item>
    <el-form-item label="店铺名称" prop="shopname">
      <el-input v-model="dataForm.shopname" placeholder="店铺名称"></el-input>
    </el-form-item>
    <el-form-item label="店铺地址" prop="adress">
      <el-input v-model="dataForm.adress" placeholder="店铺地址"></el-input>
    </el-form-item>
    <el-form-item label="申请状态 0表示未处理，1表示审核通过，-1表示审核不通过" prop="registerstatus">
      <el-input v-model="dataForm.registerstatus" placeholder="申请状态 0表示未处理，1表示审核通过，-1表示审核不通过"></el-input>
    </el-form-item>
    <el-form-item label="" prop="gmtCreate">
      <el-input v-model="dataForm.gmtCreate" placeholder=""></el-input>
    </el-form-item>
    <el-form-item label="" prop="gmtModified">
      <el-input v-model="dataForm.gmtModified" placeholder=""></el-input>
    </el-form-item>
    <el-form-item label="" prop="isDeleted">
      <el-input v-model="dataForm.isDeleted" placeholder=""></el-input>
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
          shopregisterId: 0,
          shopownerId: '',
          cateid: '',
          shopname: '',
          adress: '',
          registerstatus: '',
          gmtCreate: '',
          gmtModified: '',
          isDeleted: ''
        },
        dataRule: {
          shopownerId: [
            { required: true, message: '商家id不能为空', trigger: 'blur' }
          ],
          cateid: [
            { required: true, message: '商店类型不能为空', trigger: 'blur' }
          ],
          shopname: [
            { required: true, message: '店铺名称不能为空', trigger: 'blur' }
          ],
          adress: [
            { required: true, message: '店铺地址不能为空', trigger: 'blur' }
          ],
          registerstatus: [
            { required: true, message: '申请状态 0表示未处理，1表示审核通过，-1表示审核不通过不能为空', trigger: 'blur' }
          ],
          gmtCreate: [
            { required: true, message: '不能为空', trigger: 'blur' }
          ],
          gmtModified: [
            { required: true, message: '不能为空', trigger: 'blur' }
          ],
          isDeleted: [
            { required: true, message: '不能为空', trigger: 'blur' }
          ]
        }
      }
    },
    methods: {
      init (id) {
        this.dataForm.shopregisterId = id || 0
        this.visible = true
        this.$nextTick(() => {
          this.$refs['dataForm'].resetFields()
          if (this.dataForm.shopregisterId) {
            this.$http({
              url: this.$http.adornUrl(`/waimai/shopregister/info/${this.dataForm.shopregisterId}`),
              method: 'get',
              params: this.$http.adornParams()
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.dataForm.shopownerId = data.shopregister.shopownerId
                this.dataForm.cateid = data.shopregister.cateid
                this.dataForm.shopname = data.shopregister.shopname
                this.dataForm.adress = data.shopregister.adress
                this.dataForm.registerstatus = data.shopregister.registerstatus
                this.dataForm.gmtCreate = data.shopregister.gmtCreate
                this.dataForm.gmtModified = data.shopregister.gmtModified
                this.dataForm.isDeleted = data.shopregister.isDeleted
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
              url: this.$http.adornUrl(`/waimai/shopregister/${!this.dataForm.shopregisterId ? 'save' : 'update'}`),
              method: 'post',
              data: this.$http.adornData({
                'shopregisterId': this.dataForm.shopregisterId || undefined,
                'shopownerId': this.dataForm.shopownerId,
                'cateid': this.dataForm.cateid,
                'shopname': this.dataForm.shopname,
                'adress': this.dataForm.adress,
                'registerstatus': this.dataForm.registerstatus,
                'gmtCreate': this.dataForm.gmtCreate,
                'gmtModified': this.dataForm.gmtModified,
                'isDeleted': this.dataForm.isDeleted
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
