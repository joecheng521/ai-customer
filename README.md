
# 项目概述

该项目是一个基于 Spring Boot 的 Java 应用程序，用于开发 AI 智能商城客服系统。项目的名称为 `ai-customer`，由 `com.joe` 组织开发。

## 基本信息
- **项目版本**：1.0.0
- **Java 版本要求**：21
- **编码方式**：UTF-8

## 父项目依赖
- **Spring Boot Parent**：
  - GroupId: `org.springframework.boot`
  - ArtifactId: `spring-boot-starter-parent`
  - 版本: `3.5.3`

## 项目属性
- Java 编译版本：21
- Maven 源代码和目标代码版本：21
- Spring AI 版本：`1.0.0-M6`

## 依赖项 (Dependencies)

| 依赖库 | 功能描述 |
|--------|----------|
| `spring-boot-starter-web` | 提供 Web 开发支持（如嵌入式 Tomcat、Spring MVC） |
| `mybatis-spring-boot-starter`（版本 `3.0.4`） | MyBatis 集成 Spring Boot，用于数据库操作 |
| `mysql-connector-j`（版本 `8.0.33`） | MySQL 数据库驱动 |
| `lombok`（可选） | 自动化生成 Java Bean 方法（getter/setter/toString 等） |
| `spring-boot-starter-validation` | 提供数据校验支持（如 JSR-380 注解） |
| `spring-ai-alibaba-starter`（版本 `1.0.0-M6.1`） | 阿里云 Spring AI 集成模块 |

### 依赖管理 (Dependency Management)
- **Spring AI BOM**：
  - GroupId: `org.springframework.ai`
  - ArtifactId: `spring-ai-bom`
  - 版本: `${spring-ai.version}` (`1.0.0-M6`)
  - 类型: `pom`
  - 作用域: `import`

## 构建配置 (Build)
### 插件
- 使用了 `spring-boot-maven-plugin` 来支持 Spring Boot 项目的构建与打包。

### 资源过滤
- 包含以下资源文件并启用过滤：
  - `**/*.xml`
  - `**/*.properties`
  - `**/*.txt`

---

这个文档可以作为项目初期的 README 或者配置参考使用，帮助团队快速了解项目的结构和依赖关系。
