/*
 Navicat Premium Data Transfer

 Source Server         : 本地库
 Source Server Type    : MySQL
 Source Server Version : 80031 (8.0.31)
 Source Host           : localhost:3306
 Source Schema         : frsimple_boot

 Target Server Type    : MySQL
 Target Server Version : 80031 (8.0.31)
 File Encoding         : 65001

 Date: 17/01/2023 17:12:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for center_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `center_dictionary`;
CREATE TABLE `center_dictionary`  (
  `id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '主键ID',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_user_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人id',
  `create_user_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_org_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人org',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `modify_user_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '更新人id',
  `modify_user_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '说明',
  `sort_index` decimal(10, 2) NULL DEFAULT NULL COMMENT '排序号',
  `tenant_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '租户id',
  `is_deleted` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '1删除，0未删除',
  `label` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '字典中文',
  `value` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '字典值',
  `code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '字典编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '字典信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of center_dictionary
-- ----------------------------
INSERT INTO `center_dictionary` VALUES ('1', NULL, NULL, NULL, NULL, '2023-01-17 17:01:19', '1', '超级管理员', NULL, NULL, NULL, NULL, '是否启用', '#', 'SP_ISUSE');
INSERT INTO `center_dictionary` VALUES ('2', NULL, NULL, NULL, NULL, '2022-12-18 19:07:29', '1', '超级管理员', NULL, NULL, NULL, NULL, '是', '1', 'SP_ISUSE');
INSERT INTO `center_dictionary` VALUES ('3', NULL, NULL, NULL, NULL, '2023-01-17 17:01:19', '1', '超级管理员', NULL, NULL, NULL, NULL, '否', '0', 'SP_ISUSE');
INSERT INTO `center_dictionary` VALUES ('D20220616190625529UBU3I', NULL, NULL, NULL, NULL, '2023-01-17 16:59:29', '1', '超级管理员', NULL, NULL, NULL, NULL, '支付方式', '#', 'SP_PAYTYPE');
INSERT INTO `center_dictionary` VALUES ('D20220616214320068AXIY7', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'oatuh授权类型', '#', 'SP_AUTHTYPE');
INSERT INTO `center_dictionary` VALUES ('D202206171104054341I9GM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '客户端模式', 'client_credentials', 'SP_AUTHTYPE');
INSERT INTO `center_dictionary` VALUES ('D20220617110417884YQZ6A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '密码模式', 'password', 'SP_AUTHTYPE');
INSERT INTO `center_dictionary` VALUES ('D20220617110417884YQZ6B', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '第三方模式', 'third_code', 'SP_AUTHTYPE');
INSERT INTO `center_dictionary` VALUES ('D2022061711042926690TE6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '授权码模式', 'authorization_code', 'SP_AUTHTYPE');
INSERT INTO `center_dictionary` VALUES ('D20220617110442235FZ9GF', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '简化模式', 'implicit', 'SP_AUTHTYPE');
INSERT INTO `center_dictionary` VALUES ('D2022061711050113841874', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '刷新令牌', 'refresh_token', 'SP_AUTHTYPE');
INSERT INTO `center_dictionary` VALUES ('D20220617110542850A6J57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '短信验证模式', 'sms_code', 'SP_AUTHTYPE');
INSERT INTO `center_dictionary` VALUES ('D20220618101614096H3HVX', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '用户状态', '#', 'SP_USERSTATUS');
INSERT INTO `center_dictionary` VALUES ('D20220618101746016XNLKZ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '正常', '0', 'SP_USERSTATUS');
INSERT INTO `center_dictionary` VALUES ('D20220618101754375AICCV', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '已锁定', '1', 'SP_USERSTATUS');
INSERT INTO `center_dictionary` VALUES ('D20221214091836109XZ1MW', '2022-12-14 09:18:36', NULL, NULL, NULL, '2023-01-17 16:59:29', '1', '超级管理员', NULL, NULL, NULL, NULL, '余额', 'ye', 'SP_PAYTYPE');
INSERT INTO `center_dictionary` VALUES ('D20221214092725790805AA', '2022-12-14 09:27:26', NULL, NULL, NULL, '2023-01-17 16:59:29', '1', '超级管理员', NULL, NULL, NULL, NULL, '微信', 'wx', 'SP_PAYTYPE');
INSERT INTO `center_dictionary` VALUES ('D20221214093215181EQLEC', '2022-12-14 09:32:15', NULL, NULL, NULL, '2023-01-17 16:59:29', '1', '超级管理员', NULL, NULL, NULL, NULL, '支付宝', 'ali', 'SP_PAYTYPE');
INSERT INTO `center_dictionary` VALUES ('D20221230201104181DMF5V', '2022-12-30 20:11:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '数据来源', '#', 'SP_SHOP_DATASOURCE');
INSERT INTO `center_dictionary` VALUES ('D202212302011147287K362', '2022-12-30 20:11:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '微信', '01', 'SP_SHOP_DATASOURCE');
INSERT INTO `center_dictionary` VALUES ('D202212302011292117H6JY', '2022-12-30 20:11:29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'H5', '02', 'SP_SHOP_DATASOURCE');

-- ----------------------------
-- Table structure for center_email
-- ----------------------------
DROP TABLE IF EXISTS `center_email`;
CREATE TABLE `center_email`  (
  `id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '主键id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_user_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人id',
  `create_user_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_org_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人org',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `modify_user_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '更新人id',
  `modify_user_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '说明',
  `sort_index` decimal(10, 2) NULL DEFAULT NULL COMMENT '排序号',
  `tenant_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '租户id',
  `is_deleted` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '1删除，0未删除',
  `host` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '服务地址',
  `port` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '端口号',
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '邮箱地址',
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '授权密钥',
  `site_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '签名',
  `is_ssl` int NULL DEFAULT NULL COMMENT '是否开启ssl',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '邮箱配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of center_email
-- ----------------------------
INSERT INTO `center_email` VALUES ('EM20228S8X6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'smtp.163.com', '994', 'frsimple@163.com', 'YZTOJUCSCVHQKDAV', 'simple', 1);

-- ----------------------------
-- Table structure for center_logs
-- ----------------------------
DROP TABLE IF EXISTS `center_logs`;
CREATE TABLE `center_logs`  (
  `id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `create_time` datetime NULL DEFAULT NULL COMMENT '请求时间',
  `create_user_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人id',
  `create_user_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_org_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人org',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `modify_user_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '更新人id',
  `modify_user_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '说明',
  `sort_index` decimal(10, 2) NULL DEFAULT NULL COMMENT '排序号',
  `tenant_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '租户id',
  `is_deleted` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '1删除，0未删除',
  `service_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '接口名称',
  `resource` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '服务名',
  `ip` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '请求ip地址',
  `path` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '接口路径',
  `method` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '请求方式',
  `useragent` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '代理对象',
  `params` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '请求参数',
  `username` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '请求用户登录名',
  `nick_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '用户姓名',
  `time` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '请求时长（ms）',
  `status` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '请求状态',
  `error` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '错误原因',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '接口请求日志表' ROW_FORMAT = DYNAMIC;


-- ----------------------------
-- Table structure for center_menu
-- ----------------------------
DROP TABLE IF EXISTS `center_menu`;
CREATE TABLE `center_menu`  (
  `id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '主键ID',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '菜单/按钮名称',
  `type` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '菜单类型',
  `authcode` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '权限编码',
  `path` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '菜单路由地址',
  `parentid` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '父节点ID',
  `component` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `status` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '状态',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `icon` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '图标',
  `meta` json NULL COMMENT '路由头设置',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '菜单信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of center_menu
-- ----------------------------
INSERT INTO `center_menu` VALUES ('1', '查询', 'b', 'center:menu:query', '', '4', '', 1, '0', '2022-06-06 15:58:10', '2022-06-12 15:37:22', NULL, NULL);
INSERT INTO `center_menu` VALUES ('2', '首页', 'c', '', '/main', '999999', 'pages/dashboard/base/index', 0, '0', '2022-06-06 15:58:13', '2022-11-12 22:28:26', 'barcode', '{\"icon\": \"chart\", \"title\": \"首页\", \"single\": true}');
INSERT INTO `center_menu` VALUES ('3', '系统管理', 'c', '', '/system', '999999', 'layout', 999, '0', '2022-06-06 15:58:13', '2022-06-26 11:04:32', 'barcode', '{\"icon\": \"setting\", \"title\": \"系统管理\", \"single\": false}');
INSERT INTO `center_menu` VALUES ('4', '菜单管理', 'c', '', 'menu', '3', 'pages/system/menu/index', 1, '0', '2022-06-06 15:58:13', '2022-06-06 15:58:19', 'barcode', '{\"icon\": \"root-list\", \"title\": \"菜单管理\"}');
INSERT INTO `center_menu` VALUES ('5', '角色管理', 'c', '', 'role', '3', 'pages/system/role/index', 2, '0', '2022-06-06 15:58:13', '2022-06-06 15:58:19', 'barcode', '{\"icon\": \"usergroup\", \"title\": \"角色管理\"}');
INSERT INTO `center_menu` VALUES ('6', '字典管理', 'c', '', 'dic', '3', 'pages/system/dic/index', 3, '0', '2022-06-06 15:58:13', '2022-06-15 21:48:51', 'barcode', '{\"icon\": \"books\", \"title\": \"字典管理\"}');
INSERT INTO `center_menu` VALUES ('7', '机构管理', 'c', '', 'tenant', '3', 'pages/system/tenant/index', 0, '0', '2022-06-06 15:58:13', '2022-06-17 18:17:10', 'barcode', '{\"icon\": \"home\", \"title\": \"机构管理\"}');
INSERT INTO `center_menu` VALUES ('8', '用户管理', 'c', '', 'user', '3', 'pages/system/user/index', 1, '0', '2022-06-06 15:58:13', '2022-08-03 18:25:52', 'barcode', '{\"icon\": \"user\", \"title\": \"用户管理\", \"single\": false}');
INSERT INTO `center_menu` VALUES ('BTN20220612152538483J36DD', '新增', 'b', 'center:menu:add', NULL, '4', NULL, NULL, '0', '2022-06-12 15:25:38', '2022-06-12 15:25:38', NULL, NULL);
INSERT INTO `center_menu` VALUES ('BTN20220612152550459C55UT', '修改', 'b', 'center:menu:edit', NULL, '4', NULL, NULL, '0', '2022-06-12 15:25:50', '2022-06-12 19:29:23', NULL, NULL);
INSERT INTO `center_menu` VALUES ('BTN20220612152604812LX3X1', '删除', 'b', 'center:menu:del', NULL, '4', NULL, NULL, '0', '2022-06-12 15:26:05', '2022-06-12 15:26:05', NULL, NULL);
INSERT INTO `center_menu` VALUES ('BTN20220624190031433TE3TK', '新增字典', 'b', 'system:dict:add', NULL, '6', NULL, NULL, '0', '2022-06-24 19:00:31', '2022-06-24 19:00:31', NULL, NULL);
INSERT INTO `center_menu` VALUES ('BTN20220624190050686OBSW3', '修改字典', 'b', 'system:dict:edit', NULL, '6', NULL, NULL, '0', '2022-06-24 19:00:51', '2022-06-24 19:00:51', NULL, NULL);
INSERT INTO `center_menu` VALUES ('BTN20220624190109272L2TGP', '删除字典项', 'b', 'system:dict:del', NULL, '6', NULL, NULL, '0', '2022-06-24 19:01:09', '2022-06-24 19:01:09', NULL, NULL);
INSERT INTO `center_menu` VALUES ('BTN20220624190211693MIG7U', '查询字典', 'b', 'system:dict:query', NULL, '6', NULL, NULL, '0', '2022-06-24 19:02:12', '2022-06-24 19:02:12', NULL, NULL);
INSERT INTO `center_menu` VALUES ('BTN20220624193556724CKSBR', '新增用户', 'b', 'system:user:add', NULL, '8', NULL, NULL, '0', '2022-06-24 19:35:57', '2022-06-24 19:35:57', NULL, NULL);
INSERT INTO `center_menu` VALUES ('BTN20220624193608163XOCV6', '修改用户', 'b', 'system:user:edit', NULL, '8', NULL, NULL, '0', '2022-06-24 19:36:08', '2022-06-24 19:36:08', NULL, NULL);
INSERT INTO `center_menu` VALUES ('BTN202206241936181131YR6B', '删除用户', 'b', 'system:user:del', NULL, '8', NULL, NULL, '0', '2022-06-24 19:36:18', '2022-06-24 19:36:18', NULL, NULL);
INSERT INTO `center_menu` VALUES ('BTN20220624193628120EW0DD', '查询用户', 'b', 'system:user:query', NULL, '8', NULL, NULL, '0', '2022-06-24 19:36:28', '2022-06-24 19:36:28', NULL, NULL);
INSERT INTO `center_menu` VALUES ('BTN20220624193938973JMBB7', '查询机构', 'b', 'system:tenant:query', NULL, '7', NULL, NULL, '0', '2022-06-24 19:39:39', '2022-06-24 19:39:39', NULL, NULL);
INSERT INTO `center_menu` VALUES ('BTN202206241939506085IE7O', '新增机构', 'b', 'system:tenant:add', NULL, '7', NULL, NULL, '0', '2022-06-24 19:39:51', '2022-06-24 19:39:51', NULL, NULL);
INSERT INTO `center_menu` VALUES ('BTN20220624194002776R96TI', '修改机构', 'b', 'system:tenant:edit', NULL, '7', NULL, NULL, '0', '2022-06-24 19:40:03', '2022-06-24 19:40:03', NULL, NULL);
INSERT INTO `center_menu` VALUES ('BTN20220624194010155TW62M', '删除机构', 'b', 'system:tenant:del', NULL, '7', NULL, NULL, '0', '2022-06-24 19:40:10', '2022-06-24 19:40:10', NULL, NULL);
INSERT INTO `center_menu` VALUES ('BTN20220624194038782F1L34', '新增角色', 'b', 'system:role:add', NULL, '5', NULL, NULL, '0', '2022-06-24 19:40:39', '2022-06-24 19:40:39', NULL, NULL);
INSERT INTO `center_menu` VALUES ('BTN2022062419404569518A7R', '查询角色', 'b', 'system:role:query', NULL, '5', NULL, NULL, '0', '2022-06-24 19:40:46', '2022-06-24 19:40:46', NULL, NULL);
INSERT INTO `center_menu` VALUES ('BTN20220624194052770KZYIG', '修改角色', 'b', 'system:role:edit', NULL, '5', NULL, NULL, '0', '2022-06-24 19:40:53', '2022-06-24 19:40:53', NULL, NULL);
INSERT INTO `center_menu` VALUES ('BTN20220624194100377MJ83B', '删除角色', 'b', 'system:role:del', NULL, '5', NULL, NULL, '0', '2022-06-24 19:41:00', '2022-06-24 19:41:00', NULL, NULL);
INSERT INTO `center_menu` VALUES ('BTN20220624194123282RCKRE', '新增应用', 'b', 'system:oauth:add', NULL, 'MENU20220612154748064K2C40', NULL, NULL, '0', '2022-06-24 19:41:23', '2022-06-24 19:41:23', NULL, NULL);
INSERT INTO `center_menu` VALUES ('BTN202206241941334727EP50', '修改应用', 'b', 'system:oauth:edit', NULL, 'MENU20220612154748064K2C40', NULL, NULL, '0', '2022-06-24 19:41:33', '2022-06-24 19:41:33', NULL, NULL);
INSERT INTO `center_menu` VALUES ('BTN202206241941429035MXHR', '删除应用', 'b', 'system:oauth:del', NULL, 'MENU20220612154748064K2C40', NULL, NULL, '0', '2022-06-24 19:41:43', '2022-06-24 19:41:43', NULL, NULL);
INSERT INTO `center_menu` VALUES ('BTN20220624194152812WC5Q0', '查询应用', 'b', 'system:oauth:query', NULL, 'MENU20220612154748064K2C40', NULL, NULL, '0', '2022-06-24 19:41:53', '2022-06-24 19:41:53', NULL, NULL);
INSERT INTO `center_menu` VALUES ('BTN20220624194216415QA7LT', '查询', 'b', 'system:online:query', NULL, 'MENU20220612154353674IOIVI', NULL, NULL, '0', '2022-06-24 19:42:16', '2022-06-24 19:42:16', NULL, NULL);
INSERT INTO `center_menu` VALUES ('BTN20220624194231107IF0U0', '踢下线', 'b', 'system:online:del', NULL, 'MENU20220612154353674IOIVI', NULL, NULL, '0', '2022-06-24 19:42:31', '2022-06-24 19:42:31', NULL, NULL);
INSERT INTO `center_menu` VALUES ('BTN2022080412135175925582', '新增', 'b', 'system:organ:add', NULL, 'MENU20220803212726121GLSZ5', NULL, NULL, '0', '2022-08-04 12:13:52', '2022-08-04 12:13:52', NULL, NULL);
INSERT INTO `center_menu` VALUES ('BTN20220804121357865WA8Z7', '修改', 'b', 'system:organ:edit', NULL, 'MENU20220803212726121GLSZ5', NULL, NULL, '0', '2022-08-04 12:13:58', '2022-08-04 12:13:58', NULL, NULL);
INSERT INTO `center_menu` VALUES ('BTN20220804121408220HTDUS', '删除', 'b', 'system:organ:del', NULL, 'MENU20220803212726121GLSZ5', NULL, NULL, '0', '2022-08-04 12:14:08', '2022-08-04 12:14:08', NULL, NULL);
INSERT INTO `center_menu` VALUES ('BTN20220804121416757955LJ', '查询', 'b', 'system:organ:query', NULL, 'MENU20220803212726121GLSZ5', NULL, NULL, '0', '2022-08-04 12:14:17', '2022-08-04 12:14:17', NULL, NULL);
INSERT INTO `center_menu` VALUES ('BTN20221111154907721ZO34P', '查询', 'b', 'shop:main:query', NULL, 'MENU20220908224219507SOTNC', NULL, NULL, '0', '2022-11-11 15:49:08', '2022-11-11 15:49:08', NULL, NULL);
INSERT INTO `center_menu` VALUES ('BTN2022111115491502064GI3', '新增', 'b', 'shop:main:add', NULL, 'MENU20220908224219507SOTNC', NULL, NULL, '0', '2022-11-11 15:49:15', '2022-11-11 15:49:15', NULL, NULL);
INSERT INTO `center_menu` VALUES ('BTN20221111154922065U602V', '修改', 'b', 'shop:main:edit', NULL, 'MENU20220908224219507SOTNC', NULL, NULL, '0', '2022-11-11 15:49:22', '2022-11-11 15:49:22', NULL, NULL);
INSERT INTO `center_menu` VALUES ('BTN20221111154928733E6ZDM', '删除', 'b', 'shop:main:del', NULL, 'MENU20220908224219507SOTNC', NULL, NULL, '0', '2022-11-11 15:49:29', '2022-11-11 15:49:29', NULL, NULL);
INSERT INTO `center_menu` VALUES ('BTN202211121736211037VZI8', '启用/停用轮播图', 'b', 'shop:main:openorclose', NULL, 'MENU20220908224219507SOTNC', NULL, NULL, '0', '2022-11-12 17:36:21', '2022-11-12 17:36:21', NULL, NULL);
INSERT INTO `center_menu` VALUES ('BTN20221112180725571B02GY', '查询', 'b', 'shop:message:query', NULL, 'MENU20220917192526794FMOH4', NULL, NULL, '0', '2022-11-12 18:07:26', '2022-11-12 18:07:26', NULL, NULL);
INSERT INTO `center_menu` VALUES ('BTN20221112180742860MQU84', '新增', 'b', 'shop:message:add', NULL, 'MENU20220917192526794FMOH4', NULL, NULL, '0', '2022-11-12 18:07:43', '2022-11-12 18:07:43', NULL, NULL);
INSERT INTO `center_menu` VALUES ('BTN20221112180800120ZJOP3', '修改', 'b', 'shop:message:edit', NULL, 'MENU20220917192526794FMOH4', NULL, NULL, '0', '2022-11-12 18:08:00', '2022-11-12 18:08:00', NULL, NULL);
INSERT INTO `center_menu` VALUES ('BTN202211121808096098VNF5', '删除', 'b', 'shop:message:del', NULL, 'MENU20220917192526794FMOH4', NULL, NULL, '0', '2022-11-12 18:08:10', '2022-11-12 18:08:10', NULL, NULL);
INSERT INTO `center_menu` VALUES ('BTN20221112180859346O1PZC', '启用/停用轮播图', 'b', 'shop:message:openorclose', NULL, 'MENU20220917192526794FMOH4', NULL, NULL, '0', '2022-11-12 18:08:59', '2022-11-12 18:08:59', NULL, NULL);
INSERT INTO `center_menu` VALUES ('BTN20221113140647251FMM59', '查询', 'b', 'shop:fast:query', NULL, 'MENU202211131406076451ZM1Z', NULL, NULL, '0', '2022-11-13 14:06:47', '2022-11-13 14:06:47', NULL, NULL);
INSERT INTO `center_menu` VALUES ('BTN20221113140658682B4I6G', '新增', 'b', 'shop:fast:add', NULL, 'MENU202211131406076451ZM1Z', NULL, NULL, '0', '2022-11-13 14:06:59', '2022-11-13 14:06:59', NULL, NULL);
INSERT INTO `center_menu` VALUES ('BTN20221113140706775GBP9A', '修改', 'b', 'shop:fast:edit', NULL, 'MENU202211131406076451ZM1Z', NULL, NULL, '0', '2022-11-13 14:07:07', '2022-11-13 14:07:07', NULL, NULL);
INSERT INTO `center_menu` VALUES ('BTN2022111314072204850156', '删除', 'b', 'shop:fast:del', NULL, 'MENU202211131406076451ZM1Z', NULL, NULL, '0', '2022-11-13 14:07:22', '2022-11-13 14:07:22', NULL, NULL);
INSERT INTO `center_menu` VALUES ('BTN20221113140742924GGXWH', '启用/停用快捷功能', 'b', 'shop:fast:openorclose', NULL, 'MENU202211131406076451ZM1Z', NULL, NULL, '0', '2022-11-13 14:07:43', '2022-11-13 14:07:43', NULL, NULL);
INSERT INTO `center_menu` VALUES ('BTN20221116150625111K8VGE', '新增', 'b', 'shop:class:add', NULL, 'MENU20220908221315476W7V9B', NULL, NULL, '0', '2022-11-16 15:06:25', '2022-11-16 15:06:25', NULL, NULL);
INSERT INTO `center_menu` VALUES ('BTN20221116150633455YG0TG', '修改', 'b', 'shop:class:edit', NULL, 'MENU20220908221315476W7V9B', NULL, NULL, '0', '2022-11-16 15:06:33', '2022-11-16 15:06:33', NULL, NULL);
INSERT INTO `center_menu` VALUES ('BTN20221116150640390B72J4', '删除', 'b', 'shop:class:del', NULL, 'MENU20220908221315476W7V9B', NULL, NULL, '0', '2022-11-16 15:06:40', '2022-11-16 15:06:40', NULL, NULL);
INSERT INTO `center_menu` VALUES ('BTN20221116150647895ZD0W3', '查询', 'b', 'shop:class:query', NULL, 'MENU20220908221315476W7V9B', NULL, NULL, '0', '2022-11-16 15:06:48', '2022-11-16 15:06:48', NULL, NULL);
INSERT INTO `center_menu` VALUES ('BTN202211171635031557UXVL', '修改', 'b', 'shop:tabs:edit', NULL, 'MENU20220908221729927Q9376', NULL, NULL, '0', '2022-11-17 16:35:03', '2022-11-17 16:35:03', NULL, NULL);
INSERT INTO `center_menu` VALUES ('BTN20221117163513053VEARK', '新增', 'b', 'shop:tabs:add', NULL, 'MENU20220908221729927Q9376', NULL, NULL, '0', '2022-11-17 16:35:13', '2022-11-17 16:35:13', NULL, NULL);
INSERT INTO `center_menu` VALUES ('BTN20221117163523254NNSEM', '删除', 'b', 'shop:tabs:del', NULL, 'MENU20220908221729927Q9376', NULL, NULL, '0', '2022-11-17 16:35:23', '2022-11-17 16:35:23', NULL, NULL);
INSERT INTO `center_menu` VALUES ('BTN20221117163534008SBM7C', '查询', 'b', 'shop:tabs:query', NULL, 'MENU20220908221729927Q9376', NULL, NULL, '0', '2022-11-17 16:35:34', '2022-11-17 16:35:34', NULL, NULL);
INSERT INTO `center_menu` VALUES ('BTN20221121170718148MDX02', '查询', 'b', 'shop:ratetem:query', NULL, 'MENU20220925110415897ZFAZC', NULL, NULL, '0', '2022-11-21 17:07:18', '2022-11-21 17:07:18', NULL, NULL);
INSERT INTO `center_menu` VALUES ('BTN20221121170729310Z83IV', '新增', 'b', 'shop:ratetem:add', NULL, 'MENU20220925110415897ZFAZC', NULL, NULL, '0', '2022-11-21 17:07:29', '2022-11-21 17:07:29', NULL, NULL);
INSERT INTO `center_menu` VALUES ('BTN20221121170736285V1SA0', '修改', 'b', 'shop:ratetem:edit', NULL, 'MENU20220925110415897ZFAZC', NULL, NULL, '0', '2022-11-21 17:07:36', '2022-11-21 17:07:36', NULL, NULL);
INSERT INTO `center_menu` VALUES ('BTN20221121170743163KWT0N', '删除', 'b', 'shop:ratetem:del', NULL, 'MENU20220925110415897ZFAZC', NULL, NULL, '0', '2022-11-21 17:07:43', '2022-11-21 17:07:43', NULL, NULL);
INSERT INTO `center_menu` VALUES ('BTN20221203211321799HVL7X', '查询', 'b', 'shop:sku:query', NULL, 'MENU20220925110536162N63H2', NULL, NULL, '0', '2022-12-03 21:13:22', '2022-12-03 21:13:22', NULL, NULL);
INSERT INTO `center_menu` VALUES ('BTN20221203211328329RA75O', '新增', 'b', 'shop:sku:add', NULL, 'MENU20220925110536162N63H2', NULL, NULL, '0', '2022-12-03 21:13:28', '2022-12-03 21:13:28', NULL, NULL);
INSERT INTO `center_menu` VALUES ('BTN20221203211337948VNLU0', '修改', 'b', 'shop:sku:edit', NULL, 'MENU20220925110536162N63H2', NULL, NULL, '0', '2022-12-03 21:13:38', '2022-12-03 21:13:38', NULL, NULL);
INSERT INTO `center_menu` VALUES ('BTN2022120321134425867T4M', '删除', 'b', 'shop:sku:del', NULL, 'MENU20220925110536162N63H2', NULL, NULL, '0', '2022-12-03 21:13:44', '2022-12-03 21:13:44', NULL, NULL);
INSERT INTO `center_menu` VALUES ('BTN2022120820535095379TCZ', '新增', 'b', 'shop:info:add', NULL, 'MENU202209082212228822AY0B', NULL, NULL, '0', '2022-12-08 20:53:51', '2022-12-08 20:53:51', NULL, NULL);
INSERT INTO `center_menu` VALUES ('BTN20221208205358262BA2CP', '修改', 'b', 'shop:info:edit', NULL, 'MENU202209082212228822AY0B', NULL, NULL, '0', '2022-12-08 20:53:58', '2022-12-08 20:53:58', NULL, NULL);
INSERT INTO `center_menu` VALUES ('BTN20221208205405560UTPQU', '删除', 'b', 'shop:info:del', NULL, 'MENU202209082212228822AY0B', NULL, NULL, '0', '2022-12-08 20:54:06', '2022-12-08 20:54:06', NULL, NULL);
INSERT INTO `center_menu` VALUES ('BTN20221208205412790X1X6U', '查询', 'b', 'shop:info:query', NULL, 'MENU202209082212228822AY0B', NULL, NULL, '0', '2022-12-08 20:54:13', '2022-12-08 20:54:13', NULL, NULL);
INSERT INTO `center_menu` VALUES ('BTN20221230151312335A6HEI', '查询', 'b', 'shop:orderlist:query', NULL, 'MENU20220908221946652F0E34', NULL, NULL, '0', '2022-12-30 15:13:12', '2022-12-30 15:13:12', NULL, NULL);
INSERT INTO `center_menu` VALUES ('BTN20221230151400849W4PTM', '发货', 'b', 'shop:orderlist:send', NULL, 'MENU20220908221946652F0E34', NULL, NULL, '0', '2022-12-30 15:14:01', '2022-12-30 15:14:01', NULL, NULL);
INSERT INTO `center_menu` VALUES ('BTN20221230203730395QJV8L', '查询', 'b', 'shop:user:query', NULL, 'MENU20220917191746636XPTP2', NULL, NULL, '0', '2022-12-30 20:37:30', '2022-12-30 20:37:30', NULL, NULL);
INSERT INTO `center_menu` VALUES ('BTN20230101150117420BFW2J', '查询', 'b', 'shop:ordermark:query', NULL, 'MENU202209082220286558DO98', NULL, NULL, '0', '2023-01-01 15:01:17', '2023-01-01 15:01:17', NULL, NULL);
INSERT INTO `center_menu` VALUES ('BTN20230101220007974OMCDV', '添加回复', 'b', 'shop:ordermark:add', NULL, 'MENU202209082220286558DO98', NULL, NULL, '0', '2023-01-01 22:00:08', '2023-01-01 22:00:08', NULL, NULL);
INSERT INTO `center_menu` VALUES ('BTN20230102115505646J3L4C', '删除评价', 'b', 'shop:ordermark:del', NULL, 'MENU202209082220286558DO98', NULL, NULL, '0', '2023-01-02 11:55:06', '2023-01-02 11:55:06', NULL, NULL);
INSERT INTO `center_menu` VALUES ('BTN2023010716062356775GXB', '查询', 'b', 'shop:orderservice:query', NULL, 'MENU20221230202951797ZIE0F', NULL, NULL, '0', '2023-01-07 16:06:24', '2023-01-07 16:06:24', NULL, NULL);
INSERT INTO `center_menu` VALUES ('BTN20230108120210343LGRYG', '填写/修改运单', 'b', 'shop:orderservice:edit', NULL, 'MENU20221230202951797ZIE0F', NULL, NULL, '0', '2023-01-08 12:02:10', '2023-01-08 12:02:10', NULL, NULL);
INSERT INTO `center_menu` VALUES ('BTN20230108120226608QWZ6D', '撤销单子', 'b', 'shop:orderservice:del', NULL, 'MENU20221230202951797ZIE0F', NULL, NULL, '0', '2023-01-08 12:02:27', '2023-01-08 12:02:27', NULL, NULL);
INSERT INTO `center_menu` VALUES ('BTN20230108120244040PD9PD', '审核单子', 'b', 'shop:orderservice:check', NULL, 'MENU20221230202951797ZIE0F', NULL, NULL, '0', '2023-01-08 12:02:44', '2023-01-08 12:02:44', NULL, NULL);
INSERT INTO `center_menu` VALUES ('MENU20220612154353674IOIVI', '在线用户', 'c', NULL, 'online', '3', 'pages/system/online/index', 100, '0', '2022-06-12 15:43:54', '2022-06-17 18:16:22', NULL, '{\"icon\": \"laptop\", \"title\": \"在线用户\"}');
INSERT INTO `center_menu` VALUES ('MENU20220612154748064K2C40', '应用管理', 'c', NULL, 'oauth', '3', 'pages/system/oauth/index', 99, '0', '2022-06-12 15:47:48', '2022-06-17 18:18:21', NULL, '{\"icon\": \"lock-on\", \"title\": \"应用管理\"}');
INSERT INTO `center_menu` VALUES ('MENU20220614192715011Q8MNB', '接口日志', 'c', NULL, 'logs', '3', 'pages/system/logs/index', 101, '0', '2022-06-14 19:27:15', '2022-06-14 21:26:57', NULL, '{\"icon\": \"root-list\", \"title\": \"接口日志\"}');

-- ----------------------------
-- Table structure for center_organ
-- ----------------------------
DROP TABLE IF EXISTS `center_organ`;
CREATE TABLE `center_organ`  (
  `id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '主键ID',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_user_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人id',
  `create_user_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_org_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人org',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `modify_user_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '更新人id',
  `modify_user_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '说明',
  `sort_index` decimal(10, 2) NULL DEFAULT NULL COMMENT '排序号',
  `is_deleted` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '1删除，0未删除',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '名称',
  `parent_id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '父节点id',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `tenant_id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '关联机构',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '组织机构信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of center_organ
-- ----------------------------
INSERT INTO `center_organ` VALUES ('222', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '研发部门', '1', 12, '1');
INSERT INTO `center_organ` VALUES ('OR20222J8A8V7B', NULL, NULL, NULL, NULL, '2022-12-18 19:40:46', NULL, '超级管理员', NULL, NULL, NULL, '产品部门', '1', 1, '1');
INSERT INTO `center_organ` VALUES ('OR20227PX7EPT3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '研发部1', 'T2022E5OTSMLK', 1, 'T2022E5OTSMLK');
INSERT INTO `center_organ` VALUES ('OR202293XIOTWN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试1', 'OR20227PX7EPT3', 1, 'T2022E5OTSMLK');
INSERT INTO `center_organ` VALUES ('OR2022CP2JNFYW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试部', '1', 2, '1');
INSERT INTO `center_organ` VALUES ('OR2022V8MZZF6O', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '11', '222', 12, '1');

-- ----------------------------
-- Table structure for center_oss
-- ----------------------------
DROP TABLE IF EXISTS `center_oss`;
CREATE TABLE `center_oss`  (
  `id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '主键ID',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_user_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人id',
  `create_user_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_org_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人org',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `modify_user_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '更新人id',
  `modify_user_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '说明',
  `sort_index` decimal(10, 2) NULL DEFAULT NULL COMMENT '排序号',
  `tenant_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '租户id',
  `is_deleted` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '1删除，0未删除',
  `endpoint` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '上传地址',
  `workspace` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '空间名',
  `access_key_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '授权id',
  `access_key_secret` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '授权密钥',
  `appid` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'appid',
  `region` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '地区',
  `type` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '存储类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '文件存储配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of center_oss
-- ----------------------------
INSERT INTO `center_oss` VALUES ('OSS202246ILQ', '2022-06-20 10:39:12', NULL, NULL, NULL, '2023-01-16 22:50:48', '1', '超级管理员', NULL, NULL, NULL, NULL, 'oss-cn-zhangjiakou.aliyuncs.com', 'pengpengyu-test', 'LTAI4GEQiReVkzbHqwJcxHLV', '121', NULL, NULL, 'ALIOSS');
INSERT INTO `center_oss` VALUES ('OSS2022A0M68', '2022-06-20 12:35:38', NULL, NULL, NULL, '2023-01-16 22:50:57', '1', '超级管理员', NULL, NULL, NULL, NULL, 'https://simple-1303873963.cos.ap-shanghai.myqcloud.com', 'simple-1303873963', 'AKIDgElfOr1wWtzoO5vgbGelIdmeGR0SxjMk', '1', '1303873963', 'ap-shanghai', 'TENCENTCOS');
INSERT INTO `center_oss` VALUES ('OSS2022A34D2', '2022-06-20 12:38:13', NULL, NULL, NULL, '2023-01-16 22:51:05', '1', '超级管理员', NULL, NULL, NULL, NULL, 'http://101.43.50.12:19000', 'simple', 'simple', 'simple2022', NULL, NULL, 'MINIO');

-- ----------------------------
-- Table structure for center_platform
-- ----------------------------
DROP TABLE IF EXISTS `center_platform`;
CREATE TABLE `center_platform`  (
  `id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '主键ID',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_user_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人id',
  `create_user_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_org_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人org',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `modify_user_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '更新人id',
  `modify_user_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '说明',
  `sort_index` decimal(10, 2) NULL DEFAULT NULL COMMENT '排序号',
  `tenant_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '租户id',
  `is_deleted` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '1删除，0未删除',
  `openid` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '平台用户id',
  `uniopenid` varchar(0) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '平台用户唯一id',
  `avatar` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '头像',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `sex` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '性别',
  `user` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '关联用户id',
  `type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '平台类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '第三方平台用户信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of center_platform
-- ----------------------------

-- ----------------------------
-- Table structure for center_role
-- ----------------------------
DROP TABLE IF EXISTS `center_role`;
CREATE TABLE `center_role`  (
  `id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '角色ID',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_user_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人id',
  `create_user_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_org_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人org',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `modify_user_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '更新人id',
  `modify_user_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '说明',
  `sort_index` decimal(10, 2) NULL DEFAULT NULL COMMENT '排序号',
  `tenant_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '租户id',
  `is_deleted` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '1删除，0未删除',
  `name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '角色说明',
  `status` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '状态',
  `code` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '角色编号',
  `type` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '角色类型；01:公共的 02:指定机构',
  `tenants` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '关联机构',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `u_role_name`(`name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of center_role
-- ----------------------------
INSERT INTO `center_role` VALUES ('1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '管理员', '管理员权限', '0', 'ROLE_ADMIN', '0', NULL);
INSERT INTO `center_role` VALUES ('ROLE202206736QBRVH', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '普通用户', '普通用户', '0', NULL, '01', NULL);

-- ----------------------------
-- Table structure for center_rolemenu
-- ----------------------------
DROP TABLE IF EXISTS `center_rolemenu`;
CREATE TABLE `center_rolemenu`  (
  `id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_user_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人id',
  `create_user_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_org_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人org',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `modify_user_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '更新人id',
  `modify_user_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '说明',
  `sort_index` decimal(10, 2) NULL DEFAULT NULL COMMENT '排序号',
  `tenant_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '租户id',
  `is_deleted` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '1删除，0未删除',
  `role` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '角色id',
  `menu` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '菜单id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '权限信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of center_rolemenu
-- ----------------------------
INSERT INTO `center_rolemenu` VALUES ('375743897743429', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2');
INSERT INTO `center_rolemenu` VALUES ('375743897804869', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'BTN20221111154907721ZO34P');
INSERT INTO `center_rolemenu` VALUES ('375743897813061', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'BTN2022111115491502064GI3');
INSERT INTO `center_rolemenu` VALUES ('375743897813062', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'BTN20221111154922065U602V');
INSERT INTO `center_rolemenu` VALUES ('375743897813063', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'BTN20221111154928733E6ZDM');
INSERT INTO `center_rolemenu` VALUES ('375743897866309', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'BTN202211121736211037VZI8');
INSERT INTO `center_rolemenu` VALUES ('375743897878597', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'BTN20221112180725571B02GY');
INSERT INTO `center_rolemenu` VALUES ('375743897878598', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'BTN20221112180742860MQU84');
INSERT INTO `center_rolemenu` VALUES ('375743897878599', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'BTN20221112180800120ZJOP3');
INSERT INTO `center_rolemenu` VALUES ('375743897878600', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'BTN202211121808096098VNF5');
INSERT INTO `center_rolemenu` VALUES ('375743897878601', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'BTN20221112180859346O1PZC');
INSERT INTO `center_rolemenu` VALUES ('375743897940037', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'BTN20221113140647251FMM59');
INSERT INTO `center_rolemenu` VALUES ('375743897952325', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'BTN20221113140658682B4I6G');
INSERT INTO `center_rolemenu` VALUES ('375743897952326', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'BTN20221113140706775GBP9A');
INSERT INTO `center_rolemenu` VALUES ('375743897985093', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'BTN2022111314072204850156');
INSERT INTO `center_rolemenu` VALUES ('375743898001477', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'BTN20221113140742924GGXWH');
INSERT INTO `center_rolemenu` VALUES ('375743898017861', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'BTN2022120820535095379TCZ');
INSERT INTO `center_rolemenu` VALUES ('375743898017862', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'BTN20221208205358262BA2CP');
INSERT INTO `center_rolemenu` VALUES ('375743898079301', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'BTN20221208205405560UTPQU');
INSERT INTO `center_rolemenu` VALUES ('375743898087493', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'BTN20221208205412790X1X6U');
INSERT INTO `center_rolemenu` VALUES ('375743898087494', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'BTN20221116150625111K8VGE');
INSERT INTO `center_rolemenu` VALUES ('375743898087495', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'BTN20221116150633455YG0TG');
INSERT INTO `center_rolemenu` VALUES ('375743898087496', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'BTN20221116150640390B72J4');
INSERT INTO `center_rolemenu` VALUES ('375743898148933', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'BTN20221116150647895ZD0W3');
INSERT INTO `center_rolemenu` VALUES ('375743898153029', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'BTN202211171635031557UXVL');
INSERT INTO `center_rolemenu` VALUES ('375743898153030', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'BTN20221117163513053VEARK');
INSERT INTO `center_rolemenu` VALUES ('375743898193989', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'BTN20221117163523254NNSEM');
INSERT INTO `center_rolemenu` VALUES ('375743898206277', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'BTN20221117163534008SBM7C');
INSERT INTO `center_rolemenu` VALUES ('375743898222661', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'BTN20221121170718148MDX02');
INSERT INTO `center_rolemenu` VALUES ('375743898222662', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'BTN20221121170729310Z83IV');
INSERT INTO `center_rolemenu` VALUES ('375743898222663', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'BTN20221121170736285V1SA0');
INSERT INTO `center_rolemenu` VALUES ('375743898222664', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'BTN20221121170743163KWT0N');
INSERT INTO `center_rolemenu` VALUES ('375743898275909', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'BTN20221203211321799HVL7X');
INSERT INTO `center_rolemenu` VALUES ('375743898284101', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'BTN20221203211328329RA75O');
INSERT INTO `center_rolemenu` VALUES ('375743898292293', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'BTN20221203211337948VNLU0');
INSERT INTO `center_rolemenu` VALUES ('375743898292294', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'BTN2022120321134425867T4M');
INSERT INTO `center_rolemenu` VALUES ('375743898292295', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'BTN20221230151312335A6HEI');
INSERT INTO `center_rolemenu` VALUES ('375743898292296', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'BTN20221230151400849W4PTM');
INSERT INTO `center_rolemenu` VALUES ('375743898341445', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'BTN20230101150117420BFW2J');
INSERT INTO `center_rolemenu` VALUES ('375743898349637', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'BTN20230101220007974OMCDV');
INSERT INTO `center_rolemenu` VALUES ('375743898357829', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'BTN20230102115505646J3L4C');
INSERT INTO `center_rolemenu` VALUES ('375743898357830', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'BTN2023010716062356775GXB');
INSERT INTO `center_rolemenu` VALUES ('375743898357831', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'BTN20230108120210343LGRYG');
INSERT INTO `center_rolemenu` VALUES ('375743898357832', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'BTN20230108120226608QWZ6D');
INSERT INTO `center_rolemenu` VALUES ('375743898394693', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'BTN20230108120244040PD9PD');
INSERT INTO `center_rolemenu` VALUES ('375743898394694', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'BTN20221230203730395QJV8L');
INSERT INTO `center_rolemenu` VALUES ('375743898480709', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'BTN20220624193938973JMBB7');
INSERT INTO `center_rolemenu` VALUES ('375743898492997', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'BTN202206241939506085IE7O');
INSERT INTO `center_rolemenu` VALUES ('375743898492998', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'BTN20220624194002776R96TI');
INSERT INTO `center_rolemenu` VALUES ('375743898492999', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'BTN20220624194010155TW62M');
INSERT INTO `center_rolemenu` VALUES ('375743898525765', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'BTN2022080412135175925582');
INSERT INTO `center_rolemenu` VALUES ('375743898525766', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'BTN20220804121357865WA8Z7');
INSERT INTO `center_rolemenu` VALUES ('375743898550341', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'BTN20220804121408220HTDUS');
INSERT INTO `center_rolemenu` VALUES ('375743898558533', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'BTN20220804121416757955LJ');
INSERT INTO `center_rolemenu` VALUES ('375743898558534', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'BTN20220612152538483J36DD');
INSERT INTO `center_rolemenu` VALUES ('375743898558535', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'BTN20220612152550459C55UT');
INSERT INTO `center_rolemenu` VALUES ('375743898558536', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'BTN20220612152604812LX3X1');
INSERT INTO `center_rolemenu` VALUES ('375743898599493', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1');
INSERT INTO `center_rolemenu` VALUES ('375743898628165', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'BTN20220624193556724CKSBR');
INSERT INTO `center_rolemenu` VALUES ('375743898628166', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'BTN20220624193608163XOCV6');
INSERT INTO `center_rolemenu` VALUES ('375743898628167', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'BTN202206241936181131YR6B');
INSERT INTO `center_rolemenu` VALUES ('375743898665029', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'BTN20220624193628120EW0DD');
INSERT INTO `center_rolemenu` VALUES ('375743898665030', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'BTN20220624194038782F1L34');
INSERT INTO `center_rolemenu` VALUES ('375743898685509', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'BTN2022062419404569518A7R');
INSERT INTO `center_rolemenu` VALUES ('375743898693701', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'BTN20220624194052770KZYIG');
INSERT INTO `center_rolemenu` VALUES ('375743898693702', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'BTN20220624194100377MJ83B');
INSERT INTO `center_rolemenu` VALUES ('375743898693703', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'BTN20220624190031433TE3TK');
INSERT INTO `center_rolemenu` VALUES ('375743898693704', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'BTN20220624190050686OBSW3');
INSERT INTO `center_rolemenu` VALUES ('375743898693705', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'BTN20220624190109272L2TGP');
INSERT INTO `center_rolemenu` VALUES ('375743898693706', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'BTN20220624190211693MIG7U');
INSERT INTO `center_rolemenu` VALUES ('375743898755141', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'MENU20220730174817566HRBRX');
INSERT INTO `center_rolemenu` VALUES ('375743898767429', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'BTN20220624194216415QA7LT');
INSERT INTO `center_rolemenu` VALUES ('375743898767430', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'BTN20220624194231107IF0U0');
INSERT INTO `center_rolemenu` VALUES ('375743898767431', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'MENU20220614192715011Q8MNB');
INSERT INTO `center_rolemenu` VALUES ('375743898767432', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'MENU20220619172225564RGCC4');
INSERT INTO `center_rolemenu` VALUES ('375743898804293', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'MENU20220619172501019COPJ8');
INSERT INTO `center_rolemenu` VALUES ('375743898804294', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'MENU20220619172616380RCPPT');
INSERT INTO `center_rolemenu` VALUES ('375743898824773', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'MENU20220627112455181220IU');
INSERT INTO `center_rolemenu` VALUES ('375743899033669', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '7');
INSERT INTO `center_rolemenu` VALUES ('375743899037765', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '3');
INSERT INTO `center_rolemenu` VALUES ('375743899037766', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'MENU20220803212726121GLSZ5');
INSERT INTO `center_rolemenu` VALUES ('375743899037767', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '4');
INSERT INTO `center_rolemenu` VALUES ('375743899037768', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '8');
INSERT INTO `center_rolemenu` VALUES ('375743899037769', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '5');
INSERT INTO `center_rolemenu` VALUES ('375743899037770', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '6');
INSERT INTO `center_rolemenu` VALUES ('375743899103301', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'MENU20220612154353674IOIVI');
INSERT INTO `center_rolemenu` VALUES ('RM20220916171710607G7S48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ROLE202206736QBRVH', '2');
INSERT INTO `center_rolemenu` VALUES ('RM20220916171710615KN63T', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ROLE202206736QBRVH', 'BTN202206241939506085IE7O');
INSERT INTO `center_rolemenu` VALUES ('RM20220916171710623V0I60', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ROLE202206736QBRVH', 'BTN20220624194002776R96TI');
INSERT INTO `center_rolemenu` VALUES ('RM202209161717106308VAGA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ROLE202206736QBRVH', 'BTN20220624193938973JMBB7');
INSERT INTO `center_rolemenu` VALUES ('RM20220916171710638B34CY', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ROLE202206736QBRVH', 'BTN20220624194010155TW62M');
INSERT INTO `center_rolemenu` VALUES ('RM20220916171710646DAN71', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ROLE202206736QBRVH', 'BTN20220804121408220HTDUS');
INSERT INTO `center_rolemenu` VALUES ('RM20220916171710654A5MSI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ROLE202206736QBRVH', 'BTN2022080412135175925582');
INSERT INTO `center_rolemenu` VALUES ('RM20220916171710661NPWDY', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ROLE202206736QBRVH', 'BTN20220612152550459C55UT');
INSERT INTO `center_rolemenu` VALUES ('RM20220916171710669G50C0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ROLE202206736QBRVH', 'BTN20220612152604812LX3X1');
INSERT INTO `center_rolemenu` VALUES ('RM2022091617171067731Q04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ROLE202206736QBRVH', 'BTN20220612152538483J36DD');
INSERT INTO `center_rolemenu` VALUES ('RM20220916171710685EIMHR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ROLE202206736QBRVH', '1');
INSERT INTO `center_rolemenu` VALUES ('RM20220916171710693MACQK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ROLE202206736QBRVH', 'BTN20220624190211693MIG7U');
INSERT INTO `center_rolemenu` VALUES ('RM20220916171710700XIRKU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ROLE202206736QBRVH', 'BTN20220624190031433TE3TK');
INSERT INTO `center_rolemenu` VALUES ('RM202209161717107086VHP4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ROLE202206736QBRVH', '7');
INSERT INTO `center_rolemenu` VALUES ('RM20220916171710716HAWVD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ROLE202206736QBRVH', '3');
INSERT INTO `center_rolemenu` VALUES ('RM20220916171710724RJVSO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ROLE202206736QBRVH', 'MENU20220803212726121GLSZ5');
INSERT INTO `center_rolemenu` VALUES ('RM20220916171710732C745L', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ROLE202206736QBRVH', '4');
INSERT INTO `center_rolemenu` VALUES ('RM20220916171710740BY12W', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ROLE202206736QBRVH', '6');

-- ----------------------------
-- Table structure for center_roleuser
-- ----------------------------
DROP TABLE IF EXISTS `center_roleuser`;
CREATE TABLE `center_roleuser`  (
  `id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '主键id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_user_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人id',
  `create_user_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_org_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人org',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `modify_user_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '更新人id',
  `modify_user_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '说明',
  `sort_index` decimal(10, 2) NULL DEFAULT NULL COMMENT '排序号',
  `tenant_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '租户id',
  `is_deleted` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '1删除，0未删除',
  `user` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '关联用户',
  `role` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '关联角色',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '角色用户关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of center_roleuser
-- ----------------------------
INSERT INTO `center_roleuser` VALUES ('RU20221102160710878P197J', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1');
INSERT INTO `center_roleuser` VALUES ('RU20221128185409673SHRC8', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'U2022W2V1BYS3', 'ROLE202206736QBRVH');
INSERT INTO `center_roleuser` VALUES ('RU20221128230542647FH2DX', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'U2022WFQEM6ML', '1');

-- ----------------------------
-- Table structure for center_sms
-- ----------------------------
DROP TABLE IF EXISTS `center_sms`;
CREATE TABLE `center_sms`  (
  `id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '短信配置主键',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_user_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人id',
  `create_user_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_org_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人org',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `modify_user_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '更新人id',
  `modify_user_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '说明',
  `sort_index` decimal(10, 2) NULL DEFAULT NULL COMMENT '排序号',
  `tenant_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '租户id',
  `is_deleted` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '1删除，0未删除',
  `type` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '短信类型',
  `endpoint` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '地域域名',
  `region` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '地域',
  `appid` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'appid',
  `secret_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `secret_key` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `sign` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '默认签名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '短信配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of center_sms
-- ----------------------------
INSERT INTO `center_sms` VALUES ('375784708132933', '2023-01-16 22:51:56', '1', '超级管理员', '1', '2023-01-16 22:53:20', '1', '超级管理员', NULL, NULL, NULL, 'false', 'ALI', 'dysmsapi.aliyuncs.com', '212', NULL, '12', '1212', '1212');
INSERT INTO `center_sms` VALUES ('SMS2022D2GPP', NULL, NULL, NULL, NULL, '2023-01-16 22:53:56', '1', '超级管理员', NULL, NULL, NULL, NULL, 'TENCENT', 'sms.tencentcloudapi.com', 'ap-guangzhou', '1400467568', '12', '1212', '1212');

-- ----------------------------
-- Table structure for center_tenant
-- ----------------------------
DROP TABLE IF EXISTS `center_tenant`;
CREATE TABLE `center_tenant`  (
  `id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '机构id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_user_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人id',
  `create_user_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_org_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人org',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `modify_user_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '更新人id',
  `modify_user_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '说明',
  `sort_index` decimal(10, 2) NULL DEFAULT NULL COMMENT '排序号',
  `tenant_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '租户id',
  `is_deleted` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '1删除，0未删除',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '机构名称',
  `phone` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '电话',
  `email` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '电子邮箱',
  `address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '机构地址',
  `status` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '机构信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of center_tenant
-- ----------------------------
INSERT INTO `center_tenant` VALUES ('1', NULL, NULL, NULL, NULL, '2023-01-17 16:52:15', '1', '超级管理员', NULL, NULL, NULL, NULL, 'FrSimple1', '18777776666', '18777776666@163.com', '上海市', '0');
INSERT INTO `center_tenant` VALUES ('T2022E5OTSMLK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试机构0222', '18777776666', '18777776666@163.com', '上海市浦东新区', NULL);

-- ----------------------------
-- Table structure for center_user
-- ----------------------------
DROP TABLE IF EXISTS `center_user`;
CREATE TABLE `center_user`  (
  `id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户唯一id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_user_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人id',
  `create_user_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_org_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人org',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `modify_user_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '更新人id',
  `modify_user_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '说明',
  `sort_index` decimal(10, 2) NULL DEFAULT NULL COMMENT '排序号',
  `tenant_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '租户id',
  `is_deleted` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '1删除，0未删除',
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '登录名',
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '密码',
  `nick_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `phone` varchar(18) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '电子邮箱',
  `status` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '用户状态',
  `avatar` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '头像',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后一次登录时间',
  `tenant` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '关联主机构',
  `error_count` int NULL DEFAULT NULL COMMENT '错误次数',
  `organ` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '关联组织',
  `lock_time` datetime NULL DEFAULT NULL COMMENT '锁定时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '系统用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of center_user
-- ----------------------------
INSERT INTO `center_user` VALUES ('1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'system', 'a383606b81275376d97c64bee3581c6e', '超级管理员', '16628515672', 'frsimple@163.com', '0', 'https://pengpengyu-test.oss-cn-zhangjiakou.aliyuncs.com/public/2022-06-26/1/电子名片.png', '2022-11-11 14:57:44', '1', 0, '1', '2022-11-17 18:06:01');
INSERT INTO `center_user` VALUES ('U2022W2V1BYS3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'frsimple', '045aa1526986b056027bdd18bd3847f6', 'frsimple1', '18777776666', '18777776666@163.com', '0', NULL, '2022-06-18 14:32:49', 'T2022E5OTSMLK', 2, '222', '2022-11-27 23:31:44');
INSERT INTO `center_user` VALUES ('U2022WFQEM6ML', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'simpleboot', '65849757eac806054b117395b754583c', 'simpleboot', '13513513513', '135@xx.com', '0', NULL, NULL, '1', 0, 'OR20222J8A8V7B', NULL);

-- ----------------------------
-- Table structure for center_user_third
-- ----------------------------
DROP TABLE IF EXISTS `center_user_third`;
CREATE TABLE `center_user_third`  (
  `id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '主键ID',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_user_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人id',
  `create_user_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_org_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人org',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `modify_user_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '更新人id',
  `modify_user_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '说明',
  `sort_index` decimal(10, 2) NULL DEFAULT NULL COMMENT '排序号',
  `tenant_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '租户id',
  `is_deleted` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '1删除，0未删除',
  `userid` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '关联用户id',
  `openid` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '第三方用户id',
  `uniopenid` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '第三方用户唯一id',
  `type` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '第三方类型',
  `status` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '绑定状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '用户第三方绑定信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of center_user_third
-- ----------------------------
INSERT INTO `center_user_third` VALUES ('1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', '1', '01', '0');

-- ----------------------------
-- Table structure for center_usertenant
-- ----------------------------
DROP TABLE IF EXISTS `center_usertenant`;
CREATE TABLE `center_usertenant`  (
  `id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '主键id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_user_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人id',
  `create_user_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_org_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人org',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `modify_user_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '更新人id',
  `modify_user_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '说明',
  `sort_index` decimal(10, 2) NULL DEFAULT NULL COMMENT '排序号',
  `tenant_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '租户id',
  `is_deleted` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '1删除，0未删除',
  `tenant` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '机构id',
  `user` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '用户机构关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of center_usertenant
-- ----------------------------
INSERT INTO `center_usertenant` VALUES ('UT2022BVJRDP6C', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1');
INSERT INTO `center_usertenant` VALUES ('UT2022E2FYB9K5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'T2022E5OTSMLK', 'U2022W2V1BYS3');
INSERT INTO `center_usertenant` VALUES ('UT2022VO4CYN8F', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'U2022WFQEM6ML');

-- ----------------------------
-- Table structure for center_wqrcode
-- ----------------------------
DROP TABLE IF EXISTS `center_wqrcode`;
CREATE TABLE `center_wqrcode`  (
  `id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '主键ID',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_user_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人id',
  `create_user_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_org_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人org',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `modify_user_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '更新人id',
  `modify_user_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '说明',
  `sort_index` decimal(10, 2) NULL DEFAULT NULL COMMENT '排序号',
  `tenant_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '租户id',
  `is_deleted` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '1删除，0未删除',
  `code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '授权码',
  `createtime` datetime NULL DEFAULT NULL COMMENT '生成时间',
  `status` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '状态',
  `openid` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'openid',
  `opt` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '操作',
  `qrtime` datetime NULL DEFAULT NULL COMMENT '扫码时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '微信小程序二维码临时表' ROW_FORMAT = DYNAMIC;


-- ----------------------------
-- Table structure for code_datasource
-- ----------------------------
DROP TABLE IF EXISTS `code_datasource`;
CREATE TABLE `code_datasource`  (
  `id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '主键ID',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_user_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人id',
  `create_user_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_org_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人org',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `modify_user_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '更新人id',
  `modify_user_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '说明',
  `sort_index` decimal(10, 2) NULL DEFAULT NULL COMMENT '排序号',
  `tenant_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '租户id',
  `is_deleted` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '1删除，0未删除',
  `url` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '请求地址',
  `user` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '用户名称',
  `pwd` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '密码',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '数据源配置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of code_datasource
-- ----------------------------

-- ----------------------------
-- Table structure for code_tablecfg
-- ----------------------------
DROP TABLE IF EXISTS `code_tablecfg`;
CREATE TABLE `code_tablecfg`  (
  `id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '主键ID',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_user_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人id',
  `create_user_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_org_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人org',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `modify_user_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '更新人id',
  `modify_user_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '说明',
  `sort_index` decimal(10, 2) NULL DEFAULT NULL COMMENT '排序号',
  `tenant_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '租户id',
  `is_deleted` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '1删除，0未删除',
  `datasource` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '关联数据源',
  `table_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '表名',
  `fix` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '表前缀',
  `pkg` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '包名',
  `auth` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '作者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '生成表配置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of code_tablecfg
-- ----------------------------
INSERT INTO `code_tablecfg` VALUES ('TC20220731115213066', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'center_dictionary', 'center_', 'org.simple.plan', 'zhoupy1');
INSERT INTO `code_tablecfg` VALUES ('TC20220731161347517', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'DS20220731160534272', 'simple_user', 'si_', 'org.simple.plan', 'frsimple');
INSERT INTO `code_tablecfg` VALUES ('TC20220803214735642', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'DS20220803214655434', 'center_branch', 'center_', 'org.simple.center', 'frsimple');
INSERT INTO `code_tablecfg` VALUES ('TC20220803215631985', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'DS20220803215317588', 'center_branch', 'cenrer_', 'org.simple.center', 'frsimple');

-- ----------------------------
-- Table structure for online_data_field
-- ----------------------------
DROP TABLE IF EXISTS `online_data_field`;
CREATE TABLE `online_data_field`  (
  `id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '主键id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_user_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人id',
  `create_user_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_org_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人org',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `modify_user_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '更新人id',
  `modify_user_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '说明',
  `sort_index` decimal(10, 2) NULL DEFAULT NULL COMMENT '排序号',
  `tenant_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '租户id',
  `is_deleted` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '1删除，0未删除',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '名称',
  `code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '编号',
  `type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '关联类型id',
  `type_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '关联类型名称',
  `field_length` int NULL DEFAULT NULL COMMENT '长度',
  `field_dec_places` int NULL DEFAULT NULL COMMENT '小数位数',
  `state` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '数据域表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of online_data_field
-- ----------------------------

-- ----------------------------
-- Table structure for online_data_field_area
-- ----------------------------
DROP TABLE IF EXISTS `online_data_field_area`;
CREATE TABLE `online_data_field_area`  (
  `id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '主键id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_user_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人id',
  `create_User_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_org_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人org',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `modify_user_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '更新人id',
  `modify_user_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '说明',
  `sort_index` decimal(10, 2) NULL DEFAULT NULL COMMENT '排序号',
  `tenant_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '租户id',
  `is_deleted` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '是否删除',
  `code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '数据域代码',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '显示名称',
  `field_type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '数据类型',
  `field_code` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '数据类型编号',
  `field_length` int NULL DEFAULT NULL COMMENT '长度',
  `field_decimal_length` int NULL DEFAULT NULL COMMENT '小数位数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '数据域' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of online_data_field_area
-- ----------------------------
INSERT INTO `online_data_field_area` VALUES ('324468892876869', '2022-08-24 22:47:20', '3495028716', '管理员', '0', '2022-09-20 18:23:08', '3495028716', '管理员', NULL, NULL, NULL, 'false', '500(string)', '长字符串', 'varchar', 'varchar', 500, 0);
INSERT INTO `online_data_field_area` VALUES ('333959327928389', '2022-09-20 18:24:01', '3495028716', '管理员', '0', NULL, NULL, NULL, NULL, NULL, NULL, 'false', '50(string)', '短字符串', 'varchar', 'varchar', 50, 0);
INSERT INTO `online_data_field_area` VALUES ('333959496921157', '2022-09-20 18:24:42', '3495028716', '管理员', '0', '2022-09-20 18:25:13', '3495028716', '管理员', NULL, NULL, NULL, 'false', 'DefaultString', '默认字串', 'varchar', 'varchar', 255, 0);

-- ----------------------------
-- Table structure for online_data_field_area_detail
-- ----------------------------
DROP TABLE IF EXISTS `online_data_field_area_detail`;
CREATE TABLE `online_data_field_area_detail`  (
  `id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '主键id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_user_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人id',
  `create_User_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_org_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人org',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `modify_user_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '更新人id',
  `modify_user_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '说明',
  `sort_index` decimal(10, 2) NULL DEFAULT NULL COMMENT '排序号',
  `tenant_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '租户id',
  `is_deleted` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '是否删除',
  `field_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '所属ID',
  `field_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '数据域代码',
  `db_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '数据库类型名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '数据域' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of online_data_field_area_detail
-- ----------------------------

-- ----------------------------
-- Table structure for online_data_table
-- ----------------------------
DROP TABLE IF EXISTS `online_data_table`;
CREATE TABLE `online_data_table`  (
  `id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '主键id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_user_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人id',
  `create_user_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_org_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人org',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `modify_user_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '更新人id',
  `modify_user_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '说明',
  `sort_index` decimal(10, 2) NULL DEFAULT NULL COMMENT '排序号',
  `tenant_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '租户id',
  `is_deleted` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '1删除，0未删除',
  `code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '编号',
  `db_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '数据库名称',
  `table_code` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '表名',
  `table_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '显示名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '数据类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of online_data_table
-- ----------------------------
INSERT INTO `online_data_table` VALUES ('333846187204677', '2022-09-20 10:43:39', '3495028716', '管理员', '0', NULL, NULL, NULL, NULL, 1.00, NULL, 'false', 'test', 'logs', 't_test_table', '测试');

-- ----------------------------
-- Table structure for online_data_table_column
-- ----------------------------
DROP TABLE IF EXISTS `online_data_table_column`;
CREATE TABLE `online_data_table_column`  (
  `id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '主键id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_user_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人id',
  `create_user_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_org_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人org',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `modify_user_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '更新人id',
  `modify_user_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '说明',
  `sort_index` decimal(10, 2) NULL DEFAULT NULL COMMENT '排序号',
  `tenant_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '租户id',
  `is_deleted` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '1删除，0未删除',
  `table_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '主表id',
  `code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '字段编号',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '字段名称',
  `primary_key` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '主键',
  `area` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '数据域',
  `area_type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '数据类型',
  `data_length` double NULL DEFAULT NULL COMMENT '长度',
  `decimal_digits` double NULL DEFAULT NULL COMMENT '小数位数',
  `table_Explain` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '数据类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of online_data_table_column
-- ----------------------------

-- ----------------------------
-- Table structure for online_data_type
-- ----------------------------
DROP TABLE IF EXISTS `online_data_type`;
CREATE TABLE `online_data_type`  (
  `id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '主键id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_user_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人id',
  `create_user_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_org_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人org',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `modify_user_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '更新人id',
  `modify_user_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '说明',
  `sort_index` decimal(10, 2) NULL DEFAULT NULL COMMENT '排序号',
  `tenant_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '租户id',
  `is_deleted` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '1删除，0未删除',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '名称',
  `code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '编号',
  `type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '类型',
  `state` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '数据类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of online_data_type
-- ----------------------------
INSERT INTO `online_data_type` VALUES ('318066842300485', '2022-08-06 20:37:20', '3495028716', '管理员', '0', '2022-08-06 20:39:01', '3495028716', '管理员', '1', 1.00, NULL, 'false', '字符串', 'VARCHAR', '', 'enabled');
INSERT INTO `online_data_type` VALUES ('318307669327941', '2022-08-07 12:57:15', '3495028716', '管理员', '0', '2022-08-07 12:59:55', '3495028716', '管理员', NULL, 3.00, NULL, 'false', '长数字', 'BigInt', '', 'enabled');
INSERT INTO `online_data_type` VALUES ('318307800404037', '2022-08-07 12:57:47', '3495028716', '管理员', '0', '2022-08-07 12:59:28', '3495028716', '管理员', NULL, 2.00, NULL, 'false', '整数', 'INT', NULL, 'enabled');
INSERT INTO `online_data_type` VALUES ('318307867971653', '2022-08-07 12:58:04', '3495028716', '管理员', '0', '2022-08-07 12:59:50', '3495028716', '管理员', NULL, 5.00, NULL, 'false', '大文本', 'largeText', '', 'enabled');
INSERT INTO `online_data_type` VALUES ('318324809400389', '2022-08-07 14:07:00', '3495028716', '管理员', '0', '2022-08-07 14:07:29', '3495028716', '管理员', NULL, 4.00, NULL, 'false', '日期', 'DATETIME', '', 'enabled');
INSERT INTO `online_data_type` VALUES ('333957876367429', '2022-09-20 18:18:07', '3495028716', '管理员', '0', '2022-09-20 18:21:46', '3495028716', '管理员', NULL, 8.00, NULL, 'false', '二进制', 'BLOB', NULL, NULL);

-- ----------------------------
-- Table structure for online_data_type_detail
-- ----------------------------
DROP TABLE IF EXISTS `online_data_type_detail`;
CREATE TABLE `online_data_type_detail`  (
  `id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '主键id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_user_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人id',
  `create_user_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_org_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人org',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `modify_user_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '更新人id',
  `modify_user_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '说明',
  `sort_index` decimal(10, 2) NULL DEFAULT NULL COMMENT '排序号',
  `tenant_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '租户id',
  `is_deleted` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '1删除，0未删除',
  `detail_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '主表id',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '数据库名称 ',
  `code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '数据类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of online_data_type_detail
-- ----------------------------
INSERT INTO `online_data_type_detail` VALUES ('318307168530501', '2022-08-07 12:55:13', '3495028716', '管理员', '0', '2022-08-07 12:55:19', '3495028716', '管理员', NULL, NULL, NULL, 'false', '318066842300485', 'MySql', 'varchar');
INSERT INTO `online_data_type_detail` VALUES ('318307669536837', '2022-08-07 12:57:15', '3495028716', '管理员', '0', '2022-08-07 12:59:56', '3495028716', '管理员', NULL, NULL, NULL, 'false', '318307669327941', 'MySql', 'BigInt');
INSERT INTO `online_data_type_detail` VALUES ('318313764393029', '2022-08-07 13:22:03', '3495028716', '管理员', '0', '2022-08-07 13:22:09', '3495028716', '管理员', NULL, NULL, NULL, 'false', '318307867971653', 'MySql', 'text');
INSERT INTO `online_data_type_detail` VALUES ('318324809777221', '2022-08-07 14:07:00', '3495028716', '管理员', '0', '2022-08-07 14:07:29', '3495028716', '管理员', NULL, NULL, NULL, 'false', '318324809400389', 'MySql', 'DATETIME');
INSERT INTO `online_data_type_detail` VALUES ('333955259965509', '2022-09-20 18:07:28', '3495028716', '管理员', '0', '2022-09-20 18:17:20', '3495028716', '管理员', NULL, NULL, NULL, 'false', '318307800404037', 'MySql', 'INT');
INSERT INTO `online_data_type_detail` VALUES ('333957876711493', '2022-09-20 18:18:07', '3495028716', '管理员', '0', '2022-09-20 18:21:46', '3495028716', '管理员', NULL, NULL, NULL, 'false', '333957876367429', 'MySql', 'BLOB');

-- ----------------------------
-- Table structure for xxl_job_group
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_group`;
CREATE TABLE `xxl_job_group`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_user_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人id',
  `create_user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_org_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人组织id',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `modify_user_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '修改人id',
  `modify_user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '修改人',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '说明',
  `sort_index` decimal(10, 2) NULL DEFAULT NULL COMMENT '排序号',
  `tenant_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '租户id',
  `is_deleted` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否删除',
  `app_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '执行器AppName',
  `title` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '执行器名称',
  `address_type` tinyint NOT NULL DEFAULT 0 COMMENT '执行器地址类型：0=自动注册、1=手动录入',
  `address_list` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '执行器地址列表，多地址逗号分隔',
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xxl_job_group
-- ----------------------------
INSERT INTO `xxl_job_group` VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'xxl-job-center', '中台服务', 0, 'http://192.17.4.1:9999/', '2022-10-19 10:19:05');

-- ----------------------------
-- Table structure for xxl_job_info
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_info`;
CREATE TABLE `xxl_job_info`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_user_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人id',
  `create_user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_org_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人org',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `modify_user_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新人id',
  `modify_user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新人',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '说明',
  `sort_index` decimal(10, 2) NULL DEFAULT NULL COMMENT '排序号',
  `tenant_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '租户id',
  `is_deleted` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '1删除，0未删除',
  `job_group` int NOT NULL COMMENT '执行器主键ID',
  `job_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `add_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `author` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '作者',
  `alarm_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '报警邮件',
  `schedule_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'NONE' COMMENT '调度类型',
  `schedule_conf` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '调度配置，值含义取决于调度类型',
  `misfire_strategy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'DO_NOTHING' COMMENT '调度过期策略',
  `executor_route_strategy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '执行器路由策略',
  `executor_handler` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '执行器任务handler',
  `executor_param` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '执行器任务参数',
  `executor_block_strategy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '阻塞处理策略',
  `executor_timeout` int NOT NULL DEFAULT 0 COMMENT '任务执行超时时间，单位秒',
  `executor_fail_retry_count` int NOT NULL DEFAULT 0 COMMENT '失败重试次数',
  `glue_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'GLUE类型',
  `glue_source` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT 'GLUE源代码',
  `glue_remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'GLUE备注',
  `glue_updatetime` datetime NULL DEFAULT NULL COMMENT 'GLUE更新时间',
  `child_jobid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '子任务ID，多个逗号分隔',
  `trigger_status` tinyint NOT NULL DEFAULT 0 COMMENT '调度状态：0-停止，1-运行',
  `trigger_last_time` bigint NOT NULL DEFAULT 0 COMMENT '上次调度时间',
  `trigger_next_time` bigint NOT NULL DEFAULT 0 COMMENT '下次调度时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xxl_job_info
-- ----------------------------
INSERT INTO `xxl_job_info` VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '测试任务1', '2018-11-03 22:21:31', '2022-09-19 09:29:52', 'XXL', '', 'FIX_RATE', '60000', 'DO_NOTHING', 'RANDOM', 'demoJobHandler', '', 'SERIAL_EXECUTION', 0, 0, 'BEAN', '', 'GLUE代码初始化', '2018-11-03 22:21:31', '', 1, 1666130997482, 1666190997482);

-- ----------------------------
-- Table structure for xxl_job_lock
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_lock`;
CREATE TABLE `xxl_job_lock`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_user_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人id',
  `create_user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_org_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人org',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `modify_user_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新人id',
  `modify_user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新人',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '说明',
  `sort_index` decimal(10, 2) NULL DEFAULT NULL COMMENT '排序号',
  `tenant_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '租户id',
  `is_deleted` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '1删除，0未删除',
  `lock_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '锁名称',
  PRIMARY KEY (`lock_name`, `id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xxl_job_lock
-- ----------------------------
INSERT INTO `xxl_job_lock` VALUES ('', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'schedule_lock');

-- ----------------------------
-- Table structure for xxl_job_log
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_log`;
CREATE TABLE `xxl_job_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_user_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人id',
  `create_user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_org_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人org',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `modify_user_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新人id',
  `modify_user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新人',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '说明',
  `sort_index` decimal(10, 2) NULL DEFAULT NULL COMMENT '排序号',
  `tenant_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '租户id',
  `is_deleted` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '1删除，0未删除',
  `job_group` int NOT NULL COMMENT '执行器主键ID',
  `job_id` int NOT NULL COMMENT '任务，主键ID',
  `executor_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '执行器地址，本次执行的地址',
  `executor_handler` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '执行器任务handler',
  `executor_param` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '执行器任务参数',
  `executor_sharding_param` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '执行器任务分片参数，格式如 1/2',
  `executor_fail_retry_count` int NOT NULL DEFAULT 0 COMMENT '失败重试次数',
  `trigger_time` datetime NULL DEFAULT NULL COMMENT '调度-时间',
  `trigger_code` int NOT NULL COMMENT '调度-结果',
  `trigger_msg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '调度-日志',
  `handle_time` datetime NULL DEFAULT NULL COMMENT '执行-时间',
  `handle_code` int NOT NULL COMMENT '执行-状态',
  `handle_msg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '执行-日志',
  `alarm_status` tinyint NOT NULL DEFAULT 0 COMMENT '告警状态：0-默认、1-无需告警、2-告警成功、3-告警失败',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `I_trigger_time`(`trigger_time` ASC) USING BTREE,
  INDEX `I_handle_code`(`handle_code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12999 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;



-- ----------------------------
-- Table structure for xxl_job_log_report
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_log_report`;
CREATE TABLE `xxl_job_log_report`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_user_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人id',
  `create_user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_org_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人org',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `modify_user_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新人id',
  `modify_user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新人',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '说明',
  `sort_index` decimal(10, 2) NULL DEFAULT NULL COMMENT '排序号',
  `tenant_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '租户id',
  `is_deleted` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '1删除，0未删除',
  `trigger_day` datetime NULL DEFAULT NULL COMMENT '调度-时间',
  `running_count` int NOT NULL DEFAULT 0 COMMENT '运行中-日志数量',
  `suc_count` int NOT NULL DEFAULT 0 COMMENT '执行成功-日志数量',
  `fail_count` int NOT NULL DEFAULT 0 COMMENT '执行失败-日志数量',
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `i_trigger_day`(`trigger_day` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;



-- ----------------------------
-- Table structure for xxl_job_logglue
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_logglue`;
CREATE TABLE `xxl_job_logglue`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_user_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人id',
  `create_user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_org_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人org',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `modify_user_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新人id',
  `modify_user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新人',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '说明',
  `sort_index` decimal(10, 2) NULL DEFAULT NULL COMMENT '排序号',
  `tenant_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '租户id',
  `is_deleted` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '1删除，0未删除',
  `job_id` int NOT NULL COMMENT '任务，主键ID',
  `glue_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'GLUE类型',
  `glue_source` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT 'GLUE源代码',
  `glue_remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'GLUE备注',
  `add_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xxl_job_logglue
-- ----------------------------

-- ----------------------------
-- Table structure for xxl_job_registry
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_registry`;
CREATE TABLE `xxl_job_registry`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_user_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人id',
  `create_user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_org_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人org',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `modify_user_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新人id',
  `modify_user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新人',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '说明',
  `sort_index` decimal(10, 2) NULL DEFAULT NULL COMMENT '排序号',
  `tenant_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '租户id',
  `is_deleted` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '1删除，0未删除',
  `registry_group` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `registry_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `registry_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `i_g_k_v`(`registry_group` ASC, `registry_key` ASC, `registry_value` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xxl_job_registry
-- ----------------------------
INSERT INTO `xxl_job_registry` VALUES (20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'EXECUTOR', 'xxl-job-center', 'http://192.17.4.1:9999/', '2022-10-19 10:18:59');

-- ----------------------------
-- Table structure for xxl_job_user
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_user`;
CREATE TABLE `xxl_job_user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_user_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人id',
  `create_user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_org_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人org',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `modify_user_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新人id',
  `modify_user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新人',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '说明',
  `sort_index` decimal(10, 2) NULL DEFAULT NULL COMMENT '排序号',
  `tenant_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '租户id',
  `is_deleted` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '1删除，0未删除',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '账号',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `role` tinyint NOT NULL COMMENT '角色：0-普通用户、1-管理员',
  `permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限：执行器ID列表，多个逗号分割',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `i_username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xxl_job_user
-- ----------------------------
INSERT INTO `xxl_job_user` VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 1, NULL);

SET FOREIGN_KEY_CHECKS = 1;
