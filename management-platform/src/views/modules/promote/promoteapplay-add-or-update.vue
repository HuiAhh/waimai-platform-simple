<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
    <el-form-item label="" prop="shopId">
      <el-input v-model="dataForm.shopId" placeholder=""></el-input>
    </el-form-item>
    <el-form-item label="申请时长" prop="applayTime">
      <el-input v-model="dataForm.applayTime" placeholder="申请时长"></el-input>
    </el-form-item>
    <el-form-item label="出资多少" prop="willingpay">
      <el-input v-model="dataForm.willingpay" placeholder="出资多少"></el-input>
    </el-form-item>
    <el-form-item label="申请状态" prop="applayStatus">
      <el-input v-model="dataForm.applayStatus" placeholder="申请状态"></el-input>
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
          shopId: '',
          applayTime: '',
          willingpay: '',
          applayStatus: '',
          gmtCreate: '',
          gmtModified: ''
        },
        dataRule: {
          shopId: [
            { required: true, message: '不能为空', trigger: 'blur' }
          ],
          applayTime: [
            { required: true, message: '申请时长不能为空', trigger: 'blur' }
          ],
          willingpay: [
            { required: true, message: '出资多少不能为空', trigger: 'blur' }
          ],
          applayStatus: [
            { required: true, message: '申请状态不能为空', trigger: 'blur' }
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
              url: this.$http.adornUrl(`/waimai/promoteapplay/info/${this.dataForm.id}`),
              method: 'get',
              params: this.$http.adornParams()
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.dataForm.shopId = data.promoteApplay.shopId
                this.dataForm.applayTime = data.promoteApplay.applayTime
                this.dataForm.willingpay = data.promoteApplay.willingpay
                this.dataForm.applayStatus = data.promoteApplay.applayStatus

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
              url: this.$http.adornUrl(`/waimai/promoteapplay/${!this.dataForm.id ? 'save' : 'update'}`),
              method: 'post',
              data: this.$http.adornData({
                'id': this.dataForm.id || undefined,
                'shopId': this.dataForm.shopId,
                'applayTime': this.dataForm.applayTime,
                'willingpay': this.dataForm.willingpay,
                'applayStatus': this.dataForm.applayStatus,
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
