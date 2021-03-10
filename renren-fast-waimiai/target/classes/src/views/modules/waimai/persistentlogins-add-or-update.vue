<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
    <el-form-item label="" prop="username">
      <el-input v-model="dataForm.username" placeholder=""></el-input>
    </el-form-item>
    <el-form-item label="" prop="token">
      <el-input v-model="dataForm.token" placeholder=""></el-input>
    </el-form-item>
    <el-form-item label="" prop="lastUsed">
      <el-input v-model="dataForm.lastUsed" placeholder=""></el-input>
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
          username: '',
          series: 0,
          token: '',
          lastUsed: ''
        },
        dataRule: {
          username: [
            { required: true, message: '不能为空', trigger: 'blur' }
          ],
          token: [
            { required: true, message: '不能为空', trigger: 'blur' }
          ],
          lastUsed: [
            { required: true, message: '不能为空', trigger: 'blur' }
          ]
        }
      }
    },
    methods: {
      init (id) {
        this.dataForm.series = id || 0
        this.visible = true
        this.$nextTick(() => {
          this.$refs['dataForm'].resetFields()
          if (this.dataForm.series) {
            this.$http({
              url: this.$http.adornUrl(`/waimai/persistentlogins/info/${this.dataForm.series}`),
              method: 'get',
              params: this.$http.adornParams()
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.dataForm.username = data.persistentLogins.username
                this.dataForm.token = data.persistentLogins.token
                this.dataForm.lastUsed = data.persistentLogins.lastUsed
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
              url: this.$http.adornUrl(`/waimai/persistentlogins/${!this.dataForm.series ? 'save' : 'update'}`),
              method: 'post',
              data: this.$http.adornData({
                'username': this.dataForm.username,
                'series': this.dataForm.series || undefined,
                'token': this.dataForm.token,
                'lastUsed': this.dataForm.lastUsed
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
