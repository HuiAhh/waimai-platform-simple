<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
    <el-form-item label="用户昵称" prop="username">
      <el-input v-model="dataForm.username" placeholder="用户昵称"></el-input>
    </el-form-item>
    <el-form-item label="联系电话" prop="mobile">
      <el-input v-model="dataForm.mobile" placeholder="联系电话"></el-input>
    </el-form-item>

    <el-form-item label="钱包" prop="wallet">
      <el-input v-model="dataForm.wallet" placeholder="钱包"></el-input>
    </el-form-item>


    <el-form-item label="身份" prop="identity">
      <el-input v-model="dataForm.identity" placeholder="身份"></el-input>
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
          username: '',
          mobile: '',
          password: '',
          wallet: '',
          truename: '',
          gender: '',
          identity: '',
          gmtCreate: '',
          gmtModified: ''
        },
        dataRule: {
          username: [
            { required: true, message: '用户昵称不能为空', trigger: 'blur' }
          ],
          mobile: [
            { required: true, message: '联系电话不能为空', trigger: 'blur' }
          ],
          password: [
            { required: true, message: '登录密码不能为空', trigger: 'blur' }
          ],
          wallet: [
            { required: true, message: '钱包不能为空', trigger: 'blur' }
          ],
          truename: [
            { required: true, message: '用户真实姓名不能为空', trigger: 'blur' }
          ],
          gender: [
            { required: true, message: '性别不能为空', trigger: 'blur' }
          ],
          identity: [
            { required: true, message: '身份，0：普通顾客，1：骑手，2商家不能为空', trigger: 'blur' }
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
              url: this.$http.adornUrl(`/waimai/user/info/${this.dataForm.id}`),
              method: 'get',
              params: this.$http.adornParams()
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.dataForm.username = data.user.username
                this.dataForm.mobile = data.user.mobile
                this.dataForm.password = data.user.password
                this.dataForm.wallet = data.user.wallet
                this.dataForm.truename = data.user.truename
                this.dataForm.gender = data.user.gender
                this.dataForm.identity = data.user.identity
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
              url: this.$http.adornUrl(`/waimai/user/${!this.dataForm.id ? 'save' : 'update'}`),
              method: 'post',
              data: this.$http.adornData({
                'id': this.dataForm.id || undefined,
                'username': this.dataForm.username,
                'mobile': this.dataForm.mobile,
                'password': this.dataForm.password,
                'wallet': this.dataForm.wallet,
                'truename': this.dataForm.truename,
                'gender': this.dataForm.gender,
                'identity': this.dataForm.identity
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
