<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
    <el-form-item label="商店ID" prop="shopId">
      <el-input v-model="dataForm.shopId" placeholder="商店ID"></el-input>
    </el-form-item>
    <el-form-item label="分类ID" prop="cateId">
      <el-input v-model="dataForm.cateId" placeholder="分类ID"></el-input>
    </el-form-item>
    <el-form-item label="食品名字" prop="title">
      <el-input v-model="dataForm.title" placeholder="食品名字"></el-input>
    </el-form-item>
    <el-form-item label="描述" prop="desc">
      <el-input v-model="dataForm.desc" placeholder="描述"></el-input>
    </el-form-item>
    <el-form-item label="折扣" prop="discount">
      <el-input v-model="dataForm.discount" placeholder="折扣"></el-input>
    </el-form-item>
    <el-form-item label="食品封面图" prop="cover">
      <el-input v-model="dataForm.cover" placeholder="食品封面图"></el-input>
    </el-form-item>
    <el-form-item label="原价" prop="originPrice">
      <el-input v-model="dataForm.originPrice" placeholder="原价"></el-input>
    </el-form-item>
    <el-form-item label="售价" prop="sellPrice">
      <el-input v-model="dataForm.sellPrice" placeholder="售价"></el-input>
    </el-form-item>
    <el-form-item label="状态 0下架1上架" prop="status">
      <el-input v-model="dataForm.status" placeholder="状态 0下架1上架"></el-input>
    </el-form-item>
    <el-form-item label="点赞" prop="like">
      <el-input v-model="dataForm.like" placeholder="点赞"></el-input>
    </el-form-item>
    <el-form-item label="规格选项" prop="option">
      <el-input v-model="dataForm.option" placeholder="规格选项"></el-input>
    </el-form-item>
    <el-form-item label="总的销量" prop="totalSales">
      <el-input v-model="dataForm.totalSales" placeholder="总的销量"></el-input>
    </el-form-item>
    <el-form-item label="好评率" prop="praiseRate">
      <el-input v-model="dataForm.praiseRate" placeholder="好评率"></el-input>
    </el-form-item>
    <el-form-item label="创建时间" prop="gmtCreate">
      <el-input v-model="dataForm.gmtCreate" placeholder="创建时间"></el-input>
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
          cateId: '',
          title: '',
          desc: '',
          discount: '',
          cover: '',
          originPrice: '',
          sellPrice: '',
          status: '',
          like: '',
          option: '',
          totalSales: '',
          praiseRate: '',
          gmtCreate: '',
          gmtModified: ''
        },
        dataRule: {
          shopId: [
            { required: true, message: '商店ID不能为空', trigger: 'blur' }
          ],
          cateId: [
            { required: true, message: '分类ID不能为空', trigger: 'blur' }
          ],
          title: [
            { required: true, message: '食品名字不能为空', trigger: 'blur' }
          ],
          desc: [
            { required: true, message: '描述不能为空', trigger: 'blur' }
          ],
          discount: [
            { required: true, message: '折扣不能为空', trigger: 'blur' }
          ],
          cover: [
            { required: true, message: '食品封面图不能为空', trigger: 'blur' }
          ],
          originPrice: [
            { required: true, message: '原价不能为空', trigger: 'blur' }
          ],
          sellPrice: [
            { required: true, message: '售价不能为空', trigger: 'blur' }
          ],
          status: [
            { required: true, message: '状态 0下架1上架不能为空', trigger: 'blur' }
          ],
          like: [
            { required: true, message: '点赞不能为空', trigger: 'blur' }
          ],
          option: [
            { required: true, message: '规格选项不能为空', trigger: 'blur' }
          ],
          totalSales: [
            { required: true, message: '总的销量不能为空', trigger: 'blur' }
          ],
          praiseRate: [
            { required: true, message: '好评率不能为空', trigger: 'blur' }
          ],
          gmtCreate: [
            { required: true, message: '创建时间不能为空', trigger: 'blur' }
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
              url: this.$http.adornUrl(`/waimai/food/info/${this.dataForm.id}`),
              method: 'get',
              params: this.$http.adornParams()
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.dataForm.shopId = data.food.shopId
                this.dataForm.cateId = data.food.cateId
                this.dataForm.title = data.food.title
                this.dataForm.desc = data.food.desc
                this.dataForm.discount = data.food.discount
                this.dataForm.cover = data.food.cover
                this.dataForm.originPrice = data.food.originPrice
                this.dataForm.sellPrice = data.food.sellPrice
                this.dataForm.status = data.food.status
                this.dataForm.like = data.food.like
                this.dataForm.option = data.food.option
                this.dataForm.totalSales = data.food.totalSales
                this.dataForm.praiseRate = data.food.praiseRate
                this.dataForm.gmtCreate = data.food.gmtCreate
                this.dataForm.gmtModified = data.food.gmtModified
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
              url: this.$http.adornUrl(`/waimai/food/${!this.dataForm.id ? 'save' : 'update'}`),
              method: 'post',
              data: this.$http.adornData({
                'id': this.dataForm.id || undefined,
                'shopId': this.dataForm.shopId,
                'cateId': this.dataForm.cateId,
                'title': this.dataForm.title,
                'desc': this.dataForm.desc,
                'discount': this.dataForm.discount,
                'cover': this.dataForm.cover,
                'originPrice': this.dataForm.originPrice,
                'sellPrice': this.dataForm.sellPrice,
                'status': this.dataForm.status,
                'like': this.dataForm.like,
                'option': this.dataForm.option,
                'totalSales': this.dataForm.totalSales,
                'praiseRate': this.dataForm.praiseRate,
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
