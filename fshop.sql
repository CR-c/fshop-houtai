/*
 Navicat Premium Data Transfer

 Source Server         : 小新16pro
 Source Server Type    : MySQL
 Source Server Version : 80033
 Source Host           : localhost:3306
 Source Schema         : catcc

 Target Server Type    : MySQL
 Target Server Version : 50799
 File Encoding         : 65001

 Date: 28/03/2024 18:33:01
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `address_id` int(0) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人姓名',
  `province` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份',
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `area` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区/镇/县',
  `stress` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '街道',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '总地址',
  `flag` int(0) NULL DEFAULT 1 COMMENT '0默认地址',
  PRIMARY KEY (`address_id`, `name`) USING BTREE,
  INDEX `userId`(`user_id`) USING BTREE,
  CONSTRAINT `userId` FOREIGN KEY (`user_id`) REFERENCES `user` (`open_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of address
-- ----------------------------
BEGIN;
INSERT INTO `address` VALUES (1, 'osRS_6WTQw17hG2pCucmr9Fkuk3M', '13622482262', 'c123', '甘肃省', '南投县', '江东新区', '一马路', '甘肃省南投县江东新区一马路', 1), (2, 'osRS_6WTQw17hG2pCucmr9Fkuk3M', '13622482262', 'c2', '云南省', '天津市', '江东新区', '二马路', '云南省天津市江东新区二马路', 0), (3, 'osRS_6WTQw17hG2pCucmr9Fkuk3M', '13622482262', 'c3', '重庆', '忻州市', '江东新区', '三马路', '重庆忻州市江东新区三马路', 0), (4, 'osRS_6WTQw17hG2pCucmr9Fkuk3M', '13622482262', 'a1', '新疆维吾尔自治区', '宜兰县', '江东新区', '四马路', '新疆维吾尔自治区宜兰县江东新区四马路', 0), (5, 'osRS_6WTQw17hG2pCucmr9Fkuk3M', '13622482262', 'a2', '贵州省', '鹤壁市', '江东新区', '五马路', '贵州省鹤壁市江东新区五马路', 0);
COMMIT;

-- ----------------------------
-- Table structure for carts
-- ----------------------------
DROP TABLE IF EXISTS `carts`;
CREATE TABLE `carts`  (
  `carts_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '购物车订单id',
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id',
  `quantity` int(0) NULL DEFAULT NULL COMMENT '商品的数量',
  `cloth_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品的id',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品的价格',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `size` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '尺寸',
  `color` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '颜色',
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `cloth_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `check_flag` blob NULL COMMENT '选中标签false未选中)',
  PRIMARY KEY (`carts_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of carts
-- ----------------------------
BEGIN;
INSERT INTO `carts` VALUES (0, 'osRS_6WTQw17hG2pCucmr9Fkuk3M', 1, '1732330162665242626', 818.00, '2024-03-25 14:12:01', '2024-03-28 15:16:28', 'S', '黑色', 'http://dummyimage.com/400x400', '皮面羽绒', 0x30), (15, 'osRS_6WTQw17hG2pCucmr9Fkuk3M', 1, '1732330162665242626', 818.00, '2024-03-25 14:23:56', '2024-03-28 15:16:28', 'M', '黑色', 'http://dummyimage.com/400x400', '皮面羽绒', 0x30);
COMMIT;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `category_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类名字',
  `category_id` bigint(0) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `create_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `category_alt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类响应路径',
  `category_children` int(0) NULL DEFAULT NULL COMMENT '是否为子类',
  `category_father` bigint(0) NULL DEFAULT NULL COMMENT '父类的id',
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of category
-- ----------------------------
BEGIN;
INSERT INTO `category` VALUES ('羽绒服', 4, '2023-12-04 16:51:01', '2023-12-04 16:51:01', '1', '1', NULL, 0, NULL), ('卫衣', 5, '2023-12-04 16:51:09', '2023-12-04 16:51:09', '1', '1', NULL, 0, NULL), ('短袖', 6, '2023-12-04 16:51:14', '2023-12-04 16:51:14', '1', '1', NULL, 0, NULL), ('长袖', 7, '2023-12-04 16:51:18', '2023-12-04 16:51:18', '1', '1', NULL, 0, NULL), ('棉服', 9, '2023-12-04 16:51:24', '2023-12-04 16:51:24', '1', '1', NULL, 0, NULL), ('夹克', 10, '2023-12-04 16:51:30', '2023-12-04 16:51:30', '1', '1', NULL, 0, NULL), ('西装', 11, '2023-12-04 16:51:33', '2023-12-04 16:51:33', '1', '1', NULL, 0, NULL), ('长裤', 12, '2023-12-04 16:51:49', '2023-12-04 16:51:49', '1', '1', NULL, 0, NULL), ('短裤', 13, '2023-12-04 16:51:53', '2023-12-04 16:51:53', '1', '1', NULL, 0, NULL), ('棉裤', 14, '2023-12-04 16:51:57', '2023-12-04 16:51:57', '1', '1', NULL, 0, NULL), ('长款羽绒服', 17, '2023-12-05 15:20:42', '2023-12-05 15:20:42', '1', '1', NULL, 1, 4), ('短款羽绒服', 18, '2023-12-05 15:20:55', '2023-12-05 15:20:55', '1', '1', NULL, 1, 4), ('连帽卫衣', 20, '2023-12-06 16:58:59', '2023-12-06 16:58:59', '1', '1', NULL, 1, 5), ('加绒卫衣', 21, '2023-12-06 16:59:12', '2023-12-06 16:59:12', '1', '1', NULL, 1, 5), ('matlab联名', 22, '2023-12-06 16:59:45', '2023-12-06 16:59:45', '1', '1', NULL, 1, 6), ('spss联名', 23, '2023-12-06 16:59:55', '2023-12-06 16:59:55', '1', '1', NULL, 1, 6);
COMMIT;

-- ----------------------------
-- Table structure for cloth
-- ----------------------------
DROP TABLE IF EXISTS `cloth`;
CREATE TABLE `cloth`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '衣服名称',
  `category_id` bigint(0) NOT NULL COMMENT '衣服分类id',
  `price` decimal(10, 2) NOT NULL COMMENT '衣服价格',
  `code` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '商品码',
  `image` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '图片',
  `description` varchar(400) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '描述信息',
  `status` int(0) NOT NULL DEFAULT 1 COMMENT '0 停售 1 起售',
  `sort` int(0) NOT NULL DEFAULT 0 COMMENT '顺序',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `create_user` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `update_user` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改人',
  `is_deleted` int(0) NOT NULL DEFAULT 0 COMMENT '是否删除',
  `num` int(0) NOT NULL COMMENT '剩余数量',
  `category_father` int(0) NULL DEFAULT -1 COMMENT '主分类编号',
  `s_id` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编号字符串',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `category`(`category_id`) USING BTREE,
  CONSTRAINT `category` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1732591026416812035 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of cloth
-- ----------------------------
BEGIN;
INSERT INTO `cloth` VALUES (1732330162665242626, '皮面羽绒', 17, 818.00, '26', 'http://dummyimage.com/400x400', '相例农西导其问道场音常包我间温事。列间第都体只回制联产进上。保飞得至日调流例导约段区好作素。', 0, 0, '2023-12-06 17:24:31', '2023-12-06 17:24:31', '1', '1', 0, 4, 4, '1732330162665242626'), (1732330288695689217, '反光羽绒', 17, 818.00, '26', 'http://dummyimage.com/400x400', '相例农西导其问道场音常包我间温事。列间第都体只回制联产进上。保飞得至日调流例导约段区好作素。', 0, 0, '2023-12-06 17:25:01', '2023-12-06 17:25:01', '1', '1', 0, 4, 4, '1732330288695689217'), (1732332050756354050, '反光短羽绒', 18, 818.00, '26', 'http://dummyimage.com/400x400', '相例农西导其问道场音常包我间温事。列间第都体只回制联产进上。保飞得至日调流例导约段区好作素。', 0, 0, '2023-12-06 17:32:01', '2023-12-06 17:32:01', '1', '1', 0, 4, 4, '1732332050756354050'), (1732332080233922562, '皮面短羽绒', 18, 818.00, '26', 'http://dummyimage.com/400x400', '相例农西导其问道场音常包我间温事。列间第都体只回制联产进上。保飞得至日调流例导约段区好作素。', 0, 0, '2023-12-06 17:32:08', '2023-12-06 17:32:08', '1', '1', 0, 4, 4, '1732332080233922562'), (1732590802126405634, 'super联名连帽卫衣', 20, 109.24, '3', 'http://dummyimage.com/400x400', '高会后并消研参给之四要油段变至次选。身当群用华易族山以线个所者确白发精命。代务活新数可土西整酸加电理到快节话。北原有基电由分置查由制切。', 0, 0, '2023-12-07 10:40:12', '2023-12-07 10:40:12', '1', '1', 0, 6, 5, '1732590802126405634'), (1732590826440785922, 'supe联名连帽卫衣', 20, 109.24, '3', 'http://dummyimage.com/400x400', '高会后并消研参给之四要油段变至次选。身当群用华易族山以线个所者确白发精命。代务活新数可土西整酸加电理到快节话。北原有基电由分置查由制切。', 0, 0, '2023-12-07 10:40:18', '2023-12-07 10:40:18', '1', '1', 0, 6, 5, '1732590826440785922'), (1732590842085539842, 'sup联名连帽卫衣', 20, 109.24, '3', 'http://dummyimage.com/400x400', '高会后并消研参给之四要油段变至次选。身当群用华易族山以线个所者确白发精命。代务活新数可土西整酸加电理到快节话。北原有基电由分置查由制切。', 0, 0, '2023-12-07 10:40:21', '2023-12-07 10:40:21', '1', '1', 0, 6, 5, '1732590842085539842'), (1732590928752443393, 'drc联名加绒卫衣', 21, 109.24, '3', 'http://dummyimage.com/400x400', '高会后并消研参给之四要油段变至次选。身当群用华易族山以线个所者确白发精命。代务活新数可土西整酸加电理到快节话。北原有基电由分置查由制切。', 0, 0, '2023-12-07 10:40:42', '2023-12-07 10:40:42', '1', '1', 0, 6, 5, '1732590928752443393'), (1732590940018343938, 'dr联名加绒卫衣', 21, 109.24, '3', 'http://dummyimage.com/400x400', '高会后并消研参给之四要油段变至次选。身当群用华易族山以线个所者确白发精命。代务活新数可土西整酸加电理到快节话。北原有基电由分置查由制切。', 0, 0, '2023-12-07 10:40:45', '2023-12-07 10:40:45', '1', '1', 0, 6, 5, '1732590940018343938'), (1732590948176265218, 'd联名加绒卫衣', 21, 109.24, '3', 'http://dummyimage.com/400x400', '高会后并消研参给之四要油段变至次选。身当群用华易族山以线个所者确白发精命。代务活新数可土西整酸加电理到快节话。北原有基电由分置查由制切。', 0, 0, '2023-12-07 10:40:47', '2023-12-07 10:40:47', '1', '1', 0, 6, 5, '1732590948176265218'), (1732590981671976961, '联名加绒卫衣', 21, 109.24, '3', 'http://dummyimage.com/400x400', '高会后并消研参给之四要油段变至次选。身当群用华易族山以线个所者确白发精命。代务活新数可土西整酸加电理到快节话。北原有基电由分置查由制切。', 0, 0, '2023-12-07 10:40:55', '2023-12-07 10:40:55', '1', '1', 0, 6, 5, '1732590981671976961'), (1732590992950460417, 'a联名加绒卫衣', 21, 109.24, '3', 'http://dummyimage.com/400x400', '高会后并消研参给之四要油段变至次选。身当群用华易族山以线个所者确白发精命。代务活新数可土西整酸加电理到快节话。北原有基电由分置查由制切。', 0, 0, '2023-12-07 10:40:57', '2023-12-07 10:40:57', '1', '1', 0, 6, 5, '1732590992950460417'), (1732591003457191937, 'as联名加绒卫衣', 21, 109.24, '3', 'http://dummyimage.com/400x400', '高会后并消研参给之四要油段变至次选。身当群用华易族山以线个所者确白发精命。代务活新数可土西整酸加电理到快节话。北原有基电由分置查由制切。', 0, 0, '2023-12-07 10:41:00', '2023-12-07 10:41:00', '1', '1', 0, 6, 5, '1732591003457191937'), (1732591026416812034, 'add联名加绒卫衣', 21, 109.24, '3', 'http://dummyimage.com/400x400', '高会后并消研参给之四要油段变至次选。身当群用华易族山以线个所者确白发精命。代务活新数可土西整酸加电理到快节话。北原有基电由分置查由制切。', 0, 0, '2023-12-07 10:41:05', '2023-12-07 10:41:05', '1', '1', 0, 6, 5, '1732591026416812034');
COMMIT;

-- ----------------------------
-- Table structure for hot
-- ----------------------------
DROP TABLE IF EXISTS `hot`;
CREATE TABLE `hot`  (
  `hot_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '热门推荐名字',
  `hot_text` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '热门注释',
  `hot_picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '热门图片路径',
  `hot_type` bigint(0) NULL DEFAULT NULL COMMENT '热门对应分类(关联category)',
  `hot_alt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '热门对应响应路径',
  `hot_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '热门id',
  PRIMARY KEY (`hot_id`) USING BTREE,
  INDEX `分类`(`hot_type`) USING BTREE,
  CONSTRAINT `分类` FOREIGN KEY (`hot_type`) REFERENCES `category` (`category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of hot
-- ----------------------------
BEGIN;
INSERT INTO `hot` VALUES ('寒冬必备', '人气爆款', 'https://pcapi-xiaotuxian-front-devtest.itheima.net/miniapp/uploads/goods_small_1.jpg', 4, '@/pages/category/4', 1), ('潮流卫衣', '新人必买', 'https://pcapi-xiaotuxian-front-devtest.itheima.net/miniapp/uploads/goods_small_1.jpg', 5, '@/pages/category/5', 2), ('超值', '购物首选', 'https://pcapi-xiaotuxian-front-devtest.itheima.net/miniapp/uploads/goods_small_1.jpg', 6, '@/pages/category/6', 3), ('保暖棉裤', '温馨', 'https://pcapi-xiaotuxian-front-devtest.itheima.net/miniapp/uploads/goods_small_1.jpg', 14, '@/pages/category/10', 4);
COMMIT;

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `order_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '订单编号',
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户编号',
  `order_price` double(10, 2) NULL DEFAULT 0.00 COMMENT '订单总价',
  `order_message` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '订单备注',
  `order_delivery_id` int(0) NULL DEFAULT NULL COMMENT '订单配送时间下标',
  `order_goods_price` double(10, 2) NULL DEFAULT 0.00 COMMENT '订单商品总价',
  `order_fms_price` double(10, 2) NULL DEFAULT 0.00 COMMENT '订单运费总价',
  `order_address_id` int(0) NULL DEFAULT NULL COMMENT '订单配送地址id',
  `order_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单配送地址',
  `order_receiver` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单收件人',
  `order_receiver_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单收件人手机',
  `order_status` int(0) NOT NULL COMMENT '订单状态(-1刚创建,0已结束,1正在交易)',
  `order_pay_time` datetime(0) NULL DEFAULT NULL COMMENT '支付时间',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '订单更新时间',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 201 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of order
-- ----------------------------
BEGIN;
INSERT INTO `order` VALUES (195, 'osRS_6WTQw17hG2pCucmr9Fkuk3M', 823.00, '', 0, 818.00, 5.00, 2, '云南省天津市江东新区二马路', 'c2', '13622482262', 1, NULL, '2024-03-26 17:27:40', '2024-03-26 17:27:43'), (196, 'osRS_6WTQw17hG2pCucmr9Fkuk3M', 823.00, '', 0, 818.00, 5.00, 2, '云南省天津市江东新区二马路', 'c2', '13622482262', 3, '2024-03-26 23:22:57', '2024-03-26 23:22:47', '2024-03-26 23:23:08'), (197, 'osRS_6WTQw17hG2pCucmr9Fkuk3M', 823.00, '', 0, 818.00, 5.00, 2, '云南省天津市江东新区二马路', 'c2', '13622482262', 1, NULL, '2024-03-26 23:30:04', '2024-03-26 23:30:06'), (198, 'osRS_6WTQw17hG2pCucmr9Fkuk3M', 823.00, '', 0, 818.00, 5.00, 2, '云南省天津市江东新区二马路', 'c2', '13622482262', 2, '2024-03-26 23:30:12', '2024-03-26 23:30:10', '2024-03-26 23:30:12'), (199, 'osRS_6WTQw17hG2pCucmr9Fkuk3M', 823.00, '', 0, 818.00, 5.00, 2, '云南省天津市江东新区二马路', 'c2', '13622482262', 1, NULL, '2024-03-26 23:30:40', '2024-03-26 23:30:42'), (200, 'osRS_6WTQw17hG2pCucmr9Fkuk3M', 823.00, '', 0, 818.00, 5.00, 3, '重庆忻州市江东新区三马路', 'c3', '13622482262', 4, '2024-03-28 15:16:33', '2024-03-28 15:16:28', '2024-03-28 15:16:39');
COMMIT;

-- ----------------------------
-- Table structure for order_fms
-- ----------------------------
DROP TABLE IF EXISTS `order_fms`;
CREATE TABLE `order_fms`  (
  `fms_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '快递信息id',
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id',
  `order_id` int(0) NOT NULL COMMENT '订单id',
  `fms_details` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '快递订单详情',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`fms_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of order_fms
-- ----------------------------
BEGIN;
INSERT INTO `order_fms` VALUES (1, 'osRS_6WTQw17hG2pCucmr9Fkuk3M', 169, '北京东二环驿站已接单', '2024-03-26 09:53:03', '2024-03-26 09:53:03'), (2, 'osRS_6WTQw17hG2pCucmr9Fkuk3M', 176, '北京东二环驿站已接单', '2024-03-26 15:43:36', '2024-03-26 15:43:36'), (3, 'osRS_6WTQw17hG2pCucmr9Fkuk3M', 176, '北京东二环驿站已接单', '2024-03-26 15:44:27', '2024-03-26 15:44:27'), (4, 'osRS_6WTQw17hG2pCucmr9Fkuk3M', 176, '北京东二环驿站已接单', '2024-03-26 15:45:47', '2024-03-26 15:45:47'), (5, 'osRS_6WTQw17hG2pCucmr9Fkuk3M', 177, '北京东二环驿站已接单', '2024-03-26 15:50:42', '2024-03-26 15:50:42'), (6, 'osRS_6WTQw17hG2pCucmr9Fkuk3M', 178, '北京东二环驿站已接单', '2024-03-26 15:53:46', '2024-03-26 15:53:46'), (7, 'osRS_6WTQw17hG2pCucmr9Fkuk3M', 179, '北京东二环驿站已接单', '2024-03-26 15:55:27', '2024-03-26 15:55:27'), (8, 'osRS_6WTQw17hG2pCucmr9Fkuk3M', 179, '北京东二环驿站已接单', '2024-03-26 15:55:32', '2024-03-26 15:55:32'), (9, 'osRS_6WTQw17hG2pCucmr9Fkuk3M', 179, '北京东二环驿站已接单', '2024-03-26 15:55:34', '2024-03-26 15:55:34'), (10, 'osRS_6WTQw17hG2pCucmr9Fkuk3M', 179, '北京东二环驿站已接单', '2024-03-26 15:55:35', '2024-03-26 15:55:35'), (11, 'osRS_6WTQw17hG2pCucmr9Fkuk3M', 179, '北京东二环驿站已接单', '2024-03-26 15:55:36', '2024-03-26 15:55:36'), (12, 'osRS_6WTQw17hG2pCucmr9Fkuk3M', 179, '北京东二环驿站已接单', '2024-03-26 15:55:36', '2024-03-26 15:55:36'), (13, 'osRS_6WTQw17hG2pCucmr9Fkuk3M', 179, '北京东二环驿站已接单', '2024-03-26 15:55:37', '2024-03-26 15:55:37'), (14, 'osRS_6WTQw17hG2pCucmr9Fkuk3M', 179, '北京东二环驿站已接单', '2024-03-26 15:55:37', '2024-03-26 15:55:37'), (15, 'osRS_6WTQw17hG2pCucmr9Fkuk3M', 179, '北京东二环驿站已接单', '2024-03-26 15:55:37', '2024-03-26 15:55:37'), (16, 'osRS_6WTQw17hG2pCucmr9Fkuk3M', 179, '北京东二环驿站已接单', '2024-03-26 15:55:37', '2024-03-26 15:55:37'), (17, 'osRS_6WTQw17hG2pCucmr9Fkuk3M', 179, '北京东二环驿站已接单', '2024-03-26 15:56:00', '2024-03-26 15:56:00'), (18, 'osRS_6WTQw17hG2pCucmr9Fkuk3M', 179, '北京东二环驿站已接单', '2024-03-26 15:56:00', '2024-03-26 15:56:00'), (19, 'osRS_6WTQw17hG2pCucmr9Fkuk3M', 179, '北京东二环驿站已接单', '2024-03-26 15:56:02', '2024-03-26 15:56:02'), (20, 'osRS_6WTQw17hG2pCucmr9Fkuk3M', 180, '北京东二环驿站已接单', '2024-03-26 15:57:08', '2024-03-26 15:57:08'), (21, 'osRS_6WTQw17hG2pCucmr9Fkuk3M', 183, '北京东二环驿站已接单', '2024-03-26 16:04:35', '2024-03-26 16:04:35'), (22, 'osRS_6WTQw17hG2pCucmr9Fkuk3M', 184, '北京东二环驿站已接单', '2024-03-26 16:08:09', '2024-03-26 16:08:09'), (23, 'osRS_6WTQw17hG2pCucmr9Fkuk3M', 185, '北京东二环驿站已接单', '2024-03-26 16:35:04', '2024-03-26 16:35:04'), (24, 'osRS_6WTQw17hG2pCucmr9Fkuk3M', 186, '北京东二环驿站已接单', '2024-03-26 16:37:52', '2024-03-26 16:37:52'), (25, 'osRS_6WTQw17hG2pCucmr9Fkuk3M', 192, '北京东二环驿站已接单', '2024-03-26 16:57:05', '2024-03-26 16:57:05'), (26, 'osRS_6WTQw17hG2pCucmr9Fkuk3M', 193, '北京东二环驿站已接单', '2024-03-26 17:19:30', '2024-03-26 17:19:30'), (27, 'osRS_6WTQw17hG2pCucmr9Fkuk3M', 194, '北京东二环驿站已接单', '2024-03-26 17:24:20', '2024-03-26 17:24:20'), (28, 'osRS_6WTQw17hG2pCucmr9Fkuk3M', 196, '北京东二环驿站已接单', '2024-03-26 23:23:08', '2024-03-26 23:23:08'), (29, 'osRS_6WTQw17hG2pCucmr9Fkuk3M', 200, '北京东二环驿站已接单', '2024-03-28 15:16:36', '2024-03-28 15:16:36');
COMMIT;

-- ----------------------------
-- Table structure for order_goods
-- ----------------------------
DROP TABLE IF EXISTS `order_goods`;
CREATE TABLE `order_goods`  (
  `order_goods_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '订单商品信息id',
  `order_id` bigint(0) NOT NULL COMMENT '订单id',
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id',
  `quantity` int(0) NULL DEFAULT NULL COMMENT '商品的数量',
  `cloth_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品的id',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品的价格',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `size` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '尺寸',
  `color` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '颜色',
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `cloth_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  PRIMARY KEY (`order_goods_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 213 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of order_goods
-- ----------------------------
BEGIN;
INSERT INTO `order_goods` VALUES (204, 193, 'osRS_6WTQw17hG2pCucmr9Fkuk3M', 1, '1732330162665242626', 818.00, '2024-03-26 17:19:24', '2024-03-26 17:19:24', 'S', '黑色', 'http://dummyimage.com/400x400', '皮面羽绒'), (205, 194, 'osRS_6WTQw17hG2pCucmr9Fkuk3M', 1, '1732330162665242626', 818.00, '2024-03-26 17:24:09', '2024-03-26 17:24:09', 'S', '黑色', 'http://dummyimage.com/400x400', '皮面羽绒'), (206, 195, 'osRS_6WTQw17hG2pCucmr9Fkuk3M', 1, '1732330162665242626', 818.00, '2024-03-26 17:27:40', '2024-03-26 17:27:40', 'S', '黑色', 'http://dummyimage.com/400x400', '皮面羽绒'), (207, 196, 'osRS_6WTQw17hG2pCucmr9Fkuk3M', 1, '1732330162665242626', 818.00, '2024-03-26 23:22:47', '2024-03-26 23:22:47', 'S', '黑色', 'http://dummyimage.com/400x400', '皮面羽绒'), (208, 197, 'osRS_6WTQw17hG2pCucmr9Fkuk3M', 1, '1732330162665242626', 818.00, '2024-03-26 23:30:04', '2024-03-26 23:30:04', 'S', '黑色', 'http://dummyimage.com/400x400', '皮面羽绒'), (209, 198, 'osRS_6WTQw17hG2pCucmr9Fkuk3M', 1, '1732330162665242626', 818.00, '2024-03-26 23:30:10', '2024-03-26 23:30:10', 'S', '黑色', 'http://dummyimage.com/400x400', '皮面羽绒'), (210, 199, 'osRS_6WTQw17hG2pCucmr9Fkuk3M', 1, '1732330162665242626', 818.00, '2024-03-26 23:30:40', '2024-03-26 23:30:40', 'S', '黑色', 'http://dummyimage.com/400x400', '皮面羽绒'), (211, 200, 'osRS_6WTQw17hG2pCucmr9Fkuk3M', 1, '1732330162665242626', 818.00, '2024-03-28 15:16:28', '2024-03-28 15:16:28', 'S', '黑色', 'http://dummyimage.com/400x400', '皮面羽绒'), (212, 200, 'osRS_6WTQw17hG2pCucmr9Fkuk3M', 1, '1732330162665242626', 818.00, '2024-03-28 15:16:28', '2024-03-28 15:16:28', 'M', '黑色', 'http://dummyimage.com/400x400', '皮面羽绒');
COMMIT;

-- ----------------------------
-- Table structure for picture
-- ----------------------------
DROP TABLE IF EXISTS `picture`;
CREATE TABLE `picture`  (
  `img_id` int(0) NOT NULL AUTO_INCREMENT,
  `img_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cloth_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `first` int(0) NULL DEFAULT 0 COMMENT '是否主图',
  `status` int(0) NULL DEFAULT NULL COMMENT '类型',
  PRIMARY KEY (`img_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of picture
-- ----------------------------
BEGIN;
INSERT INTO `picture` VALUES (2, 'https://z1.ax1x.com/2023/12/04/piyhSMV.jpg', NULL, 0, 3), (3, 'https://z1.ax1x.com/2023/12/04/piyhprT.jpg', NULL, 0, 3), (4, 'https://z1.ax1x.com/2023/12/04/piyfxx0.jpg', NULL, 0, 3), (5, 'https://cbu01.alicdn.com/img/ibank/2017/047/722/4503227740_92773441.jpg', '1732330162665242626', 1, 1), (6, 'https://cbu01.alicdn.com/img/ibank/2017/047/722/4503227740_92773441.jpg', '1732330162665242626', 0, 1);
COMMIT;

-- ----------------------------
-- Table structure for specs
-- ----------------------------
DROP TABLE IF EXISTS `specs`;
CREATE TABLE `specs`  (
  `specs_id` int(0) NOT NULL AUTO_INCREMENT,
  `cloth_id` bigint(0) NULL DEFAULT NULL COMMENT '衣服id',
  `size` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '尺寸',
  `color` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '颜色',
  `num` int(0) NULL DEFAULT NULL COMMENT '数量',
  PRIMARY KEY (`specs_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of specs
-- ----------------------------
BEGIN;
INSERT INTO `specs` VALUES (1, 1732330162665242626, 'L', '黑色', 3), (2, 1732330162665242626, 'S', '黑色', 2), (3, 1732330162665242626, 'M', '黑色', 1), (5, 1732330162665242626, 'L', '白色', 3), (6, 1732330162665242626, 'S', '白色', 2), (7, 1732330162665242626, 'M', '白色', 1);
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `open_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id',
  `nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `age` int(0) NULL DEFAULT NULL COMMENT '用户年龄',
  `sex` int(0) NULL DEFAULT NULL COMMENT '用户性别',
  `phone` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户手机号',
  `status` int(0) NULL DEFAULT NULL COMMENT '用户状态',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '用户创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '用户修改时间',
  `pic` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户头像',
  PRIMARY KEY (`open_id`) USING BTREE,
  UNIQUE INDEX `user_pk`(`open_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES ('osRS_6blRvSFDQ04SQGZsVef57cs', '陈启晖1', 18, 1, '136224822622', 1, '2023-11-29 18:36:49', '2024-02-17 17:26:18', 'http://dummyimage.com/400x400'), ('osRS_6WTQw17hG2pCucmr9Fkuk3M', '陈宾宾63', 19, 0, '17727111638', 1, '2023-11-29 15:27:25', '2024-03-25 19:12:19', 'https://ts1.cn.mm.bing.net/th/id/R-C.748160bf925a7acb3ba1c9514bbc60db?rik=AYY%2bJ9WcXYIMgw&riu=http%3a%2f%2fseopic.699pic.com%2fphoto%2f50017%2f0822.jpg_wh1200.jpg&ehk=CMVcdZMU6xxsjVjafO70cFcmJvD62suFC1ytk8UuAUk%3d&risl=&pid=ImgRaw&r=0');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
