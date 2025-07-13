package com.joe.aicustomer;

import org.springframework.core.io.Resource;
import org.springframework.ai.chat.memory.ChatMemory;
import org.springframework.ai.chat.memory.InMemoryChatMemory;
import org.springframework.ai.embedding.EmbeddingModel;
import org.springframework.ai.reader.TextReader;
import org.springframework.ai.transformer.splitter.TokenTextSplitter;
import org.springframework.ai.vectorstore.SimpleVectorStore;
import org.springframework.ai.vectorstore.VectorStore;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

/**
 * @author JOE
 */

@SpringBootApplication
public class AiCustomerApplication {
    @Value("classpath:rag/joe-mall.txt")
    Resource resource;
    public static void main(String[] args) {
        SpringApplication.run(AiCustomerApplication.class, args);
    }

    @Bean
    public ChatMemory chatMemory() {
        return new InMemoryChatMemory();
    }

    @Bean
    public VectorStore vectorStore(EmbeddingModel embeddingModel) {
        return SimpleVectorStore.builder(embeddingModel).build();
    }


    @Bean
    CommandLineRunner ingestTermOfServiceToVectorStore(VectorStore vectorStore) {
        return args -> vectorStore.write(new TokenTextSplitter().transform(new TextReader(resource).read()));
    }
}
