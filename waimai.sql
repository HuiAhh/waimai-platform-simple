/*
Navicat MySQL Data Transfer

Source Server         : waimai
Source Server Version : 50649
Source Host           : 47.103.192.205:3306
Source Database       : waimai

Target Server Type    : MYSQL
Target Server Version : 50649
File Encoding         : 65001

Date: 2020-11-13 20:13:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `deliver_task`
-- ----------------------------
DROP TABLE IF EXISTS `deliver_task`;
CREATE TABLE `deliver_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` varchar(50) DEFAULT NULL COMMENT '订单ID',
  `deliver_id` int(11) DEFAULT '0' COMMENT '送餐员ID',
  `status` tinyint(4) DEFAULT '10' COMMENT '状态',
  `send_cost` decimal(10,0) DEFAULT '0' COMMENT '配送费',
  `gmt_create` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '加入时间',
  `gmt_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单配送表';

-- ----------------------------
-- Records of deliver_task
-- ----------------------------

-- ----------------------------
-- Table structure for `food`
-- ----------------------------
DROP TABLE IF EXISTS `food`;
CREATE TABLE `food` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '商店ID',
  `cate_id` int(11) DEFAULT '0' COMMENT '分类ID',
  `title` varchar(50) DEFAULT NULL COMMENT '食品名字',
  `describle` varchar(100) DEFAULT NULL COMMENT '描述',
  `discount` decimal(10,0) DEFAULT '10' COMMENT '折扣',
  `cover` varchar(500) DEFAULT NULL COMMENT '食品封面图',
  `origin_price` double(10,2) DEFAULT '0.00' COMMENT '原价',
  `sell_price` double(10,2) DEFAULT '0.00' COMMENT '售价',
  `showstatus` int(4) DEFAULT '10' COMMENT '状态 0下架1上架',
  `selection` varchar(500) DEFAULT NULL COMMENT '规格选项',
  `total_sales` int(11) DEFAULT NULL COMMENT '总的销量',
  `praise_rate` float DEFAULT '100' COMMENT '好评率',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COMMENT='菜品信息表';

-- ----------------------------
-- Records of food
-- ----------------------------
INSERT INTO `food` VALUES ('1', '1', '1', '正信鸡排', '好吃不贵', '10', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604723110205&di=7ba9224df0eb69f5470d91f5ea3a659e&imgtype=0&src=http%3A%2F%2Fe.hiphotos.baidu.com%2Fbainuo%2Fcrop%3D0%2C37%2C470%2C285%3Bw%3D470%3Bq%3D80%2Fsign%3D6c621e39b5de9c82b22aa3cf51b1ac39%2F8694a4c27d1ed21bf0ced4e5ab6eddc451da3faf.jpg', '18.00', '12.00', '0', '大份', '1035', '85', '2020-11-07 09:36:11', '2020-11-07 09:36:13');
INSERT INTO `food` VALUES ('2', '1', '1', '烤肠', '超棒', '10', 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=4075010374,3289619316&fm=26&gp=0.jpg', '8.00', '5.60', '0', '大份', '869', '84', '2020-11-07 09:40:38', '2020-11-07 09:40:37');
INSERT INTO `food` VALUES ('3', '1', '1', '正信汉堡', '上火贼好', '10', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604723376765&di=9f2b863d1cbc71012f32ff36ea2b067e&imgtype=0&src=http%3A%2F%2Fimages.3158.cn%2Fdata%2Fattachment%2Ftougao%2Farticle%2F2017%2F05%2F22%2F109cc228ae8456b0f88cad76d188e827.jpg', '15.00', '12.00', '0', '1份', '658', '84', '2020-11-07 09:42:08', '2020-11-07 09:42:06');
INSERT INTO `food` VALUES ('4', '1', '1', '正信鸡肉卷', '嗯嗯', '10', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604723442040&di=9f6c60d8501b2b1da4a6e6667020058e&imgtype=0&src=http%3A%2F%2Fwww.dmwfoods.com%2Fhome%2F9%2Fe%2Fbbltdx%2Fresource%2F2016%2F09%2F09%2F57d280d972c6b.jpg', '15.00', '12.00', '0', '1份', '758', '82', '2020-11-07 09:43:05', '2020-11-07 09:43:03');
INSERT INTO `food` VALUES ('5', '1', '1', '阿拉伯烤肉', '好吃', '10', 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2254905268,2557779527&fm=26&gp=0.jpg', '20.00', '16.00', '0', '4串', '688', '79', '2020-11-07 09:44:00', '2020-11-07 09:43:59');
INSERT INTO `food` VALUES ('6', '1', '1', '孜然锁骨', '好味', '10', 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=464251800,3487736601&fm=26&gp=0.jpg', '16.00', '12.00', '0', '3串', '384', '75', '2020-11-07 09:45:21', '2020-11-07 09:45:19');
INSERT INTO `food` VALUES ('7', '1', '1', '烤面筋', '嚼劲', '10', 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3072961766,2151635605&fm=26&gp=0.jpg', '12.00', '11.00', '0', '4串', '458', '83', '2020-11-07 09:46:35', '2020-11-07 09:46:34');
INSERT INTO `food` VALUES ('8', '1', '1', '俄罗斯烤肉', '好味道', '10', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604723707453&di=1ee694c241f5d371389aa60a863fd2a5&imgtype=0&src=http%3A%2F%2Fpics4.baidu.com%2Ffeed%2Fa8ec8a13632762d020f56b80086dbbfe503dc649.jpeg%3Ftoken%3D72a43f4b89eee1ca1d735b4663dbb0f2%26s%3D770607E35AB6B0D258364DBB0300F04B', '13.00', '11.00', '0', '3串', '325', '78', '2020-11-07 09:47:49', '2020-11-07 09:47:48');
INSERT INTO `food` VALUES ('9', '1', '1', '香辣鸡胗', '美味', '10', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604723801481&di=a455913a41af59e86b287c6b027a65ce&imgtype=0&src=http%3A%2F%2F5b0988e595225.cdn.sohucs.com%2Fq_70%2Cc_zoom%2Cw_640%2Fimages%2F20171223%2Ffad0c148c02246cbb4ffd23dfaf147eb.jpeg', '19.00', '17.00', '0', '3串', '265', '77', '2020-11-07 09:49:11', '2020-11-07 09:49:09');
INSERT INTO `food` VALUES ('10', '1', '1', '香脆鸡米花', '脆', '10', 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1607948728,2940564414&fm=26&gp=0.jpg', '12.00', '10.00', '0', '大份', '629', '86', '2020-11-07 09:50:22', '2020-11-07 09:50:21');
INSERT INTO `food` VALUES ('11', '1', '1', '藤椒味鸡条', '美味', '10', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604723954414&di=4a909894f442e47e919907474dd5afff&imgtype=0&src=http%3A%2F%2Fp0.meituan.net%2Fwmproduct%2Ffea052addd23d8f2a80e617c4f9b105c244859.jpg%2540249w_249h_1e_1c_1l%257Cwatermark%3D1%26%26r%3D1%26p%3D9%26x%3D2%26y%3D2%26relative%3D1%26o%3D20', '10.00', '6.00', '0', '2根', '268', '71', '2020-11-07 09:51:43', '2020-11-07 09:51:41');
INSERT INTO `food` VALUES ('12', '1', '1', '拉丝芝士棒', '棒', '10', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=468364138,744061989&fm=26&gp=0.jpg', '10.00', '6.00', '0', '大根', '423', '81', '2020-11-07 09:52:40', '2020-11-07 09:52:38');
INSERT INTO `food` VALUES ('13', '3', '1', '双拼奶茶', '喝爆', '10', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604724230677&di=522004636890bff26a9cfc7db7fcaeb3&imgtype=0&src=http%3A%2F%2Fimg.yzcdn.cn%2Fupload_files%2F2015%2F11%2F19%2FFsrOK_-sec5e3OJpr9HzneFFokmb.jpg%3FimageView2%2F2%2Fw%2F580%2Fh%2F580%2Fq%2F75%2Fformat%2Fjpg', '15.00', '10.00', '0', '1杯', '1058', '85', '2020-11-07 09:56:18', '2020-11-07 09:56:16');
INSERT INTO `food` VALUES ('14', '3', '1', '泷珠奶茶', '牌面', '10', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604724364827&di=9c1675e064aec824fa1196d49f018ab5&imgtype=0&src=http%3A%2F%2F5b0988e595225.cdn.sohucs.com%2Fimages%2F20181211%2Fd1082fc503bc4e319d6bc5bf31dab3db.jpeg', '15.00', '10.00', '0', '1杯', '1731', '86', '2020-11-07 09:58:32', '2020-11-07 09:58:31');
INSERT INTO `food` VALUES ('15', '3', '1', '烤奶', '嗯', '10', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604724413706&di=0979fa7011f373e845a2f69589add0d8&imgtype=0&src=http%3A%2F%2Fpic139.huitu.com%2Fres%2F20200327%2F1124748_20200327023930781020_1.jpg', '13.00', '9.00', '0', '1杯', '4416', '90', '2020-11-07 09:59:23', '2020-11-07 09:59:21');
INSERT INTO `food` VALUES ('16', '3', '1', '烧仙草', '66', '10', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604724464765&di=4e64ab1b07932595824d0c301429416b&imgtype=0&src=http%3A%2F%2Fqcloud.dpfile.com%2Fpc%2F8ZDqKOdCOV6REgVw6HEBQiJtEGPI-hgN9La6NHxGfHwaWV7jnGXDu6q3ZNCC13oojoJrvItByyS4HHaWdXyO_DrXIaWutJls2xCVbatkhjUNNiIYVnHvzugZCuBITtvjski7YaLlHpkrQUr5euoQrg.jpg', '16.00', '11.00', '0', '1份', '1230', '91', '2020-11-07 10:00:10', '2020-11-07 10:00:09');
INSERT INTO `food` VALUES ('17', '3', '1', '芋泥啵啵奶茶', '好喝', '10', 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2693002049,321135990&fm=26&gp=0.jpg', '16.00', '12.00', '0', '1杯', '165', '72', '2020-11-07 10:01:11', '2020-11-07 10:01:10');
INSERT INTO `food` VALUES ('18', '3', '1', '芋泥啵啵奶绿', '喝喝喝', '10', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604724582198&di=4576a70b7eaeae16c6c1f9ad641e23cf&imgtype=0&src=http%3A%2F%2F5b0988e595225.cdn.sohucs.com%2Fq_70%2Cc_zoom%2Cw_640%2Fimages%2F20181218%2F2e01f1040a34460493859bf116a1427a.jpeg', '16.00', '12.00', '0', '1杯', '1324', '87', '2020-11-07 10:02:11', '2020-11-07 10:02:10');
INSERT INTO `food` VALUES ('19', '3', '1', '禾风奶绿', '3333', '10', 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3270377995,4028060305&fm=26&gp=0.jpg', '13.00', '9.00', '0', '1杯', '1282', '95', '2020-11-07 10:03:12', '2020-11-07 10:03:11');
INSERT INTO `food` VALUES ('20', '3', '1', '蜜桃乌龙', '777', '10', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604724696897&di=6e1cabc52925c026fb829c0d69570457&imgtype=0&src=http%3A%2F%2Fku.90sjimg.com%2Felement_origin_min_pic%2F18%2F08%2F28%2Fe32cb2445ef7ad40d2773a13d512a880.jpg%2521%2Ffwfh%2F804x1206%2Fquality%2F90%2Funsharp%2Ftrue%2Fcompress%2Ftrue', '17.00', '12.00', '0', '1杯', '710', '88', '2020-11-07 10:04:04', '2020-11-07 10:04:02');
INSERT INTO `food` VALUES ('21', '3', '1', '葡萄啵啵', '嗯嗯嗯呃', '10', 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1134022499,1374171013&fm=15&gp=0.jpg', '20.00', '16.00', '0', '1杯', '689', '85', '2020-11-07 10:04:55', '2020-11-07 10:04:53');
INSERT INTO `food` VALUES ('22', '3', '1', '杨枝甘露', '棒棒哒', '10', 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3155956534,165678882&fm=26&gp=0.jpg', '20.00', '15.00', '0', '1杯', '674', '83', '2020-11-07 10:05:49', '2020-11-07 10:05:47');
INSERT INTO `food` VALUES ('23', '3', '1', '西瓜汁', '6', '10', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604724850810&di=0314004619962a1eb15efec00f51cedc&imgtype=0&src=http%3A%2F%2Fpic.51yuansu.com%2Fpic3%2Fcover%2F01%2F99%2F53%2F59848c35edbc9_610.jpg', '14.00', '10.00', '0', '1杯', '279', '86', '2020-11-07 10:06:32', '2020-11-07 10:06:31');
INSERT INTO `food` VALUES ('24', '3', '1', '蜂蜜柚子茶', '好', '10', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604724903060&di=b77615a2ae0b2df74af57fe0a7df7a02&imgtype=0&src=http%3A%2F%2Fpic.health1.tw%2Fuploads%2F3%2Fe%2F1539e73a9001b1e3%2F0.jpg', '13.00', '9.00', '0', '1杯', '147', '77', '2020-11-07 10:07:32', '2020-11-07 10:07:31');
INSERT INTO `food` VALUES ('25', '3', '1', '金桔柠檬', '喝棒', '10', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604724986303&di=723401eea759c94b798c027947d1f72b&imgtype=0&src=http%3A%2F%2Fpic191.nipic.com%2Ffile%2F20181115%2F13516955_151740115000_2.jpg', '13.00', '9.00', '0', '1杯', '289', '76', '2020-11-07 10:08:47', '2020-11-07 10:08:45');
INSERT INTO `food` VALUES ('26', '4', '1', '大面筋', '卫龙', '10', 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=136017795,605876241&fm=26&gp=0.jpg', '6.00', '4.00', '0', '106g', '32', '76', '2020-11-07 10:10:20', '2020-11-07 10:10:19');
INSERT INTO `food` VALUES ('27', '4', '1', '大辣棒', '卫龙', '10', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604725138376&di=c0c901085a793cbafe052b45386e5a37&imgtype=0&src=http%3A%2F%2Fimg.yzcdn.cn%2Fupload_files%2F2018%2F04%2F18%2FFiTTPHQlb1KSTwg178Ev752feJq9.jpg%3FimageView2%2F2%2Fw%2F580%2Fh%2F580%2Fq%2F75%2Fformat%2Fjpg', '6.00', '4.00', '0', '106g', '15', '79', '2020-11-07 10:11:36', '2020-11-07 10:11:35');
INSERT INTO `food` VALUES ('28', '4', '1', '番茄鸡蛋面', '满减', '10', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604725239927&di=f72c8ae65201ca38da170f23681534f9&imgtype=0&src=http%3A%2F%2Fwww.5999.tv%2FUpload_Map%2FPro%2FSmall%2F2014%2F2-20%2F20140220102438223.jpg', '25.00', '22.00', '0', '1袋', '13', '74', '2020-11-07 10:13:05', '2020-11-07 10:13:04');
INSERT INTO `food` VALUES ('29', '4', '1', '老坛酸菜牛肉面', '嗯嗯', '10', 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1252098575,2366127069&fm=26&gp=0.jpg', '6.00', '4.00', '0', '桶装160g', '45', '86', '2020-11-07 10:16:21', '2020-11-07 10:16:20');
INSERT INTO `food` VALUES ('30', '4', '1', '合味道', '道出来', '10', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604725511336&di=7c5652620db724e8947b5df7589f4b28&imgtype=0&src=http%3A%2F%2Fimg.yzcdn.cn%2Fupload_files%2F2016%2F11%2F22%2FFhFUrNTiSjKku2U_-Fnsl5SzZjYL.jpg%3FimageView2%2F2%2Fw%2F580%2Fh%2F580%2Fq%2F75%2Fformat%2Fjpg', '6.00', '6.00', '0', '82g', '56', '88', '2020-11-07 10:17:45', '2020-11-07 10:17:43');
INSERT INTO `food` VALUES ('31', '4', '1', '百威', '啤酒', '10', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604725583936&di=dd3e4d6585b4f0823f3331d01a6b0e78&imgtype=0&src=http%3A%2F%2Fimage2.suning.cn%2Fuimg%2Fb2c%2Fnewcatentries%2F0070177421-000000000860849773_5_800x800.jpg', '8.00', '6.00', '0', '瓶600ml', '16', '78', '2020-11-07 10:18:54', '2020-11-07 10:18:52');
INSERT INTO `food` VALUES ('32', '4', '1', '怡宝', '好水', '10', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2050273938,3884891723&fm=26&gp=0.jpg', '3.00', '2.00', '0', '450ml', '17', '79', '2020-11-07 10:19:50', '2020-11-07 10:19:49');
INSERT INTO `food` VALUES ('33', '4', '1', '维他奶', '奶起来', '10', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604725698998&di=309f618d65e1387c7bf54b162d13c67d&imgtype=0&src=http%3A%2F%2Foimagec6.ydstatic.com%2Fimage%3Fid%3D-7234397140708968291%26product%3Dgouwu', '60.00', '56.00', '0', '24支', '25', '81', '2020-11-07 10:20:52', '2020-11-07 10:20:50');
INSERT INTO `food` VALUES ('34', '4', '1', '百世可乐', '好喝', '10', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2981786357,1171749272&fm=26&gp=0.jpg', '10.00', '7.00', '0', '大瓶', '21', '88', '2020-11-07 10:21:44', '2020-11-07 10:21:42');
INSERT INTO `food` VALUES ('35', '4', '1', '水桶', '好用', '10', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604725827288&di=dd536c8fbb20e7a41dd671501f431abf&imgtype=0&src=http%3A%2F%2Fimg2.imgtn.bdimg.com%2Fit%2Fu%3D878730697%2C1153373702%26fm%3D214%26gp%3D0.jpg', '16.00', '12.00', '0', '桶', '7', '72', '2020-11-07 10:22:49', '2020-11-07 10:22:47');
INSERT INTO `food` VALUES ('36', '4', '1', '白巧克力', '美味', '10', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604725880866&di=6749bc06c117bbf67c6f527fc4ee67fb&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2F7db79311afda92a98e7d43b9ad311ddb7a2fac188a6d-Yj8IRw_fw658', '5.00', '3.00', '0', '70g', '13', '78', '2020-11-07 10:23:45', '2020-11-07 10:23:43');
INSERT INTO `food` VALUES ('37', '4', '1', '玉米棒', '嗯嗯', '10', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604726022599&di=983b0300178b164529a5de69ffd19d32&imgtype=0&src=http%3A%2F%2Fd7.yihaodianimg.com%2FN01%2FM08%2F34%2FB3%2FCgQCrlLFFo6AFkGTAAGmobLPVo028700.jpg', '15.00', '12.00', '0', '160g', '25', '79', '2020-11-07 10:26:06', '2020-11-07 10:26:04');
INSERT INTO `food` VALUES ('38', '5', '1', '哈密瓜', '瓜瓜', '10', 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=641226286,1399305492&fm=26&gp=0.jpg', '6.80', '3.80', '0', '120g', '153', '85', '2020-11-07 10:29:07', '2020-11-07 10:29:08');
INSERT INTO `food` VALUES ('39', '5', '1', '香蕉', '嚼嚼', '10', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604726259159&di=ac5c3d09adc61de1d8bd608b80755055&imgtype=0&src=http%3A%2F%2Fdpic.tiankong.com%2Fbs%2Fep%2FQJ6482946070.jpg%3Fx-oss-process%3Dstyle%2Fshow', '12.80', '8.80', '0', '500g', '26', '74', '2020-11-07 10:30:03', '2020-11-07 10:30:05');
INSERT INTO `food` VALUES ('40', '5', '1', '西瓜', '西西', '10', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604726311192&di=3270c6d6b0625a39f711552cd716f4bd&imgtype=0&src=http%3A%2F%2Fi1.sinaimg.cn%2Flx%2Fzc%2F2011%2F0601%2FU5924P8T1D1071184F913DT20110530202026.jpg', '12.80', '8.80', '0', '500g', '26', '81', '2020-11-07 10:30:57', '2020-11-07 10:30:58');
INSERT INTO `food` VALUES ('41', '5', '1', '火龙果', '龙龙', '10', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604726375685&di=66fdb22ed2173c36a95b7d24a0db7427&imgtype=0&src=http%3A%2F%2Fku.90sjimg.com%2Felement_origin_min_pic%2F16%2F11%2F02%2F3f33597c42b9859ca1324e62bfff24ba.jpg', '20.00', '18.80', '0', '500g', '34', '78', '2020-11-07 10:32:04', '2020-11-07 10:32:06');
INSERT INTO `food` VALUES ('42', '5', '1', '青提', '提提', '10', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604726429252&di=aa53269221dc9aaac350409ce266e0ec&imgtype=0&src=http%3A%2F%2Fbpic.588ku.com%2Felement_origin_min_pic%2F16%2F11%2F10%2F719f1b1a4b43f804436e7ae089fdc18c.jpg', '22.80', '12.80', '0', '300g', '20', '86', '2020-11-07 10:33:03', '2020-11-07 10:33:04');
INSERT INTO `food` VALUES ('43', '5', '1', '水蜜桃', '桃桃', '10', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604726495591&di=3834e25c696bd000f320e8520dd73b92&imgtype=0&src=http%3A%2F%2Fpic106.huitu.com%2Fpic%2F20180506%2F1149609_20180506124308406070_0.jpg', '12.80', '7.80', '0', '120g', '18', '95', '2020-11-07 10:34:02', '2020-11-07 10:34:03');
INSERT INTO `food` VALUES ('44', '5', '1', '凤梨', '粒粒', '10', 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1524561392,2649213402&fm=26&gp=0.jpg', '18.80', '16.80', '0', '280g', '15', '91', '2020-11-07 10:34:51', '2020-11-07 10:34:52');
INSERT INTO `food` VALUES ('45', '5', '1', '圣女果', '女女', '10', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604726596584&di=68379605a98a0519569d7a6fd2b3bd67&imgtype=0&src=http%3A%2F%2Fpic.616pic.com%2Fys_b_img%2F00%2F73%2F29%2F4N2HPCfVtw.jpg', '8.80', '7.80', '0', '300g', '13', '84', '2020-11-07 10:35:41', '2020-11-07 10:35:42');
INSERT INTO `food` VALUES ('46', '5', '1', '青皮蜜桔', '皮皮', '10', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604726652427&di=3da0ee894b32764fa2e05357bdc83429&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2F540279da1f6f8f059b48d3d066ae3176c36bdf7f4ccf4-3hSC2X_fw658', '13.80', '8.80', '0', '3头', '11', '83', '2020-11-07 10:36:36', '2020-11-07 10:36:37');
INSERT INTO `food` VALUES ('47', '5', '1', '椰青', '青青', '10', 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=204442612,3173381041&fm=26&gp=0.jpg', '18.80', '15.80', '0', '1头', '11', '78', '2020-11-07 10:37:35', '2020-11-07 10:37:37');
INSERT INTO `food` VALUES ('48', '5', '1', '橙子', '橙橙', '10', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604726775294&di=846bf402986f6eb3b8469509271a0df3&imgtype=0&src=http%3A%2F%2Fimage.huahuibk.com%2Fuploads%2F20190228%2F22%2F1551363205-SPNBCIKGrm.jpg', '19.80', '16.80', '0', '300g', '10', '82', '2020-11-07 10:38:40', '2020-11-07 10:38:42');

-- ----------------------------
-- Table structure for `food_category`
-- ----------------------------
DROP TABLE IF EXISTS `food_category`;
CREATE TABLE `food_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) NOT NULL COMMENT '分类类型',
  `describle` varchar(5000) DEFAULT NULL COMMENT '描述',
  `shop_id` int(11) NOT NULL COMMENT '店铺id',
  `level` int(11) NOT NULL,
  `gmt_create` datetime DEFAULT NULL,
  `gmt_modified` datetime NOT NULL,
  `is_deleted` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='商家的食物分类';

-- ----------------------------
-- Records of food_category
-- ----------------------------
INSERT INTO `food_category` VALUES ('1', '奶茶', '可口的奶茶', '0', '1', '2020-10-29 11:10:05', '2020-10-29 11:29:38', '1');

-- ----------------------------
-- Table structure for `news`
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `news_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统消息id',
  `receive_id` int(11) DEFAULT NULL COMMENT '接收者id',
  `message` varchar(500) DEFAULT NULL COMMENT '消息内容',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`news_id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('1', '1', '你有新的订单请及时处理', '2020-11-08 11:00:22');
INSERT INTO `news` VALUES ('3', '1', '你有新的订单请及时处理', '2020-11-08 13:58:22');
INSERT INTO `news` VALUES ('4', '1', '你有新的订单请及时处理', '2020-11-08 07:02:57');
INSERT INTO `news` VALUES ('5', '1', '你有新的订单请及时处理', '2020-11-08 07:06:36');
INSERT INTO `news` VALUES ('6', '1', '你有新的订单请及时处理', '2020-11-08 07:08:43');
INSERT INTO `news` VALUES ('7', '1', '你有新的订单请及时处理', '2020-11-09 23:07:47');
INSERT INTO `news` VALUES ('8', '4', '你有新的订单请及时处理', '2020-11-09 23:08:20');
INSERT INTO `news` VALUES ('9', '1', '你有新的订单请及时处理', '2020-11-09 23:23:05');
INSERT INTO `news` VALUES ('10', '4', '你有新的订单请及时处理', '2020-11-09 23:23:53');
INSERT INTO `news` VALUES ('11', '1', '你有新的订单请及时处理', '2020-11-09 23:24:14');
INSERT INTO `news` VALUES ('12', '5', '你有新的订单请及时处理', '2020-11-10 00:30:00');
INSERT INTO `news` VALUES ('13', '5', '你有新的订单请及时处理', '2020-11-10 00:30:02');
INSERT INTO `news` VALUES ('14', '5', '你有新的订单请及时处理', '2020-11-10 00:30:02');
INSERT INTO `news` VALUES ('15', '5', '你有新的订单请及时处理', '2020-11-10 00:30:03');
INSERT INTO `news` VALUES ('16', '5', '你有新的订单请及时处理', '2020-11-10 00:30:03');
INSERT INTO `news` VALUES ('17', '5', '你有新的订单请及时处理', '2020-11-10 00:30:03');
INSERT INTO `news` VALUES ('18', '5', '你有新的订单请及时处理', '2020-11-10 00:30:03');
INSERT INTO `news` VALUES ('19', '5', '你有新的订单请及时处理', '2020-11-10 00:30:03');
INSERT INTO `news` VALUES ('20', '5', '你有新的订单请及时处理', '2020-11-10 00:30:04');
INSERT INTO `news` VALUES ('21', '5', '你有新的订单请及时处理', '2020-11-10 00:30:09');
INSERT INTO `news` VALUES ('22', '1', '你有新的订单请及时处理', '2020-11-10 06:56:13');
INSERT INTO `news` VALUES ('23', '1', '你有新的订单请及时处理', '2020-11-11 10:03:00');
INSERT INTO `news` VALUES ('24', '1', '你的订单已被骑手接单', '2020-11-11 21:31:44');
INSERT INTO `news` VALUES ('25', '1', '你的订单已被骑手接单', '2020-11-11 21:36:37');
INSERT INTO `news` VALUES ('26', '1', '你的订单已被骑手接单', '2020-11-11 21:58:22');
INSERT INTO `news` VALUES ('27', '1', '你的订单已被骑手接单', '2020-11-11 21:59:54');
INSERT INTO `news` VALUES ('28', '1', '你的订单已被骑手接单', '2020-11-11 22:01:12');
INSERT INTO `news` VALUES ('29', '1', '你的订单已被骑手接单', '2020-11-11 22:01:24');
INSERT INTO `news` VALUES ('30', '1', '你的订单已被骑手接单', '2020-11-11 22:01:26');
INSERT INTO `news` VALUES ('31', '1', '你的订单已被骑手接单', '2020-11-11 22:04:30');
INSERT INTO `news` VALUES ('32', '1', '你的订单已被骑手接单', '2020-11-11 22:04:45');
INSERT INTO `news` VALUES ('33', '3', '你的订单已被骑手接单', '2020-11-11 22:11:50');
INSERT INTO `news` VALUES ('34', '3', '你有新的订单请及时处理', '2020-11-11 14:53:38');
INSERT INTO `news` VALUES ('35', '6', '你的订单已被骑手接单', '2020-11-11 14:56:41');
INSERT INTO `news` VALUES ('36', '6', '你的订单已被骑手接单', '2020-11-11 14:56:43');
INSERT INTO `news` VALUES ('37', '6', '你的订单已被骑手接单', '2020-11-11 14:56:43');
INSERT INTO `news` VALUES ('38', '6', '你的订单已被骑手接单', '2020-11-11 14:56:44');
INSERT INTO `news` VALUES ('39', '6', '你的订单已被骑手接单', '2020-11-11 14:56:44');
INSERT INTO `news` VALUES ('40', '3', '你的订单已被骑手接单', '2020-11-11 14:56:44');
INSERT INTO `news` VALUES ('41', '3', '你的订单已被骑手接单', '2020-11-11 14:56:44');
INSERT INTO `news` VALUES ('42', '3', '你的订单已被骑手接单', '2020-11-11 14:56:44');
INSERT INTO `news` VALUES ('43', '3', '你的订单已被骑手接单', '2020-11-11 14:56:45');
INSERT INTO `news` VALUES ('44', '3', '你的订单已被骑手接单', '2020-11-11 14:56:45');
INSERT INTO `news` VALUES ('45', '3', '你的订单已被骑手接单', '2020-11-11 14:56:45');
INSERT INTO `news` VALUES ('46', '3', '你的订单已被骑手接单', '2020-11-11 14:56:45');
INSERT INTO `news` VALUES ('47', '3', '你的订单已被骑手接单', '2020-11-11 14:56:45');
INSERT INTO `news` VALUES ('48', '3', '你的订单已被骑手接单', '2020-11-11 14:56:46');
INSERT INTO `news` VALUES ('49', '1', '你的订单已被骑手接单', '2020-11-11 14:56:46');
INSERT INTO `news` VALUES ('50', '1', '你的订单已被骑手接单', '2020-11-11 14:56:47');
INSERT INTO `news` VALUES ('51', '1', '你有新的订单请及时处理', '2020-11-12 00:04:45');
INSERT INTO `news` VALUES ('52', '1', '你有新的订单请及时处理', '2020-11-12 14:32:07');
INSERT INTO `news` VALUES ('53', '1', '你的订单已被骑手接单', '2020-11-12 14:34:14');
INSERT INTO `news` VALUES ('54', '6', '你的订单已被骑手接单', '2020-11-12 14:34:16');
INSERT INTO `news` VALUES ('55', '3', '你的订单已被骑手接单', '2020-11-12 14:34:17');
INSERT INTO `news` VALUES ('56', '1', '你有新的订单请及时处理', '2020-11-12 14:45:55');
INSERT INTO `news` VALUES ('57', '2', '你的订单已被骑手接单', '2020-11-12 14:46:19');
INSERT INTO `news` VALUES ('58', '1', '你有新的订单请及时处理', '2020-11-12 14:51:47');
INSERT INTO `news` VALUES ('59', '2', '你的订单已被骑手接单', '2020-11-12 06:53:17');
INSERT INTO `news` VALUES ('60', '1', '你有新的订单请及时处理', '2020-11-12 10:03:01');
INSERT INTO `news` VALUES ('61', '3', '你有新的订单请及时处理', '2020-11-12 22:23:37');
INSERT INTO `news` VALUES ('62', '6', '你的订单已成功取消', '2020-11-12 22:36:42');
INSERT INTO `news` VALUES ('63', '4', '用户Mrs翁已取消订单', '2020-11-12 22:36:42');
INSERT INTO `news` VALUES ('64', '6', '你的订单已成功取消', '2020-11-12 22:37:38');
INSERT INTO `news` VALUES ('65', '4', '用户Mrs翁已取消订单', '2020-11-12 22:37:38');
INSERT INTO `news` VALUES ('66', '6', '你的订单已成功取消', '2020-11-12 22:40:40');
INSERT INTO `news` VALUES ('67', '4', '用户Mrs翁已取消订单', '2020-11-12 22:40:40');
INSERT INTO `news` VALUES ('68', '6', '你的订单已成功取消', '2020-11-12 22:44:11');
INSERT INTO `news` VALUES ('69', '4', '用户Mrs翁已取消订单', '2020-11-12 22:44:11');
INSERT INTO `news` VALUES ('70', '6', '你的订单已成功取消', '2020-11-12 22:55:28');
INSERT INTO `news` VALUES ('71', '4', '用户Mrs翁已取消订单', '2020-11-12 22:55:28');
INSERT INTO `news` VALUES ('72', '3', '你有新的订单请及时处理', '2020-11-12 23:00:08');
INSERT INTO `news` VALUES ('73', '6', '你的订单已被骑手接单', '2020-11-12 23:01:27');
INSERT INTO `news` VALUES ('74', '4', '用户Mrs翁申请退款，请及时处理', '2020-11-12 23:19:58');
INSERT INTO `news` VALUES ('75', '4', '用户Mrs翁申请退款，请及时处理', '2020-11-12 23:22:02');
INSERT INTO `news` VALUES ('76', '1', '你有新的订单请及时处理', '2020-11-13 00:50:43');
INSERT INTO `news` VALUES ('77', '1', '你的订单已成功取消', '2020-11-13 00:50:48');
INSERT INTO `news` VALUES ('78', '2', '用户王中王已取消订单', '2020-11-13 00:50:48');
INSERT INTO `news` VALUES ('79', '1', '你的订单已被骑手接单', '2020-11-13 00:52:32');
INSERT INTO `news` VALUES ('80', '1', '你有新的订单请及时处理', '2020-11-13 00:53:34');
INSERT INTO `news` VALUES ('81', '1', '你的订单已被骑手接单', '2020-11-13 00:53:53');
INSERT INTO `news` VALUES ('82', '2', '用户王中王申请退款，请及时处理', '2020-11-13 00:54:17');
INSERT INTO `news` VALUES ('83', '30', '您的骑手注册申请未通过', '2020-11-13 01:19:49');
INSERT INTO `news` VALUES ('84', '31', '您的商家注册申请未通过', '2020-11-13 09:41:02');
INSERT INTO `news` VALUES ('85', '32', '您的商家注册申请已通过', '2020-11-13 09:53:34');
INSERT INTO `news` VALUES ('86', '3', '你有新的订单请及时处理', '2020-11-13 08:44:41');
INSERT INTO `news` VALUES ('87', '4', '你有新的订单请及时处理', '2020-11-13 08:46:56');
INSERT INTO `news` VALUES ('88', '1', '你有新的订单请及时处理', '2020-11-13 08:47:49');
INSERT INTO `news` VALUES ('89', '1', '你有新的订单请及时处理', '2020-11-13 08:48:20');
INSERT INTO `news` VALUES ('90', '1', '你有新的订单请及时处理', '2020-11-13 10:59:02');
INSERT INTO `news` VALUES ('91', '1', '你有新的订单请及时处理', '2020-11-13 20:02:10');
INSERT INTO `news` VALUES ('92', '1', '你有新的订单请及时处理', '2020-11-13 20:04:06');
INSERT INTO `news` VALUES ('93', '31', '你的订单已被骑手接单', '2020-11-13 20:06:22');
INSERT INTO `news` VALUES ('94', '2', '用户嘎嘎申请退款，请及时处理', '2020-11-13 20:08:00');

-- ----------------------------
-- Table structure for `order_comment`
-- ----------------------------
DROP TABLE IF EXISTS `order_comment`;
CREATE TABLE `order_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` varchar(50) DEFAULT NULL COMMENT '订单ID',
  `user_id` int(11) DEFAULT '0' COMMENT '用户ID',
  `content` varchar(500) DEFAULT NULL COMMENT '评论内容',
  `images` varchar(1000) DEFAULT NULL COMMENT '评论图片',
  `path` varchar(500) DEFAULT NULL COMMENT '回复的ID路径:1/2/3/5',
  `num_praise` int(11) DEFAULT '0' COMMENT '点赞次数',
  `status` tinyint(4) DEFAULT '0' COMMENT '状态',
  `re_comment_id` int(11) DEFAULT '0' COMMENT '引用的评论ID',
  `like_ids` varchar(500) DEFAULT NULL COMMENT '点赞用户的IDs',
  `gmt_create` datetime DEFAULT NULL,
  `gmt_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单--评论';

-- ----------------------------
-- Records of order_comment
-- ----------------------------

-- ----------------------------
-- Table structure for `order_detail`
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_username` varchar(20) DEFAULT NULL COMMENT '用户名',
  `user_mobile` varchar(20) DEFAULT NULL COMMENT '用户联系电话',
  `user_address_id` int(11) DEFAULT '0' COMMENT '用户地址ID',
  `user_address` varchar(500) DEFAULT NULL COMMENT '用户详细地址',
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `note` varchar(1000) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '订单备注',
  `shop_id` int(11) DEFAULT NULL,
  `shop_shopname` varchar(20) DEFAULT NULL COMMENT '商铺名字',
  `shop_mobile` varchar(20) DEFAULT NULL COMMENT '商铺联系电话',
  `shop_address` varchar(500) DEFAULT NULL COMMENT '商铺详细地址',
  `completestatus` varchar(50) DEFAULT '商家已接单' COMMENT '订单状态',
  `total_money` double(10,2) DEFAULT '0.00',
  `box_cost` double(10,2) DEFAULT '0.00',
  `send_cost` double(10,2) DEFAULT '0.00',
  `deliver_id` int(11) DEFAULT NULL COMMENT '送餐员ID',
  `deliver_name` varchar(20) DEFAULT NULL COMMENT '送餐员姓名',
  `deliver_mobile` varchar(20) DEFAULT NULL COMMENT '送餐员联系电话',
  `gmt_create` datetime DEFAULT NULL,
  `gmt_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8 COMMENT='订单详情表';

-- ----------------------------
-- Records of order_detail
-- ----------------------------
INSERT INTO `order_detail` VALUES ('7', '吴sir', '18752151001', '2', '广东金融学院北苑北教广场xxxxxxxxxxxxxxxxxxxxx', '1', '', '1', '正信鸡排', '18752151002', '迎龙路01号', '已完成', '30.00', '2.00', '1.00', '3', '赵泰', '18752151003', '2020-11-08 13:58:21', '2020-11-11 22:02:27');
INSERT INTO `order_detail` VALUES ('8', '吴sir', '18752151001', '2', '广东金融学院北苑北教广场xxxxxxxxxxxxxxxxxxxxx', '1', '啊哈哈哈嘎嘎嘎嘎嘎噶', '1', '正信鸡排', '18752151002', '迎龙路01号', '已完成', '30.00', '2.00', '1.00', '3', '赵泰', '18752151003', '2020-11-08 07:02:57', '2020-11-11 22:02:39');
INSERT INTO `order_detail` VALUES ('9', '吴sir', '18752151001', '2', '广东金融学院北苑北教广场xxxxxxxxxxxxxxxxxxxxx', '1', '啊哈哈哈嘎嘎嘎嘎嘎噶', '1', '正信鸡排', '18752151002', '迎龙路01号', '已完成', '30.00', '2.00', '1.00', '3', '赵泰', '18752151003', '2020-11-08 07:06:36', '2020-11-11 22:04:28');
INSERT INTO `order_detail` VALUES ('10', '王sir', '18752151001', '1', '广东工业大学', '1', '', '1', '正信鸡排', '18752151002', '迎龙路01号', '已完成', '30.00', '2.00', '1.00', '3', '赵泰', '18752151003', '2020-11-08 07:08:43', '2020-11-11 22:04:55');
INSERT INTO `order_detail` VALUES ('11', '吴sir', '18752151001', '2', '广东金融学院北苑北教广场xxxxxxxxxxxxxxxxxxxxx', '1', '', '1', '正信鸡排', '18752151002', '迎龙路01号', '已完成', '30.00', '2.00', '1.00', '3', '赵泰', '18752151003', '2020-11-08 11:00:22', '2020-11-11 22:04:57');
INSERT INTO `order_detail` VALUES ('87', '渣渣龟', '18752151006', '3', '广东金融学院北苑北教广场xxxxxxxxxxxxxxxxxxxxx', '6', '', '1', '正信鸡排', '18752151002', '迎龙路01号', '已完成', '31.00', '2.00', '1.00', '3', '赵泰', '18752151003', '2020-11-09 23:07:47', '2020-11-12 06:53:43');
INSERT INTO `order_detail` VALUES ('88', '渣渣龟', '18752151006', '3', '广东金融学院北苑北教广场xxxxxxxxxxxxxxxxxxxxx', '6', '', '4', '好伙伴超市', '18752151004', '迎龙路16号', '已完成', '47.00', '0.00', '1.00', '3', '赵泰', '18752151003', '2020-11-09 23:08:20', '2020-11-12 06:56:45');
INSERT INTO `order_detail` VALUES ('89', '渣渣龟', '18752151006', '3', '广东金融学院北苑北教广场xxxxxxxxxxxxxxxxxxxxx', '6', '搞饿了', '1', '正信鸡排', '18752151002', '迎龙路01号', '已完成', '21.00', '2.00', '1.00', '3', '赵泰', '18752151003', '2020-11-09 23:23:05', '2020-11-12 14:34:34');
INSERT INTO `order_detail` VALUES ('90', '渣渣龟', '18752151006', '3', '广东金融学院北苑北教广场xxxxxxxxxxxxxxxxxxxxx', '6', '', '4', '好伙伴超市', '18752151004', '迎龙路16号', '已完成', '50.00', '0.00', '1.00', '3', '赵泰', '18752151003', '2020-11-09 23:23:52', '2020-11-12 14:34:30');
INSERT INTO `order_detail` VALUES ('91', '渣渣龟', '18752151006', '3', '广东金融学院北苑北教广场xxxxxxxxxxxxxxxxxxxxx', '6', '', '1', '正信鸡排', '18752151002', '迎龙路01号', '已完成', '43.00', '2.00', '1.00', '3', '赵泰', '18752151003', '2020-11-09 23:24:14', '2020-11-12 06:56:48');
INSERT INTO `order_detail` VALUES ('92', '渣渣龟', '18752151002', '4', '广东工业大学', '3', '', '5', '老钱水果摊', '18752151005', '迎龙路12号', '已完成', '42.20', '1.00', '1.00', '3', '赵泰', '18752151003', '2020-11-10 00:30:00', '2020-11-11 22:20:37');
INSERT INTO `order_detail` VALUES ('93', '渣渣龟', '18752151002', '4', '广东工业大学', '3', '', '5', '老钱水果摊', '18752151005', '迎龙路12号', '已完成', '42.20', '1.00', '1.00', '3', '赵泰', '18752151003', '2020-11-10 00:30:02', '2020-11-12 06:56:49');
INSERT INTO `order_detail` VALUES ('94', '渣渣龟', '18752151002', '4', '广东工业大学', '3', '', '5', '老钱水果摊', '18752151005', '迎龙路12号', '已完成', '42.20', '1.00', '1.00', '3', '赵泰', '18752151003', '2020-11-10 00:30:02', '2020-11-12 06:56:51');
INSERT INTO `order_detail` VALUES ('95', '渣渣龟', '18752151002', '4', '广东工业大学', '3', '', '5', '老钱水果摊', '18752151005', '迎龙路12号', '已完成', '42.20', '1.00', '1.00', '3', '赵泰', '18752151003', '2020-11-10 00:30:03', '2020-11-12 06:56:52');
INSERT INTO `order_detail` VALUES ('96', '渣渣龟', '18752151002', '4', '广东工业大学', '3', '', '5', '老钱水果摊', '18752151005', '迎龙路12号', '已完成', '42.20', '1.00', '1.00', '3', '赵泰', '18752151003', '2020-11-10 00:30:03', '2020-11-12 06:56:54');
INSERT INTO `order_detail` VALUES ('97', '渣渣龟', '18752151002', '4', '广东工业大学', '3', '', '5', '老钱水果摊', '18752151005', '迎龙路12号', '已完成', '42.20', '1.00', '1.00', '3', '赵泰', '18752151003', '2020-11-10 00:30:03', '2020-11-12 06:56:55');
INSERT INTO `order_detail` VALUES ('98', '渣渣龟', '18752151002', '4', '广东工业大学', '3', '', '5', '老钱水果摊', '18752151005', '迎龙路12号', '已完成', '42.20', '1.00', '1.00', '3', '赵泰', '18752151003', '2020-11-10 00:30:03', '2020-11-12 06:56:57');
INSERT INTO `order_detail` VALUES ('99', '渣渣龟', '18752151002', '4', '广东工业大学', '3', '', '5', '老钱水果摊', '18752151005', '迎龙路12号', '已完成', '42.20', '1.00', '1.00', '3', '赵泰', '18752151003', '2020-11-10 00:30:03', '2020-11-12 06:57:00');
INSERT INTO `order_detail` VALUES ('100', '渣渣龟', '18752151002', '4', '广东工业大学', '3', '', '5', '老钱水果摊', '18752151005', '迎龙路12号', '已完成', '42.20', '1.00', '1.00', '3', '赵泰', '18752151003', '2020-11-10 00:30:04', '2020-11-12 06:57:10');
INSERT INTO `order_detail` VALUES ('101', '渣渣龟', '18752151002', '4', '广东工业大学', '3', '', '5', '老钱水果摊', '18752151005', '迎龙路12号', '已完成', '42.20', '1.00', '1.00', '3', '赵泰', '18752151003', '2020-11-10 00:30:09', '2020-11-12 06:57:20');
INSERT INTO `order_detail` VALUES ('102', '吴sir', '18752151001', '2', '广东金融学院北苑北教广场xxxxxxxxxxxxxxxxxxxxx', '1', '', '1', '正信鸡排', '18752151002', '迎龙路01号', '已完成', '32.00', '2.00', '1.00', '3', '赵泰', '18752151003', '2020-11-10 06:56:13', '2020-11-12 06:57:22');
INSERT INTO `order_detail` VALUES ('103', '吴sir', '18752151001', '2', '广东金融学院北苑北教广场xxxxxxxxxxxxxxxxxxxxx', '1', '', '1', '正信鸡排', '18752151002', '迎龙路01号', '已完成', '39.00', '2.00', '1.00', '3', '赵泰', '18752151003', '2020-11-11 10:02:59', '2020-11-12 06:57:30');
INSERT INTO `order_detail` VALUES ('104', '王sir', '18752151001', '1', '广东工业大学', '1', '', '3', '易合堂', '18752151004', '迎龙路02号', '已完成', '30.00', '1.00', '0.00', '3', '赵泰', '18752151003', '2020-11-11 14:53:38', '2020-11-12 06:57:36');
INSERT INTO `order_detail` VALUES ('105', '渣渣龟', '18752151006', '3', '广东金融学院北苑北教广场xxxxxxxxxxxxxxxxxxxxx', '6', '双11过完了，累了，求安慰', '1', '正信鸡排', '18752151002', '迎龙路01号', '已完成', '21.00', '2.00', '1.00', '3', '赵泰', '18752151003', '2020-11-12 00:04:45', '2020-11-12 06:57:38');
INSERT INTO `order_detail` VALUES ('106', '渣渣龟', '18752151002', '4', '广东工业大学', '3', '', '1', '正信鸡排', '18752151002', '迎龙路01号', '已完成', '44.60', '2.00', '1.00', '3', '赵泰', '18752151003', '2020-11-12 14:32:06', '2020-11-12 06:57:40');
INSERT INTO `order_detail` VALUES ('107', '渣渣龟', '18752151006', '3', '广东金融学院北苑北教广场xxxxxxxxxxxxxxxxxxxxx', '2', '', '1', '正信鸡排', '18752151002', '迎龙路01号', '已完成', '44.60', '2.00', '1.00', '3', '赵泰', '18752151003', '2020-11-12 14:45:55', '2020-11-12 06:56:23');
INSERT INTO `order_detail` VALUES ('108', '渣渣龟', '18752151006', '3', '广东金融学院北苑北教广场xxxxxxxxxxxxxxxxxxxxx', '2', '', '1', '正信鸡排', '18752151002', '迎龙路01号', '已完成', '32.60', '2.00', '1.00', '3', '赵泰', '18752151003', '2020-11-12 14:51:47', '2020-11-12 06:56:20');
INSERT INTO `order_detail` VALUES ('109', '王sir', '18752151001', '1', '广东工业大学', '1', '', '1', '正信鸡排', '18752151002', '迎龙路01号', '配送中', '32.60', '2.00', '1.00', '3', '赵泰', '18752151003', '2020-11-12 10:03:01', '2020-11-13 00:52:32');
INSERT INTO `order_detail` VALUES ('110', '灰灰灰灰6666', '18752151066', '5', '广东金融学院南苑青年广场xxxxxxxxxxxxxxxxxxxxx', '6', '测试单子', '3', '易合堂', '18752151004', '迎龙路02号', '已取消', '21.00', '1.00', '0.00', null, null, null, '2020-11-12 22:23:37', '2020-11-12 22:55:28');
INSERT INTO `order_detail` VALUES ('111', '灰灰灰灰6666', '18752151066', '5', '广东金融学院南苑青年广场xxxxxxxxxxxxxxxxxxxxx', '6', '滚啊你tm', '3', '易合堂', '18752151004', '迎龙路02号', '已退款', '29.00', '1.00', '0.00', '3', '赵泰', '18752151003', '2020-11-12 23:00:08', '2020-11-13 00:10:41');
INSERT INTO `order_detail` VALUES ('112', '王sir', '18752151001', '1', '广东工业大学', '1', '', '1', '正信鸡排', '18752151002', '迎龙路01号', '已取消', '32.60', '2.00', '1.00', null, null, null, '2020-11-13 00:50:43', '2020-11-13 00:50:48');
INSERT INTO `order_detail` VALUES ('113', '王sir', '18752151001', '1', '广东工业大学', '1', '', '1', '正信鸡排', '18752151002', '迎龙路01号', '申请退款中', '32.60', '2.00', '1.00', '3', '赵泰', '18752151003', '2020-11-13 00:53:34', '2020-11-13 00:54:17');
INSERT INTO `order_detail` VALUES ('114', '吴。。。', '10086', '10', '广东金融学院', '36', '', '3', '易合堂', '18752151004', '迎龙路02号', '商家已接单', '74.00', '1.00', '0.00', null, null, null, '2020-11-13 08:44:41', '2020-11-13 08:44:41');
INSERT INTO `order_detail` VALUES ('115', '吴。。。', '10086', '10', '广东金融学院', '36', '', '4', '好伙伴超市', '18752151004', '迎龙路16号', '商家已接单', '285.00', '0.00', '1.00', null, null, null, '2020-11-13 08:46:56', '2020-11-13 08:46:56');
INSERT INTO `order_detail` VALUES ('116', '王sir', '18752151001', '1', '广东工业大学', '1', '', '1', '正信鸡排', '18752151002', '迎龙路01号', '商家已接单', '44.60', '2.00', '1.00', null, null, null, '2020-11-13 08:47:49', '2020-11-13 08:47:49');
INSERT INTO `order_detail` VALUES ('117', '王sir', '18752151001', '1', '广东工业大学', '1', '', '1', '正信鸡排', '18752151002', '迎龙路01号', '商家已接单', '67.00', '2.00', '1.00', null, null, null, '2020-11-13 08:48:20', '2020-11-13 08:48:20');
INSERT INTO `order_detail` VALUES ('118', '吴。。。', '10086', '10', '广东金融学院', '36', '', '1', '正信鸡排', '18752151002', '迎龙路01号', '商家已接单', '32.60', '2.00', '1.00', null, null, null, '2020-11-13 10:59:02', '2020-11-13 10:59:02');
INSERT INTO `order_detail` VALUES ('119', '喳喳', '13522222222', '8', '广东金融学院2栋宿舍最顶层', '31', '', '1', '正信鸡排', '18752151002', '迎龙路01号', '商家已接单', '51.00', '2.00', '1.00', null, null, null, '2020-11-13 20:02:09', '2020-11-13 20:02:09');
INSERT INTO `order_detail` VALUES ('120', '渣渣渣', '13511111111', '6', '广东金融学院后门2栋宿舍最顶层', '31', '', '1', '正信鸡排', '18752151002', '迎龙路01号', '申请退款中', '133.60', '2.00', '1.00', '3', '赵泰', '18752151003', '2020-11-13 20:04:05', '2020-11-13 20:08:00');

-- ----------------------------
-- Table structure for `order_food`
-- ----------------------------
DROP TABLE IF EXISTS `order_food`;
CREATE TABLE `order_food` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` varchar(50) DEFAULT NULL COMMENT '订单ID',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '商铺ID',
  `shopname` varchar(50) DEFAULT NULL COMMENT '商铺名称',
  `food_id` int(11) DEFAULT '0' COMMENT '商品ID',
  `title` varchar(50) DEFAULT NULL COMMENT '商品标题',
  `numbers` int(11) DEFAULT '0' COMMENT '下单数量',
  `cover` varchar(500) DEFAULT NULL COMMENT '商品封面',
  `origin_price` double(10,0) DEFAULT '0' COMMENT '原价',
  `sell_price` double(10,0) DEFAULT '0' COMMENT '售价',
  `gmt_create` datetime DEFAULT NULL,
  `gmt_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=351 DEFAULT CHARSET=utf8 COMMENT='订单商品详情表';

-- ----------------------------
-- Records of order_food
-- ----------------------------
INSERT INTO `order_food` VALUES ('1', '1', '1', null, '0', '正信汉堡', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604723376765&di=9f2b863d1cbc71012f32ff36ea2b067e&imgtype=0&src=http%3A%2F%2Fimages.3158.cn%2Fdata%2Fattachment%2Ftougao%2Farticle%2F2017%2F05%2F22%2F109cc228ae8456b0f88cad76d188e827.jpg', '15', '12', '2020-11-08 13:39:03', '2020-11-08 13:39:03');
INSERT INTO `order_food` VALUES ('2', '1', '1', null, '0', '烤肠', '1', 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=4075010374,3289619316&fm=26&gp=0.jpg', '8', '6', '2020-11-08 13:39:03', '2020-11-08 13:39:03');
INSERT INTO `order_food` VALUES ('3', '1', '1', null, '0', '正信鸡排', '3', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604723110205&di=7ba9224df0eb69f5470d91f5ea3a659e&imgtype=0&src=http%3A%2F%2Fe.hiphotos.baidu.com%2Fbainuo%2Fcrop%3D0%2C37%2C470%2C285%3Bw%3D470%3Bq%3D80%2Fsign%3D6c621e39b5de9c82b22aa3cf51b1ac39%2F8694a4c27d1ed21bf0ced4e5ab6eddc451da3faf.jpg', '18', '12', '2020-11-08 13:39:03', '2020-11-08 13:39:03');
INSERT INTO `order_food` VALUES ('13', '5', '1', null, '0', '正信汉堡', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604723376765&di=9f2b863d1cbc71012f32ff36ea2b067e&imgtype=0&src=http%3A%2F%2Fimages.3158.cn%2Fdata%2Fattachment%2Ftougao%2Farticle%2F2017%2F05%2F22%2F109cc228ae8456b0f88cad76d188e827.jpg', '15', '12', '2020-11-08 13:44:57', '2020-11-08 13:44:57');
INSERT INTO `order_food` VALUES ('14', '5', '1', null, '0', '烤肠', '1', 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=4075010374,3289619316&fm=26&gp=0.jpg', '8', '6', '2020-11-08 13:44:57', '2020-11-08 13:44:57');
INSERT INTO `order_food` VALUES ('15', '5', '1', null, '0', '正信鸡排', '3', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604723110205&di=7ba9224df0eb69f5470d91f5ea3a659e&imgtype=0&src=http%3A%2F%2Fe.hiphotos.baidu.com%2Fbainuo%2Fcrop%3D0%2C37%2C470%2C285%3Bw%3D470%3Bq%3D80%2Fsign%3D6c621e39b5de9c82b22aa3cf51b1ac39%2F8694a4c27d1ed21bf0ced4e5ab6eddc451da3faf.jpg', '18', '12', '2020-11-08 13:44:57', '2020-11-08 13:44:57');
INSERT INTO `order_food` VALUES ('16', '6', '1', null, '0', '正信汉堡', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604723376765&di=9f2b863d1cbc71012f32ff36ea2b067e&imgtype=0&src=http%3A%2F%2Fimages.3158.cn%2Fdata%2Fattachment%2Ftougao%2Farticle%2F2017%2F05%2F22%2F109cc228ae8456b0f88cad76d188e827.jpg', '15', '12', '2020-11-08 13:45:01', '2020-11-08 13:45:01');
INSERT INTO `order_food` VALUES ('17', '6', '1', null, '0', '烤肠', '1', 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=4075010374,3289619316&fm=26&gp=0.jpg', '8', '6', '2020-11-08 13:45:01', '2020-11-08 13:45:01');
INSERT INTO `order_food` VALUES ('18', '6', '1', null, '0', '正信鸡排', '3', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604723110205&di=7ba9224df0eb69f5470d91f5ea3a659e&imgtype=0&src=http%3A%2F%2Fe.hiphotos.baidu.com%2Fbainuo%2Fcrop%3D0%2C37%2C470%2C285%3Bw%3D470%3Bq%3D80%2Fsign%3D6c621e39b5de9c82b22aa3cf51b1ac39%2F8694a4c27d1ed21bf0ced4e5ab6eddc451da3faf.jpg', '18', '12', '2020-11-08 13:45:01', '2020-11-08 13:45:01');
INSERT INTO `order_food` VALUES ('19', '7', '1', null, '0', '正信鸡排', '3', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604723110205&di=7ba9224df0eb69f5470d91f5ea3a659e&imgtype=0&src=http%3A%2F%2Fe.hiphotos.baidu.com%2Fbainuo%2Fcrop%3D0%2C37%2C470%2C285%3Bw%3D470%3Bq%3D80%2Fsign%3D6c621e39b5de9c82b22aa3cf51b1ac39%2F8694a4c27d1ed21bf0ced4e5ab6eddc451da3faf.jpg', '18', '12', '2020-11-08 13:58:22', '2020-11-08 13:58:22');
INSERT INTO `order_food` VALUES ('20', '8', '1', null, '0', '孜然锁骨', '1', 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=464251800,3487736601&fm=26&gp=0.jpg', '16', '12', '2020-11-08 07:02:57', '2020-11-08 07:02:57');
INSERT INTO `order_food` VALUES ('21', '8', '1', null, '0', '阿拉伯烤肉', '1', 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2254905268,2557779527&fm=26&gp=0.jpg', '20', '16', '2020-11-08 07:02:57', '2020-11-08 07:02:57');
INSERT INTO `order_food` VALUES ('22', '8', '1', null, '0', '正信鸡肉卷', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604723442040&di=9f6c60d8501b2b1da4a6e6667020058e&imgtype=0&src=http%3A%2F%2Fwww.dmwfoods.com%2Fhome%2F9%2Fe%2Fbbltdx%2Fresource%2F2016%2F09%2F09%2F57d280d972c6b.jpg', '15', '12', '2020-11-08 07:02:57', '2020-11-08 07:02:57');
INSERT INTO `order_food` VALUES ('23', '9', '1', null, '0', '孜然锁骨', '1', 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=464251800,3487736601&fm=26&gp=0.jpg', '16', '12', '2020-11-08 07:06:36', '2020-11-08 07:06:36');
INSERT INTO `order_food` VALUES ('24', '9', '1', null, '0', '阿拉伯烤肉', '1', 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2254905268,2557779527&fm=26&gp=0.jpg', '20', '16', '2020-11-08 07:06:36', '2020-11-08 07:06:36');
INSERT INTO `order_food` VALUES ('25', '9', '1', null, '0', '正信鸡肉卷', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604723442040&di=9f6c60d8501b2b1da4a6e6667020058e&imgtype=0&src=http%3A%2F%2Fwww.dmwfoods.com%2Fhome%2F9%2Fe%2Fbbltdx%2Fresource%2F2016%2F09%2F09%2F57d280d972c6b.jpg', '15', '12', '2020-11-08 07:06:36', '2020-11-08 07:06:36');
INSERT INTO `order_food` VALUES ('26', '10', '1', null, '0', '正信汉堡', '2', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604723376765&di=9f2b863d1cbc71012f32ff36ea2b067e&imgtype=0&src=http%3A%2F%2Fimages.3158.cn%2Fdata%2Fattachment%2Ftougao%2Farticle%2F2017%2F05%2F22%2F109cc228ae8456b0f88cad76d188e827.jpg', '15', '12', '2020-11-08 07:08:43', '2020-11-08 07:08:43');
INSERT INTO `order_food` VALUES ('27', '11', '1', null, '0', '正信汉堡', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604723376765&di=9f2b863d1cbc71012f32ff36ea2b067e&imgtype=0&src=http%3A%2F%2Fimages.3158.cn%2Fdata%2Fattachment%2Ftougao%2Farticle%2F2017%2F05%2F22%2F109cc228ae8456b0f88cad76d188e827.jpg', '15', '12', '2020-11-08 11:00:22', '2020-11-08 11:00:22');
INSERT INTO `order_food` VALUES ('28', '11', '1', null, '0', '烤肠', '1', 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=4075010374,3289619316&fm=26&gp=0.jpg', '8', '6', '2020-11-08 11:00:22', '2020-11-08 11:00:22');
INSERT INTO `order_food` VALUES ('29', '11', '1', null, '0', '正信鸡排', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604723110205&di=7ba9224df0eb69f5470d91f5ea3a659e&imgtype=0&src=http%3A%2F%2Fe.hiphotos.baidu.com%2Fbainuo%2Fcrop%3D0%2C37%2C470%2C285%3Bw%3D470%3Bq%3D80%2Fsign%3D6c621e39b5de9c82b22aa3cf51b1ac39%2F8694a4c27d1ed21bf0ced4e5ab6eddc451da3faf.jpg', '18', '12', '2020-11-08 11:00:22', '2020-11-08 11:00:22');
INSERT INTO `order_food` VALUES ('228', '87', '1', null, '0', '阿拉伯烤肉', '1', 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2254905268,2557779527&fm=26&gp=0.jpg', '20', '16', '2020-11-09 23:07:47', '2020-11-09 23:07:47');
INSERT INTO `order_food` VALUES ('229', '87', '1', null, '0', '正信鸡肉卷', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604723442040&di=9f6c60d8501b2b1da4a6e6667020058e&imgtype=0&src=http%3A%2F%2Fwww.dmwfoods.com%2Fhome%2F9%2Fe%2Fbbltdx%2Fresource%2F2016%2F09%2F09%2F57d280d972c6b.jpg', '15', '12', '2020-11-09 23:07:47', '2020-11-09 23:07:47');
INSERT INTO `order_food` VALUES ('230', '88', '4', null, '0', '合味道', '2', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604725511336&di=7c5652620db724e8947b5df7589f4b28&imgtype=0&src=http%3A%2F%2Fimg.yzcdn.cn%2Fupload_files%2F2016%2F11%2F22%2FFhFUrNTiSjKku2U_-Fnsl5SzZjYL.jpg%3FimageView2%2F2%2Fw%2F580%2Fh%2F580%2Fq%2F75%2Fformat%2Fjpg', '6', '6', '2020-11-09 23:08:20', '2020-11-09 23:08:20');
INSERT INTO `order_food` VALUES ('231', '88', '4', null, '0', '老坛酸菜牛肉面', '1', 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1252098575,2366127069&fm=26&gp=0.jpg', '6', '4', '2020-11-09 23:08:20', '2020-11-09 23:08:20');
INSERT INTO `order_food` VALUES ('232', '88', '4', null, '0', '番茄鸡蛋面', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604725239927&di=f72c8ae65201ca38da170f23681534f9&imgtype=0&src=http%3A%2F%2Fwww.5999.tv%2FUpload_Map%2FPro%2FSmall%2F2014%2F2-20%2F20140220102438223.jpg', '25', '22', '2020-11-09 23:08:20', '2020-11-09 23:08:20');
INSERT INTO `order_food` VALUES ('233', '88', '4', null, '0', '大辣棒', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604725138376&di=c0c901085a793cbafe052b45386e5a37&imgtype=0&src=http%3A%2F%2Fimg.yzcdn.cn%2Fupload_files%2F2018%2F04%2F18%2FFiTTPHQlb1KSTwg178Ev752feJq9.jpg%3FimageView2%2F2%2Fw%2F580%2Fh%2F580%2Fq%2F75%2Fformat%2Fjpg', '6', '4', '2020-11-09 23:08:20', '2020-11-09 23:08:20');
INSERT INTO `order_food` VALUES ('234', '88', '4', null, '0', '大面筋', '1', 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=136017795,605876241&fm=26&gp=0.jpg', '6', '4', '2020-11-09 23:08:20', '2020-11-09 23:08:20');
INSERT INTO `order_food` VALUES ('235', '89', '1', null, '0', '拉丝芝士棒', '1', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=468364138,744061989&fm=26&gp=0.jpg', '10', '6', '2020-11-09 23:23:05', '2020-11-09 23:23:05');
INSERT INTO `order_food` VALUES ('236', '89', '1', null, '0', '藤椒味鸡条', '2', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604723954414&di=4a909894f442e47e919907474dd5afff&imgtype=0&src=http%3A%2F%2Fp0.meituan.net%2Fwmproduct%2Ffea052addd23d8f2a80e617c4f9b105c244859.jpg%2540249w_249h_1e_1c_1l%257Cwatermark%3D1%26%26r%3D1%26p%3D9%26x%3D2%26y%3D2%26relative%3D1%26o%3D20', '10', '6', '2020-11-09 23:23:05', '2020-11-09 23:23:05');
INSERT INTO `order_food` VALUES ('237', '90', '4', null, '0', '玉米棒', '2', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604726022599&di=983b0300178b164529a5de69ffd19d32&imgtype=0&src=http%3A%2F%2Fd7.yihaodianimg.com%2FN01%2FM08%2F34%2FB3%2FCgQCrlLFFo6AFkGTAAGmobLPVo028700.jpg', '15', '12', '2020-11-09 23:23:52', '2020-11-09 23:23:52');
INSERT INTO `order_food` VALUES ('238', '90', '4', null, '0', '白巧克力', '2', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604725880866&di=6749bc06c117bbf67c6f527fc4ee67fb&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2F7db79311afda92a98e7d43b9ad311ddb7a2fac188a6d-Yj8IRw_fw658', '5', '3', '2020-11-09 23:23:52', '2020-11-09 23:23:52');
INSERT INTO `order_food` VALUES ('239', '90', '4', null, '0', '水桶', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604725827288&di=dd536c8fbb20e7a41dd671501f431abf&imgtype=0&src=http%3A%2F%2Fimg2.imgtn.bdimg.com%2Fit%2Fu%3D878730697%2C1153373702%26fm%3D214%26gp%3D0.jpg', '16', '12', '2020-11-09 23:23:53', '2020-11-09 23:23:53');
INSERT INTO `order_food` VALUES ('240', '90', '4', null, '0', '百世可乐', '1', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2981786357,1171749272&fm=26&gp=0.jpg', '10', '7', '2020-11-09 23:23:53', '2020-11-09 23:23:53');
INSERT INTO `order_food` VALUES ('241', '91', '1', null, '0', '阿拉伯烤肉', '1', 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2254905268,2557779527&fm=26&gp=0.jpg', '20', '16', '2020-11-09 23:24:14', '2020-11-09 23:24:14');
INSERT INTO `order_food` VALUES ('242', '91', '1', null, '0', '正信鸡肉卷', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604723442040&di=9f6c60d8501b2b1da4a6e6667020058e&imgtype=0&src=http%3A%2F%2Fwww.dmwfoods.com%2Fhome%2F9%2Fe%2Fbbltdx%2Fresource%2F2016%2F09%2F09%2F57d280d972c6b.jpg', '15', '12', '2020-11-09 23:24:14', '2020-11-09 23:24:14');
INSERT INTO `order_food` VALUES ('243', '91', '1', null, '0', '正信汉堡', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604723376765&di=9f2b863d1cbc71012f32ff36ea2b067e&imgtype=0&src=http%3A%2F%2Fimages.3158.cn%2Fdata%2Fattachment%2Ftougao%2Farticle%2F2017%2F05%2F22%2F109cc228ae8456b0f88cad76d188e827.jpg', '15', '12', '2020-11-09 23:24:14', '2020-11-09 23:24:14');
INSERT INTO `order_food` VALUES ('244', '92', '5', null, '0', '火龙果', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604726375685&di=66fdb22ed2173c36a95b7d24a0db7427&imgtype=0&src=http%3A%2F%2Fku.90sjimg.com%2Felement_origin_min_pic%2F16%2F11%2F02%2F3f33597c42b9859ca1324e62bfff24ba.jpg', '20', '19', '2020-11-10 00:30:00', '2020-11-10 00:30:00');
INSERT INTO `order_food` VALUES ('245', '92', '5', null, '0', '西瓜', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604726311192&di=3270c6d6b0625a39f711552cd716f4bd&imgtype=0&src=http%3A%2F%2Fi1.sinaimg.cn%2Flx%2Fzc%2F2011%2F0601%2FU5924P8T1D1071184F913DT20110530202026.jpg', '13', '9', '2020-11-10 00:30:00', '2020-11-10 00:30:00');
INSERT INTO `order_food` VALUES ('246', '92', '5', null, '0', '香蕉', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604726259159&di=ac5c3d09adc61de1d8bd608b80755055&imgtype=0&src=http%3A%2F%2Fdpic.tiankong.com%2Fbs%2Fep%2FQJ6482946070.jpg%3Fx-oss-process%3Dstyle%2Fshow', '13', '9', '2020-11-10 00:30:00', '2020-11-10 00:30:00');
INSERT INTO `order_food` VALUES ('247', '92', '5', null, '0', '哈密瓜', '1', 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=641226286,1399305492&fm=26&gp=0.jpg', '7', '4', '2020-11-10 00:30:00', '2020-11-10 00:30:00');
INSERT INTO `order_food` VALUES ('248', '93', '5', null, '0', '火龙果', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604726375685&di=66fdb22ed2173c36a95b7d24a0db7427&imgtype=0&src=http%3A%2F%2Fku.90sjimg.com%2Felement_origin_min_pic%2F16%2F11%2F02%2F3f33597c42b9859ca1324e62bfff24ba.jpg', '20', '19', '2020-11-10 00:30:02', '2020-11-10 00:30:02');
INSERT INTO `order_food` VALUES ('249', '93', '5', null, '0', '西瓜', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604726311192&di=3270c6d6b0625a39f711552cd716f4bd&imgtype=0&src=http%3A%2F%2Fi1.sinaimg.cn%2Flx%2Fzc%2F2011%2F0601%2FU5924P8T1D1071184F913DT20110530202026.jpg', '13', '9', '2020-11-10 00:30:02', '2020-11-10 00:30:02');
INSERT INTO `order_food` VALUES ('250', '93', '5', null, '0', '香蕉', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604726259159&di=ac5c3d09adc61de1d8bd608b80755055&imgtype=0&src=http%3A%2F%2Fdpic.tiankong.com%2Fbs%2Fep%2FQJ6482946070.jpg%3Fx-oss-process%3Dstyle%2Fshow', '13', '9', '2020-11-10 00:30:02', '2020-11-10 00:30:02');
INSERT INTO `order_food` VALUES ('251', '93', '5', null, '0', '哈密瓜', '1', 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=641226286,1399305492&fm=26&gp=0.jpg', '7', '4', '2020-11-10 00:30:02', '2020-11-10 00:30:02');
INSERT INTO `order_food` VALUES ('252', '94', '5', null, '0', '火龙果', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604726375685&di=66fdb22ed2173c36a95b7d24a0db7427&imgtype=0&src=http%3A%2F%2Fku.90sjimg.com%2Felement_origin_min_pic%2F16%2F11%2F02%2F3f33597c42b9859ca1324e62bfff24ba.jpg', '20', '19', '2020-11-10 00:30:02', '2020-11-10 00:30:02');
INSERT INTO `order_food` VALUES ('253', '94', '5', null, '0', '西瓜', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604726311192&di=3270c6d6b0625a39f711552cd716f4bd&imgtype=0&src=http%3A%2F%2Fi1.sinaimg.cn%2Flx%2Fzc%2F2011%2F0601%2FU5924P8T1D1071184F913DT20110530202026.jpg', '13', '9', '2020-11-10 00:30:02', '2020-11-10 00:30:02');
INSERT INTO `order_food` VALUES ('254', '94', '5', null, '0', '香蕉', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604726259159&di=ac5c3d09adc61de1d8bd608b80755055&imgtype=0&src=http%3A%2F%2Fdpic.tiankong.com%2Fbs%2Fep%2FQJ6482946070.jpg%3Fx-oss-process%3Dstyle%2Fshow', '13', '9', '2020-11-10 00:30:02', '2020-11-10 00:30:02');
INSERT INTO `order_food` VALUES ('255', '94', '5', null, '0', '哈密瓜', '1', 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=641226286,1399305492&fm=26&gp=0.jpg', '7', '4', '2020-11-10 00:30:02', '2020-11-10 00:30:02');
INSERT INTO `order_food` VALUES ('256', '95', '5', null, '0', '火龙果', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604726375685&di=66fdb22ed2173c36a95b7d24a0db7427&imgtype=0&src=http%3A%2F%2Fku.90sjimg.com%2Felement_origin_min_pic%2F16%2F11%2F02%2F3f33597c42b9859ca1324e62bfff24ba.jpg', '20', '19', '2020-11-10 00:30:03', '2020-11-10 00:30:03');
INSERT INTO `order_food` VALUES ('257', '95', '5', null, '0', '西瓜', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604726311192&di=3270c6d6b0625a39f711552cd716f4bd&imgtype=0&src=http%3A%2F%2Fi1.sinaimg.cn%2Flx%2Fzc%2F2011%2F0601%2FU5924P8T1D1071184F913DT20110530202026.jpg', '13', '9', '2020-11-10 00:30:03', '2020-11-10 00:30:03');
INSERT INTO `order_food` VALUES ('258', '95', '5', null, '0', '香蕉', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604726259159&di=ac5c3d09adc61de1d8bd608b80755055&imgtype=0&src=http%3A%2F%2Fdpic.tiankong.com%2Fbs%2Fep%2FQJ6482946070.jpg%3Fx-oss-process%3Dstyle%2Fshow', '13', '9', '2020-11-10 00:30:03', '2020-11-10 00:30:03');
INSERT INTO `order_food` VALUES ('259', '95', '5', null, '0', '哈密瓜', '1', 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=641226286,1399305492&fm=26&gp=0.jpg', '7', '4', '2020-11-10 00:30:03', '2020-11-10 00:30:03');
INSERT INTO `order_food` VALUES ('260', '96', '5', null, '0', '火龙果', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604726375685&di=66fdb22ed2173c36a95b7d24a0db7427&imgtype=0&src=http%3A%2F%2Fku.90sjimg.com%2Felement_origin_min_pic%2F16%2F11%2F02%2F3f33597c42b9859ca1324e62bfff24ba.jpg', '20', '19', '2020-11-10 00:30:03', '2020-11-10 00:30:03');
INSERT INTO `order_food` VALUES ('261', '96', '5', null, '0', '西瓜', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604726311192&di=3270c6d6b0625a39f711552cd716f4bd&imgtype=0&src=http%3A%2F%2Fi1.sinaimg.cn%2Flx%2Fzc%2F2011%2F0601%2FU5924P8T1D1071184F913DT20110530202026.jpg', '13', '9', '2020-11-10 00:30:03', '2020-11-10 00:30:03');
INSERT INTO `order_food` VALUES ('262', '96', '5', null, '0', '香蕉', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604726259159&di=ac5c3d09adc61de1d8bd608b80755055&imgtype=0&src=http%3A%2F%2Fdpic.tiankong.com%2Fbs%2Fep%2FQJ6482946070.jpg%3Fx-oss-process%3Dstyle%2Fshow', '13', '9', '2020-11-10 00:30:03', '2020-11-10 00:30:03');
INSERT INTO `order_food` VALUES ('263', '96', '5', null, '0', '哈密瓜', '1', 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=641226286,1399305492&fm=26&gp=0.jpg', '7', '4', '2020-11-10 00:30:03', '2020-11-10 00:30:03');
INSERT INTO `order_food` VALUES ('264', '97', '5', null, '0', '火龙果', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604726375685&di=66fdb22ed2173c36a95b7d24a0db7427&imgtype=0&src=http%3A%2F%2Fku.90sjimg.com%2Felement_origin_min_pic%2F16%2F11%2F02%2F3f33597c42b9859ca1324e62bfff24ba.jpg', '20', '19', '2020-11-10 00:30:03', '2020-11-10 00:30:03');
INSERT INTO `order_food` VALUES ('265', '97', '5', null, '0', '西瓜', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604726311192&di=3270c6d6b0625a39f711552cd716f4bd&imgtype=0&src=http%3A%2F%2Fi1.sinaimg.cn%2Flx%2Fzc%2F2011%2F0601%2FU5924P8T1D1071184F913DT20110530202026.jpg', '13', '9', '2020-11-10 00:30:03', '2020-11-10 00:30:03');
INSERT INTO `order_food` VALUES ('266', '97', '5', null, '0', '香蕉', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604726259159&di=ac5c3d09adc61de1d8bd608b80755055&imgtype=0&src=http%3A%2F%2Fdpic.tiankong.com%2Fbs%2Fep%2FQJ6482946070.jpg%3Fx-oss-process%3Dstyle%2Fshow', '13', '9', '2020-11-10 00:30:03', '2020-11-10 00:30:03');
INSERT INTO `order_food` VALUES ('267', '97', '5', null, '0', '哈密瓜', '1', 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=641226286,1399305492&fm=26&gp=0.jpg', '7', '4', '2020-11-10 00:30:03', '2020-11-10 00:30:03');
INSERT INTO `order_food` VALUES ('268', '98', '5', null, '0', '火龙果', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604726375685&di=66fdb22ed2173c36a95b7d24a0db7427&imgtype=0&src=http%3A%2F%2Fku.90sjimg.com%2Felement_origin_min_pic%2F16%2F11%2F02%2F3f33597c42b9859ca1324e62bfff24ba.jpg', '20', '19', '2020-11-10 00:30:03', '2020-11-10 00:30:03');
INSERT INTO `order_food` VALUES ('269', '98', '5', null, '0', '西瓜', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604726311192&di=3270c6d6b0625a39f711552cd716f4bd&imgtype=0&src=http%3A%2F%2Fi1.sinaimg.cn%2Flx%2Fzc%2F2011%2F0601%2FU5924P8T1D1071184F913DT20110530202026.jpg', '13', '9', '2020-11-10 00:30:03', '2020-11-10 00:30:03');
INSERT INTO `order_food` VALUES ('270', '98', '5', null, '0', '香蕉', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604726259159&di=ac5c3d09adc61de1d8bd608b80755055&imgtype=0&src=http%3A%2F%2Fdpic.tiankong.com%2Fbs%2Fep%2FQJ6482946070.jpg%3Fx-oss-process%3Dstyle%2Fshow', '13', '9', '2020-11-10 00:30:03', '2020-11-10 00:30:03');
INSERT INTO `order_food` VALUES ('271', '98', '5', null, '0', '哈密瓜', '1', 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=641226286,1399305492&fm=26&gp=0.jpg', '7', '4', '2020-11-10 00:30:03', '2020-11-10 00:30:03');
INSERT INTO `order_food` VALUES ('272', '99', '5', null, '0', '火龙果', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604726375685&di=66fdb22ed2173c36a95b7d24a0db7427&imgtype=0&src=http%3A%2F%2Fku.90sjimg.com%2Felement_origin_min_pic%2F16%2F11%2F02%2F3f33597c42b9859ca1324e62bfff24ba.jpg', '20', '19', '2020-11-10 00:30:03', '2020-11-10 00:30:03');
INSERT INTO `order_food` VALUES ('273', '99', '5', null, '0', '西瓜', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604726311192&di=3270c6d6b0625a39f711552cd716f4bd&imgtype=0&src=http%3A%2F%2Fi1.sinaimg.cn%2Flx%2Fzc%2F2011%2F0601%2FU5924P8T1D1071184F913DT20110530202026.jpg', '13', '9', '2020-11-10 00:30:03', '2020-11-10 00:30:03');
INSERT INTO `order_food` VALUES ('274', '99', '5', null, '0', '香蕉', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604726259159&di=ac5c3d09adc61de1d8bd608b80755055&imgtype=0&src=http%3A%2F%2Fdpic.tiankong.com%2Fbs%2Fep%2FQJ6482946070.jpg%3Fx-oss-process%3Dstyle%2Fshow', '13', '9', '2020-11-10 00:30:03', '2020-11-10 00:30:03');
INSERT INTO `order_food` VALUES ('275', '99', '5', null, '0', '哈密瓜', '1', 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=641226286,1399305492&fm=26&gp=0.jpg', '7', '4', '2020-11-10 00:30:03', '2020-11-10 00:30:03');
INSERT INTO `order_food` VALUES ('276', '100', '5', null, '0', '火龙果', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604726375685&di=66fdb22ed2173c36a95b7d24a0db7427&imgtype=0&src=http%3A%2F%2Fku.90sjimg.com%2Felement_origin_min_pic%2F16%2F11%2F02%2F3f33597c42b9859ca1324e62bfff24ba.jpg', '20', '19', '2020-11-10 00:30:04', '2020-11-10 00:30:04');
INSERT INTO `order_food` VALUES ('277', '100', '5', null, '0', '西瓜', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604726311192&di=3270c6d6b0625a39f711552cd716f4bd&imgtype=0&src=http%3A%2F%2Fi1.sinaimg.cn%2Flx%2Fzc%2F2011%2F0601%2FU5924P8T1D1071184F913DT20110530202026.jpg', '13', '9', '2020-11-10 00:30:04', '2020-11-10 00:30:04');
INSERT INTO `order_food` VALUES ('278', '100', '5', null, '0', '香蕉', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604726259159&di=ac5c3d09adc61de1d8bd608b80755055&imgtype=0&src=http%3A%2F%2Fdpic.tiankong.com%2Fbs%2Fep%2FQJ6482946070.jpg%3Fx-oss-process%3Dstyle%2Fshow', '13', '9', '2020-11-10 00:30:04', '2020-11-10 00:30:04');
INSERT INTO `order_food` VALUES ('279', '100', '5', null, '0', '哈密瓜', '1', 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=641226286,1399305492&fm=26&gp=0.jpg', '7', '4', '2020-11-10 00:30:04', '2020-11-10 00:30:04');
INSERT INTO `order_food` VALUES ('280', '101', '5', null, '0', '火龙果', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604726375685&di=66fdb22ed2173c36a95b7d24a0db7427&imgtype=0&src=http%3A%2F%2Fku.90sjimg.com%2Felement_origin_min_pic%2F16%2F11%2F02%2F3f33597c42b9859ca1324e62bfff24ba.jpg', '20', '19', '2020-11-10 00:30:09', '2020-11-10 00:30:09');
INSERT INTO `order_food` VALUES ('281', '101', '5', null, '0', '西瓜', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604726311192&di=3270c6d6b0625a39f711552cd716f4bd&imgtype=0&src=http%3A%2F%2Fi1.sinaimg.cn%2Flx%2Fzc%2F2011%2F0601%2FU5924P8T1D1071184F913DT20110530202026.jpg', '13', '9', '2020-11-10 00:30:09', '2020-11-10 00:30:09');
INSERT INTO `order_food` VALUES ('282', '101', '5', null, '0', '香蕉', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604726259159&di=ac5c3d09adc61de1d8bd608b80755055&imgtype=0&src=http%3A%2F%2Fdpic.tiankong.com%2Fbs%2Fep%2FQJ6482946070.jpg%3Fx-oss-process%3Dstyle%2Fshow', '13', '9', '2020-11-10 00:30:09', '2020-11-10 00:30:09');
INSERT INTO `order_food` VALUES ('283', '101', '5', null, '0', '哈密瓜', '1', 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=641226286,1399305492&fm=26&gp=0.jpg', '7', '4', '2020-11-10 00:30:09', '2020-11-10 00:30:09');
INSERT INTO `order_food` VALUES ('284', '102', '1', null, '0', '藤椒味鸡条', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604723954414&di=4a909894f442e47e919907474dd5afff&imgtype=0&src=http%3A%2F%2Fp0.meituan.net%2Fwmproduct%2Ffea052addd23d8f2a80e617c4f9b105c244859.jpg%2540249w_249h_1e_1c_1l%257Cwatermark%3D1%26%26r%3D1%26p%3D9%26x%3D2%26y%3D2%26relative%3D1%26o%3D20', '10', '6', '2020-11-10 06:56:13', '2020-11-10 06:56:13');
INSERT INTO `order_food` VALUES ('285', '102', '1', null, '0', '俄罗斯烤肉', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604723707453&di=1ee694c241f5d371389aa60a863fd2a5&imgtype=0&src=http%3A%2F%2Fpics4.baidu.com%2Ffeed%2Fa8ec8a13632762d020f56b80086dbbfe503dc649.jpeg%3Ftoken%3D72a43f4b89eee1ca1d735b4663dbb0f2%26s%3D770607E35AB6B0D258364DBB0300F04B', '13', '11', '2020-11-10 06:56:13', '2020-11-10 06:56:13');
INSERT INTO `order_food` VALUES ('286', '102', '1', null, '0', '正信鸡排', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604723110205&di=7ba9224df0eb69f5470d91f5ea3a659e&imgtype=0&src=http%3A%2F%2Fe.hiphotos.baidu.com%2Fbainuo%2Fcrop%3D0%2C37%2C470%2C285%3Bw%3D470%3Bq%3D80%2Fsign%3D6c621e39b5de9c82b22aa3cf51b1ac39%2F8694a4c27d1ed21bf0ced4e5ab6eddc451da3faf.jpg', '18', '12', '2020-11-10 06:56:13', '2020-11-10 06:56:13');
INSERT INTO `order_food` VALUES ('287', '103', '1', null, '0', '正信鸡排', '3', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604723110205&di=7ba9224df0eb69f5470d91f5ea3a659e&imgtype=0&src=http%3A%2F%2Fe.hiphotos.baidu.com%2Fbainuo%2Fcrop%3D0%2C37%2C470%2C285%3Bw%3D470%3Bq%3D80%2Fsign%3D6c621e39b5de9c82b22aa3cf51b1ac39%2F8694a4c27d1ed21bf0ced4e5ab6eddc451da3faf.jpg', '18', '12', '2020-11-11 10:02:59', '2020-11-11 10:02:59');
INSERT INTO `order_food` VALUES ('288', '104', '3', null, '0', '烤奶', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604724413706&di=0979fa7011f373e845a2f69589add0d8&imgtype=0&src=http%3A%2F%2Fpic139.huitu.com%2Fres%2F20200327%2F1124748_20200327023930781020_1.jpg', '13', '9', '2020-11-11 14:53:38', '2020-11-11 14:53:38');
INSERT INTO `order_food` VALUES ('289', '104', '3', null, '0', '泷珠奶茶', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604724364827&di=9c1675e064aec824fa1196d49f018ab5&imgtype=0&src=http%3A%2F%2F5b0988e595225.cdn.sohucs.com%2Fimages%2F20181211%2Fd1082fc503bc4e319d6bc5bf31dab3db.jpeg', '15', '10', '2020-11-11 14:53:38', '2020-11-11 14:53:38');
INSERT INTO `order_food` VALUES ('290', '104', '3', null, '0', '双拼奶茶', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604724230677&di=522004636890bff26a9cfc7db7fcaeb3&imgtype=0&src=http%3A%2F%2Fimg.yzcdn.cn%2Fupload_files%2F2015%2F11%2F19%2FFsrOK_-sec5e3OJpr9HzneFFokmb.jpg%3FimageView2%2F2%2Fw%2F580%2Fh%2F580%2Fq%2F75%2Fformat%2Fjpg', '15', '10', '2020-11-11 14:53:38', '2020-11-11 14:53:38');
INSERT INTO `order_food` VALUES ('291', '105', '1', null, '0', '拉丝芝士棒', '3', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=468364138,744061989&fm=26&gp=0.jpg', '10', '6', '2020-11-12 00:04:45', '2020-11-12 00:04:45');
INSERT INTO `order_food` VALUES ('292', '106', '1', null, '0', '正信鸡肉卷', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604723442040&di=9f6c60d8501b2b1da4a6e6667020058e&imgtype=0&src=http%3A%2F%2Fwww.dmwfoods.com%2Fhome%2F9%2Fe%2Fbbltdx%2Fresource%2F2016%2F09%2F09%2F57d280d972c6b.jpg', '15', '12', '2020-11-12 14:32:06', '2020-11-12 14:32:06');
INSERT INTO `order_food` VALUES ('293', '106', '1', null, '0', '正信汉堡', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604723376765&di=9f2b863d1cbc71012f32ff36ea2b067e&imgtype=0&src=http%3A%2F%2Fimages.3158.cn%2Fdata%2Fattachment%2Ftougao%2Farticle%2F2017%2F05%2F22%2F109cc228ae8456b0f88cad76d188e827.jpg', '15', '12', '2020-11-12 14:32:06', '2020-11-12 14:32:06');
INSERT INTO `order_food` VALUES ('294', '106', '1', null, '0', '烤肠', '1', 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=4075010374,3289619316&fm=26&gp=0.jpg', '8', '6', '2020-11-12 14:32:06', '2020-11-12 14:32:06');
INSERT INTO `order_food` VALUES ('295', '106', '1', null, '0', '正信鸡排', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604723110205&di=7ba9224df0eb69f5470d91f5ea3a659e&imgtype=0&src=http%3A%2F%2Fe.hiphotos.baidu.com%2Fbainuo%2Fcrop%3D0%2C37%2C470%2C285%3Bw%3D470%3Bq%3D80%2Fsign%3D6c621e39b5de9c82b22aa3cf51b1ac39%2F8694a4c27d1ed21bf0ced4e5ab6eddc451da3faf.jpg', '18', '12', '2020-11-12 14:32:06', '2020-11-12 14:32:06');
INSERT INTO `order_food` VALUES ('296', '107', '1', null, '0', '正信鸡肉卷', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604723442040&di=9f6c60d8501b2b1da4a6e6667020058e&imgtype=0&src=http%3A%2F%2Fwww.dmwfoods.com%2Fhome%2F9%2Fe%2Fbbltdx%2Fresource%2F2016%2F09%2F09%2F57d280d972c6b.jpg', '15', '12', '2020-11-12 14:45:55', '2020-11-12 14:45:55');
INSERT INTO `order_food` VALUES ('297', '107', '1', null, '0', '正信汉堡', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604723376765&di=9f2b863d1cbc71012f32ff36ea2b067e&imgtype=0&src=http%3A%2F%2Fimages.3158.cn%2Fdata%2Fattachment%2Ftougao%2Farticle%2F2017%2F05%2F22%2F109cc228ae8456b0f88cad76d188e827.jpg', '15', '12', '2020-11-12 14:45:55', '2020-11-12 14:45:55');
INSERT INTO `order_food` VALUES ('298', '107', '1', null, '0', '烤肠', '1', 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=4075010374,3289619316&fm=26&gp=0.jpg', '8', '6', '2020-11-12 14:45:55', '2020-11-12 14:45:55');
INSERT INTO `order_food` VALUES ('299', '107', '1', null, '0', '正信鸡排', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604723110205&di=7ba9224df0eb69f5470d91f5ea3a659e&imgtype=0&src=http%3A%2F%2Fe.hiphotos.baidu.com%2Fbainuo%2Fcrop%3D0%2C37%2C470%2C285%3Bw%3D470%3Bq%3D80%2Fsign%3D6c621e39b5de9c82b22aa3cf51b1ac39%2F8694a4c27d1ed21bf0ced4e5ab6eddc451da3faf.jpg', '18', '12', '2020-11-12 14:45:55', '2020-11-12 14:45:55');
INSERT INTO `order_food` VALUES ('300', '108', '1', null, '0', '正信汉堡', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604723376765&di=9f2b863d1cbc71012f32ff36ea2b067e&imgtype=0&src=http%3A%2F%2Fimages.3158.cn%2Fdata%2Fattachment%2Ftougao%2Farticle%2F2017%2F05%2F22%2F109cc228ae8456b0f88cad76d188e827.jpg', '15', '12', '2020-11-12 14:51:47', '2020-11-12 14:51:47');
INSERT INTO `order_food` VALUES ('301', '108', '1', null, '0', '烤肠', '1', 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=4075010374,3289619316&fm=26&gp=0.jpg', '8', '6', '2020-11-12 14:51:47', '2020-11-12 14:51:47');
INSERT INTO `order_food` VALUES ('302', '108', '1', null, '0', '正信鸡排', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604723110205&di=7ba9224df0eb69f5470d91f5ea3a659e&imgtype=0&src=http%3A%2F%2Fe.hiphotos.baidu.com%2Fbainuo%2Fcrop%3D0%2C37%2C470%2C285%3Bw%3D470%3Bq%3D80%2Fsign%3D6c621e39b5de9c82b22aa3cf51b1ac39%2F8694a4c27d1ed21bf0ced4e5ab6eddc451da3faf.jpg', '18', '12', '2020-11-12 14:51:47', '2020-11-12 14:51:47');
INSERT INTO `order_food` VALUES ('303', '109', '1', null, '0', '正信鸡肉卷', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604723442040&di=9f6c60d8501b2b1da4a6e6667020058e&imgtype=0&src=http%3A%2F%2Fwww.dmwfoods.com%2Fhome%2F9%2Fe%2Fbbltdx%2Fresource%2F2016%2F09%2F09%2F57d280d972c6b.jpg', '15', '12', '2020-11-12 10:03:01', '2020-11-12 10:03:01');
INSERT INTO `order_food` VALUES ('304', '109', '1', null, '0', '正信汉堡', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604723376765&di=9f2b863d1cbc71012f32ff36ea2b067e&imgtype=0&src=http%3A%2F%2Fimages.3158.cn%2Fdata%2Fattachment%2Ftougao%2Farticle%2F2017%2F05%2F22%2F109cc228ae8456b0f88cad76d188e827.jpg', '15', '12', '2020-11-12 10:03:01', '2020-11-12 10:03:01');
INSERT INTO `order_food` VALUES ('305', '109', '1', null, '0', '烤肠', '1', 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=4075010374,3289619316&fm=26&gp=0.jpg', '8', '6', '2020-11-12 10:03:01', '2020-11-12 10:03:01');
INSERT INTO `order_food` VALUES ('306', '110', '3', null, '0', '烧仙草', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604724464765&di=4e64ab1b07932595824d0c301429416b&imgtype=0&src=http%3A%2F%2Fqcloud.dpfile.com%2Fpc%2F8ZDqKOdCOV6REgVw6HEBQiJtEGPI-hgN9La6NHxGfHwaWV7jnGXDu6q3ZNCC13oojoJrvItByyS4HHaWdXyO_DrXIaWutJls2xCVbatkhjUNNiIYVnHvzugZCuBITtvjski7YaLlHpkrQUr5euoQrg.jpg', '16', '11', '2020-11-12 22:23:37', '2020-11-12 22:23:37');
INSERT INTO `order_food` VALUES ('307', '110', '3', null, '0', '烤奶', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604724413706&di=0979fa7011f373e845a2f69589add0d8&imgtype=0&src=http%3A%2F%2Fpic139.huitu.com%2Fres%2F20200327%2F1124748_20200327023930781020_1.jpg', '13', '9', '2020-11-12 22:23:37', '2020-11-12 22:23:37');
INSERT INTO `order_food` VALUES ('308', '111', '3', null, '0', '葡萄啵啵', '1', 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1134022499,1374171013&fm=15&gp=0.jpg', '20', '16', '2020-11-12 23:00:08', '2020-11-12 23:00:08');
INSERT INTO `order_food` VALUES ('309', '111', '3', null, '0', '蜜桃乌龙', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604724696897&di=6e1cabc52925c026fb829c0d69570457&imgtype=0&src=http%3A%2F%2Fku.90sjimg.com%2Felement_origin_min_pic%2F18%2F08%2F28%2Fe32cb2445ef7ad40d2773a13d512a880.jpg%2521%2Ffwfh%2F804x1206%2Fquality%2F90%2Funsharp%2Ftrue%2Fcompress%2Ftrue', '17', '12', '2020-11-12 23:00:08', '2020-11-12 23:00:08');
INSERT INTO `order_food` VALUES ('310', '112', '1', null, '0', '正信汉堡', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604723376765&di=9f2b863d1cbc71012f32ff36ea2b067e&imgtype=0&src=http%3A%2F%2Fimages.3158.cn%2Fdata%2Fattachment%2Ftougao%2Farticle%2F2017%2F05%2F22%2F109cc228ae8456b0f88cad76d188e827.jpg', '15', '12', '2020-11-13 00:50:43', '2020-11-13 00:50:43');
INSERT INTO `order_food` VALUES ('311', '112', '1', null, '0', '烤肠', '1', 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=4075010374,3289619316&fm=26&gp=0.jpg', '8', '6', '2020-11-13 00:50:43', '2020-11-13 00:50:43');
INSERT INTO `order_food` VALUES ('312', '112', '1', null, '0', '正信鸡排', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604723110205&di=7ba9224df0eb69f5470d91f5ea3a659e&imgtype=0&src=http%3A%2F%2Fe.hiphotos.baidu.com%2Fbainuo%2Fcrop%3D0%2C37%2C470%2C285%3Bw%3D470%3Bq%3D80%2Fsign%3D6c621e39b5de9c82b22aa3cf51b1ac39%2F8694a4c27d1ed21bf0ced4e5ab6eddc451da3faf.jpg', '18', '12', '2020-11-13 00:50:43', '2020-11-13 00:50:43');
INSERT INTO `order_food` VALUES ('313', '113', '1', null, '0', '正信汉堡', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604723376765&di=9f2b863d1cbc71012f32ff36ea2b067e&imgtype=0&src=http%3A%2F%2Fimages.3158.cn%2Fdata%2Fattachment%2Ftougao%2Farticle%2F2017%2F05%2F22%2F109cc228ae8456b0f88cad76d188e827.jpg', '15', '12', '2020-11-13 00:53:34', '2020-11-13 00:53:34');
INSERT INTO `order_food` VALUES ('314', '113', '1', null, '0', '烤肠', '1', 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=4075010374,3289619316&fm=26&gp=0.jpg', '8', '6', '2020-11-13 00:53:34', '2020-11-13 00:53:34');
INSERT INTO `order_food` VALUES ('315', '113', '1', null, '0', '正信鸡排', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604723110205&di=7ba9224df0eb69f5470d91f5ea3a659e&imgtype=0&src=http%3A%2F%2Fe.hiphotos.baidu.com%2Fbainuo%2Fcrop%3D0%2C37%2C470%2C285%3Bw%3D470%3Bq%3D80%2Fsign%3D6c621e39b5de9c82b22aa3cf51b1ac39%2F8694a4c27d1ed21bf0ced4e5ab6eddc451da3faf.jpg', '18', '12', '2020-11-13 00:53:34', '2020-11-13 00:53:34');
INSERT INTO `order_food` VALUES ('316', '114', '3', null, '0', '禾风奶绿', '1', 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3270377995,4028060305&fm=26&gp=0.jpg', '13', '9', '2020-11-13 08:44:41', '2020-11-13 08:44:41');
INSERT INTO `order_food` VALUES ('317', '114', '3', null, '0', '芋泥啵啵奶绿', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604724582198&di=4576a70b7eaeae16c6c1f9ad641e23cf&imgtype=0&src=http%3A%2F%2F5b0988e595225.cdn.sohucs.com%2Fq_70%2Cc_zoom%2Cw_640%2Fimages%2F20181218%2F2e01f1040a34460493859bf116a1427a.jpeg', '16', '12', '2020-11-13 08:44:41', '2020-11-13 08:44:41');
INSERT INTO `order_food` VALUES ('318', '114', '3', null, '0', '芋泥啵啵奶茶', '1', 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2693002049,321135990&fm=26&gp=0.jpg', '16', '12', '2020-11-13 08:44:41', '2020-11-13 08:44:41');
INSERT INTO `order_food` VALUES ('319', '114', '3', null, '0', '烧仙草', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604724464765&di=4e64ab1b07932595824d0c301429416b&imgtype=0&src=http%3A%2F%2Fqcloud.dpfile.com%2Fpc%2F8ZDqKOdCOV6REgVw6HEBQiJtEGPI-hgN9La6NHxGfHwaWV7jnGXDu6q3ZNCC13oojoJrvItByyS4HHaWdXyO_DrXIaWutJls2xCVbatkhjUNNiIYVnHvzugZCuBITtvjski7YaLlHpkrQUr5euoQrg.jpg', '16', '11', '2020-11-13 08:44:41', '2020-11-13 08:44:41');
INSERT INTO `order_food` VALUES ('320', '114', '3', null, '0', '烤奶', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604724413706&di=0979fa7011f373e845a2f69589add0d8&imgtype=0&src=http%3A%2F%2Fpic139.huitu.com%2Fres%2F20200327%2F1124748_20200327023930781020_1.jpg', '13', '9', '2020-11-13 08:44:41', '2020-11-13 08:44:41');
INSERT INTO `order_food` VALUES ('321', '114', '3', null, '0', '泷珠奶茶', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604724364827&di=9c1675e064aec824fa1196d49f018ab5&imgtype=0&src=http%3A%2F%2F5b0988e595225.cdn.sohucs.com%2Fimages%2F20181211%2Fd1082fc503bc4e319d6bc5bf31dab3db.jpeg', '15', '10', '2020-11-13 08:44:41', '2020-11-13 08:44:41');
INSERT INTO `order_food` VALUES ('322', '114', '3', null, '0', '双拼奶茶', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604724230677&di=522004636890bff26a9cfc7db7fcaeb3&imgtype=0&src=http%3A%2F%2Fimg.yzcdn.cn%2Fupload_files%2F2015%2F11%2F19%2FFsrOK_-sec5e3OJpr9HzneFFokmb.jpg%3FimageView2%2F2%2Fw%2F580%2Fh%2F580%2Fq%2F75%2Fformat%2Fjpg', '15', '10', '2020-11-13 08:44:41', '2020-11-13 08:44:41');
INSERT INTO `order_food` VALUES ('323', '115', '4', null, '0', '百世可乐', '4', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2981786357,1171749272&fm=26&gp=0.jpg', '10', '7', '2020-11-13 08:46:56', '2020-11-13 08:46:56');
INSERT INTO `order_food` VALUES ('324', '115', '4', null, '0', '维他奶', '4', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604725698998&di=309f618d65e1387c7bf54b162d13c67d&imgtype=0&src=http%3A%2F%2Foimagec6.ydstatic.com%2Fimage%3Fid%3D-7234397140708968291%26product%3Dgouwu', '60', '56', '2020-11-13 08:46:56', '2020-11-13 08:46:56');
INSERT INTO `order_food` VALUES ('325', '115', '4', null, '0', '怡宝', '4', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2050273938,3884891723&fm=26&gp=0.jpg', '3', '2', '2020-11-13 08:46:56', '2020-11-13 08:46:56');
INSERT INTO `order_food` VALUES ('326', '115', '4', null, '0', '百威', '4', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604725583936&di=dd3e4d6585b4f0823f3331d01a6b0e78&imgtype=0&src=http%3A%2F%2Fimage2.suning.cn%2Fuimg%2Fb2c%2Fnewcatentries%2F0070177421-000000000860849773_5_800x800.jpg', '8', '6', '2020-11-13 08:46:56', '2020-11-13 08:46:56');
INSERT INTO `order_food` VALUES ('327', '116', '1', null, '0', '正信鸡肉卷', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604723442040&di=9f6c60d8501b2b1da4a6e6667020058e&imgtype=0&src=http%3A%2F%2Fwww.dmwfoods.com%2Fhome%2F9%2Fe%2Fbbltdx%2Fresource%2F2016%2F09%2F09%2F57d280d972c6b.jpg', '15', '12', '2020-11-13 08:47:49', '2020-11-13 08:47:49');
INSERT INTO `order_food` VALUES ('328', '116', '1', null, '0', '正信汉堡', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604723376765&di=9f2b863d1cbc71012f32ff36ea2b067e&imgtype=0&src=http%3A%2F%2Fimages.3158.cn%2Fdata%2Fattachment%2Ftougao%2Farticle%2F2017%2F05%2F22%2F109cc228ae8456b0f88cad76d188e827.jpg', '15', '12', '2020-11-13 08:47:49', '2020-11-13 08:47:49');
INSERT INTO `order_food` VALUES ('329', '116', '1', null, '0', '烤肠', '1', 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=4075010374,3289619316&fm=26&gp=0.jpg', '8', '6', '2020-11-13 08:47:49', '2020-11-13 08:47:49');
INSERT INTO `order_food` VALUES ('330', '116', '1', null, '0', '正信鸡排', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604723110205&di=7ba9224df0eb69f5470d91f5ea3a659e&imgtype=0&src=http%3A%2F%2Fe.hiphotos.baidu.com%2Fbainuo%2Fcrop%3D0%2C37%2C470%2C285%3Bw%3D470%3Bq%3D80%2Fsign%3D6c621e39b5de9c82b22aa3cf51b1ac39%2F8694a4c27d1ed21bf0ced4e5ab6eddc451da3faf.jpg', '18', '12', '2020-11-13 08:47:49', '2020-11-13 08:47:49');
INSERT INTO `order_food` VALUES ('331', '117', '1', null, '0', '正信鸡肉卷', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604723442040&di=9f6c60d8501b2b1da4a6e6667020058e&imgtype=0&src=http%3A%2F%2Fwww.dmwfoods.com%2Fhome%2F9%2Fe%2Fbbltdx%2Fresource%2F2016%2F09%2F09%2F57d280d972c6b.jpg', '15', '12', '2020-11-13 08:48:20', '2020-11-13 08:48:20');
INSERT INTO `order_food` VALUES ('332', '117', '1', null, '0', '正信汉堡', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604723376765&di=9f2b863d1cbc71012f32ff36ea2b067e&imgtype=0&src=http%3A%2F%2Fimages.3158.cn%2Fdata%2Fattachment%2Ftougao%2Farticle%2F2017%2F05%2F22%2F109cc228ae8456b0f88cad76d188e827.jpg', '15', '12', '2020-11-13 08:48:20', '2020-11-13 08:48:20');
INSERT INTO `order_food` VALUES ('333', '117', '1', null, '0', '烤肠', '5', 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=4075010374,3289619316&fm=26&gp=0.jpg', '8', '6', '2020-11-13 08:48:20', '2020-11-13 08:48:20');
INSERT INTO `order_food` VALUES ('334', '117', '1', null, '0', '正信鸡排', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604723110205&di=7ba9224df0eb69f5470d91f5ea3a659e&imgtype=0&src=http%3A%2F%2Fe.hiphotos.baidu.com%2Fbainuo%2Fcrop%3D0%2C37%2C470%2C285%3Bw%3D470%3Bq%3D80%2Fsign%3D6c621e39b5de9c82b22aa3cf51b1ac39%2F8694a4c27d1ed21bf0ced4e5ab6eddc451da3faf.jpg', '18', '12', '2020-11-13 08:48:20', '2020-11-13 08:48:20');
INSERT INTO `order_food` VALUES ('335', '118', '1', null, '0', '正信汉堡', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604723376765&di=9f2b863d1cbc71012f32ff36ea2b067e&imgtype=0&src=http%3A%2F%2Fimages.3158.cn%2Fdata%2Fattachment%2Ftougao%2Farticle%2F2017%2F05%2F22%2F109cc228ae8456b0f88cad76d188e827.jpg', '15', '12', '2020-11-13 10:59:02', '2020-11-13 10:59:02');
INSERT INTO `order_food` VALUES ('336', '118', '1', null, '0', '烤肠', '1', 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=4075010374,3289619316&fm=26&gp=0.jpg', '8', '6', '2020-11-13 10:59:02', '2020-11-13 10:59:02');
INSERT INTO `order_food` VALUES ('337', '118', '1', null, '0', '正信鸡排', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604723110205&di=7ba9224df0eb69f5470d91f5ea3a659e&imgtype=0&src=http%3A%2F%2Fe.hiphotos.baidu.com%2Fbainuo%2Fcrop%3D0%2C37%2C470%2C285%3Bw%3D470%3Bq%3D80%2Fsign%3D6c621e39b5de9c82b22aa3cf51b1ac39%2F8694a4c27d1ed21bf0ced4e5ab6eddc451da3faf.jpg', '18', '12', '2020-11-13 10:59:02', '2020-11-13 10:59:02');
INSERT INTO `order_food` VALUES ('338', '119', '1', null, '0', '正信鸡肉卷', '4', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604723442040&di=9f6c60d8501b2b1da4a6e6667020058e&imgtype=0&src=http%3A%2F%2Fwww.dmwfoods.com%2Fhome%2F9%2Fe%2Fbbltdx%2Fresource%2F2016%2F09%2F09%2F57d280d972c6b.jpg', '15', '12', '2020-11-13 20:02:10', '2020-11-13 20:02:10');
INSERT INTO `order_food` VALUES ('339', '120', '1', null, '0', '拉丝芝士棒', '1', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=468364138,744061989&fm=26&gp=0.jpg', '10', '6', '2020-11-13 20:04:05', '2020-11-13 20:04:05');
INSERT INTO `order_food` VALUES ('340', '120', '1', null, '0', '藤椒味鸡条', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604723954414&di=4a909894f442e47e919907474dd5afff&imgtype=0&src=http%3A%2F%2Fp0.meituan.net%2Fwmproduct%2Ffea052addd23d8f2a80e617c4f9b105c244859.jpg%2540249w_249h_1e_1c_1l%257Cwatermark%3D1%26%26r%3D1%26p%3D9%26x%3D2%26y%3D2%26relative%3D1%26o%3D20', '10', '6', '2020-11-13 20:04:05', '2020-11-13 20:04:05');
INSERT INTO `order_food` VALUES ('341', '120', '1', null, '0', '香脆鸡米花', '1', 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1607948728,2940564414&fm=26&gp=0.jpg', '12', '10', '2020-11-13 20:04:05', '2020-11-13 20:04:05');
INSERT INTO `order_food` VALUES ('342', '120', '1', null, '0', '香辣鸡胗', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604723801481&di=a455913a41af59e86b287c6b027a65ce&imgtype=0&src=http%3A%2F%2F5b0988e595225.cdn.sohucs.com%2Fq_70%2Cc_zoom%2Cw_640%2Fimages%2F20171223%2Ffad0c148c02246cbb4ffd23dfaf147eb.jpeg', '19', '17', '2020-11-13 20:04:05', '2020-11-13 20:04:05');
INSERT INTO `order_food` VALUES ('343', '120', '1', null, '0', '俄罗斯烤肉', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604723707453&di=1ee694c241f5d371389aa60a863fd2a5&imgtype=0&src=http%3A%2F%2Fpics4.baidu.com%2Ffeed%2Fa8ec8a13632762d020f56b80086dbbfe503dc649.jpeg%3Ftoken%3D72a43f4b89eee1ca1d735b4663dbb0f2%26s%3D770607E35AB6B0D258364DBB0300F04B', '13', '11', '2020-11-13 20:04:05', '2020-11-13 20:04:05');
INSERT INTO `order_food` VALUES ('344', '120', '1', null, '0', '烤面筋', '1', 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3072961766,2151635605&fm=26&gp=0.jpg', '12', '11', '2020-11-13 20:04:05', '2020-11-13 20:04:05');
INSERT INTO `order_food` VALUES ('345', '120', '1', null, '0', '孜然锁骨', '1', 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=464251800,3487736601&fm=26&gp=0.jpg', '16', '12', '2020-11-13 20:04:05', '2020-11-13 20:04:05');
INSERT INTO `order_food` VALUES ('346', '120', '1', null, '0', '阿拉伯烤肉', '1', 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2254905268,2557779527&fm=26&gp=0.jpg', '20', '16', '2020-11-13 20:04:05', '2020-11-13 20:04:05');
INSERT INTO `order_food` VALUES ('347', '120', '1', null, '0', '正信鸡肉卷', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604723442040&di=9f6c60d8501b2b1da4a6e6667020058e&imgtype=0&src=http%3A%2F%2Fwww.dmwfoods.com%2Fhome%2F9%2Fe%2Fbbltdx%2Fresource%2F2016%2F09%2F09%2F57d280d972c6b.jpg', '15', '12', '2020-11-13 20:04:05', '2020-11-13 20:04:05');
INSERT INTO `order_food` VALUES ('348', '120', '1', null, '0', '正信汉堡', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604723376765&di=9f2b863d1cbc71012f32ff36ea2b067e&imgtype=0&src=http%3A%2F%2Fimages.3158.cn%2Fdata%2Fattachment%2Ftougao%2Farticle%2F2017%2F05%2F22%2F109cc228ae8456b0f88cad76d188e827.jpg', '15', '12', '2020-11-13 20:04:05', '2020-11-13 20:04:05');
INSERT INTO `order_food` VALUES ('349', '120', '1', null, '0', '烤肠', '1', 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=4075010374,3289619316&fm=26&gp=0.jpg', '8', '6', '2020-11-13 20:04:06', '2020-11-13 20:04:06');
INSERT INTO `order_food` VALUES ('350', '120', '1', null, '0', '正信鸡排', '1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604723110205&di=7ba9224df0eb69f5470d91f5ea3a659e&imgtype=0&src=http%3A%2F%2Fe.hiphotos.baidu.com%2Fbainuo%2Fcrop%3D0%2C37%2C470%2C285%3Bw%3D470%3Bq%3D80%2Fsign%3D6c621e39b5de9c82b22aa3cf51b1ac39%2F8694a4c27d1ed21bf0ced4e5ab6eddc451da3faf.jpg', '18', '12', '2020-11-13 20:04:06', '2020-11-13 20:04:06');

-- ----------------------------
-- Table structure for `order_refund`
-- ----------------------------
DROP TABLE IF EXISTS `order_refund`;
CREATE TABLE `order_refund` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` varchar(50) DEFAULT NULL COMMENT '订单ID',
  `user_id` int(11) DEFAULT '0' COMMENT '用户ID',
  `username` varchar(20) DEFAULT NULL COMMENT '用户姓名',
  `pay_money` double(10,2) DEFAULT '0.00' COMMENT '需要退回的款项',
  `refund_reason` varchar(1000) DEFAULT NULL COMMENT '退款原因',
  `service_cost` decimal(10,2) DEFAULT '0.00' COMMENT '协商的需要扣除的手续费',
  `completestatus` int(11) DEFAULT '0' COMMENT '状态，0：等待处理 1：商家已退款 -1：商家不同意退款',
  `gmt_create` datetime DEFAULT NULL,
  `gmt_modified` datetime DEFAULT NULL COMMENT '卖家处理时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='订单--退款处理';

-- ----------------------------
-- Records of order_refund
-- ----------------------------
INSERT INTO `order_refund` VALUES ('2', '108', '2', '渣渣龟', '12.00', '啊，就这了', '0.10', '1', '2020-11-12 16:48:11', '2020-11-12 17:44:09');
INSERT INTO `order_refund` VALUES ('11', '111', '6', '灰灰灰灰6666', '29.00', '必要了', '0.10', '1', '2020-11-12 23:22:01', '2020-11-13 00:10:40');
INSERT INTO `order_refund` VALUES ('12', '113', '1', '王sir', '12.00', '点多了', '0.10', '1', '2020-11-13 00:54:17', '2020-11-13 00:56:52');
INSERT INTO `order_refund` VALUES ('13', '120', '31', '渣渣渣', '133.60', '咬我啊', '0.10', '0', '2020-11-13 20:07:59', '2020-11-13 20:07:59');

-- ----------------------------
-- Table structure for `orderlist`
-- ----------------------------
DROP TABLE IF EXISTS `orderlist`;
CREATE TABLE `orderlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) DEFAULT '0' COMMENT '用户ID',
  `shop_id` int(11) DEFAULT '0' COMMENT '商铺ID',
  `box_cost` double DEFAULT '0' COMMENT '餐盒费',
  `send_cost` double DEFAULT '0' COMMENT '配送费',
  `total_money` double DEFAULT '0' COMMENT '总价',
  `completstatus` varchar(255) DEFAULT '商家已接单' COMMENT '状态',
  `demand_time` int(11) DEFAULT '0' COMMENT '限定的时间',
  `gmt_create` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '订单创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '订单更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单主表';

-- ----------------------------
-- Records of orderlist
-- ----------------------------

-- ----------------------------
-- Table structure for `pay`
-- ----------------------------
DROP TABLE IF EXISTS `pay`;
CREATE TABLE `pay` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` varchar(50) DEFAULT NULL COMMENT '订单ID',
  `user_id` int(11) DEFAULT '0' COMMENT '用户ID',
  `shop_id` int(11) DEFAULT '0' COMMENT '商店ID',
  `total_money` decimal(10,2) DEFAULT '0.00' COMMENT '支付总数',
  `completestatus` int(4) DEFAULT '10' COMMENT '状态',
  `is_deleted` int(11) DEFAULT '0',
  `gmt_create` datetime DEFAULT NULL COMMENT '加入时间',
  `gmt_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单支付表';

-- ----------------------------
-- Records of pay
-- ----------------------------

-- ----------------------------
-- Table structure for `persistent_logins`
-- ----------------------------
DROP TABLE IF EXISTS `persistent_logins`;
CREATE TABLE `persistent_logins` (
  `username` varchar(64) NOT NULL,
  `series` varchar(64) NOT NULL,
  `token` varchar(64) NOT NULL,
  `last_used` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`series`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of persistent_logins
-- ----------------------------
INSERT INTO `persistent_logins` VALUES ('18752151002', '+o85yHozAR52kEV6DUQMqQ==', 'erzx/cxUegrsboiEmk9u4g==', '2020-11-13 19:27:00');
INSERT INTO `persistent_logins` VALUES ('18752151002', '//4SmvHvrqtPVbYFodShjg==', 'Xa5m/8yF7ZVCo3GtNW0sew==', '2020-11-12 14:50:17');
INSERT INTO `persistent_logins` VALUES ('18752151002', '0WfL3FO7B2Z5y5atXQaP9w==', 'VuEi0JT+Ik5sPZionaZWiw==', '2020-11-13 20:06:21');
INSERT INTO `persistent_logins` VALUES ('18752151009', '2ihwFSAVLNcSaImPlUm+HQ==', 'xaPuTeX7EtgBDqfXZ+MKiQ==', '2020-11-12 14:44:20');
INSERT INTO `persistent_logins` VALUES ('18752151002', '2lLrvpDYSsM8gXH/Zalccg==', 'Vwq6FK3hWCfbnG5Xr7BQqg==', '2020-11-12 08:10:18');
INSERT INTO `persistent_logins` VALUES ('18752151002', '2U89TlBHWb2bq84ntdnHzA==', 'SLjSPjY7JKP7bFmEfMPO/g==', '2020-11-12 14:50:16');
INSERT INTO `persistent_logins` VALUES ('18752151007', '3kctv5NzUwfqfghHLeiIww==', 'Qu8NHLtHDnqrFbW6QQzRzw==', '2020-11-07 10:20:19');
INSERT INTO `persistent_logins` VALUES ('18752151007', '5kSWq+Cff89PoKI3hvupcg==', '6IVZiDDKxikkNa9tfH8ehQ==', '2020-11-11 14:51:11');
INSERT INTO `persistent_logins` VALUES ('18752151002', '8FaNQgQ1C+VfFjKfYmzUuA==', 'aU99YYlnKYiOicpcRncjYw==', '2020-11-12 06:41:15');
INSERT INTO `persistent_logins` VALUES ('18752151007', '9ga3kdyaW4qM5B4SE7zBnQ==', '643vMYw1Jay1VzaSju1caA==', '2020-11-07 10:20:19');
INSERT INTO `persistent_logins` VALUES ('18752151002', '9qrooGMsJ3e6n2XcDk9uig==', 'qBkXmhyFtqayXkBkL3kKyA==', '2020-11-13 12:06:03');
INSERT INTO `persistent_logins` VALUES ('18752151003', '9rrajY4uyGFvTxGH2zyBCg==', 'jX6Ae32t1qiD/N+xrNDoWA==', '2020-11-13 00:51:13');
INSERT INTO `persistent_logins` VALUES ('18752151002', '9Y2BUD239kvg2WwakJMDZg==', 'i6xIMl3RVFDFBJF237NCEQ==', '2020-11-12 14:50:17');
INSERT INTO `persistent_logins` VALUES ('10086', 'a0A9rN8SFhfGn9dHhgUx/w==', '3gooGupPBZtr0uPF8klMhg==', '2020-11-13 08:49:04');
INSERT INTO `persistent_logins` VALUES ('18752151004', 'A5mjY/o/t6vHdLPSwMjviw==', 'nj0lLjFfDvz0r5tSDuz++A==', '2020-11-13 00:07:22');
INSERT INTO `persistent_logins` VALUES ('18752151002', 'B+WccggKFYq+mSo1UMReig==', '+krpBiAKV1swTQVl4Ld+UQ==', '2020-11-12 14:50:17');
INSERT INTO `persistent_logins` VALUES ('18752151015', 'c3+MKxZn0j4srH5vPLHpRg==', 'MAOeQ4oKtlrUNL9X63QjMQ==', '2020-11-12 23:00:41');
INSERT INTO `persistent_logins` VALUES ('18752151007', 'cy5JQN5paF9F/XRvvguFgg==', 'pxclGH007ZB+at8r3P36CQ==', '2020-11-07 10:20:22');
INSERT INTO `persistent_logins` VALUES ('18752151003', 'eII+8ZpxqbqKIo9wdSsg4w==', 'tMrm5JE6BnEuzhj9QxLoow==', '2020-11-13 00:52:05');
INSERT INTO `persistent_logins` VALUES ('18752151003', 'Fo6+BbjPQkUGYhL6/xtZiQ==', '59EJHZjmyYxxsmIvqc83tw==', '2020-11-12 06:53:03');
INSERT INTO `persistent_logins` VALUES ('18752151002', 'fYPn9GFd21nYBpCKx2baOQ==', 'P6iyTvpHC4XrQIBfdogDYQ==', '2020-11-13 00:50:57');
INSERT INTO `persistent_logins` VALUES ('18752151005', 'GdvCCGocd3sQXpfy1adqZg==', 'RLtMebz8FUzCcYEdRX2jeQ==', '2020-11-13 07:40:23');
INSERT INTO `persistent_logins` VALUES ('18752151008', 'GVrNZpIVGr504nJ6dGc6Ew==', 'A3NX49KrHIzNMm2/Vrmnnw==', '2020-11-07 10:18:02');
INSERT INTO `persistent_logins` VALUES ('18752151003', 'HGsW2cXY5tMrFzYu2I0bCg==', 'vXz31JIWgQqzNV46GD/7UA==', '2020-11-13 08:46:45');
INSERT INTO `persistent_logins` VALUES ('18752151002', 'jvHA2r31nhcPpyx21+pWXA==', 'sbqEGJqxUCkE6ttO8U3QZQ==', '2020-11-12 14:50:17');
INSERT INTO `persistent_logins` VALUES ('18752151002', 'K4SVWXnkRZ6XTxmKuKvPkg==', 'pYBAL+j9tccIqn9V0dsxsw==', '2020-11-12 14:44:53');
INSERT INTO `persistent_logins` VALUES ('18752151002', 'Kd2wIS6AkcgSwaAxV6ADCA==', 'o/JSURhQuPZJvjcPLXgtfw==', '2020-11-12 14:50:17');
INSERT INTO `persistent_logins` VALUES ('18752151002', 'keepqBcEOcOPDKjS7OeI8Q==', 'Bz6OR5tbbPqZN5pWvS4tsw==', '2020-11-12 14:50:17');
INSERT INTO `persistent_logins` VALUES ('18752151015', 'kF9+F1FSYsiamgnXY8zIIw==', 'iEz4OpyYMtZQDFSE3xsn5g==', '2020-11-12 14:41:00');
INSERT INTO `persistent_logins` VALUES ('13511111111', 'KiF8uu+SzFtaVbLibuqFIw==', 'KjcrngCiinaXROsiNSbyrg==', '2020-11-13 20:00:59');
INSERT INTO `persistent_logins` VALUES ('18752151003', 'lEresMwMy4PF2cKWkQtmwA==', 'VwNqkMR3fOSL9vgzEBpegg==', '2020-11-13 20:06:01');
INSERT INTO `persistent_logins` VALUES ('18752151007', 'lPwDUUu1z4q6OvmxpHQwQw==', 'jxjTVxbtR2RGhBoJb3N3AQ==', '2020-11-07 10:20:21');
INSERT INTO `persistent_logins` VALUES ('18752151006', 'lZpntkLhKnpSaxKvt7ttVw==', '7AmqVOQ9VudtWYGJA+XZeg==', '2020-11-13 09:20:12');
INSERT INTO `persistent_logins` VALUES ('18752151007', 'mh1hmcv7l7T91rN3nI6Q9A==', '68zYzP1kgMB1W8YF4KRKyg==', '2020-11-11 15:01:56');
INSERT INTO `persistent_logins` VALUES ('13511111111', 'mNnLkGwloPRBNe/+TKKevQ==', 'a/cIqLsseOhluaMDl052rg==', '2020-11-13 14:45:58');
INSERT INTO `persistent_logins` VALUES ('18752151002', 'mOH2CirvDivtYkT52LTyCg==', '3Fnh5BixET/7N++mlkUdEw==', '2020-11-12 14:50:16');
INSERT INTO `persistent_logins` VALUES ('18752151002', 'mp8z5BHZEy6xaaTeRbTpFg==', 'vfXGvnrNZGCO2olhUmR8HA==', '2020-11-13 00:51:47');
INSERT INTO `persistent_logins` VALUES ('18752151003', 'MsJtNWYw2M2328JItZiOYw==', 'iPQm7LsUiIic/91TF2LYiQ==', '2020-11-12 14:46:15');
INSERT INTO `persistent_logins` VALUES ('18752151002', 'mu6Yq0fcsquF9QXw06mS3A==', 'WMqmSi0GYmGHQ/yc6JhAWA==', '2020-11-12 14:50:30');
INSERT INTO `persistent_logins` VALUES ('18752151003', 'nqs9NgHF/wl1LZMrvUCl2w==', 'VAXg6bUWSao21xqHse81jw==', '2020-11-13 08:46:45');
INSERT INTO `persistent_logins` VALUES ('18752151015', 'o1xsC6kf+wqDPjjKIR9yTg==', 'pnUlEMi1INoBsevK7WPDcQ==', '2020-11-12 14:41:00');
INSERT INTO `persistent_logins` VALUES ('18752151002', 'O4Cx2Wvl5XjeZKqk5aKOxA==', 'vGrE9bOob6JTtJDFtRELpw==', '2020-11-12 10:01:03');
INSERT INTO `persistent_logins` VALUES ('18752151002', 'o4YThsp83POY4qaGLfCpLA==', 'I8GHtjG2Akj3hH4wY999eg==', '2020-11-12 14:50:17');
INSERT INTO `persistent_logins` VALUES ('18752151006', 'oGPwNjpdJw6o2jsoBEHYbA==', 'Hl3AVkheWrk9tnaC2HZ4Ng==', '2020-11-12 22:58:38');
INSERT INTO `persistent_logins` VALUES ('18752151001', 'OODkqUcvuzZQcyNfKCJvrg==', 'ueanJ/yilBZQuJvpHu4/lg==', '2020-11-13 09:23:22');
INSERT INTO `persistent_logins` VALUES ('18752151002', 'oQ0GkH5/bMh7sAiTz20q3g==', 'jXhwZEqHPqV9OOdMfVELSg==', '2020-11-13 00:54:47');
INSERT INTO `persistent_logins` VALUES ('10086', 'orK2QKH/hTXEQmJ7YjJUWQ==', 'DDgBWf8hw9BzCMPeMtU3hg==', '2020-11-13 10:57:24');
INSERT INTO `persistent_logins` VALUES ('18752151002', 'pmTQAQJu2dZrlN6EZlsKJg==', 'FkBKiyKRlpdg69s6Gcb1uA==', '2020-11-12 12:07:16');
INSERT INTO `persistent_logins` VALUES ('18752151002', 'pQIhccP7dl6g8qcMrLLkOg==', 'iD5BdDxzLwb43hhkUZ24Gw==', '2020-11-12 14:50:17');
INSERT INTO `persistent_logins` VALUES ('13511111111', 'QowUL6970onD6k/tq7FQ0Q==', '9QSmj3ms30OovGp5SJC80A==', '2020-11-13 14:37:39');
INSERT INTO `persistent_logins` VALUES ('18752151002', 'qq0NbsaSvg3VmCYm4d6wSA==', 'lPelciC5OT7ZzutCd63tqQ==', '2020-11-12 14:51:36');
INSERT INTO `persistent_logins` VALUES ('18752151007', 'QqXoLNWJDUMnoZJXn6fR+A==', 'S6d0vzqpnHdsQgVhibVnoA==', '2020-11-07 10:22:25');
INSERT INTO `persistent_logins` VALUES ('18752151005', 'qtHPXWOrWUddZpIKxAmYxQ==', '79UAvthbDewa4vODeUmbSQ==', '2020-11-11 23:57:43');
INSERT INTO `persistent_logins` VALUES ('18752151007', 'SnlYUcShYgpMDD19i3JOzA==', 'qXJnx7rqpTzmiD/p/vIILg==', '2020-11-07 10:20:19');
INSERT INTO `persistent_logins` VALUES ('18752151002', 'SOCF2BK6xUUcyW+USDwTEQ==', 'VLD2oRWUK5FvqbrYmZ3otQ==', '2020-11-13 20:05:35');
INSERT INTO `persistent_logins` VALUES ('18752151003', 'sYVFeAqa391OLt0MGcTURw==', 'Ndy1eEHRpm4n5asmoYX+NQ==', '2020-11-13 00:52:01');
INSERT INTO `persistent_logins` VALUES ('18752151008', 'tLcYYlh0GPSZdPNLqcg5ng==', 'L4EpY9QSGN0hufIHN1b9gg==', '2020-11-07 10:13:31');
INSERT INTO `persistent_logins` VALUES ('18752151002', 'U8Db8n1dJmTsYHgAmSHf9A==', 'Fv4/PlwHUAvYGs4NAp4s7Q==', '2020-11-12 14:50:17');
INSERT INTO `persistent_logins` VALUES ('18752151015', 'VXVj4BkgkVvhy0ck0Dp+KQ==', 'Uwvm+s5dvHtZ2Ds8hkGtzw==', '2020-11-12 14:40:55');
INSERT INTO `persistent_logins` VALUES ('18752151003', 'w41UWTA+w3KusU3bHih6Pw==', 'gLmYrC615FFYz5s8eHpvaQ==', '2020-11-12 06:56:37');
INSERT INTO `persistent_logins` VALUES ('18752151015', 'W6vf7Leqc3IbxIaITNTarg==', 'DgoiETxZGXKEdtxJwniMxw==', '2020-11-12 14:40:55');
INSERT INTO `persistent_logins` VALUES ('13511111111', 'xCw6jizpJdOqGVrFedZHAg==', 'tY8H/vAA4Ro02A9nMcheAQ==', '2020-11-13 16:35:58');
INSERT INTO `persistent_logins` VALUES ('18752151008', 'xHr9/asMkn97TfounUrZFw==', 'k3aO1K367yVWaE2FveS6iQ==', '2020-11-07 10:18:16');
INSERT INTO `persistent_logins` VALUES ('13511111111', 'xTpPvhFtdP0jDkCN/6kePw==', 'CvZupoakJSle3KzZ9uHETQ==', '2020-11-13 14:46:09');
INSERT INTO `persistent_logins` VALUES ('18752151015', 'xv0woyr7c6lzx2gmBz6Zyg==', 'OSYoqkmiqeK+DktH8HswnA==', '2020-11-12 14:41:00');
INSERT INTO `persistent_logins` VALUES ('18752151590', 'ySk0tC2AbP0YfilSTx0Uyg==', 'DLR/qXMYYyBUb6jYgAFcYw==', '2020-11-13 07:06:58');
INSERT INTO `persistent_logins` VALUES ('18752151006', 'ZCjxMnYVwIt77jwd2QVdgg==', 'Knd8F5qLa7aFzZ80LOo23A==', '2020-11-13 08:47:16');

-- ----------------------------
-- Table structure for `QRTZ_BLOB_TRIGGERS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
CREATE TABLE `QRTZ_BLOB_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_BLOB_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for `QRTZ_CALENDARS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
CREATE TABLE `QRTZ_CALENDARS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_CALENDARS
-- ----------------------------

-- ----------------------------
-- Table structure for `QRTZ_CRON_TRIGGERS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
CREATE TABLE `QRTZ_CRON_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_CRON_TRIGGERS
-- ----------------------------
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', '0 0/30 * * * ?', 'GMT+08:00');

-- ----------------------------
-- Table structure for `QRTZ_FIRED_TRIGGERS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
CREATE TABLE `QRTZ_FIRED_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_FIRED_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for `QRTZ_JOB_DETAILS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
CREATE TABLE `QRTZ_JOB_DETAILS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_JOB_DETAILS
-- ----------------------------
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', null, 'io.renren.modules.job.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002E696F2E72656E72656E2E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200074C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017586BEED887874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000672656E72656E74000CE58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);

-- ----------------------------
-- Table structure for `QRTZ_LOCKS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_LOCKS`;
CREATE TABLE `QRTZ_LOCKS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_LOCKS
-- ----------------------------
INSERT INTO `QRTZ_LOCKS` VALUES ('RenrenScheduler', 'STATE_ACCESS');
INSERT INTO `QRTZ_LOCKS` VALUES ('RenrenScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for `QRTZ_PAUSED_TRIGGER_GRPS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------

-- ----------------------------
-- Table structure for `QRTZ_SCHEDULER_STATE`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
CREATE TABLE `QRTZ_SCHEDULER_STATE` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_SCHEDULER_STATE
-- ----------------------------
INSERT INTO `QRTZ_SCHEDULER_STATE` VALUES ('RenrenScheduler', '354946d0fe611605242146306', '1605269624692', '15000');
INSERT INTO `QRTZ_SCHEDULER_STATE` VALUES ('RenrenScheduler', 'LAPTOP-O23T4QCN1605232432262', '1605269626110', '15000');

-- ----------------------------
-- Table structure for `QRTZ_SIMPLE_TRIGGERS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_SIMPLE_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for `QRTZ_SIMPROP_TRIGGERS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_SIMPROP_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for `QRTZ_TRIGGERS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
CREATE TABLE `QRTZ_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `QRTZ_JOB_DETAILS` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_TRIGGERS
-- ----------------------------
INSERT INTO `QRTZ_TRIGGERS` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', 'TASK_1', 'DEFAULT', null, '1605270600000', '1605268800000', '5', 'WAITING', 'CRON', '1604312305000', '0', null, '2', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002E696F2E72656E72656E2E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200074C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017586BEED887874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000672656E72656E74000CE58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);

-- ----------------------------
-- Table structure for `register`
-- ----------------------------
DROP TABLE IF EXISTS `register`;
CREATE TABLE `register` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `password` varchar(500) NOT NULL,
  `truename` varchar(50) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `identity` int(11) NOT NULL,
  `registerstatus` varchar(50) DEFAULT '申请中',
  `gmt_modified` datetime DEFAULT NULL,
  `gmt_create` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of register
-- ----------------------------
INSERT INTO `register` VALUES ('2', '马鹿', '13588888889', '123456', '啊啊啊', '男', '1', '未通过', null, null);
INSERT INTO `register` VALUES ('3', '嘎嘎', '13511111111', '$2a$10$5EVqbN/HRYsv3y5iVfpZk.G4jaJrxtvFILLaM854lEPBFSrQmJYAS', '啊啊啊啊', '男', '2', '未通过', '2020-11-13 09:41:02', null);
INSERT INTO `register` VALUES ('4', '我淦', '13522222222', '$2a$10$xpGskNv6G0vSnGuEtZzSYeSmZONbF4.1oj1p.6KbaBcCHIaKoccU6', '嗡嗡嗡', '男', '2', '已通过', '2020-11-13 09:53:34', null);
INSERT INTO `register` VALUES ('5', '隔壁老王', '18752151590', '$2a$10$DH33kaKx68dLOAlBJG6g3O7xXq.jhVvHto5zovbxN.hPvfaf5XSVS', 'lll', '男', '2', '申请中', null, null);
INSERT INTO `register` VALUES ('6', 'zzz', '10086', '$2a$10$0qdTA5fTpusHi7so6FI1ROL4Pi7WCm.6Ov0u2BKv53bm4/b1P8iWe', 'zzz', '男', '1', '申请中', null, null);

-- ----------------------------
-- Table structure for `schedule_job`
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(4) DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='定时任务';

-- ----------------------------
-- Records of schedule_job
-- ----------------------------

-- ----------------------------
-- Table structure for `schedule_job_log`
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job_log`;
CREATE TABLE `schedule_job_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint(20) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `status` tinyint(4) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) DEFAULT NULL COMMENT '失败信息',
  `times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=198 DEFAULT CHARSET=utf8mb4 COMMENT='定时任务日志';

-- ----------------------------
-- Records of schedule_job_log
-- ----------------------------
INSERT INTO `schedule_job_log` VALUES ('1', '1', 'testTask', 'renren', '0', null, '1', '2020-11-02 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('2', '1', 'testTask', 'renren', '0', null, '0', '2020-11-03 17:00:01');
INSERT INTO `schedule_job_log` VALUES ('3', '1', 'testTask', 'renren', '0', null, '0', '2020-11-03 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('4', '1', 'testTask', 'renren', '0', null, '2', '2020-11-03 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('5', '1', 'testTask', 'renren', '0', null, '0', '2020-11-03 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('6', '1', 'testTask', 'renren', '0', null, '1', '2020-11-03 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('7', '1', 'testTask', 'renren', '0', null, '0', '2020-11-03 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('8', '1', 'testTask', 'renren', '0', null, '2', '2020-11-03 20:00:01');
INSERT INTO `schedule_job_log` VALUES ('9', '1', 'testTask', 'renren', '0', null, '2', '2020-11-03 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('10', '1', 'testTask', 'renren', '0', null, '2', '2020-11-03 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('11', '1', 'testTask', 'renren', '0', null, '1', '2020-11-03 21:30:01');
INSERT INTO `schedule_job_log` VALUES ('12', '1', 'testTask', 'renren', '0', null, '1', '2020-11-03 22:00:01');
INSERT INTO `schedule_job_log` VALUES ('13', '1', 'testTask', 'renren', '0', null, '3', '2020-11-03 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('14', '1', 'testTask', 'renren', '0', null, '1', '2020-11-04 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('15', '1', 'testTask', 'renren', '0', null, '2', '2020-11-04 20:00:01');
INSERT INTO `schedule_job_log` VALUES ('16', '1', 'testTask', 'renren', '0', null, '2', '2020-11-04 20:30:01');
INSERT INTO `schedule_job_log` VALUES ('17', '1', 'testTask', 'renren', '0', null, '2', '2020-11-04 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('18', '1', 'testTask', 'renren', '0', null, '2', '2020-11-04 21:30:01');
INSERT INTO `schedule_job_log` VALUES ('19', '1', 'testTask', 'renren', '0', null, '3', '2020-11-04 22:00:01');
INSERT INTO `schedule_job_log` VALUES ('20', '1', 'testTask', 'renren', '0', null, '1', '2020-11-07 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('21', '1', 'testTask', 'renren', '0', null, '1', '2020-11-07 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('22', '1', 'testTask', 'renren', '0', null, '3', '2020-11-07 10:30:01');
INSERT INTO `schedule_job_log` VALUES ('23', '1', 'testTask', 'renren', '0', null, '2', '2020-11-07 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('24', '1', 'testTask', 'renren', '0', null, '2', '2020-11-07 11:30:01');
INSERT INTO `schedule_job_log` VALUES ('25', '1', 'testTask', 'renren', '0', null, '2', '2020-11-07 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('26', '1', 'testTask', 'renren', '0', null, '69', '2020-11-07 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('27', '1', 'testTask', 'renren', '0', null, '1', '2020-11-07 14:30:01');
INSERT INTO `schedule_job_log` VALUES ('28', '1', 'testTask', 'renren', '0', null, '0', '2020-11-07 15:00:01');
INSERT INTO `schedule_job_log` VALUES ('29', '1', 'testTask', 'renren', '0', null, '2', '2020-11-07 15:30:01');
INSERT INTO `schedule_job_log` VALUES ('30', '1', 'testTask', 'renren', '0', null, '2', '2020-11-08 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('31', '1', 'testTask', 'renren', '0', null, '1', '2020-11-08 18:30:01');
INSERT INTO `schedule_job_log` VALUES ('32', '1', 'testTask', 'renren', '0', null, '1', '2020-11-08 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('33', '1', 'testTask', 'renren', '0', null, '1', '2020-11-08 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('34', '1', 'testTask', 'renren', '0', null, '1', '2020-11-08 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('35', '1', 'testTask', 'renren', '0', null, '1', '2020-11-08 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('36', '1', 'testTask', 'renren', '0', null, '1', '2020-11-08 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('37', '1', 'testTask', 'renren', '0', null, '26', '2020-11-10 01:00:01');
INSERT INTO `schedule_job_log` VALUES ('38', '1', 'testTask', 'renren', '0', null, '0', '2020-11-10 01:30:01');
INSERT INTO `schedule_job_log` VALUES ('39', '1', 'testTask', 'renren', '0', null, '1', '2020-11-10 08:30:01');
INSERT INTO `schedule_job_log` VALUES ('40', '1', 'testTask', 'renren', '0', null, '2', '2020-11-10 09:00:07');
INSERT INTO `schedule_job_log` VALUES ('41', '1', 'testTask', 'renren', '0', null, '11', '2020-11-10 14:00:01');
INSERT INTO `schedule_job_log` VALUES ('42', '1', 'testTask', 'renren', '0', null, '0', '2020-11-10 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('43', '1', 'testTask', 'renren', '0', null, '1', '2020-11-10 07:00:00');
INSERT INTO `schedule_job_log` VALUES ('44', '1', 'testTask', 'renren', '0', null, '0', '2020-11-10 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('45', '1', 'testTask', 'renren', '0', null, '0', '2020-11-10 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('46', '1', 'testTask', 'renren', '0', null, '0', '2020-11-10 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('47', '1', 'testTask', 'renren', '0', null, '1', '2020-11-10 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('48', '1', 'testTask', 'renren', '0', null, '1', '2020-11-10 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('49', '1', 'testTask', 'renren', '0', null, '0', '2020-11-10 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('50', '1', 'testTask', 'renren', '0', null, '1', '2020-11-10 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('51', '1', 'testTask', 'renren', '0', null, '1', '2020-11-10 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('52', '1', 'testTask', 'renren', '0', null, '0', '2020-11-10 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('53', '1', 'testTask', 'renren', '0', null, '1', '2020-11-10 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('54', '1', 'testTask', 'renren', '0', null, '0', '2020-11-10 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('55', '1', 'testTask', 'renren', '0', null, '0', '2020-11-10 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('56', '1', 'testTask', 'renren', '0', null, '1', '2020-11-10 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('57', '1', 'testTask', 'renren', '0', null, '1', '2020-11-10 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('58', '1', 'testTask', 'renren', '0', null, '18', '2020-11-10 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('59', '1', 'testTask', 'renren', '0', null, '4', '2020-11-10 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('60', '1', 'testTask', 'renren', '0', null, '0', '2020-11-10 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('61', '1', 'testTask', 'renren', '0', null, '0', '2020-11-10 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('62', '1', 'testTask', 'renren', '0', null, '0', '2020-11-10 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('63', '1', 'testTask', 'renren', '0', null, '1', '2020-11-10 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('64', '1', 'testTask', 'renren', '0', null, '0', '2020-11-10 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('65', '1', 'testTask', 'renren', '0', null, '0', '2020-11-10 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('66', '1', 'testTask', 'renren', '0', null, '0', '2020-11-10 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('67', '1', 'testTask', 'renren', '0', null, '1', '2020-11-10 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('68', '1', 'testTask', 'renren', '0', null, '0', '2020-11-10 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('69', '1', 'testTask', 'renren', '0', null, '1', '2020-11-10 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('70', '1', 'testTask', 'renren', '0', null, '0', '2020-11-10 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('71', '1', 'testTask', 'renren', '0', null, '1', '2020-11-10 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('72', '1', 'testTask', 'renren', '0', null, '1', '2020-11-10 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('73', '1', 'testTask', 'renren', '0', null, '1', '2020-11-10 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('74', '1', 'testTask', 'renren', '0', null, '0', '2020-11-10 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('75', '1', 'testTask', 'renren', '0', null, '0', '2020-11-10 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('76', '1', 'testTask', 'renren', '0', null, '0', '2020-11-10 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('77', '1', 'testTask', 'renren', '0', null, '24', '2020-11-11 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('78', '1', 'testTask', 'renren', '0', null, '2', '2020-11-11 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('79', '1', 'testTask', 'renren', '0', null, '1', '2020-11-11 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('80', '1', 'testTask', 'renren', '0', null, '1', '2020-11-11 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('81', '1', 'testTask', 'renren', '0', null, '0', '2020-11-11 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('82', '1', 'testTask', 'renren', '0', null, '1', '2020-11-11 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('83', '1', 'testTask', 'renren', '0', null, '0', '2020-11-11 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('84', '1', 'testTask', 'renren', '0', null, '0', '2020-11-11 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('85', '1', 'testTask', 'renren', '0', null, '1', '2020-11-11 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('86', '1', 'testTask', 'renren', '0', null, '1', '2020-11-11 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('87', '1', 'testTask', 'renren', '0', null, '0', '2020-11-11 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('88', '1', 'testTask', 'renren', '0', null, '1', '2020-11-11 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('89', '1', 'testTask', 'renren', '0', null, '1', '2020-11-11 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('90', '1', 'testTask', 'renren', '0', null, '1', '2020-11-11 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('91', '1', 'testTask', 'renren', '0', null, '0', '2020-11-11 07:00:00');
INSERT INTO `schedule_job_log` VALUES ('92', '1', 'testTask', 'renren', '0', null, '0', '2020-11-11 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('93', '1', 'testTask', 'renren', '0', null, '0', '2020-11-11 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('94', '1', 'testTask', 'renren', '0', null, '0', '2020-11-11 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('95', '1', 'testTask', 'renren', '0', null, '1', '2020-11-11 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('96', '1', 'testTask', 'renren', '0', null, '0', '2020-11-11 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('97', '1', 'testTask', 'renren', '0', null, '1', '2020-11-11 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('98', '1', 'testTask', 'renren', '0', null, '0', '2020-11-11 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('99', '1', 'testTask', 'renren', '0', null, '1', '2020-11-11 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('100', '1', 'testTask', 'renren', '0', null, '0', '2020-11-11 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('101', '1', 'testTask', 'renren', '0', null, '0', '2020-11-11 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('102', '1', 'testTask', 'renren', '0', null, '0', '2020-11-11 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('103', '1', 'testTask', 'renren', '0', null, '0', '2020-11-11 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('104', '1', 'testTask', 'renren', '0', null, '0', '2020-11-11 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('105', '1', 'testTask', 'renren', '0', null, '0', '2020-11-11 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('106', '1', 'testTask', 'renren', '0', null, '0', '2020-11-11 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('107', '1', 'testTask', 'renren', '0', null, '2', '2020-11-11 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('108', '1', 'testTask', 'renren', '0', null, '0', '2020-11-11 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('109', '1', 'testTask', 'renren', '0', null, '1', '2020-11-11 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('110', '1', 'testTask', 'renren', '0', null, '0', '2020-11-11 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('111', '1', 'testTask', 'renren', '0', null, '0', '2020-11-11 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('112', '1', 'testTask', 'renren', '0', null, '0', '2020-11-11 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('113', '1', 'testTask', 'renren', '0', null, '0', '2020-11-11 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('114', '1', 'testTask', 'renren', '0', null, '1', '2020-11-11 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('115', '1', 'testTask', 'renren', '0', null, '0', '2020-11-11 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('116', '1', 'testTask', 'renren', '0', null, '0', '2020-11-11 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('117', '1', 'testTask', 'renren', '0', null, '0', '2020-11-11 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('118', '1', 'testTask', 'renren', '0', null, '1', '2020-11-11 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('119', '1', 'testTask', 'renren', '0', null, '0', '2020-11-11 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('120', '1', 'testTask', 'renren', '0', null, '1', '2020-11-11 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('121', '1', 'testTask', 'renren', '0', null, '0', '2020-11-11 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('122', '1', 'testTask', 'renren', '0', null, '0', '2020-11-11 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('123', '1', 'testTask', 'renren', '0', null, '0', '2020-11-11 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('124', '1', 'testTask', 'renren', '0', null, '1', '2020-11-11 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('125', '1', 'testTask', 'renren', '0', null, '30', '2020-11-12 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('126', '1', 'testTask', 'renren', '0', null, '0', '2020-11-12 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('127', '1', 'testTask', 'renren', '0', null, '1', '2020-11-12 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('128', '1', 'testTask', 'renren', '0', null, '0', '2020-11-12 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('129', '1', 'testTask', 'renren', '0', null, '0', '2020-11-12 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('130', '1', 'testTask', 'renren', '0', null, '0', '2020-11-12 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('131', '1', 'testTask', 'renren', '0', null, '0', '2020-11-12 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('132', '1', 'testTask', 'renren', '0', null, '1', '2020-11-12 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('133', '1', 'testTask', 'renren', '0', null, '0', '2020-11-12 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('134', '1', 'testTask', 'renren', '0', null, '0', '2020-11-12 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('135', '1', 'testTask', 'renren', '0', null, '0', '2020-11-12 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('136', '1', 'testTask', 'renren', '0', null, '0', '2020-11-12 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('137', '1', 'testTask', 'renren', '0', null, '0', '2020-11-12 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('138', '1', 'testTask', 'renren', '0', null, '0', '2020-11-12 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('139', '1', 'testTask', 'renren', '0', null, '1', '2020-11-12 07:00:00');
INSERT INTO `schedule_job_log` VALUES ('140', '1', 'testTask', 'renren', '0', null, '0', '2020-11-12 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('141', '1', 'testTask', 'renren', '0', null, '1', '2020-11-12 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('142', '1', 'testTask', 'renren', '0', null, '0', '2020-11-12 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('143', '1', 'testTask', 'renren', '0', null, '0', '2020-11-12 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('144', '1', 'testTask', 'renren', '0', null, '1', '2020-11-12 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('145', '1', 'testTask', 'renren', '0', null, '0', '2020-11-12 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('146', '1', 'testTask', 'renren', '0', null, '0', '2020-11-12 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('147', '1', 'testTask', 'renren', '0', null, '0', '2020-11-12 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('148', '1', 'testTask', 'renren', '0', null, '0', '2020-11-12 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('149', '1', 'testTask', 'renren', '0', null, '0', '2020-11-12 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('150', '1', 'testTask', 'renren', '0', null, '0', '2020-11-12 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('151', '1', 'testTask', 'renren', '0', null, '0', '2020-11-12 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('152', '1', 'testTask', 'renren', '0', null, '1', '2020-11-12 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('153', '1', 'testTask', 'renren', '0', null, '0', '2020-11-12 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('154', '1', 'testTask', 'renren', '0', null, '0', '2020-11-12 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('155', '1', 'testTask', 'renren', '0', null, '0', '2020-11-12 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('156', '1', 'testTask', 'renren', '0', null, '0', '2020-11-12 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('157', '1', 'testTask', 'renren', '0', null, '1', '2020-11-12 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('158', '1', 'testTask', 'renren', '0', null, '0', '2020-11-12 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('159', '1', 'testTask', 'renren', '0', null, '0', '2020-11-12 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('160', '1', 'testTask', 'renren', '0', null, '1', '2020-11-12 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('161', '1', 'testTask', 'renren', '0', null, '1', '2020-11-12 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('162', '1', 'testTask', 'renren', '0', null, '1', '2020-11-12 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('163', '1', 'testTask', 'renren', '0', null, '0', '2020-11-12 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('164', '1', 'testTask', 'renren', '0', null, '0', '2020-11-12 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('165', '1', 'testTask', 'renren', '0', null, '0', '2020-11-12 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('166', '1', 'testTask', 'renren', '0', null, '1', '2020-11-12 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('167', '1', 'testTask', 'renren', '0', null, '0', '2020-11-12 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('168', '1', 'testTask', 'renren', '0', null, '1', '2020-11-12 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('169', '1', 'testTask', 'renren', '0', null, '0', '2020-11-12 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('170', '1', 'testTask', 'renren', '0', null, '1', '2020-11-12 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('171', '1', 'testTask', 'renren', '0', null, '0', '2020-11-12 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('172', '1', 'testTask', 'renren', '0', null, '1', '2020-11-12 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('173', '1', 'testTask', 'renren', '0', null, '32', '2020-11-13 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('174', '1', 'testTask', 'renren', '0', null, '1', '2020-11-13 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('175', '1', 'testTask', 'renren', '0', null, '0', '2020-11-13 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('176', '1', 'testTask', 'renren', '0', null, '0', '2020-11-13 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('177', '1', 'testTask', 'renren', '0', null, '1', '2020-11-13 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('178', '1', 'testTask', 'renren', '0', null, '0', '2020-11-13 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('179', '1', 'testTask', 'renren', '0', null, '1', '2020-11-13 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('180', '1', 'testTask', 'renren', '0', null, '1', '2020-11-13 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('181', '1', 'testTask', 'renren', '0', null, '0', '2020-11-13 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('182', '1', 'testTask', 'renren', '0', null, '0', '2020-11-13 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('183', '1', 'testTask', 'renren', '0', null, '1', '2020-11-13 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('184', '1', 'testTask', 'renren', '0', null, '0', '2020-11-13 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('185', '1', 'testTask', 'renren', '0', null, '0', '2020-11-13 14:00:01');
INSERT INTO `schedule_job_log` VALUES ('186', '1', 'testTask', 'renren', '0', null, '0', '2020-11-13 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('187', '1', 'testTask', 'renren', '0', null, '4', '2020-11-13 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('188', '1', 'testTask', 'renren', '0', null, '4', '2020-11-13 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('189', '1', 'testTask', 'renren', '0', null, '0', '2020-11-13 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('190', '1', 'testTask', 'renren', '0', null, '0', '2020-11-13 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('191', '1', 'testTask', 'renren', '0', null, '0', '2020-11-13 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('192', '1', 'testTask', 'renren', '0', null, '1', '2020-11-13 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('193', '1', 'testTask', 'renren', '0', null, '0', '2020-11-13 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('194', '1', 'testTask', 'renren', '0', null, '0', '2020-11-13 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('195', '1', 'testTask', 'renren', '0', null, '3', '2020-11-13 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('196', '1', 'testTask', 'renren', '0', null, '0', '2020-11-13 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('197', '1', 'testTask', 'renren', '0', null, '1', '2020-11-13 20:00:00');

-- ----------------------------
-- Table structure for `shop_category`
-- ----------------------------
DROP TABLE IF EXISTS `shop_category`;
CREATE TABLE `shop_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `catename` varchar(50) DEFAULT NULL COMMENT '分类名字',
  `describle` varchar(500) DEFAULT NULL COMMENT '简单的描述',
  `gmt_create` datetime DEFAULT NULL,
  `gmt_modified` datetime DEFAULT NULL,
  `is_deleted` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='通用的分类表';

-- ----------------------------
-- Records of shop_category
-- ----------------------------
INSERT INTO `shop_category` VALUES ('1', '水果', null, '2020-11-05 21:25:05', '2020-11-05 21:25:05', '0');
INSERT INTO `shop_category` VALUES ('2', '水果', null, '2020-11-05 21:26:06', '2020-11-05 21:26:06', '0');
INSERT INTO `shop_category` VALUES ('3', '水果', null, '2020-11-05 21:28:12', '2020-11-05 21:28:12', '0');
INSERT INTO `shop_category` VALUES ('4', '水果', null, '2020-11-05 21:33:26', '2020-11-05 21:33:26', '0');

-- ----------------------------
-- Table structure for `shop_collect`
-- ----------------------------
DROP TABLE IF EXISTS `shop_collect`;
CREATE TABLE `shop_collect` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `shop_id` int(11) DEFAULT '0' COMMENT '店铺ID',
  `user_id` int(11) DEFAULT '0' COMMENT '用户ID',
  `gmt_create` datetime DEFAULT NULL,
  `gmt_modified` datetime DEFAULT NULL,
  `is_deleted` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `商店id` (`shop_id`),
  CONSTRAINT `商店id` FOREIGN KEY (`shop_id`) REFERENCES `shop_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺收藏表';

-- ----------------------------
-- Records of shop_collect
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_info`
-- ----------------------------
DROP TABLE IF EXISTS `shop_info`;
CREATE TABLE `shop_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `shopowner_id` int(11) DEFAULT '0' COMMENT '商店拥有者ID',
  `shopname` varchar(50) DEFAULT NULL COMMENT '商店名称',
  `contact_man` varchar(20) DEFAULT NULL COMMENT '联系人',
  `contact_mobile` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `cateid` int(11) DEFAULT '0' COMMENT '门店类型',
  `begin_time` time DEFAULT '00:00:00' COMMENT '营业开始时间',
  `end_time` time DEFAULT '00:00:00' COMMENT '营业结束时间',
  `permit_img` varchar(500) DEFAULT 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=857799480,4286784571&fm=26&gp=0.jpg',
  `logo_img` varchar(500) DEFAULT NULL COMMENT 'logo图片',
  `address` varchar(200) DEFAULT NULL COMMENT '详细地址',
  `mobile` varchar(20) DEFAULT NULL COMMENT '外卖电话',
  `notice` varchar(500) DEFAULT NULL COMMENT '商家公告',
  `score` float DEFAULT '0' COMMENT '平均评分',
  `send_time` varchar(50) DEFAULT NULL COMMENT '配送时间',
  `box_cost` double DEFAULT '0' COMMENT '餐盒费用',
  `send_cost` double DEFAULT '0' COMMENT '配送费用',
  `floor_send_cost` double DEFAULT '0' COMMENT '起送消费',
  `show_status` int(11) DEFAULT '0' COMMENT '店铺状态 ，0关门，1营业',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='商铺信息表';

-- ----------------------------
-- Records of shop_info
-- ----------------------------
INSERT INTO `shop_info` VALUES ('1', '2', '正信鸡排', '张小蕊', '18752151002', '2', '01:09:00', '23:20:00', 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=857799480,4286784571&fm=26&gp=0.jpg', 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=4023824055,1008608247&fm=26&gp=0.jpg', '迎龙路01号', '18152554901', '可送，等你', '4.8', '20', '2', '1', '18', '1');
INSERT INTO `shop_info` VALUES ('2', '2', '你的烧烤', '张小蕊', '18752151002', '2', '18:00:00', '00:00:00', 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=857799480,4286784571&fm=26&gp=0.jpg', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604492187490&di=03fefb4bbc6657ec48b75827166570f7&imgtype=0&src=http%3A%2F%2Fimg.redocn.com%2Fsheji%2F20170704%2Fshaokaodianshaokaomeishihaibao_8396737.jpg.285.jpg', '迎龙路16号', '18152554902', '可送', '4.6', '20', '2', '1', '15', '1');
INSERT INTO `shop_info` VALUES ('3', '4', '易合堂', '吴某', '18752151004', '1', '11:00:00', '23:00:00', 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=857799480,4286784571&fm=26&gp=0.jpg', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604492219839&di=f8a5e51e4690279d56f78875beec9ea8&imgtype=0&src=http%3A%2F%2Fimg.zx123.cn%2FResources%2Fzx123cn%2Fuploadfile%2F2015%2F0629%2F2f2b28987d902476511b1cf67d8f8e01.jpg', '迎龙路02号', '18152554903', '可送啊啊啊', '4.7', '15', '1', '0', '10', '1');
INSERT INTO `shop_info` VALUES ('4', '4', '好伙伴超市', '吴某', '18752151004', '3', '08:00:00', '22:00:00', 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=857799480,4286784571&fm=26&gp=0.jpg', 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=4241366946,1005981075&fm=26&gp=0.jpg', '迎龙路16号', '18152554904', '可送', '4.5', '30', '0', '1', '45', '1');
INSERT INTO `shop_info` VALUES ('5', '5', '老钱水果摊', '钱大佬', '18752151005', '4', '10:00:00', '22:00:00', 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=857799480,4286784571&fm=26&gp=0.jpg', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2911121634,179014357&fm=26&gp=0.jpg', '迎龙路12号', '18152554905', '可送', '4.8', '20', '1', '1', '20', '1');
INSERT INTO `shop_info` VALUES ('6', '5', '东北饺子', '钱大佬', '18752151005 ', '2', '10:00:00', '23:00:00', 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=857799480,4286784571&fm=26&gp=0.jpg', 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=4260193589,2447593630&fm=26&gp=0.jpg', '迎龙路07号', '18152554906', '可送', '4.6', '20', '1', '2', '40', '0');
INSERT INTO `shop_info` VALUES ('7', '6', '翁哥牛腩饭', '翁哥', '18752151006', '2', '09:30:00', '22:30:00', 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=857799480,4286784571&fm=26&gp=0.jpg', 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2813174246,1077760129&fm=15&gp=0.jpg', '迎龙路04号', '18152554907', '可送，好吃', '4.4', '15', '2', '0', '15', '0');
INSERT INTO `shop_info` VALUES ('8', '7', '无骨烤鱼饭', '王小婷', '18752151007', '2', '15:00:00', '23:30:00', 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=857799480,4286784571&fm=26&gp=0.jpg', 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=455639745,3579250986&fm=26&gp=0.jpg', '迎龙路08号', '18152554908', '可送，美味', '4.9', '20', '2', '0', '20', '0');
INSERT INTO `shop_info` VALUES ('9', '8', '牛蛙饭', '吴璇', '18752151008', '2', '15:30:00', '23:50:00', 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=857799480,4286784571&fm=26&gp=0.jpg', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1512646277,3606280278&fm=26&gp=0.jpg', '迎龙路10号', '18152554909', '好吃不上火', '4.6', '20', '2', '1', '15', '0');
INSERT INTO `shop_info` VALUES ('10', '9', '老司机茶', '梁章', '18752151009', '1', '08:00:00', '00:00:00', 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=857799480,4286784571&fm=26&gp=0.jpg', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604492387785&di=b81456118234646001da12157725b873&imgtype=0&src=http%3A%2F%2Fpic4.zhimg.com%2Fv2-22f88f817cf640a0ffbaa93e479aa023_1200x500.jpg', '迎龙路03号', '18152554910', '喝美味', '4.6', '15', '1', '0', '10', '0');
INSERT INTO `shop_info` VALUES ('11', '9', '梁记猪脚饭', '梁章', '18752151009', '2', '00:00:00', '00:00:00', 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=857799480,4286784571&fm=26&gp=0.jpg', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604492408388&di=d89e2ba09ae29f438fd7ac3d9495a911&imgtype=0&src=http%3A%2F%2Fcy.89178.com%2Fupload%2Farticle%2F20170609%2F64415196901496993618.jpg', '迎龙路13号', '18152554911', '红红火火', '4.4', '20', '1', '0', '12', '0');
INSERT INTO `shop_info` VALUES ('12', '10', '唐多多', '唐珊', '18752151010', '3', '08:00:00', '00:00:00', 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=857799480,4286784571&fm=26&gp=0.jpg', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1219233099,3720768806&fm=26&gp=0.jpg', '迎龙路21号', '18152554912', '每一天', '4.8', '30', '0', '5', '14', '0');
INSERT INTO `shop_info` VALUES ('13', '11', '鲜果月', '陈月', '18752151011', '4', '09:00:00', '00:00:00', 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=857799480,4286784571&fm=26&gp=0.jpg', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604492474378&di=d4b0f10edb9e59e8c2b0967892a2bac7&imgtype=0&src=http%3A%2F%2Fimg.pconline.com.cn%2Fimages%2Fupload%2Fupc%2Ftx%2Fwallpaper%2F1501%2F16%2Fc0%2F1967021_1421421294388_800x600.jpg', '迎龙路11号', '18152554913', '送', '4.6', '35', '0', '3', '15', '0');
INSERT INTO `shop_info` VALUES ('14', '12', '胖子点心店', '周老二', '18752151012', '2', '10:00:00', '22:30:00', 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=857799480,4286784571&fm=26&gp=0.jpg', 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2018368047,2016115337&fm=26&gp=0.jpg', '迎龙路03号', '18152554914', '等你', '4.4', '20', '1', '0', '12', '0');
INSERT INTO `shop_info` VALUES ('15', '12', '大碗面', '周老二', '18752151012', '2', '10:00:00', '23:00:00', 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=857799480,4286784571&fm=26&gp=0.jpg', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604492516398&di=612a64cea9119fa4ba393de31f1cf8f6&imgtype=0&src=http%3A%2F%2Fimg.mp.sohu.com%2Fupload%2F20170729%2Fd7b1cdd2f62149da8d1477bc6ba4ee1f_th.png', '迎龙路09号', '18152554915', '好', '4.6', '20', '1', '0', '24', '0');
INSERT INTO `shop_info` VALUES ('16', '13', '烧腊饭', '孙空', '18752151013', '2', '10:00:00', '23:00:00', 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=857799480,4286784571&fm=26&gp=0.jpg', 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1855894862,2900862560&fm=26&gp=0.jpg', '迎龙路15号', '18152554916', '666', '4.8', '15', '1', '1', '15', '0');
INSERT INTO `shop_info` VALUES ('17', '14', '鱼粉', '谢大宏', '18752151014', '2', '11:00:00', '22:30:00', 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=857799480,4286784571&fm=26&gp=0.jpg', 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3777292791,3172690594&fm=26&gp=0.jpg', '迎龙路05号', '18152554917', '777', '4.6', '15', '1', '0', '15', '0');
INSERT INTO `shop_info` VALUES ('18', '15', '炒饭王', '黄豪', '18752151015', '2', '10:30:00', '22:30:00', 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=857799480,4286784571&fm=26&gp=0.jpg', 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3362642489,3087082810&fm=26&gp=0.jpg', '迎龙路19号', '18152554918', '666', '4.6', '20', '1', '1', '15', '0');
INSERT INTO `shop_info` VALUES ('19', '16', '包点', '熊小萱', '18752151016', '2', '10:00:00', '21:00:00', 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=857799480,4286784571&fm=26&gp=0.jpg', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1663993842,380578069&fm=26&gp=0.jpg', '迎龙路14号', '18152554919', '333', '4.4', '20', '1', '1', '10', '0');
INSERT INTO `shop_info` VALUES ('20', '17', '汤粉王', '郑勇', '18752151017', '2', '10:00:00', '23:00:00', 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=857799480,4286784571&fm=26&gp=0.jpg', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604492595043&di=46e48583960120a4ad97fb1a6e796a22&imgtype=0&src=http%3A%2F%2Fe.hiphotos.baidu.com%2Fbainuo%2Fcrop%3D0%2C77%2C803%2C486%3Bw%3D720%3Bq%3D79%2Fsign%3Deb13035433a85edfeec3a46374642514%2Fa686c9177f3e67099e1f2ffb3cc79f3df8dc5592.jpg', '迎龙路31号', '18152554920', '111', '4.8', '20', '1', '1', '12', '0');
INSERT INTO `shop_info` VALUES ('21', '18', '茶千道', '林瑞', '18752151018', '3', '10:00:00', '23:00:00', 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=857799480,4286784571&fm=26&gp=0.jpg', 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2782615249,1587897583&fm=26&gp=0.jpg', '迎龙路17号', '18152554921', '好喝', '4.7', '15', '1', '0', '14', '0');
INSERT INTO `shop_info` VALUES ('22', '19', '烧仙草', '蔡敏', '18752151019', '3', '10:00:00', '22:30:00', 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=857799480,4286784571&fm=26&gp=0.jpg', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604492664476&di=e7187cb039d17497a67ac1d47f889c17&imgtype=0&src=http%3A%2F%2Fqcloud.dpfile.com%2Fpc%2F8ZDqKOdCOV6REgVw6HEBQiJtEGPI-hgN9La6NHxGfHwaWV7jnGXDu6q3ZNCC13oojoJrvItByyS4HHaWdXyO_DrXIaWutJls2xCVbatkhjUNNiIYVnHvzugZCuBITtvjski7YaLlHpkrQUr5euoQrg.jpg', '迎龙路18号', '18152554922', '喝饱', '4.6', '15', '1', '1', '12', '0');
INSERT INTO `shop_info` VALUES ('23', '20', '美佳', '冯梅', '18752151020', '4', '09:00:00', '23:00:00', 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=857799480,4286784571&fm=26&gp=0.jpg', 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1789312237,1736312672&fm=26&gp=0.jpg', '迎龙路22号', '18152554923', '接着来', '4.3', '30', '0', '5', '35', '0');
INSERT INTO `shop_info` VALUES ('24', '21', '点心传说', '李婷', '18752151021', '2', '10:00:00', '22:30:00', 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=857799480,4286784571&fm=26&gp=0.jpg', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604492707974&di=e3347164721aa8390740ca81554d0efd&imgtype=0&src=http%3A%2F%2Fqcloud.dpfile.com%2Fpc%2Ff6Qt77_KaJdjp8UI7GVMZiHw4KOb4xrXpTaPbUxMTIhCuOLBp4VcPfUu7tXbiRZdjoJrvItByyS4HHaWdXyO_DrXIaWutJls2xCVbatkhjUNNiIYVnHvzugZCuBITtvjski7YaLlHpkrQUr5euoQrg.jpg', '迎龙路25号', '18152554924', '来来来', '4.6', '20', '1', '1', '10', '0');
INSERT INTO `shop_info` VALUES ('25', '22', '黄焖鸡米饭', '李佳', '18752151022', '2', '10:30:00', '22:00:00', 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=857799480,4286784571&fm=26&gp=0.jpg', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604492719077&di=3abbe9c56d0a7beb8321717780a65679&imgtype=0&src=http%3A%2F%2Fwww.befa.cn%2Ffile%2Fupload%2F201708%2F11%2F130945861.jpg', '迎龙路23号', '18152554925', '666', '4.5', '20', '1', '0', '12', '0');
INSERT INTO `shop_info` VALUES ('26', '23', '猿人超市', '简易', '18752151023', '4', '00:00:00', '00:00:00', 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=857799480,4286784571&fm=26&gp=0.jpg', 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3829884016,1769101302&fm=26&gp=0.jpg', '迎龙路34号', '18152554926', '777', '4.5', '20', '1', '1', '34', '0');
INSERT INTO `shop_info` VALUES ('27', '24', '董氏咖啡', '孔董', '18752151024', '3', '10:00:00', '23:00:00', 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=857799480,4286784571&fm=26&gp=0.jpg', 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1933311266,1203412646&fm=26&gp=0.jpg', '迎龙路06号', '18152554927', '333', '4.6', '15', '1', '0', '20', '0');
INSERT INTO `shop_info` VALUES ('28', '26', '智慧蛋糕', '廖智', '18752151026', '2', '10:00:00', '22:30:00', 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=857799480,4286784571&fm=26&gp=0.jpg', 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=285901181,4044392254&fm=26&gp=0.jpg', '迎龙路20号', '18152554928', '美味蛋糕', '4.8', '15', '2', '1', '24', '0');
INSERT INTO `shop_info` VALUES ('29', '28', '工喜冰激凌', '彭工', '18752151028', '2', '11:00:00', '23:00:00', 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=857799480,4286784571&fm=26&gp=0.jpg', 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=179526549,408214680&fm=26&gp=0.jpg', '迎龙路24号', '18152554929', '好', '4.6', '30', '2', '1', '15', '0');
INSERT INTO `shop_info` VALUES ('30', '30', '砂锅麻辣烫', '苏班', '18752151030', '2', '10:00:00', '23:30:00', 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=857799480,4286784571&fm=26&gp=0.jpg', 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=792128420,1354282392&fm=26&gp=0.jpg', '迎龙路28号', '18152554930', '666', '4.7', '25', '2', '1', '15', '0');
INSERT INTO `shop_info` VALUES ('34', '2', '蜜汁叉烧饭', null, null, '2', '00:00:00', '00:00:00', 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=857799480,4286784571&fm=26&gp=0.jpg', null, '广金2栋宿舍楼流动摊子', '18752151002', null, '0', null, '0', '0', '0', '1');
INSERT INTO `shop_info` VALUES ('35', '2', '蜜汁叉烧饭2', null, null, '2', '00:00:00', '00:00:00', 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=857799480,4286784571&fm=26&gp=0.jpg', null, '广金2栋宿舍楼流动摊子2', '18752151002', null, '0', null, '0', '0', '0', '1');

-- ----------------------------
-- Table structure for `shopregister`
-- ----------------------------
DROP TABLE IF EXISTS `shopregister`;
CREATE TABLE `shopregister` (
  `shopregister_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `shopowner_id` int(11) NOT NULL COMMENT '商家id',
  `cateid` int(11) NOT NULL COMMENT '商店类型',
  `shopname` varchar(50) NOT NULL COMMENT '店铺名称',
  `adress` varchar(200) NOT NULL COMMENT '店铺地址',
  `images` varchar(500) DEFAULT NULL,
  `permit_img` varchar(500) DEFAULT 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=857799480,4286784571&fm=26&gp=0.jpg',
  `registerstatus` varchar(50) NOT NULL DEFAULT '审核中' COMMENT '申请状态 0表示未处理，1表示审核通过，-1表示审核不通过',
  `gmt_create` datetime DEFAULT NULL,
  `gmt_modified` datetime DEFAULT NULL,
  `is_deleted` int(11) DEFAULT '0',
  PRIMARY KEY (`shopregister_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of shopregister
-- ----------------------------
INSERT INTO `shopregister` VALUES ('1', '2', '1', '张记早点铺', '天河区迎龙路225号', 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=857799480,4286784571&fm=26&gp=0.jpg', 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=857799480,4286784571&fm=26&gp=0.jpg', '已通过', '2020-10-29 14:16:39', '2020-10-29 14:16:41', '0');
INSERT INTO `shopregister` VALUES ('5', '2', '2', '蜜汁叉烧饭', '广金2栋宿舍楼流动摊子', 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=15169130,2148904711&fm=26&gp=0.jpg', 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=857799480,4286784571&fm=26&gp=0.jpg', '已通过', '2020-11-13 12:19:47', '2020-11-13 12:19:47', '0');
INSERT INTO `shopregister` VALUES ('6', '2', '2', '蜜汁叉烧饭2', '广金2栋宿舍楼流动摊子2', 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=15169130,2148904711&fm=26&gp=0.jpg', 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=857799480,4286784571&fm=26&gp=0.jpg', '已通过', '2020-11-13 14:08:38', '2020-11-13 14:08:38', '0');

-- ----------------------------
-- Table structure for `sys_captcha`
-- ----------------------------
DROP TABLE IF EXISTS `sys_captcha`;
CREATE TABLE `sys_captcha` (
  `uuid` char(36) NOT NULL COMMENT 'uuid',
  `code` varchar(6) NOT NULL COMMENT '验证码',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统验证码';

-- ----------------------------
-- Records of sys_captcha
-- ----------------------------
INSERT INTO `sys_captcha` VALUES ('1c3c9246-118d-4860-86a7-7f9dd2922065', 'm35nw', '2020-11-04 15:02:10');
INSERT INTO `sys_captcha` VALUES ('1d536cf7-9eae-4e6e-80d7-95f96a237050', '3byxe', '2020-11-08 22:50:30');
INSERT INTO `sys_captcha` VALUES ('33591178-4956-4dc2-8ff8-ab91cd85c78c', 'd87cn', '2020-11-03 21:40:39');
INSERT INTO `sys_captcha` VALUES ('3e3fadd6-f8f1-476d-852f-c12ac52c04f7', '26m7n', '2020-11-13 09:58:32');
INSERT INTO `sys_captcha` VALUES ('7da77299-7f9d-4827-8b64-93426bd2d913', 'a6nwx', '2020-11-10 15:34:02');
INSERT INTO `sys_captcha` VALUES ('889575eb-ad69-4031-8180-a2b31659a134', 'n63y6', '2020-11-03 17:18:54');
INSERT INTO `sys_captcha` VALUES ('9c97d871-bd4e-4bf1-86c3-6e45abfddbf6', '5f7a5', '2020-11-10 06:18:22');
INSERT INTO `sys_captcha` VALUES ('cb319d6d-1c5f-411f-839c-3706ab420a5d', '72b8m', '2020-11-03 17:18:25');
INSERT INTO `sys_captcha` VALUES ('cc9810b4-acfb-41c8-8bf7-afe99cfe1f88', 'g483y', '2020-11-03 17:18:25');
INSERT INTO `sys_captcha` VALUES ('cd2189dd-e014-44d7-85a6-869f687c094c', 'm5xw4', '2020-11-03 17:16:50');
INSERT INTO `sys_captcha` VALUES ('d3339722-8f30-41ab-8559-e7a89a91b355', 'p6fdc', '2020-11-03 09:25:39');
INSERT INTO `sys_captcha` VALUES ('f014db2f-91cc-4e5d-8538-27ada7d3deb3', 'ypn5d', '2020-11-03 17:16:08');

-- ----------------------------
-- Table structure for `sys_config`
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `param_key` varchar(50) DEFAULT NULL COMMENT 'key',
  `param_value` varchar(2000) DEFAULT NULL COMMENT 'value',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `param_key` (`param_key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='系统配置信息表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', 'CLOUD_STORAGE_CONFIG_KEY', '{\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"aliyunDomain\":\"\",\"aliyunEndPoint\":\"\",\"aliyunPrefix\":\"\",\"qcloudBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qiniuAccessKey\":\"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ\",\"qiniuBucketName\":\"ios-app\",\"qiniuDomain\":\"http://7xqbwh.dl1.z0.glb.clouddn.com\",\"qiniuPrefix\":\"upload\",\"qiniuSecretKey\":\"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV\",\"type\":1}', '0', '云存储配置信息');

-- ----------------------------
-- Table structure for `sys_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `time` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('1', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":46,\"parentId\":0,\"name\":\"评论管理\",\"url\":\"comment /comment\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0}]', '94', '0:0:0:0:0:0:0:1', '2020-11-03 16:44:23');
INSERT INTO `sys_log` VALUES ('2', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":46,\"parentId\":0,\"name\":\"评论管理\",\"url\":\"comment/comment\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0}]', '96', '0:0:0:0:0:0:0:1', '2020-11-03 16:44:51');
INSERT INTO `sys_log` VALUES ('3', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[40]', '302', '0:0:0:0:0:0:0:1', '2020-11-03 17:27:30');
INSERT INTO `sys_log` VALUES ('4', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[45]', '201', '0:0:0:0:0:0:0:1', '2020-11-03 21:09:22');
INSERT INTO `sys_log` VALUES ('5', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":47,\"parentId\":35,\"name\":\"商品管理\",\"url\":\"shop/food\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0}]', '179', '0:0:0:0:0:0:0:1', '2020-11-03 21:35:00');
INSERT INTO `sys_log` VALUES ('6', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":48,\"parentId\":36,\"name\":\"未完成订单\",\"url\":\"order/order\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0}]', '179', '0:0:0:0:0:0:0:1', '2020-11-04 20:18:19');
INSERT INTO `sys_log` VALUES ('7', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":48,\"parentId\":36,\"name\":\"未完成订单\",\"url\":\"order/uorder\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0}]', '198', '0:0:0:0:0:0:0:1', '2020-11-04 20:21:10');
INSERT INTO `sys_log` VALUES ('10', 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":2,\"username\":\"zhangsan\",\"password\":\"046320b64d7fb0fba417f74c74572791a56abb657eb5fde9c5b8891a7a547970\",\"salt\":\"NzJafWBD4sz8iW0mQdP2\",\"email\":\"610997249@qq.com\",\"mobile\":\"18752151590\",\"status\":1,\"roleIdList\":[],\"createUserId\":1,\"createTime\":\"Oct 31, 2020, 8:39:03 AM\"}]', '253', '0:0:0:0:0:0:0:1', '2020-10-31 08:39:03');
INSERT INTO `sys_log` VALUES ('11', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":38,\"parentId\":37,\"name\":\"角色申请\",\"url\":\"applay/register\",\"perms\":\"\",\"type\":1,\"icon\":\"log\",\"orderNum\":0}]', '78', '0:0:0:0:0:0:0:1', '2020-10-31 09:06:54');
INSERT INTO `sys_log` VALUES ('12', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":39,\"parentId\":37,\"name\":\"开店申请\",\"url\":\"applay/shopregister\",\"perms\":\"\",\"type\":1,\"icon\":\"editor\",\"orderNum\":0}]', '59', '0:0:0:0:0:0:0:1', '2020-10-31 09:09:09');
INSERT INTO `sys_log` VALUES ('13', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":40,\"parentId\":37,\"name\":\"店铺退出平台申请\",\"url\":\"applay/shopout\",\"perms\":\"\",\"type\":1,\"icon\":\"duanxin\",\"orderNum\":0}]', '62', '0:0:0:0:0:0:0:1', '2020-10-31 09:10:06');
INSERT INTO `sys_log` VALUES ('14', 'admin', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '[{\"roleId\":1,\"roleName\":\"商家\",\"remark\":\"商家\",\"createUserId\":1,\"menuIdList\":[35,-666666],\"createTime\":\"Oct 31, 2020, 9:34:57 AM\"}]', '216', '0:0:0:0:0:0:0:1', '2020-10-31 09:34:58');
INSERT INTO `sys_log` VALUES ('15', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":41,\"parentId\":0,\"name\":\"商户列表\",\"url\":\"shop/user\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0}]', '32', '0:0:0:0:0:0:0:1', '2020-10-31 09:40:26');
INSERT INTO `sys_log` VALUES ('16', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":41,\"parentId\":35,\"name\":\"商户列表\",\"url\":\"shop/user\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0}]', '65', '0:0:0:0:0:0:0:1', '2020-10-31 09:40:41');
INSERT INTO `sys_log` VALUES ('17', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":42,\"parentId\":35,\"name\":\"店铺列表\",\"url\":\"shop/shopinfo\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0}]', '61', '0:0:0:0:0:0:0:1', '2020-10-31 09:41:19');
INSERT INTO `sys_log` VALUES ('18', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":43,\"parentId\":0,\"name\":\"已完成订单\",\"url\":\"order/order\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0}]', '57', '0:0:0:0:0:0:0:1', '2020-10-31 09:47:22');
INSERT INTO `sys_log` VALUES ('19', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":43,\"parentId\":36,\"name\":\"已完成订单\",\"url\":\"order/order\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0}]', '59', '0:0:0:0:0:0:0:1', '2020-10-31 09:48:49');
INSERT INTO `sys_log` VALUES ('20', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":44,\"parentId\":36,\"name\":\"骑手列表\",\"url\":\"deliver/deliverlist\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0}]', '57', '0:0:0:0:0:0:0:1', '2020-10-31 09:50:20');
INSERT INTO `sys_log` VALUES ('21', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":44,\"parentId\":34,\"name\":\"骑手列表\",\"url\":\"deliver/deliverlist\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0}]', '97', '0:0:0:0:0:0:0:1', '2020-10-31 09:50:54');
INSERT INTO `sys_log` VALUES ('22', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":45,\"parentId\":37,\"name\":\"退款申请\",\"url\":\"applay/orderrefund\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0}]', '61', '0:0:0:0:0:0:0:1', '2020-10-31 09:51:53');
INSERT INTO `sys_log` VALUES ('23', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":46,\"parentId\":0,\"name\":\"评论管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"\",\"orderNum\":0}]', '79', '0:0:0:0:0:0:0:1', '2020-10-31 09:52:38');
INSERT INTO `sys_log` VALUES ('24', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":46,\"parentId\":0,\"name\":\"评论管理\",\"url\":\"comment /\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0}]', '32', '0:0:0:0:0:0:0:1', '2020-10-31 10:29:22');
INSERT INTO `sys_log` VALUES ('25', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":44,\"parentId\":34,\"name\":\"骑手列表\",\"url\":\"deliver/user\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0}]', '79', '0:0:0:0:0:0:0:1', '2020-10-31 10:45:46');
INSERT INTO `sys_log` VALUES ('26', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":46,\"parentId\":0,\"name\":\"评论管理\",\"url\":\"comment/comment\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0}]', '87', '0:0:0:0:0:0:0:1', '2020-11-07 09:16:11');
INSERT INTO `sys_log` VALUES ('27', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":47,\"parentId\":35,\"name\":\"食品列表\",\"url\":\"shop/food\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0}]', '139', '0:0:0:0:0:0:0:1', '2020-11-07 09:22:07');
INSERT INTO `sys_log` VALUES ('28', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[46]', '204', '0:0:0:0:0:0:0:1', '2020-11-08 18:08:36');
INSERT INTO `sys_log` VALUES ('29', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[40]', '186', '0:0:0:0:0:0:0:1', '2020-11-08 18:08:47');
INSERT INTO `sys_log` VALUES ('30', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":48,\"parentId\":0,\"name\":\"推广管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"admin\",\"orderNum\":0}]', '76', '0:0:0:0:0:0:0:1', '2020-11-08 18:09:23');
INSERT INTO `sys_log` VALUES ('31', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":49,\"parentId\":48,\"name\":\"推广申请\",\"url\":\"promote/promoteapplay\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0}]', '110', '0:0:0:0:0:0:0:1', '2020-11-08 18:10:06');
INSERT INTO `sys_log` VALUES ('32', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":50,\"parentId\":48,\"name\":\"推广管理\",\"url\":\"promote/promote\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0}]', '110', '0:0:0:0:0:0:0:1', '2020-11-08 18:10:40');
INSERT INTO `sys_log` VALUES ('33', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[45]', '353', '0:0:0:0:0:0:0:1', '2020-11-08 22:41:45');
INSERT INTO `sys_log` VALUES ('34', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":43,\"parentId\":36,\"name\":\"已完成订单\",\"url\":\"order/orderdetail\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0}]', '19', '120.235.177.162', '2020-11-13 07:29:55');

-- ----------------------------
-- Table structure for `sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COMMENT='菜单管理';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '0', '系统管理', null, null, '0', 'system', '0');
INSERT INTO `sys_menu` VALUES ('2', '1', '管理员列表', 'sys/user', null, '1', 'admin', '1');
INSERT INTO `sys_menu` VALUES ('3', '1', '角色管理', 'sys/role', null, '1', 'role', '2');
INSERT INTO `sys_menu` VALUES ('4', '1', '菜单管理', 'sys/menu', null, '1', 'menu', '3');
INSERT INTO `sys_menu` VALUES ('5', '1', 'SQL监控', 'http://localhost:8080/renren-fast/druid/sql.html', null, '1', 'sql', '4');
INSERT INTO `sys_menu` VALUES ('6', '1', '定时任务', 'job/schedule', null, '1', 'job', '5');
INSERT INTO `sys_menu` VALUES ('7', '6', '查看', null, 'sys:schedule:list,sys:schedule:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('8', '6', '新增', null, 'sys:schedule:save', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('9', '6', '修改', null, 'sys:schedule:update', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('10', '6', '删除', null, 'sys:schedule:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('11', '6', '暂停', null, 'sys:schedule:pause', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('12', '6', '恢复', null, 'sys:schedule:resume', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('13', '6', '立即执行', null, 'sys:schedule:run', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('14', '6', '日志列表', null, 'sys:schedule:log', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('15', '2', '查看', null, 'sys:user:list,sys:user:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('16', '2', '新增', null, 'sys:user:save,sys:role:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('17', '2', '修改', null, 'sys:user:update,sys:role:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('18', '2', '删除', null, 'sys:user:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('19', '3', '查看', null, 'sys:role:list,sys:role:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('20', '3', '新增', null, 'sys:role:save,sys:menu:list', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('21', '3', '修改', null, 'sys:role:update,sys:menu:list', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('22', '3', '删除', null, 'sys:role:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('23', '4', '查看', null, 'sys:menu:list,sys:menu:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('24', '4', '新增', null, 'sys:menu:save,sys:menu:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('25', '4', '修改', null, 'sys:menu:update,sys:menu:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('26', '4', '删除', null, 'sys:menu:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('27', '1', '参数管理', 'sys/config', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', '1', 'config', '6');
INSERT INTO `sys_menu` VALUES ('29', '1', '系统日志', 'sys/log', 'sys:log:list', '1', 'log', '7');
INSERT INTO `sys_menu` VALUES ('30', '1', '文件上传', 'oss/oss', 'sys:oss:all', '1', 'oss', '6');
INSERT INTO `sys_menu` VALUES ('31', '0', '用户管理', '', '', '0', 'admin', '0');
INSERT INTO `sys_menu` VALUES ('32', '31', '用户信息', 'userssss/user', '', '1', 'admin', '0');
INSERT INTO `sys_menu` VALUES ('33', '31', '用户地址', 'userssss/useraddress', '', '1', 'shouye', '0');
INSERT INTO `sys_menu` VALUES ('34', '0', '骑手管理', '', '', '0', 'editor', '0');
INSERT INTO `sys_menu` VALUES ('35', '0', '商家管理', '', '', '0', '', '0');
INSERT INTO `sys_menu` VALUES ('36', '0', '订单管理', '', '', '0', 'tubiao', '0');
INSERT INTO `sys_menu` VALUES ('37', '0', '申请管理', '', '', '0', 'bianji', '0');
INSERT INTO `sys_menu` VALUES ('38', '37', '角色申请', 'applay/register', '', '1', 'log', '0');
INSERT INTO `sys_menu` VALUES ('39', '37', '开店申请', 'applay/shopregister', '', '1', 'editor', '0');
INSERT INTO `sys_menu` VALUES ('41', '35', '商户列表', 'shop/user', '', '1', '', '0');
INSERT INTO `sys_menu` VALUES ('42', '35', '店铺列表', 'shop/shopinfo', '', '1', '', '0');
INSERT INTO `sys_menu` VALUES ('43', '36', '已完成订单', 'order/orderdetail', '', '1', '', '0');
INSERT INTO `sys_menu` VALUES ('44', '34', '骑手列表', 'deliver/user', '', '1', '', '0');
INSERT INTO `sys_menu` VALUES ('47', '35', '食品列表', 'shop/food', '', '1', '', '0');
INSERT INTO `sys_menu` VALUES ('48', '0', '推广管理', '', '', '0', 'admin', '0');
INSERT INTO `sys_menu` VALUES ('49', '48', '推广申请', 'promote/promoteapplay', '', '1', '', '0');
INSERT INTO `sys_menu` VALUES ('50', '48', '推广管理', 'promote/promote', '', '1', '', '0');

-- ----------------------------
-- Table structure for `sys_oss`
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='文件上传';

-- ----------------------------
-- Records of sys_oss
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '商家', '商家', '1', '2020-10-31 09:34:58');

-- ----------------------------
-- Table structure for `sys_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='角色与菜单对应关系';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1', '1', '35');
INSERT INTO `sys_role_menu` VALUES ('2', '1', '-666666');

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) DEFAULT NULL COMMENT '盐',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='系统用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d', 'YzcmCZNvbXocrsz9dm8e', 'root@renren.io', '13612345678', '1', '1', '2016-11-11 11:11:11');
INSERT INTO `sys_user` VALUES ('2', 'zhangsan', '046320b64d7fb0fba417f74c74572791a56abb657eb5fde9c5b8891a7a547970', 'NzJafWBD4sz8iW0mQdP2', '610997249@qq.com', '18752151590', '1', '1', '2020-10-31 08:39:03');

-- ----------------------------
-- Table structure for `sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_user_token`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_token`;
CREATE TABLE `sys_user_token` (
  `user_id` bigint(20) NOT NULL,
  `token` varchar(100) NOT NULL COMMENT 'token',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统用户Token';

-- ----------------------------
-- Records of sys_user_token
-- ----------------------------
INSERT INTO `sys_user_token` VALUES ('1', '01e440cb630fb3d7a3812b72ea8a8d85', '2020-11-13 19:27:05', '2020-11-13 07:27:05');

-- ----------------------------
-- Table structure for `tb_promote`
-- ----------------------------
DROP TABLE IF EXISTS `tb_promote`;
CREATE TABLE `tb_promote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL COMMENT '推广商店id',
  `applay_time` int(11) DEFAULT NULL COMMENT '推广时长',
  `start_promote` date DEFAULT NULL COMMENT '开始推广时间',
  `promote_status` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '推广状态',
  `gmt_create` datetime DEFAULT NULL COMMENT '申请通过时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tb_promote
-- ----------------------------
INSERT INTO `tb_promote` VALUES ('15', '1', '5', '2020-11-13', '推广中', '2020-11-13 11:16:23', '2020-11-13 11:16:37');
INSERT INTO `tb_promote` VALUES ('16', '2', '5', '2020-11-13', '推广中', '2020-11-13 11:16:24', '2020-11-13 11:16:38');

-- ----------------------------
-- Table structure for `tb_promote_applay`
-- ----------------------------
DROP TABLE IF EXISTS `tb_promote_applay`;
CREATE TABLE `tb_promote_applay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) DEFAULT NULL,
  `applay_time` int(11) DEFAULT NULL COMMENT '申请时长',
  `willingpay` double(11,2) DEFAULT NULL COMMENT '出资多少',
  `applay_status` varchar(200) CHARACTER SET utf8mb4 DEFAULT '申请中' COMMENT '申请状态',
  `gmt_create` datetime DEFAULT NULL,
  `gmt_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tb_promote_applay
-- ----------------------------
INSERT INTO `tb_promote_applay` VALUES ('1', '1', '7', '2222.00', '通过申请', '2020-11-12 17:37:34', '2020-11-12 17:37:36');
INSERT INTO `tb_promote_applay` VALUES ('2', '12', '111', '111111111.00', '通过申请', null, null);
INSERT INTO `tb_promote_applay` VALUES ('3', '34', '5', '500.00', '申请中', null, null);
INSERT INTO `tb_promote_applay` VALUES ('4', '1', '5', '500.00', '通过申请', null, null);
INSERT INTO `tb_promote_applay` VALUES ('5', '2', '5', '500.00', '通过申请', null, null);

-- ----------------------------
-- Table structure for `tb_user`
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `mobile` varchar(20) NOT NULL COMMENT '手机号',
  `password` varchar(64) DEFAULT NULL COMMENT '密码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='用户';

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('1', 'mark', '13612345678', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '2017-03-23 22:37:41');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(50) DEFAULT NULL COMMENT '用户昵称',
  `mobile` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `password` varchar(500) DEFAULT NULL COMMENT '登录密码',
  `wallet` decimal(10,0) DEFAULT '300' COMMENT '钱包',
  `truename` varchar(50) DEFAULT NULL COMMENT '用户真实姓名',
  `gender` varchar(10) DEFAULT NULL COMMENT '性别',
  `identity` int(11) DEFAULT '0' COMMENT '身份，0：普通顾客，1：骑手，2商家',
  `gmt_create` datetime DEFAULT NULL,
  `gmt_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_mobile_uindex` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COMMENT='用户登录表';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '王中王', '18752151001', '$2a$10$CwxQcA7s93wzfROf2Xlm0OX3VQS99VPuP8xRWtK4yZ.PpH5Qva8gm', '164', '王德发', '男', '0', '2020-10-28 23:50:14', '2020-11-13 08:48:20');
INSERT INTO `user` VALUES ('2', 'Miss张', '18752151002', '$2a$10$CwxQcA7s93wzfROf2Xlm0OX3VQS99VPuP8xRWtK4yZ.PpH5Qva8gm', '817', '张小蕊', '女', '2', '2020-10-29 14:12:13', '2020-11-13 00:56:52');
INSERT INTO `user` VALUES ('3', '赵泰', '18752151003', '$2a$10$CwxQcA7s93wzfROf2Xlm0OX3VQS99VPuP8xRWtK4yZ.PpH5Qva8gm', '2000', '赵泰', '男', '1', '2020-10-29 14:13:22', '2020-11-13 07:32:08');
INSERT INTO `user` VALUES ('4', 'Mrs吴', '18752151004', '$2a$10$CwxQcA7s93wzfROf2Xlm0OX3VQS99VPuP8xRWtK4yZ.PpH5Qva8gm', '5808', '吴某', '男', '2', '2020-11-07 09:14:56', '2020-11-13 00:10:41');
INSERT INTO `user` VALUES ('5', 'Mrs钱', '18752151005', '$2a$10$CwxQcA7s93wzfROf2Xlm0OX3VQS99VPuP8xRWtK4yZ.PpH5Qva8gm', '12000', '钱大佬', '男', '2', '2020-11-07 09:16:25', '2020-11-07 09:16:26');
INSERT INTO `user` VALUES ('6', 'Mrs翁', '18752151006', '$2a$10$CwxQcA7s93wzfROf2Xlm0OX3VQS99VPuP8xRWtK4yZ.PpH5Qva8gm', '14863', '翁哥', '男', '2', '2020-11-07 09:17:19', '2020-11-13 00:10:40');
INSERT INTO `user` VALUES ('7', 'Miss王', '18752151007', '$2a$10$CwxQcA7s93wzfROf2Xlm0OX3VQS99VPuP8xRWtK4yZ.PpH5Qva8gm', '10000', '王小婷', '女', '2', '2020-11-07 09:18:19', '2020-11-07 09:18:21');
INSERT INTO `user` VALUES ('8', 'Miss吴', '18752151008', '$2a$10$CwxQcA7s93wzfROf2Xlm0OX3VQS99VPuP8xRWtK4yZ.PpH5Qva8gm', '8000', '吴璇', '女', '2', '2020-11-07 09:19:54', '2020-11-07 09:19:56');
INSERT INTO `user` VALUES ('9', 'Mrs梁', '18752151009', '$2a$10$CwxQcA7s93wzfROf2Xlm0OX3VQS99VPuP8xRWtK4yZ.PpH5Qva8gm', '13000', '梁章', '男', '2', '2020-11-07 09:20:36', '2020-11-07 09:20:38');
INSERT INTO `user` VALUES ('10', 'Miss唐', '18752151010', '$2a$10$CwxQcA7s93wzfROf2Xlm0OX3VQS99VPuP8xRWtK4yZ.PpH5Qva8gm', '26000', '唐珊', '女', '2', '2020-11-07 09:21:14', '2020-11-07 09:21:15');
INSERT INTO `user` VALUES ('11', 'Miss陈', '18752151011', '$2a$10$CwxQcA7s93wzfROf2Xlm0OX3VQS99VPuP8xRWtK4yZ.PpH5Qva8gm', '13000', '陈月', '女', '2', '2020-11-07 09:22:04', '2020-11-07 09:22:05');
INSERT INTO `user` VALUES ('12', 'Mrs周', '18752151012', '$2a$10$CwxQcA7s93wzfROf2Xlm0OX3VQS99VPuP8xRWtK4yZ.PpH5Qva8gm', '21000', '周老二', '男', '2', '2020-11-07 09:22:38', '2020-11-07 09:22:41');
INSERT INTO `user` VALUES ('13', 'Mrs孙', '18752151013', '$2a$10$CwxQcA7s93wzfROf2Xlm0OX3VQS99VPuP8xRWtK4yZ.PpH5Qva8gm', '11000', '孙空', '男', '2', '2020-11-07 09:23:08', '2020-11-07 09:23:10');
INSERT INTO `user` VALUES ('14', 'Mrs谢', '18752151014', '$2a$10$CwxQcA7s93wzfROf2Xlm0OX3VQS99VPuP8xRWtK4yZ.PpH5Qva8gm', '16000', '谢大宏', '男', '2', '2020-11-07 09:23:57', '2020-11-07 09:23:59');
INSERT INTO `user` VALUES ('15', 'Mrs黄', '18752151015', '$2a$10$CwxQcA7s93wzfROf2Xlm0OX3VQS99VPuP8xRWtK4yZ.PpH5Qva8gm', '6000', '黄豪', '男', '2', '2020-11-07 09:24:29', '2020-11-07 09:24:30');
INSERT INTO `user` VALUES ('16', 'Miss熊', '18752151016', '$2a$10$CwxQcA7s93wzfROf2Xlm0OX3VQS99VPuP8xRWtK4yZ.PpH5Qva8gm', '16000', '熊小萱', '女', '2', '2020-11-07 09:25:21', '2020-11-07 09:25:22');
INSERT INTO `user` VALUES ('17', 'Mrs郑', '18752151017', '$2a$10$CwxQcA7s93wzfROf2Xlm0OX3VQS99VPuP8xRWtK4yZ.PpH5Qva8gm', '1500', '郑勇', '男', '2', '2020-11-07 09:26:14', '2020-11-07 09:26:15');
INSERT INTO `user` VALUES ('18', 'Mrs林', '18752151018', '$2a$10$CwxQcA7s93wzfROf2Xlm0OX3VQS99VPuP8xRWtK4yZ.PpH5Qva8gm', '2000', '林瑞', '男', '2', '2020-11-07 09:26:50', '2020-11-07 09:26:51');
INSERT INTO `user` VALUES ('19', 'Miss蔡', '18752151019', '$2a$10$CwxQcA7s93wzfROf2Xlm0OX3VQS99VPuP8xRWtK4yZ.PpH5Qva8gm', '14000', '蔡敏', '女', '2', '2020-11-07 09:27:24', '2020-11-07 09:27:26');
INSERT INTO `user` VALUES ('20', 'Miss冯', '18752151020', '$2a$10$CwxQcA7s93wzfROf2Xlm0OX3VQS99VPuP8xRWtK4yZ.PpH5Qva8gm', '3000', '冯梅', '女', '2', '2020-11-07 09:28:05', '2020-11-07 09:28:06');
INSERT INTO `user` VALUES ('21', 'Miss李', '18752151021', '$2a$10$CwxQcA7s93wzfROf2Xlm0OX3VQS99VPuP8xRWtK4yZ.PpH5Qva8gm', '6000', '李婷', '女', '2', '2020-11-07 09:28:31', '2020-11-07 09:28:33');
INSERT INTO `user` VALUES ('22', 'Miss李', '18752151022', '$2a$10$CwxQcA7s93wzfROf2Xlm0OX3VQS99VPuP8xRWtK4yZ.PpH5Qva8gm', '4500', '李佳', '女', '2', '2020-11-07 09:29:02', '2020-11-07 09:29:03');
INSERT INTO `user` VALUES ('23', 'Mrs简', '18752151023', '$2a$10$CwxQcA7s93wzfROf2Xlm0OX3VQS99VPuP8xRWtK4yZ.PpH5Qva8gm', '3000', '简易', '男', '2', '2020-11-07 09:29:37', '2020-11-07 09:29:38');
INSERT INTO `user` VALUES ('24', 'Mrs孔', '18752151024', '$2a$10$CwxQcA7s93wzfROf2Xlm0OX3VQS99VPuP8xRWtK4yZ.PpH5Qva8gm', '13000', '孔董', '男', '2', '2020-11-07 09:30:11', '2020-11-07 09:30:12');
INSERT INTO `user` VALUES ('25', 'Mrs廖', '18752151026', '$2a$10$CwxQcA7s93wzfROf2Xlm0OX3VQS99VPuP8xRWtK4yZ.PpH5Qva8gm', '16000', '廖智', '男', '2', '2020-11-07 09:30:47', '2020-11-07 09:30:49');
INSERT INTO `user` VALUES ('26', 'Mrs彭', '18752151028', '$2a$10$CwxQcA7s93wzfROf2Xlm0OX3VQS99VPuP8xRWtK4yZ.PpH5Qva8gm', '6000', '彭工', '男', '2', '2020-11-07 09:31:14', '2020-11-07 09:31:15');
INSERT INTO `user` VALUES ('27', 'Mrs苏', '18752151030', '$2a$10$CwxQcA7s93wzfROf2Xlm0OX3VQS99VPuP8xRWtK4yZ.PpH5Qva8gm', '12500', '苏班', '男', '2', '2020-11-07 09:32:05', '2020-11-07 09:32:06');
INSERT INTO `user` VALUES ('31', '嘎嘎', '13511111111', '$2a$10$5EVqbN/HRYsv3y5iVfpZk.G4jaJrxtvFILLaM854lEPBFSrQmJYAS', '2037', '啊啊啊啊', '男', '0', '2020-11-13 09:20:38', '2020-11-13 20:04:05');
INSERT INTO `user` VALUES ('33', '隔壁老王', '18752151590', '$2a$10$DH33kaKx68dLOAlBJG6g3O7xXq.jhVvHto5zovbxN.hPvfaf5XSVS', '2222222', 'lll', '男', '0', '2020-11-13 07:06:34', '2020-11-13 07:09:42');
INSERT INTO `user` VALUES ('36', 'zzz', '10086', '$2a$10$0qdTA5fTpusHi7so6FI1ROL4Pi7WCm.6Ov0u2BKv53bm4/b1P8iWe', '2608', 'zzz', '男', '0', '2020-11-13 08:42:43', '2020-11-13 10:59:02');
INSERT INTO `user` VALUES ('37', 'string', '18752151515', 'string', '0', 'string', 'string', '0', '2020-11-13 19:46:52', '2020-11-13 19:46:52');
INSERT INTO `user` VALUES ('39', 'string', '18752151693', 'string', '0', 'string', 'string', '0', '2020-11-13 19:47:12', '2020-11-13 19:47:12');
INSERT INTO `user` VALUES ('40', 'string', '18751159876', 'string', '0', 'string', 'string', '0', '2020-11-13 20:05:27', '2020-11-13 20:05:27');

-- ----------------------------
-- Table structure for `user_address`
-- ----------------------------
DROP TABLE IF EXISTS `user_address`;
CREATE TABLE `user_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(50) DEFAULT NULL COMMENT '姓名',
  `gender` varchar(10) DEFAULT '先生' COMMENT '性别',
  `mobile` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `adress` varchar(50) DEFAULT NULL COMMENT '地址',
  `gmt_create` datetime DEFAULT NULL,
  `gmt_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `用户` (`user_id`),
  CONSTRAINT `用户` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='用户配送地址';

-- ----------------------------
-- Records of user_address
-- ----------------------------
INSERT INTO `user_address` VALUES ('1', '1', '王sir', '先生', '18752151001', '广东工业大学', '2020-10-29 14:14:47', '2020-10-29 14:14:49');
INSERT INTO `user_address` VALUES ('2', '1', '吴sir', '先生', '18752151001', '广东金融学院北苑北教广场xxxxxxxxxxxxxxxxxxxxx', '2020-10-29 14:14:47', '2020-10-29 14:14:49');
INSERT INTO `user_address` VALUES ('3', '2', '渣渣龟', '先生', '18752151006', '广东金融学院北苑北教广场xxxxxxxxxxxxxxxxxxxxx', '2020-10-29 14:14:47', '2020-10-29 14:14:49');
INSERT INTO `user_address` VALUES ('4', '3', '渣渣龟', '先生', '18752151002', '广东工业大学', null, null);
INSERT INTO `user_address` VALUES ('5', '6', '灰灰灰灰6666', '先生', '18752151066', '广东金融学院南苑青年广场xxxxxxxxxxxxxxxxxxxxx', null, null);
INSERT INTO `user_address` VALUES ('6', '31', '渣渣渣', '先生', '13511111111', '广东金融学院后门2栋宿舍最顶层', '2020-11-13 13:40:17', '2020-11-13 13:40:17');
INSERT INTO `user_address` VALUES ('8', '31', '喳喳', '先生', '13522222222', '广东金融学院2栋宿舍最顶层', '2020-11-13 14:34:44', '2020-11-13 20:01:29');
INSERT INTO `user_address` VALUES ('9', '33', '隔壁老王', '先生', '18751*******', '广州塔顶', '2020-11-13 07:07:41', '2020-11-13 07:07:41');
INSERT INTO `user_address` VALUES ('10', '36', '吴。。。', '先生', '10086', '广东金融学院', '2020-11-13 08:44:37', '2020-11-13 08:44:37');
