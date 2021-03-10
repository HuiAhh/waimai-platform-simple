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
    <el-form-item label="评论内容" prop="content">
      <el-input v-model="dataForm.content" placeholder="评论内容"></el-input>
    </el-form-item>
    <el-form-item label="评论图片" prop="images">
      <el-input v-model="dataForm.images" placeholder="评论图片"></el-input>
    </el-form-item>
    <el-form-item label="回复的ID路径:1/2/3/5" prop="path">
      <el-input v-model="dataForm.path" placeholder="回复的ID路径:1/2/3/5"></el-input>
    </el-form-item>
    <el-form-item label="点赞次数" prop="numPraise">
      <el-input v-model="dataForm.numPraise" placeholder="点赞次数"></el-input>
    </el-form-item>
    <el-form-item label="状态" prop="status">
      <el-input v-model="dataForm.status" placeholder="状态"></el-input>
    </el-form-item>
    <el-form-item label="引用的评论ID" prop="reCommentId">
      <el-input v-model="dataForm.reCommentId" placeholder="引用的评论ID"></el-input>
    </el-form-item>
    <el-form-item label="点赞用户的IDs" prop="likeIds">
      <el-input v-model="dataForm.likeIds" placeholder="点赞用户的IDs"></el-input>
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
          userId: '',
          content: '',
          images: '',
          path: '',
          numPraise: '',
          status: '',
          reCommentId: '',
          likeIds: '',
          gmtCreate: '',
          gmtModified: ''
        },
        dataRule: {
          orderId: [
            { required: true, message: '订单ID不能为空', trigger: 'blur' }
          ],
          userId: [
            { required: true, message: '用户ID不能为空', trigger: 'blur' }
          ],
          content: [
            { required: true, message: '评论内容不能为空', trigger: 'blur' }
          ],
          images: [
            { required: true, message: '评论图片不能为空', trigger: 'blur' }
          ],
          path: [
            { required: true, message: '回复的ID路径:1/2/3/5不能为空', trigger: 'blur' }
          ],
          numPraise: [
            { required: true, message: '点赞次数不能为空', trigger: 'blur' }
          ],
          status: [
            { required: true, message: '状态不能为空', trigger: 'blur' }
          ],
          reCommentId: [
            { required: true, message: '引用的评论ID不能为空', trigger: 'blur' }
          ],
          likeIds: [
            { required: true, message: '点赞用户的IDs不能为空', trigger: 'blur' }
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
              url: this.$http.adornUrl(`/waimai/ordercomment/info/${this.dataForm.id}`),
              method: 'get',
              params: this.$http.adornParams()
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.dataForm.orderId = data.orderComment.orderId
                this.dataForm.userId = data.orderComment.userId
                this.dataForm.content = data.orderComment.content
                this.dataForm.images = data.orderComment.images
                this.dataForm.path = data.orderComment.path
                this.dataForm.numPraise = data.orderComment.numPraise
                this.dataForm.status = data.orderComment.status
                this.dataForm.reCommentId = data.orderComment.reCommentId
                this.dataForm.likeIds = data.orderComment.likeIds
                this.dataForm.gmtCreate = data.orderComment.gmtCreate
                this.dataForm.gmtModified = data.orderComment.gmtModified
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
              url: this.$http.adornUrl(`/waimai/ordercomment/${!this.dataForm.id ? 'save' : 'update'}`),
              method: 'post',
              data: this.$http.adornData({
                'id': this.dataForm.id || undefined,
                'orderId': this.dataForm.orderId,
                'userId': this.dataForm.userId,
                'content': this.dataForm.content,
                'images': this.dataForm.images,
                'path': this.dataForm.path,
                'numPraise': this.dataForm.numPraise,
                'status': this.dataForm.status,
                'reCommentId': this.dataForm.reCommentId,
                'likeIds': this.dataForm.likeIds,
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
