<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
    <el-form-item label="登录账号" prop="account">
      <el-input v-model="dataForm.account" placeholder="登录账号"></el-input>
    </el-form-item>
    <el-form-item label="登录密码" prop="password">
      <el-input v-model="dataForm.password" placeholder="登录密码"></el-input>
    </el-form-item>
    <el-form-item label="用户名字" prop="username">
      <el-input v-model="dataForm.username" placeholder="用户名字"></el-input>
    </el-form-item>
    <el-form-item label="状态" prop="status">
      <el-input v-model="dataForm.status" placeholder="状态"></el-input>
    </el-form-item>
    <el-form-item label="加入时间" prop="gmtCreate">
      <el-input v-model="dataForm.gmtCreate" placeholder="加入时间"></el-input>
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
          account: '',
          password: '',
          username: '',
          status: '',
          gmtCreate: '',
          gmtModified: ''
        },
        dataRule: {
          account: [
            { required: true, message: '登录账号不能为空', trigger: 'blur' }
          ],
          password: [
            { required: true, message: '登录密码不能为空', trigger: 'blur' }
          ],
          username: [
            { required: true, message: '用户名字不能为空', trigger: 'blur' }
          ],
          status: [
            { required: true, message: '状态不能为空', trigger: 'blur' }
          ],
          gmtCreate: [
            { required: true, message: '加入时间不能为空', trigger: 'blur' }
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
              url: this.$http.adornUrl(`/waimai/adminuser/info/${this.dataForm.id}`),
              method: 'get',
              params: this.$http.adornParams()
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.dataForm.account = data.adminUser.account
                this.dataForm.password = data.adminUser.password
                this.dataForm.username = data.adminUser.username
                this.dataForm.status = data.adminUser.status
                this.dataForm.gmtCreate = data.adminUser.gmtCreate
                this.dataForm.gmtModified = data.adminUser.gmtModified
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
              url: this.$http.adornUrl(`/waimai/adminuser/${!this.dataForm.id ? 'save' : 'update'}`),
              method: 'post',
              data: this.$http.adornData({
                'id': this.dataForm.id || undefined,
                'account': this.dataForm.account,
                'password': this.dataForm.password,
                'username': this.dataForm.username,
                'status': this.dataForm.status,
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
