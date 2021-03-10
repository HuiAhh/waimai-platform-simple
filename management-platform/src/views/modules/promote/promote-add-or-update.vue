<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
    <el-form-item label="推广商店id" prop="shopId">
      <el-input v-model="dataForm.shopId" placeholder="推广商店id"></el-input>
    </el-form-item>
    <el-form-item label="推广时长" prop="applayTime">
      <el-input v-model="dataForm.applayTime" placeholder="推广时长"></el-input>
    </el-form-item>
    <el-form-item label="开始推广时间" prop="startPromote">
      <el-input v-model="dataForm.startPromote" placeholder="开始推广时间"></el-input>
    </el-form-item>
    <el-form-item label="推广状态" prop="promoteStatus">
      <el-input v-model="dataForm.promoteStatus" placeholder="推广状态"></el-input>
    </el-form-item>
    <el-form-item label="申请通过时间" prop="gmtCreate">
      <el-input v-model="dataForm.gmtCreate" placeholder="申请通过时间"></el-input>
    </el-form-item>
    <el-form-item label="修改时间" prop="gmtModified">
      <el-input v-model="dataForm.gmtModified" placeholder="修改时间"></el-input>
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
          startPromote: '',
          promoteStatus: '',
          gmtCreate: '',
          gmtModified: ''
        },
        dataRule: {
          shopId: [
            { required: true, message: '推广商店id不能为空', trigger: 'blur' }
          ],
          applayTime: [
            { required: true, message: '推广时长不能为空', trigger: 'blur' }
          ],
          startPromote: [
            { required: true, message: '开始推广时间不能为空', trigger: 'blur' }
          ],
          promoteStatus: [
            { required: true, message: '推广状态不能为空', trigger: 'blur' }
          ],
          gmtCreate: [
            { required: true, message: '申请通过时间不能为空', trigger: 'blur' }
          ],
          gmtModified: [
            { required: true, message: '修改时间不能为空', trigger: 'blur' }
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
              url: this.$http.adornUrl(`/waimai/promote/info/${this.dataForm.id}`),
              method: 'get',
              params: this.$http.adornParams()
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.dataForm.shopId = data.promote.shopId
                this.dataForm.applayTime = data.promote.applayTime
                this.dataForm.startPromote = data.promote.startPromote
                this.dataForm.promoteStatus = data.promote.promoteStatus
                this.dataForm.gmtCreate = data.promote.gmtCreate
                this.dataForm.gmtModified = data.promote.gmtModified
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
              url: this.$http.adornUrl(`/waimai/promote/${!this.dataForm.id ? 'save' : 'update'}`),
              method: 'post',
              data: this.$http.adornData({
                'id': this.dataForm.id || undefined,
                'shopId': this.dataForm.shopId,
                'applayTime': this.dataForm.applayTime,
                'startPromote': this.dataForm.startPromote,
                'promoteStatus': this.dataForm.promoteStatus,
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
