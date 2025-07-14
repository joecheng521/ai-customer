package com.joe.aicustomer.config;

import lombok.AllArgsConstructor;
import org.springframework.ai.autoconfigure.vectorstore.redis.RedisVectorStoreAutoConfiguration;
import org.springframework.ai.autoconfigure.vectorstore.redis.RedisVectorStoreProperties;
import org.springframework.ai.embedding.EmbeddingModel;
import org.springframework.ai.vectorstore.VectorStore;
import org.springframework.ai.vectorstore.redis.RedisVectorStore;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.data.redis.connection.RedisConnectionFactory;

@EnableAutoConfiguration(exclude = {RedisVectorStoreAutoConfiguration.class})

@EnableConfigurationProperties({RedisVectorStoreProperties.class})
@AllArgsConstructor
public class RedisVectorConfig {
    /**
     * 创建RedisStack向量数据库
     *
     * @param embeddingModel 嵌⼊模型
     * @return vectorStore 向量数据库
     */
    @Bean
    public VectorStore vectorStore(
            RedisConnectionFactory redisConnectionFactory, // Spring自动注入
            EmbeddingModel embeddingModel
    ) {
        return new RedisVectorStore(
                RedisVectorStoreConfig.builder()
                        .withIndexName("my_vector_idx")
                        .build(),
                embeddingModel,
                redisConnectionFactory
        );
    }
}