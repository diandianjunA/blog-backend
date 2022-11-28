/*
 Navicat Premium Data Transfer

 Source Server         : 云数据库
 Source Server Type    : MySQL
 Source Server Version : 80031
 Source Host           : 43.140.197.50:3306
 Source Schema         : blog

 Target Server Type    : MySQL
 Target Server Version : 80031
 File Encoding         : 65001

 Date: 28/11/2022 10:09:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '分类名',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '其他', '2022-04-28 16:58:28');
INSERT INTO `category` VALUES (2, '数据结构与算法', '2022-08-23 17:41:47');
INSERT INTO `category` VALUES (3, 'Java', '2022-06-21 23:23:38');
INSERT INTO `category` VALUES (4, 'Ajax', '2022-10-16 21:26:20');
INSERT INTO `category` VALUES (5, '项目实战', '2022-11-08 23:53:15');
INSERT INTO `category` VALUES (6, 'SSM', '2022-09-07 20:44:41');
INSERT INTO `category` VALUES (7, 'python', '2022-11-24 22:35:52');

-- ----------------------------
-- Table structure for more_text
-- ----------------------------
DROP TABLE IF EXISTS `more_text`;
CREATE TABLE `more_text`  (
  `id` int(0) NOT NULL COMMENT '更多文章id',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '更多文章名',
  `url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '地址',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of more_text
-- ----------------------------
INSERT INTO `more_text` VALUES (1, '资本论读书笔记及个人感悟', 'http://www.diandianjun.com.cn:8080/resource/blog/text/more/capitalTheory.md', '2022-11-23 10:51:54');

-- ----------------------------
-- Table structure for text
-- ----------------------------
DROP TABLE IF EXISTS `text`;
CREATE TABLE `text`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '文章id',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '文章名',
  `category_id` int(0) NOT NULL COMMENT '所属分类的id',
  `url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '文件位置',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '文章创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of text
-- ----------------------------
INSERT INTO `text` VALUES (1, '文件上传下载', 1, 'http://www.diandianjun.com.cn:8080/resource/blog/text/Other/FileUploadAndDownload.md', '2022-11-09 23:32:11');
INSERT INTO `text` VALUES (2, 'git使用', 1, 'http://www.diandianjun.com.cn:8080/resource/blog/text/Other/GitUse.md', '2022-07-27 18:35:52');
INSERT INTO `text` VALUES (3, 'markdown使用教程', 1, 'http://www.diandianjun.com.cn:8080/resource/blog/text/Other/MarkdownStartup.md', '2022-04-28 16:58:20');
INSERT INTO `text` VALUES (4, '正则表达式', 1, 'http://www.diandianjun.com.cn:8080/resource/blog/text/Other/RegularExpression.md', '2022-09-25 20:40:42');
INSERT INTO `text` VALUES (5, 'springboot项目部署', 1, 'http://www.diandianjun.com.cn:8080/resource/blog/text/Other/SpringbootProjectDeployment.md', '2022-11-09 20:21:59');
INSERT INTO `text` VALUES (6, '稀疏数组与队列', 2, 'http://www.diandianjun.com.cn:8080/resource/blog/text/DataStructureAndAlgorithm/ArrayAndQueue/ArrayAndQueue.md', '2022-07-22 18:53:53');
INSERT INTO `text` VALUES (7, '排序算法', 2, 'http://www.diandianjun.com.cn:8080/resource/blog/text/DataStructureAndAlgorithm/Sort/sort.md', '2022-08-09 23:28:46');
INSERT INTO `text` VALUES (8, '查找算法', 2, 'http://www.diandianjun.com.cn:8080/resource/blog/text/DataStructureAndAlgorithm/search/search.md', '2022-08-10 15:23:54');
INSERT INTO `text` VALUES (9, '八皇后问题', 2, 'http://www.diandianjun.com.cn:8080/resource/blog/text/DataStructureAndAlgorithm/recrusion/eightQuene.md', '2022-08-09 23:20:08');
INSERT INTO `text` VALUES (10, '递归的原理与规则', 2, 'http://www.diandianjun.com.cn:8080/resource/blog/text/DataStructureAndAlgorithm/recrusion/recrusionRegular.md', '2022-08-09 18:57:12');
INSERT INTO `text` VALUES (11, '迷宫回溯问题', 2, 'http://www.diandianjun.com.cn:8080/resource/blog/text/DataStructureAndAlgorithm/recrusion/mazeBacktracking.md', '2022-08-09 22:37:40');
INSERT INTO `text` VALUES (12, '迪杰斯特拉算法', 2, 'http://www.diandianjun.com.cn:8080/resource/blog/text/DataStructureAndAlgorithm/generalAlgorithm/dijkstra.md', '2022-08-27 16:21:48');
INSERT INTO `text` VALUES (13, '分治算法', 2, 'http://www.diandianjun.com.cn:8080/resource/blog/text/DataStructureAndAlgorithm/generalAlgorithm/divideConquer.md', '2022-08-23 15:46:56');
INSERT INTO `text` VALUES (14, '动态规划', 2, 'http://www.diandianjun.com.cn:8080/resource/blog/text/DataStructureAndAlgorithm/generalAlgorithm/dynamicPlan.md', '2022-08-23 18:16:18');
INSERT INTO `text` VALUES (15, '弗洛伊德算法', 2, 'http://www.diandianjun.com.cn:8080/resource/blog/text/DataStructureAndAlgorithm/generalAlgorithm/floyd.md', '2022-08-27 19:39:26');
INSERT INTO `text` VALUES (16, '贪心算法', 2, 'http://www.diandianjun.com.cn:8080/resource/blog/text/DataStructureAndAlgorithm/generalAlgorithm/greedy.md', '2022-08-25 11:00:16');
INSERT INTO `text` VALUES (17, '骑士周游问题', 2, 'http://www.diandianjun.com.cn:8080/resource/blog/text/DataStructureAndAlgorithm/generalAlgorithm/knightTravel.md', '2022-08-28 08:40:15');
INSERT INTO `text` VALUES (18, '克鲁斯卡尔算法', 2, 'http://www.diandianjun.com.cn:8080/resource/blog/text/DataStructureAndAlgorithm/generalAlgorithm/kruskal.md', '2022-08-26 13:30:25');
INSERT INTO `text` VALUES (19, '二分查找', 2, 'http://www.diandianjun.com.cn:8080/resource/blog/text/DataStructureAndAlgorithm/generalAlgorithm/midSearch.md', '2022-08-23 17:55:16');
INSERT INTO `text` VALUES (20, '普里姆算法', 2, 'http://www.diandianjun.com.cn:8080/resource/blog/text/DataStructureAndAlgorithm/generalAlgorithm/prim.md', '2022-08-25 18:33:03');
INSERT INTO `text` VALUES (21, '字符串匹配', 2, 'http://www.diandianjun.com.cn:8080/resource/blog/text/DataStructureAndAlgorithm/generalAlgorithm/stringMatch.md', '2022-08-24 15:05:04');
INSERT INTO `text` VALUES (22, '哈希表', 2, 'http://www.diandianjun.com.cn:8080/resource/blog/text/DataStructureAndAlgorithm/hash/hash.md', '2022-08-11 15:53:24');
INSERT INTO `text` VALUES (23, '链表', 2, 'http://www.diandianjun.com.cn:8080/resource/blog/text/DataStructureAndAlgorithm/linkedList/linkedList.md', '2022-08-08 14:08:23');
INSERT INTO `text` VALUES (24, '平衡二叉树', 2, 'http://www.diandianjun.com.cn:8080/resource/blog/text/DataStructureAndAlgorithm/tree/avlTree.md', '2022-08-21 09:42:53');
INSERT INTO `text` VALUES (25, '二叉排序树', 2, 'http://www.diandianjun.com.cn:8080/resource/blog/text/DataStructureAndAlgorithm/tree/binarySortTree.md', '2022-08-18 21:43:52');
INSERT INTO `text` VALUES (26, '堆排序', 2, 'http://www.diandianjun.com.cn:8080/resource/blog/text/DataStructureAndAlgorithm/tree/heapSort.md', '2022-08-14 12:12:51');
INSERT INTO `text` VALUES (27, '赫夫曼树', 2, 'http://www.diandianjun.com.cn:8080/resource/blog/text/DataStructureAndAlgorithm/tree/huffmanTree.md', '2022-08-17 13:39:39');
INSERT INTO `text` VALUES (28, '多路查找树', 2, 'http://www.diandianjun.com.cn:8080/resource/blog/text/DataStructureAndAlgorithm/tree/mutiPathTree.md', '2022-08-21 10:33:31');
INSERT INTO `text` VALUES (29, '树', 2, 'http://www.diandianjun.com.cn:8080/resource/blog/text/DataStructureAndAlgorithm/tree/tree.md', '2022-08-31 08:11:13');
INSERT INTO `text` VALUES (30, '图', 2, 'http://www.diandianjun.com.cn:8080/resource/blog/text/DataStructureAndAlgorithm/map/map.md', '2022-08-23 17:40:41');
INSERT INTO `text` VALUES (31, '前中后缀表达式', 2, 'http://www.diandianjun.com.cn:8080/resource/blog/text/DataStructureAndAlgorithm/stack/expression.md', '2022-08-09 17:37:58');
INSERT INTO `text` VALUES (32, '栈', 2, 'http://www.diandianjun.com.cn:8080/resource/blog/text/DataStructureAndAlgorithm/stack/stack.md', '2022-08-08 18:53:46');
INSERT INTO `text` VALUES (33, '集合', 3, 'http://www.diandianjun.com.cn:8080/resource/blog/text/Java/collection.md', '2022-05-13 20:24:00');
INSERT INTO `text` VALUES (34, '枚举类', 3, 'http://www.diandianjun.com.cn:8080/resource/blog/text/Java/enum.md', '2022-05-07 23:25:44');
INSERT INTO `text` VALUES (35, '网络编程', 3, 'http://www.diandianjun.com.cn:8080/resource/blog/text/Java/Internet.md', '2022-05-18 23:27:06');
INSERT INTO `text` VALUES (36, 'IO流', 3, 'http://www.diandianjun.com.cn:8080/resource/blog/text/Java/IO.md', '2022-05-17 18:00:54');
INSERT INTO `text` VALUES (37, 'JDBC', 3, 'http://www.diandianjun.com.cn:8080/resource/blog/text/Java/JDBC.md', '2022-06-21 16:22:24');
INSERT INTO `text` VALUES (38, '多线程', 3, 'http://www.diandianjun.com.cn:8080/resource/blog/text/Java/mutiThread.md', '2022-05-05 20:22:05');
INSERT INTO `text` VALUES (39, '反射', 3, 'http://www.diandianjun.com.cn:8080/resource/blog/text/Java/reflection.md', '2022-05-21 17:19:50');
INSERT INTO `text` VALUES (40, 'Java常用类', 3, 'http://www.diandianjun.com.cn:8080/resource/blog/text/Java/utils.md', '2022-05-07 21:25:40');
INSERT INTO `text` VALUES (41, 'Ajax', 4, 'http://www.diandianjun.com.cn:8080/resource/blog/text/Ajax/Ajax.md', '2022-10-16 21:26:19');
INSERT INTO `text` VALUES (42, 'javaWeb', 3, 'http://www.diandianjun.com.cn:8080/resource/blog/text/Java/javaWeb.md', '2022-08-28 15:33:23');
INSERT INTO `text` VALUES (43, '瑞吉外卖', 5, 'http://www.diandianjun.com.cn:8080/resource/blog/text/ProjectPractice/reggieTakeout.md', '2022-11-08 23:53:05');
INSERT INTO `text` VALUES (44, 'MyBatis', 6, 'http://www.diandianjun.com.cn:8080/resource/blog/text/SSM/MyBatis/Mybatis.md', '2022-08-04 22:56:50');
INSERT INTO `text` VALUES (45, 'Spring', 6, 'http://www.diandianjun.com.cn:8080/resource/blog/text/SSM/Spring/Spring.md', '2022-09-01 19:04:54');
INSERT INTO `text` VALUES (46, 'SpringMvc', 6, 'http://www.diandianjun.com.cn:8080/resource/blog/text/SSM/SpringMvc/SpringMVC.md', '2022-09-08 15:56:06');
INSERT INTO `text` VALUES (47, 'SSM整合', 6, 'http://www.diandianjun.com.cn:8080/resource/blog/text/SSM/SSM.md', '2022-09-08 13:28:55');
INSERT INTO `text` VALUES (48, 'python基础1', 7, 'http://www.diandianjun.com.cn:8080/resource/blog/text/AI/python/python1.md', '2022-11-24 22:32:37');
INSERT INTO `text` VALUES (49, 'python基础2', 7, 'http://www.diandianjun.com.cn:8080/resource/blog/text/AI/python/python2.md', '2022-11-24 22:33:21');

SET FOREIGN_KEY_CHECKS = 1;
