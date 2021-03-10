webpackJsonp([17,36],{Q1Kz:function(e,t,a){"use strict";Object.defineProperty(t,"__esModule",{value:!0});var o={data:function(){return{visible:!1,dataForm:{id:0,shopownerId:"",shopname:"",contactMan:"",contactMobile:"",cateid:"",beginTime:"",endTime:"",logoImg:"",address:"",mobile:"",notice:"",score:"",sendTime:"",boxCost:"",sendCost:"",floorSendCost:"",showStatus:""},dataRule:{shopownerId:[{required:!0,message:"商店拥有者ID不能为空",trigger:"blur"}],shopname:[{required:!0,message:"商店名称不能为空",trigger:"blur"}],contactMan:[{required:!0,message:"联系人不能为空",trigger:"blur"}],contactMobile:[{required:!0,message:"联系电话不能为空",trigger:"blur"}],cateid:[{required:!0,message:"门店类型不能为空",trigger:"blur"}],beginTime:[{required:!0,message:"营业开始时间不能为空",trigger:"blur"}],endTime:[{required:!0,message:"营业结束时间不能为空",trigger:"blur"}],logoImg:[{required:!0,message:"logo图片不能为空",trigger:"blur"}],address:[{required:!0,message:"详细地址不能为空",trigger:"blur"}],mobile:[{required:!0,message:"外卖电话不能为空",trigger:"blur"}],notice:[{required:!0,message:"商家公告不能为空",trigger:"blur"}],score:[{required:!0,message:"平均评分不能为空",trigger:"blur"}],sendTime:[{required:!0,message:"配送时间不能为空",trigger:"blur"}],boxCost:[{required:!0,message:"餐盒费用不能为空",trigger:"blur"}],sendCost:[{required:!0,message:"配送费用不能为空",trigger:"blur"}],floorSendCost:[{required:!0,message:"起送消费不能为空",trigger:"blur"}],showStatus:[{required:!0,message:"店铺状态 ，0关门，1营业不能为空",trigger:"blur"}]}}},methods:{init:function(e){var t=this;this.dataForm.id=e||0,this.visible=!0,this.$nextTick(function(){t.$refs.dataForm.resetFields(),t.dataForm.id&&t.$http({url:t.$http.adornUrl("/waimai/shopinfo/info/"+t.dataForm.id),method:"get",params:t.$http.adornParams()}).then(function(e){var a=e.data;a&&0===a.code&&(t.dataForm.shopownerId=a.shopInfo.shopownerId,t.dataForm.shopname=a.shopInfo.shopname,t.dataForm.contactMan=a.shopInfo.contactMan,t.dataForm.contactMobile=a.shopInfo.contactMobile,t.dataForm.cateid=a.shopInfo.cateid,t.dataForm.beginTime=a.shopInfo.beginTime,t.dataForm.endTime=a.shopInfo.endTime,t.dataForm.logoImg=a.shopInfo.logoImg,t.dataForm.address=a.shopInfo.address,t.dataForm.mobile=a.shopInfo.mobile,t.dataForm.notice=a.shopInfo.notice,t.dataForm.score=a.shopInfo.score,t.dataForm.sendTime=a.shopInfo.sendTime,t.dataForm.boxCost=a.shopInfo.boxCost,t.dataForm.sendCost=a.shopInfo.sendCost,t.dataForm.floorSendCost=a.shopInfo.floorSendCost,t.dataForm.showStatus=a.shopInfo.showStatus)})})},dataFormSubmit:function(){var e=this;this.$refs.dataForm.validate(function(t){t&&e.$http({url:e.$http.adornUrl("/waimai/shopinfo/"+(e.dataForm.id?"update":"save")),method:"post",data:e.$http.adornData({id:e.dataForm.id||void 0,shopownerId:e.dataForm.shopownerId,shopname:e.dataForm.shopname,contactMan:e.dataForm.contactMan,contactMobile:e.dataForm.contactMobile,cateid:e.dataForm.cateid,beginTime:e.dataForm.beginTime,endTime:e.dataForm.endTime,logoImg:e.dataForm.logoImg,address:e.dataForm.address,mobile:e.dataForm.mobile,notice:e.dataForm.notice,score:e.dataForm.score,sendTime:e.dataForm.sendTime,boxCost:e.dataForm.boxCost,sendCost:e.dataForm.sendCost,floorSendCost:e.dataForm.floorSendCost,showStatus:e.dataForm.showStatus})}).then(function(t){var a=t.data;a&&0===a.code?e.$message({message:"操作成功",type:"success",duration:1500,onClose:function(){e.visible=!1,e.$emit("refreshDataList")}}):e.$message.error(a.msg)})})}}},r={render:function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("el-dialog",{attrs:{title:e.dataForm.id?"修改":"新增","close-on-click-modal":!1,visible:e.visible},on:{"update:visible":function(t){e.visible=t}}},[a("el-form",{ref:"dataForm",attrs:{model:e.dataForm,rules:e.dataRule,"label-width":"180px"},nativeOn:{keyup:function(t){if(!("button"in t)&&e._k(t.keyCode,"enter",13,t.key,"Enter"))return null;e.dataFormSubmit()}}},[a("el-form-item",{attrs:{label:"商店拥有者ID",prop:"shopownerId"}},[a("el-input",{attrs:{placeholder:"商店拥有者ID"},model:{value:e.dataForm.shopownerId,callback:function(t){e.$set(e.dataForm,"shopownerId",t)},expression:"dataForm.shopownerId"}})],1),e._v(" "),a("el-form-item",{attrs:{label:"商店名称",prop:"shopname"}},[a("el-input",{attrs:{placeholder:"商店名称"},model:{value:e.dataForm.shopname,callback:function(t){e.$set(e.dataForm,"shopname",t)},expression:"dataForm.shopname"}})],1),e._v(" "),a("el-form-item",{attrs:{label:"联系人",prop:"contactMan"}},[a("el-input",{attrs:{placeholder:"联系人"},model:{value:e.dataForm.contactMan,callback:function(t){e.$set(e.dataForm,"contactMan",t)},expression:"dataForm.contactMan"}})],1),e._v(" "),a("el-form-item",{attrs:{label:"联系电话",prop:"contactMobile"}},[a("el-input",{attrs:{placeholder:"联系电话"},model:{value:e.dataForm.contactMobile,callback:function(t){e.$set(e.dataForm,"contactMobile",t)},expression:"dataForm.contactMobile"}})],1),e._v(" "),a("el-form-item",{attrs:{label:"门店类型",prop:"cateid"}},[a("el-input",{attrs:{placeholder:"门店类型"},model:{value:e.dataForm.cateid,callback:function(t){e.$set(e.dataForm,"cateid",t)},expression:"dataForm.cateid"}})],1),e._v(" "),a("el-form-item",{attrs:{label:"营业开始时间",prop:"beginTime"}},[a("el-input",{attrs:{placeholder:"营业开始时间"},model:{value:e.dataForm.beginTime,callback:function(t){e.$set(e.dataForm,"beginTime",t)},expression:"dataForm.beginTime"}})],1),e._v(" "),a("el-form-item",{attrs:{label:"营业结束时间",prop:"endTime"}},[a("el-input",{attrs:{placeholder:"营业结束时间"},model:{value:e.dataForm.endTime,callback:function(t){e.$set(e.dataForm,"endTime",t)},expression:"dataForm.endTime"}})],1),e._v(" "),a("el-form-item",{attrs:{label:"logo图片",prop:"logoImg"}},[a("el-input",{attrs:{placeholder:"logo图片"},model:{value:e.dataForm.logoImg,callback:function(t){e.$set(e.dataForm,"logoImg",t)},expression:"dataForm.logoImg"}})],1),e._v(" "),a("el-form-item",{attrs:{label:"详细地址",prop:"address"}},[a("el-input",{attrs:{placeholder:"详细地址"},model:{value:e.dataForm.address,callback:function(t){e.$set(e.dataForm,"address",t)},expression:"dataForm.address"}})],1),e._v(" "),a("el-form-item",{attrs:{label:"外卖电话",prop:"mobile"}},[a("el-input",{attrs:{placeholder:"外卖电话"},model:{value:e.dataForm.mobile,callback:function(t){e.$set(e.dataForm,"mobile",t)},expression:"dataForm.mobile"}})],1),e._v(" "),a("el-form-item",{attrs:{label:"商家公告",prop:"notice"}},[a("el-input",{attrs:{placeholder:"商家公告"},model:{value:e.dataForm.notice,callback:function(t){e.$set(e.dataForm,"notice",t)},expression:"dataForm.notice"}})],1),e._v(" "),a("el-form-item",{attrs:{label:"平均评分",prop:"score"}},[a("el-input",{attrs:{placeholder:"平均评分"},model:{value:e.dataForm.score,callback:function(t){e.$set(e.dataForm,"score",t)},expression:"dataForm.score"}})],1),e._v(" "),a("el-form-item",{attrs:{label:"配送时间",prop:"sendTime"}},[a("el-input",{attrs:{placeholder:"配送时间"},model:{value:e.dataForm.sendTime,callback:function(t){e.$set(e.dataForm,"sendTime",t)},expression:"dataForm.sendTime"}})],1),e._v(" "),a("el-form-item",{attrs:{label:"餐盒费用",prop:"boxCost"}},[a("el-input",{attrs:{placeholder:"餐盒费用"},model:{value:e.dataForm.boxCost,callback:function(t){e.$set(e.dataForm,"boxCost",t)},expression:"dataForm.boxCost"}})],1),e._v(" "),a("el-form-item",{attrs:{label:"配送费用",prop:"sendCost"}},[a("el-input",{attrs:{placeholder:"配送费用"},model:{value:e.dataForm.sendCost,callback:function(t){e.$set(e.dataForm,"sendCost",t)},expression:"dataForm.sendCost"}})],1),e._v(" "),a("el-form-item",{attrs:{label:"起送消费",prop:"floorSendCost"}},[a("el-input",{attrs:{placeholder:"起送消费"},model:{value:e.dataForm.floorSendCost,callback:function(t){e.$set(e.dataForm,"floorSendCost",t)},expression:"dataForm.floorSendCost"}})],1),e._v(" "),a("el-form-item",{attrs:{label:"店铺状态",prop:"showStatus"}},[a("el-switch",{attrs:{"active-color":"#13ce66","inactive-color":"#ff4949"},model:{value:e.dataForm.showStatus,callback:function(t){e.$set(e.dataForm,"showStatus",t)},expression:"dataForm.showStatus"}})],1)],1),e._v(" "),a("span",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[a("el-button",{on:{click:function(t){e.visible=!1}}},[e._v("取消")]),e._v(" "),a("el-button",{attrs:{type:"primary"},on:{click:function(t){e.dataFormSubmit()}}},[e._v("确定")])],1)],1)},staticRenderFns:[]},n=a("VU/8")(o,r,!1,null,null,null);t.default=n.exports},gwHv:function(e,t,a){"use strict";Object.defineProperty(t,"__esModule",{value:!0});var o={data:function(){return{dataForm:{key:""},dataList:[],pageIndex:1,pageSize:10,totalPage:0,dataListLoading:!1,dataListSelections:[],addOrUpdateVisible:!1}},components:{AddOrUpdate:a("Q1Kz").default},activated:function(){this.getDataList()},methods:{updateStatus:function(e){var t=this;console.log("最新信息",e);var a=e.id,o=e.showStatus;this.$http({url:this.$http.adornUrl("/waimai/shopinfo/update"),method:"post",data:this.$http.adornData({id:a,showStatus:o},!1)}).then(function(e){e.data;t.$message({type:"success",message:"状态更新成功"})})},getDataList:function(){var e=this;this.dataListLoading=!0,this.$http({url:this.$http.adornUrl("/waimai/shopinfo/list"),method:"get",params:this.$http.adornParams({page:this.pageIndex,limit:this.pageSize,key:this.dataForm.key})}).then(function(t){var a=t.data;a&&0===a.code?(e.dataList=a.page.list,e.totalPage=a.page.totalCount):(e.dataList=[],e.totalPage=0),e.dataListLoading=!1})},sizeChangeHandle:function(e){this.pageSize=e,this.pageIndex=1,this.getDataList()},currentChangeHandle:function(e){this.pageIndex=e,this.getDataList()},selectionChangeHandle:function(e){this.dataListSelections=e},addOrUpdateHandle:function(e){var t=this;this.addOrUpdateVisible=!0,this.$nextTick(function(){t.$refs.addOrUpdate.init(e)})},deleteHandle:function(e){var t=this,a=e?[e]:this.dataListSelections.map(function(e){return e.id});this.$confirm("确定对[id="+a.join(",")+"]进行["+(e?"删除":"批量删除")+"]操作?","提示",{confirmButtonText:"确定",cancelButtonText:"取消",type:"warning"}).then(function(){t.$http({url:t.$http.adornUrl("/waimai/shopinfo/delete"),method:"post",data:t.$http.adornData(a,!1)}).then(function(e){var a=e.data;a&&0===a.code?t.$message({message:"操作成功",type:"success",duration:1500,onClose:function(){t.getDataList()}}):t.$message.error(a.msg)})})}}},r={render:function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("div",{staticClass:"mod-config"},[a("el-form",{attrs:{inline:!0,model:e.dataForm},nativeOn:{keyup:function(t){if(!("button"in t)&&e._k(t.keyCode,"enter",13,t.key,"Enter"))return null;e.getDataList()}}},[a("el-form-item",[a("el-input",{attrs:{placeholder:"参数名",clearable:""},model:{value:e.dataForm.key,callback:function(t){e.$set(e.dataForm,"key",t)},expression:"dataForm.key"}})],1),e._v(" "),a("el-form-item",[a("el-button",{on:{click:function(t){e.getDataList()}}},[e._v("查询")]),e._v(" "),e.isAuth("waimai:shopinfo:delete")?a("el-button",{attrs:{type:"danger",disabled:e.dataListSelections.length<=0},on:{click:function(t){e.deleteHandle()}}},[e._v("批量删除\n      ")]):e._e()],1)],1),e._v(" "),a("el-table",{directives:[{name:"loading",rawName:"v-loading",value:e.dataListLoading,expression:"dataListLoading"}],staticStyle:{width:"100%"},attrs:{data:e.dataList,border:""},on:{"selection-change":e.selectionChangeHandle}},[a("el-table-column",{attrs:{type:"selection","header-align":"center",align:"center",width:"50"}}),e._v(" "),a("el-table-column",{attrs:{prop:"shopname","header-align":"center",align:"center",label:"商店名称"}}),e._v(" "),a("el-table-column",{attrs:{prop:"contactMan","header-align":"center",align:"center",label:"联系人"}}),e._v(" "),a("el-table-column",{attrs:{prop:"contactMobile","header-align":"center",align:"center",label:"联系电话"}}),e._v(" "),a("el-table-column",{attrs:{prop:"permitImg","header-align":"center",align:"center",label:"许可证",width:"120px"},scopedSlots:e._u([{key:"default",fn:function(e){return[a("img",{staticStyle:{width:"100px",height:"100px"},attrs:{src:e.row.permitImg}})]}}])}),e._v(" "),a("el-table-column",{attrs:{prop:"logoImg","header-align":"center",align:"center",label:"logo图片",width:"130px"},scopedSlots:e._u([{key:"default",fn:function(e){return[a("img",{staticStyle:{width:"100px",height:"80px"},attrs:{src:e.row.logoImg}})]}}])}),e._v(" "),a("el-table-column",{attrs:{prop:"address","header-align":"center",align:"center",label:"详细地址"}}),e._v(" "),a("el-table-column",{attrs:{prop:"mobile","header-align":"center",align:"center",label:"外卖电话"}}),e._v(" "),a("el-table-column",{attrs:{prop:"notice","header-align":"center",align:"center",label:"商家公告"}}),e._v(" "),a("el-table-column",{attrs:{prop:"score","header-align":"center",align:"center",label:"平均评分"}}),e._v(" "),a("el-table-column",{attrs:{prop:"sendTime","header-align":"center",align:"center",label:"配送时间"}}),e._v(" "),a("el-table-column",{attrs:{prop:"boxCost","header-align":"center",align:"center",label:"餐盒费用"}}),e._v(" "),a("el-table-column",{attrs:{prop:"sendCost","header-align":"center",align:"center",label:"配送费用"}}),e._v(" "),a("el-table-column",{attrs:{prop:"floorSendCost","header-align":"center",align:"center",label:"起送消费"}}),e._v(" "),a("el-table-column",{attrs:{prop:"showStatus","header-align":"center",align:"center",label:"店铺状态 ，0关门，1营业"}}),e._v(" "),a("el-table-column",{attrs:{fixed:"right","header-align":"center",align:"center",width:"150",label:"操作"},scopedSlots:e._u([{key:"default",fn:function(t){return[a("el-button",{attrs:{type:"text",size:"small"},on:{click:function(a){e.addOrUpdateHandle(t.row.id)}}},[e._v("修改")]),e._v(" "),a("el-button",{attrs:{type:"text",size:"small"},on:{click:function(a){e.deleteHandle(t.row.id)}}},[e._v("删除")])]}}])})],1),e._v(" "),a("el-pagination",{attrs:{"current-page":e.pageIndex,"page-sizes":[10,20,50,100],"page-size":e.pageSize,total:e.totalPage,layout:"total, sizes, prev, pager, next, jumper"},on:{"size-change":e.sizeChangeHandle,"current-change":e.currentChangeHandle}}),e._v(" "),e.addOrUpdateVisible?a("add-or-update",{ref:"addOrUpdate",on:{refreshDataList:e.getDataList}}):e._e()],1)},staticRenderFns:[]},n=a("VU/8")(o,r,!1,null,null,null);t.default=n.exports}});