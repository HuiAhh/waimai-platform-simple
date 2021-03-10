<template>
  <div class="mod-config">
    <el-form :inline="true" :model="dataForm" @keyup.enter.native="getDataList()">
      <el-form-item>
        <el-input v-model="dataForm.key" placeholder="参数名" clearable></el-input>
      </el-form-item>
      <el-form-item>
        <el-button @click="getDataList()">查询</el-button>

        <el-button v-if="isAuth('waimai:shopinfo:delete')" type="danger" @click="deleteHandle()"
                   :disabled="dataListSelections.length <= 0">批量删除
        </el-button>
      </el-form-item>
    </el-form>
    <el-table
      :data="dataList"
      border
      v-loading="dataListLoading"
      @selection-change="selectionChangeHandle"
      style="width: 100%;">
      <el-table-column
        type="selection"
        header-align="center"
        align="center"
        width="50">
      </el-table-column>
      <el-table-column
        prop="shopname"
        header-align="center"
        align="center"
        label="商店名称">
      </el-table-column>
      <el-table-column
        prop="contactMan"
        header-align="center"
        align="center"
        label="联系人">
      </el-table-column>
      <el-table-column
        prop="contactMobile"
        header-align="center"
        align="center"
        label="联系电话">
      </el-table-column>

      <el-table-column
        prop="permitImg"
        header-align="center"
        align="center"
        label="许可证"
      width="120px">
        <template slot-scope="scope">
          <!-- <el-image
              style="width: 100px; height: 80px"
              :src="scope.row.logo"
          fit="fill"></el-image>-->
          <img :src="scope.row.permitImg" style="width: 100px; height: 100px" />
        </template>
      </el-table-column>
      <el-table-column
        prop="logoImg"
        header-align="center"
        align="center"
        label="logo图片"
      width="130px">
        <template slot-scope="scope">
          <!-- <el-image
              style="width: 100px; height: 80px"
              :src="scope.row.logo"
          fit="fill"></el-image>-->
          <img :src="scope.row.logoImg" style="width: 100px; height: 80px" />
        </template>
      </el-table-column>
      <el-table-column
        prop="address"
        header-align="center"
        align="center"
        label="详细地址">
      </el-table-column>
      <el-table-column
        prop="mobile"
        header-align="center"
        align="center"
        label="外卖电话">
      </el-table-column>
      <el-table-column
        prop="notice"
        header-align="center"
        align="center"
        label="商家公告">
      </el-table-column>
      <el-table-column
        prop="score"
        header-align="center"
        align="center"
        label="平均评分">
      </el-table-column>
      <el-table-column
        prop="sendTime"
        header-align="center"
        align="center"
        label="配送时间">
      </el-table-column>
      <el-table-column
        prop="boxCost"
        header-align="center"
        align="center"
        label="餐盒费用">
      </el-table-column>
      <el-table-column
        prop="sendCost"
        header-align="center"
        align="center"
        label="配送费用">
      </el-table-column>
      <el-table-column
        prop="floorSendCost"
        header-align="center"
        align="center"
        label="起送消费">
      </el-table-column>
      <el-table-column
        prop="showStatus"
        header-align="center"
        align="center"
        label="店铺状态 ，0关门，1营业">
      </el-table-column>
      <el-table-column
        fixed="right"
        header-align="center"
        align="center"
        width="150"
        label="操作">
        <template slot-scope="scope">
          <el-button type="text" size="small" @click="addOrUpdateHandle(scope.row.id)">修改</el-button>
          <el-button type="text" size="small" @click="deleteHandle(scope.row.id)">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    <el-pagination
      @size-change="sizeChangeHandle"
      @current-change="currentChangeHandle"
      :current-page="pageIndex"
      :page-sizes="[10, 20, 50, 100]"
      :page-size="pageSize"
      :total="totalPage"
      layout="total, sizes, prev, pager, next, jumper">
    </el-pagination>
    <!-- 弹窗, 新增 / 修改 -->
    <add-or-update v-if="addOrUpdateVisible" ref="addOrUpdate" @refreshDataList="getDataList"></add-or-update>
  </div>
</template>

<script>
  import AddOrUpdate from './shopinfo-add-or-update'

  export default {
    data () {
      return {
        dataForm: {
          key: ''
        },
        dataList: [],
        pageIndex: 1,
        pageSize: 10,
        totalPage: 0,
        dataListLoading: false,
        dataListSelections: [],
        addOrUpdateVisible: false
      }
    },
    components: {
      AddOrUpdate
    },
    activated () {
      this.getDataList()
    },
    methods: {
      updateStatus(data) {
        console.log("最新信息", data);
        let { id, showStatus } = data;
        //发送请求修改状态
        this.$http({
          url: this.$http.adornUrl("/waimai/shopinfo/update"),
          method: "post",
          data: this.$http.adornData({ id, showStatus }, false)
        }).then(({ data }) => {
          this.$message({
            type: "success",
            message: "状态更新成功"
          });
        });
      },
      // 获取数据列表
      getDataList () {
        this.dataListLoading = true
        this.$http({
          url: this.$http.adornUrl('/waimai/shopinfo/list'),
          method: 'get',
          params: this.$http.adornParams({
            'page': this.pageIndex,
            'limit': this.pageSize,
            'key': this.dataForm.key
          })
        }).then(({data}) => {
          if (data && data.code === 0) {
            this.dataList = data.page.list
            this.totalPage = data.page.totalCount
          } else {
            this.dataList = []
            this.totalPage = 0
          }
          this.dataListLoading = false
        })
      },
      // 每页数
      sizeChangeHandle (val) {
        this.pageSize = val
        this.pageIndex = 1
        this.getDataList()
      },
      // 当前页
      currentChangeHandle (val) {
        this.pageIndex = val
        this.getDataList()
      },
      // 多选
      selectionChangeHandle (val) {
        this.dataListSelections = val
      },
      // 新增 / 修改
      addOrUpdateHandle (id) {
        this.addOrUpdateVisible = true
        this.$nextTick(() => {
          this.$refs.addOrUpdate.init(id)
        })
      },
      // 删除
      deleteHandle (id) {
        var ids = id ? [id] : this.dataListSelections.map(item => {
          return item.id
        })
        this.$confirm(`确定对[id=${ids.join(',')}]进行[${id ? '删除' : '批量删除'}]操作?`, '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          this.$http({
            url: this.$http.adornUrl('/waimai/shopinfo/delete'),
            method: 'post',
            data: this.$http.adornData(ids, false)
          }).then(({data}) => {
            if (data && data.code === 0) {
              this.$message({
                message: '操作成功',
                type: 'success',
                duration: 1500,
                onClose: () => {
                  this.getDataList()
                }
              })
            } else {
              this.$message.error(data.msg)
            }
          })
        })
      }
    }
  }
</script>
