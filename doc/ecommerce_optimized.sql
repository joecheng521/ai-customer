/*
 Navicat Premium Dump SQL

 Source Server         : 本地环境
 Source Server Type    : MySQL
 Source Server Version : 80026 (8.0.26)
 Source Host           : localhost:3306
 Source Schema         : ecommerce_optimized

 Target Server Type    : MySQL
 Target Server Version : 80026 (8.0.26)
 File Encoding         : 65001

 Date: 13/07/2025 17:20:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单号',
  `user_id` int NOT NULL COMMENT '用户ID',
  `product_id` int NOT NULL COMMENT '商品ID',
  `quantity` tinyint NULL DEFAULT 1 COMMENT '数量',
  `amount` decimal(10, 2) NOT NULL COMMENT '总金额',
  `status` enum('CREATED','PAID','SHIPPED','DELIVERED','COMPLETED','CANCELLED') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'CREATED' COMMENT '订单状态',
  `created_at` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('ORD20250701001', 2, 1, 1, 8999.00, 'COMPLETED', '2025-07-01 10:30:45', NULL);
INSERT INTO `orders` VALUES ('ORD20250702002', 5, 3, 2, 8598.00, 'SHIPPED', '2025-07-02 12:18:33', NULL);
INSERT INTO `orders` VALUES ('ORD20250702015', 10, 25, 1, 3499.00, 'PAID', '2025-07-02 17:55:06', NULL);
INSERT INTO `orders` VALUES ('ORD20250703003', 1, 2, 1, 2899.00, 'DELIVERED', '2025-07-03 15:22:17', NULL);
INSERT INTO `orders` VALUES ('ORD20250703016', 11, 29, 1, 2499.00, 'SHIPPED', '2025-07-03 14:06:44', NULL);
INSERT INTO `orders` VALUES ('ORD20250703026', 21, 7, 1, 4788.00, 'COMPLETED', '2025-07-03 12:25:18', NULL);
INSERT INTO `orders` VALUES ('ORD20250704017', 12, 22, 2, 2398.00, 'COMPLETED', '2025-07-04 11:08:48', NULL);
INSERT INTO `orders` VALUES ('ORD20250705004', 3, 5, 1, 3899.00, 'PAID', '2025-07-05 09:45:12', NULL);
INSERT INTO `orders` VALUES ('ORD20250705018', 13, 15, 1, 2999.00, 'COMPLETED', '2025-07-05 09:14:12', NULL);
INSERT INTO `orders` VALUES ('ORD20250705027', 22, 9, 1, 998.00, 'SHIPPED', '2025-07-05 14:35:29', NULL);
INSERT INTO `orders` VALUES ('ORD20250706005', 4, 8, 1, 1588.00, 'SHIPPED', '2025-07-06 16:22:01', NULL);
INSERT INTO `orders` VALUES ('ORD20250706011', 6, 11, 1, 8999.00, 'COMPLETED', '2025-07-06 09:31:11', NULL);
INSERT INTO `orders` VALUES ('ORD20250706019', 14, 18, 3, 1077.00, 'SHIPPED', '2025-07-06 17:23:59', NULL);
INSERT INTO `orders` VALUES ('ORD20250707012', 7, 15, 1, 2999.00, 'SHIPPED', '2025-07-07 14:50:07', NULL);
INSERT INTO `orders` VALUES ('ORD20250707020', 15, 21, 1, 6799.00, 'COMPLETED', '2025-07-07 10:39:00', NULL);
INSERT INTO `orders` VALUES ('ORD20250707028', 23, 11, 1, 8999.00, 'COMPLETED', '2025-07-07 11:14:00', NULL);
INSERT INTO `orders` VALUES ('ORD20250708006', 10, 10, 5, 495.00, 'COMPLETED', '2025-07-08 08:44:55', NULL);
INSERT INTO `orders` VALUES ('ORD20250708021', 16, 24, 6, 528.00, 'PAID', '2025-07-08 14:15:33', NULL);
INSERT INTO `orders` VALUES ('ORD20250708029', 24, 13, 1, 7999.00, 'PAID', '2025-07-08 17:33:11', NULL);
INSERT INTO `orders` VALUES ('ORD20250709007', 1, 7, 1, 4788.00, 'CREATED', '2025-07-09 11:30:22', NULL);
INSERT INTO `orders` VALUES ('ORD20250709013', 8, 19, 1, 2499.00, 'DELIVERED', '2025-07-09 11:12:33', NULL);
INSERT INTO `orders` VALUES ('ORD20250709022', 17, 27, 1, 2499.00, 'CREATED', '2025-07-09 11:21:14', NULL);
INSERT INTO `orders` VALUES ('ORD20250709030', 25, 16, 10, 80.00, 'CANCELLED', '2025-07-09 16:21:22', NULL);
INSERT INTO `orders` VALUES ('ORD20250710008', 2, 4, 3, 2397.00, 'COMPLETED', '2025-07-10 15:18:36', NULL);
INSERT INTO `orders` VALUES ('ORD20250710014', 9, 23, 1, 15999.00, 'CREATED', '2025-07-10 18:32:55', NULL);
INSERT INTO `orders` VALUES ('ORD20250710023', 18, 30, 10, 90.00, 'SHIPPED', '2025-07-10 17:03:55', NULL);
INSERT INTO `orders` VALUES ('ORD20250711009', 5, 6, 2, 2998.00, 'PAID', '2025-07-11 10:40:18', NULL);
INSERT INTO `orders` VALUES ('ORD20250711024', 19, 3, 1, 4299.00, 'DELIVERED', '2025-07-11 14:56:06', NULL);
INSERT INTO `orders` VALUES ('ORD20250712010', 3, 9, 1, 998.00, 'SHIPPED', '2025-07-12 11:22:47', NULL);
INSERT INTO `orders` VALUES ('ORD20250712025', 20, 5, 1, 3899.00, 'PAID', '2025-07-12 10:08:17', NULL);

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `cn_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '中文名称',
  `en_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '英文名称',
  `category` enum('ELECTRONIC','BEVERAGE') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '电子产品，酒水饮品',
  `brand_cn` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '品牌(中文)',
  `brand_en` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '品牌(英文)',
  `price` decimal(10, 2) NOT NULL,
  `stock` int NULL DEFAULT 10,
  `specs` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `release_date` date NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, 'iPhone 15 Pro', 'iPhone 15 Pro', 'ELECTRONIC', '苹果', 'Apple', 8999.00, 50, '512GB, 深空黑色, A17芯片', '2025-01-10');
INSERT INTO `products` VALUES (2, '茅台飞天53度', 'Moutai Feitian 53°', 'BEVERAGE', '茅台', 'Moutai', 2899.00, 30, '500ml, 酱香型', '2023-10-01');
INSERT INTO `products` VALUES (3, '华为MatePad Pro', 'Huawei MatePad Pro', 'ELECTRONIC', '华为', 'Huawei', 4299.00, 80, '256GB存储, 麒麟9000芯片', '2025-03-15');
INSERT INTO `products` VALUES (4, '奔富BIN389', 'Penfolds BIN389', 'BEVERAGE', '奔富', 'Penfolds', 799.00, 45, '赤霞珠混酿, 750ml', '2022-08-20');
INSERT INTO `products` VALUES (5, '索尼PS5游戏机', 'Sony PlayStation 5', 'ELECTRONIC', '索尼', 'Sony', 3899.00, 25, '光驱版, 825GB SSD', '2024-11-05');
INSERT INTO `products` VALUES (6, '五粮液普五', 'Wuliangye Premium', 'BEVERAGE', '五粮液', 'Wuliangye', 1499.00, 60, '52度, 500ml, 浓香型', '2024-05-01');
INSERT INTO `products` VALUES (7, '大疆Mini 3 Pro', 'DJI Mini 3 Pro', 'ELECTRONIC', '大疆', 'DJI', 4788.00, 35, '4800万像素, 34分钟续航', '2025-02-28');
INSERT INTO `products` VALUES (8, '皇家礼炮21年', 'Royal Salute 21 Years', 'BEVERAGE', '芝华士', 'Chivas', 1588.00, 20, '苏格兰威士忌, 700ml', '2020-12-15');
INSERT INTO `products` VALUES (9, 'Kindle Paperwhite', 'Kindle Paperwhite', 'ELECTRONIC', '亚马逊', 'Amazon', 998.00, 100, '6.8英寸电子墨水屏, IPX8防水', '2024-09-10');
INSERT INTO `products` VALUES (10, '长城干红解百纳', 'Great Wall Cabernet', 'BEVERAGE', '长城', 'Great Wall', 99.00, 200, '干红葡萄酒, 750ml', '2025-04-20');
INSERT INTO `products` VALUES (11, 'MacBook Air M3', 'MacBook Air M3', 'ELECTRONIC', '苹果', 'Apple', 8999.00, 40, '13英寸, M3芯片, 16GB内存', '2025-03-01');
INSERT INTO `products` VALUES (12, '泸州老窖特曲', 'Luzhou Laojiao Special', 'BEVERAGE', '泸州老窖', 'Luzhou', 498.00, 70, '52度, 500ml, 浓香型', '2024-01-15');
INSERT INTO `products` VALUES (13, '三星Galaxy S24', 'Samsung Galaxy S24', 'ELECTRONIC', '三星', 'Samsung', 7999.00, 35, '12GB+512GB, 2亿像素主摄', '2025-01-20');
INSERT INTO `products` VALUES (14, '张裕解百纳干红', 'Changyu Cabernet', 'BEVERAGE', '张裕', 'Changyu', 168.00, 150, '干红葡萄酒, 750ml', '2023-12-10');
INSERT INTO `products` VALUES (15, 'Apple Watch Series 9', 'Apple Watch Series 9', 'ELECTRONIC', '苹果', 'Apple', 2999.00, 60, '45mm, 心电图监测功能', '2024-09-15');
INSERT INTO `products` VALUES (16, '百威啤酒经典装', 'Budweiser Classic', 'BEVERAGE', '百威', 'Budweiser', 8.00, 500, '4.5%酒精度, 500ml', '2025-05-01');
INSERT INTO `products` VALUES (17, '小米14 Ultra', 'Xiaomi 14 Ultra', 'ELECTRONIC', '小米', 'Xiaomi', 5999.00, 45, '徕卡四摄, 骁龙8 Gen3', '2024-12-10');
INSERT INTO `products` VALUES (18, '杰克丹尼威士忌', 'Jack Daniels Whiskey', 'BEVERAGE', '杰克丹尼', 'Jack Daniels', 359.00, 40, '田纳西威士忌, 700ml', '2022-06-01');
INSERT INTO `products` VALUES (19, '索尼降噪耳机', 'Sony Noise Cancelling Headphones', 'ELECTRONIC', '索尼', 'Sony', 2499.00, 30, 'WH-1000XM5, 30小时续航', '2024-07-20');
INSERT INTO `products` VALUES (20, '青岛啤酒纯生', 'Tsingtao Draft Beer', 'BEVERAGE', '青岛', 'Tsingtao', 7.50, 600, '4.0%酒精度, 500ml', '2025-04-15');
INSERT INTO `products` VALUES (21, 'iPad Pro M2', 'iPad Pro M2', 'ELECTRONIC', '苹果', 'Apple', 6799.00, 25, '11英寸, M2芯片, 256GB', '2024-10-10');
INSERT INTO `products` VALUES (22, '剑南春珍藏级', 'Jiannanchun Reserve', 'BEVERAGE', '剑南春', 'Jiannanchun', 1199.00, 35, '52度, 500ml, 浓香型', '2023-11-20');
INSERT INTO `products` VALUES (23, '佳能EOS R6 Mark II', 'Canon EOS R6 Mark II', 'ELECTRONIC', '佳能', 'Canon', 15999.00, 15, '全画幅, 2420万像素', '2025-02-15');
INSERT INTO `products` VALUES (24, '长城干白葡萄酒', 'Great Wall Dry White', 'BEVERAGE', '长城', 'Great Wall', 88.00, 180, '霞多丽, 750ml', '2024-06-10');
INSERT INTO `products` VALUES (25, 'GoPro HERO12', 'GoPro HERO12', 'ELECTRONIC', 'GoPro', 'GoPro', 3499.00, 40, '5.3K视频, 10米防水', '2024-11-30');
INSERT INTO `products` VALUES (26, '芝华士12年', 'Chivas Regal 12 Years', 'BEVERAGE', '芝华士', 'Chivas', 299.00, 55, '苏格兰威士忌, 700ml', '2021-05-18');
INSERT INTO `products` VALUES (27, '任天堂Switch OLED', 'Nintendo Switch OLED', 'ELECTRONIC', '任天堂', 'Nintendo', 2499.00, 35, '7英寸OLED屏, 64GB', '2024-08-20');
INSERT INTO `products` VALUES (28, '拉菲传奇波尔多', 'Legende Bordeaux by Lafite', 'BEVERAGE', '拉菲', 'Lafite', 258.00, 65, '红葡萄酒, 750ml', '2023-09-01');
INSERT INTO `products` VALUES (29, 'Bose消噪耳机', 'Bose QuietComfort', 'ELECTRONIC', 'Bose', 'Bose', 2499.00, 30, 'QC系列, 24小时续航', '2025-01-05');
INSERT INTO `products` VALUES (30, '喜力啤酒', 'Heineken Lager', 'BEVERAGE', '喜力', 'Heineken', 9.00, 400, '5.0%酒精度, 500ml', '2025-05-20');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `cn_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '中文名',
  `en_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '英文名',
  `gender` enum('M','F','O') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'M' COMMENT 'M:男, F:女, O:其他',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `city_cn` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '中文城市',
  `city_en` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '英文城市',
  `reg_date` date NULL DEFAULT NULL,
  `vip_level` tinyint NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `phone`(`phone` ASC) USING BTREE,
  UNIQUE INDEX `email`(`email` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, '张伟', 'Zhang Wei', 'M', '13800138000', 'zhang@qq.com', '北京', 'Beijing', '2023-01-10', 3);
INSERT INTO `users` VALUES (2, '李娜', 'Li Na', 'F', '13911223344', 'lina@163.com', '上海', 'Shanghai', '2022-12-05', 5);
INSERT INTO `users` VALUES (3, '王雷', 'Wang Lei', 'M', '13555667788', 'wang@mail.com', '广州', 'Guangzhou', '2023-03-22', 1);
INSERT INTO `users` VALUES (4, '赵敏', 'Zhao Min', 'F', '13199887766', 'zhao@aliyun.com', '深圳', 'Shenzhen', '2023-05-15', 4);
INSERT INTO `users` VALUES (5, '陈航', 'Chen Hang', 'M', '13712345678', 'chen@qq.com', '杭州', 'Hangzhou', '2022-11-30', 2);
INSERT INTO `users` VALUES (6, '杨小雅', 'Yang Xiaoya', 'F', '13678901234', 'yang@outlook.com', '成都', 'Chengdu', '2023-07-18', 3);
INSERT INTO `users` VALUES (7, '刘宇', 'Liu Yu', 'M', '13900998877', 'liu@qq.com', '重庆', 'Chongqing', '2022-10-22', 4);
INSERT INTO `users` VALUES (8, '周婷', 'Zhou Ting', 'F', '13788002233', 'zhou@163.com', '南京', 'Nanjing', '2023-06-30', 2);
INSERT INTO `users` VALUES (9, '郑浩然', 'Zheng Haoran', 'M', '13512340000', 'zheng@mail.com', '武汉', 'Wuhan', '2023-02-14', 1);
INSERT INTO `users` VALUES (10, '吴小雨', 'Wu Xiaoyu', 'F', '13145678901', 'wu@aliyun.com', '西安', 'Xian', '2024-03-01', 0);
INSERT INTO `users` VALUES (11, '孙宇航', 'Sun Yuhang', 'M', '13987654321', 'sun@qq.com', '苏州', 'Suzhou', '2023-04-05', 3);
INSERT INTO `users` VALUES (12, '钱思思', 'Qian Sisi', 'F', '13711223344', 'qian@163.com', '宁波', 'Ningbo', '2022-08-20', 5);
INSERT INTO `users` VALUES (13, '冯建国', 'Feng Jianguo', 'M', '13544332211', 'feng@mail.com', '青岛', 'Qingdao', '2023-09-09', 2);
INSERT INTO `users` VALUES (14, '沈怡然', 'Shen Yiran', 'F', '13822334455', 'shen@outlook.com', '大连', 'Dalian', '2023-12-12', 1);
INSERT INTO `users` VALUES (15, '朱志强', 'Zhu Zhiqiang', 'M', '13900110022', 'zhu@aliyun.com', '厦门', 'Xiamen', '2022-07-15', 4);
INSERT INTO `users` VALUES (16, '林婉儿', 'Lin Waner', 'F', '13633445566', 'lin@qq.com', '福州', 'Fuzhou', '2024-01-01', 0);
INSERT INTO `users` VALUES (17, '郭明宇', 'Guo Mingyu', 'M', '13755667788', 'guo@163.com', '济南', 'Jinan', '2023-05-20', 3);
INSERT INTO `users` VALUES (18, '徐静', 'Xu Jing', 'F', '13977889900', 'xu@mail.com', '长沙', 'Changsha', '2023-08-08', 2);
INSERT INTO `users` VALUES (19, '高翔', 'Gao Xiang', 'M', '13800998877', 'gao@outlook.com', '郑州', 'Zhengzhou', '2022-09-10', 1);
INSERT INTO `users` VALUES (20, '胡梦瑶', 'Hu Mengyao', 'F', '13566778899', 'hu@aliyun.com', '合肥', 'Hefei', '2024-02-14', 0);
INSERT INTO `users` VALUES (21, '曹志文', 'Cao Zhiwen', 'M', '13611223344', 'cao@qq.com', '天津', 'Tianjin', '2022-06-30', 4);
INSERT INTO `users` VALUES (22, '何菲菲', 'He Feifei', 'F', '13722334455', 'he@163.com', '石家庄', 'Shijiazhuang', '2023-03-03', 3);
INSERT INTO `users` VALUES (23, '范小龙', 'Fan Xiaolong', 'M', '13933445566', 'fan@mail.com', '太原', 'Taiyuan', '2023-10-01', 2);
INSERT INTO `users` VALUES (24, '罗佳怡', 'Luo Jiayi', 'F', '13844556677', 'luo@outlook.com', '哈尔滨', 'Harbin', '2022-11-11', 5);
INSERT INTO `users` VALUES (25, '梁超', 'Liang Chao', 'M', '13555667789', 'liang@aliyun.com', '长春', 'Changchun', '2023-07-07', 0);
INSERT INTO `users` VALUES (26, '谢小婉', 'Xie Xiaowan', 'F', '13677889900', 'xie@qq.com', '沈阳', 'Shenyang', '2024-04-20', 1);
INSERT INTO `users` VALUES (27, '宋天宇', 'Song Tianyu', 'M', '13788990011', 'song@163.com', '昆明', 'Kunming', '2022-08-15', 3);
INSERT INTO `users` VALUES (28, '姜婷婷', 'Jiang Tingting', 'F', '13999221133', 'jiang@mail.com', '贵阳', 'Guiyang', '2023-01-25', 2);
INSERT INTO `users` VALUES (29, '董志勇', 'Dong Zhiyong', 'M', '13811667788', 'dong@outlook.com', '南宁', 'Nanning', '2022-10-10', 4);
INSERT INTO `users` VALUES (30, '欧阳雨欣', 'Ouyang Yuxin', 'F', '13522998877', 'ouyang@aliyun.com', '南昌', 'Nanchang', '2023-04-12', 0);

SET FOREIGN_KEY_CHECKS = 1;
