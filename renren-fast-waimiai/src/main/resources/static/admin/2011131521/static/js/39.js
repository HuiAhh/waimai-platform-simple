webpackJsonp([39],{cr2W:function(t,e,a){"use strict";Object.defineProperty(e,"__esModule",{value:!0});var o={data:function(){return{visible:!1,dataForm:{id:0,shopId:"",applayTime:"",startPromote:"",promoteStatus:"",gmtCreate:"",gmtModified:""},dataRule:{shopId:[{required:!0,message:"推广商店id不能为空",trigger:"blur"}],applayTime:[{required:!0,message:"推广时长不能为空",trigger:"blur"}],startPromote:[{required:!0,message:"开始推广时间不能为空",trigger:"blur"}],promoteStatus:[{required:!0,message:"推广状态不能为空",trigger:"blur"}],gmtCreate:[{required:!0,message:"申请通过时间不能为空",trigger:"blur"}],gmtModified:[{required:!0,message:"修改时间不能为空",trigger:"blur"}]}}},methods:{init:function(t){var e=this;this.dataForm.id=t||0,this.visible=!0,this.$nextTick(function(){e.$refs.dataForm.resetFields(),e.dataForm.id&&e.$http({url:e.$http.adornUrl("/waimai/promote/info/"+e.dataForm.id),method:"get",params:e.$http.adornParams()}).then(function(t){var a=t.data;a&&0===a.code&&(e.dataForm.shopId=a.promote.shopId,e.dataForm.applayTime=a.promote.applayTime,e.dataForm.startPromote=a.promote.startPromote,e.dataForm.promoteStatus=a.promote.promoteStatus,e.dataForm.gmtCreate=a.promote.gmtCreate,e.dataForm.gmtModified=a.promote.gmtModified)})})},dataFormSubmit:function(){var t=this;this.$refs.dataForm.validate(function(e){e&&t.$http({url:t.$http.adornUrl("/waimai/promote/"+(t.dataForm.id?"update":"save")),method:"post",data:t.$http.adornData({id:t.dataForm.id||void 0,shopId:t.dataForm.shopId,applayTime:t.dataForm.applayTime,startPromote:t.dataForm.startPromote,promoteStatus:t.dataForm.promoteStatus,gmtCreate:t.dataForm.gmtCreate,gmtModified:t.dataForm.gmtModified})}).then(function(e){var a=e.data;a&&0===a.code?t.$message({message:"操作成功",type:"success",duration:1500,onClose:function(){t.visible=!1,t.$emit("refreshDataList")}}):t.$message.error(a.msg)})})}}},r={render:function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("el-dialog",{attrs:{title:t.dataForm.id?"修改":"新增","close-on-click-modal":!1,visible:t.visible},on:{"update:visible":function(e){t.visible=e}}},[a("el-form",{ref:"dataForm",attrs:{model:t.dataForm,rules:t.dataRule,"label-width":"80px"},nativeOn:{keyup:function(e){if(!("button"in e)&&t._k(e.keyCode,"enter",13,e.key,"Enter"))return null;t.dataFormSubmit()}}},[a("el-form-item",{attrs:{label:"推广商店id",prop:"shopId"}},[a("el-input",{attrs:{placeholder:"推广商店id"},model:{value:t.dataForm.shopId,callback:function(e){t.$set(t.dataForm,"shopId",e)},expression:"dataForm.shopId"}})],1),t._v(" "),a("el-form-item",{attrs:{label:"推广时长",prop:"applayTime"}},[a("el-input",{attrs:{placeholder:"推广时长"},model:{value:t.dataForm.applayTime,callback:function(e){t.$set(t.dataForm,"applayTime",e)},expression:"dataForm.applayTime"}})],1),t._v(" "),a("el-form-item",{attrs:{label:"开始推广时间",prop:"startPromote"}},[a("el-input",{attrs:{placeholder:"开始推广时间"},model:{value:t.dataForm.startPromote,callback:function(e){t.$set(t.dataForm,"startPromote",e)},expression:"dataForm.startPromote"}})],1),t._v(" "),a("el-form-item",{attrs:{label:"推广状态",prop:"promoteStatus"}},[a("el-input",{attrs:{placeholder:"推广状态"},model:{value:t.dataForm.promoteStatus,callback:function(e){t.$set(t.dataForm,"promoteStatus",e)},expression:"dataForm.promoteStatus"}})],1),t._v(" "),a("el-form-item",{attrs:{label:"申请通过时间",prop:"gmtCreate"}},[a("el-input",{attrs:{placeholder:"申请通过时间"},model:{value:t.dataForm.gmtCreate,callback:function(e){t.$set(t.dataForm,"gmtCreate",e)},expression:"dataForm.gmtCreate"}})],1),t._v(" "),a("el-form-item",{attrs:{label:"修改时间",prop:"gmtModified"}},[a("el-input",{attrs:{placeholder:"修改时间"},model:{value:t.dataForm.gmtModified,callback:function(e){t.$set(t.dataForm,"gmtModified",e)},expression:"dataForm.gmtModified"}})],1)],1),t._v(" "),a("span",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[a("el-button",{on:{click:function(e){t.visible=!1}}},[t._v("取消")]),t._v(" "),a("el-button",{attrs:{type:"primary"},on:{click:function(e){t.dataFormSubmit()}}},[t._v("确定")])],1)],1)},staticRenderFns:[]},i=a("VU/8")(o,r,!1,null,null,null);e.default=i.exports}});