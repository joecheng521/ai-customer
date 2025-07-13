package com.joe.aicustomer.controller;


import com.joe.aicustomer.logs.AILoggerAdvisor;
import com.joe.aicustomer.tools.OrderFunctionTools;
import com.joe.aicustomer.tools.ProductFunctionTools;
import com.joe.aicustomer.tools.UserFunctionTools;
import org.springframework.ai.chat.client.ChatClient;
import org.springframework.ai.chat.client.advisor.AbstractChatMemoryAdvisor;
import org.springframework.ai.chat.client.advisor.PromptChatMemoryAdvisor;
import org.springframework.ai.chat.client.advisor.QuestionAnswerAdvisor;
import org.springframework.ai.chat.memory.ChatMemory;
import org.springframework.ai.tool.ToolCallbackProvider;
import org.springframework.ai.vectorstore.SearchRequest;
import org.springframework.ai.vectorstore.VectorStore;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import reactor.core.publisher.Flux;

import java.time.LocalDate;

/**
 * @author JOE
 */
@RestController
@CrossOrigin
public class OpenAiController {

    private final ChatClient chatClient;

    public OpenAiController(ChatClient.Builder chatClientBuilder, ChatMemory chatMemory, VectorStore vectorStore, OrderFunctionTools o, UserFunctionTools u, ProductFunctionTools p) {
        this.chatClient = chatClientBuilder.defaultSystem(
                        """
                                您是“小乔”商城的客户聊天助理。请以友好、乐于助人且愉快的方式来回复。
                                您正在通过在线聊天系统与客户互动。
                                在提供有关商城订单的信息之前，您必须始终
                                从用户处获取以下信息：订单号/用户号/商品信息编号。
                                在询问用户之前，请检查消息历史记录以获取此信息。
                                在更改订单或者取消订单状态之前，请先获取预订信息并且用户确定之后才进行更改或取消。
                                请讲中文。
                                今天的日期是 {current_date}.
                                """
                ).defaultAdvisors(
                        new PromptChatMemoryAdvisor(chatMemory),
                        new AILoggerAdvisor(),
                        new QuestionAnswerAdvisor(vectorStore, SearchRequest.builder().build())
                ).defaultTools(o, u, p)
                .build();
    }

    @CrossOrigin
    @GetMapping(value = "/ai/chat", produces = MediaType.TEXT_EVENT_STREAM_VALUE)
    public Flux<String> chat(@RequestParam(value = "message") String message) {
        Flux<String> content = this.chatClient.prompt()
                .user(message)
                .system(promptSystemSpec -> promptSystemSpec.param("current_date", LocalDate.now().toString()))
                .advisors(advisorSpec -> advisorSpec.param(AbstractChatMemoryAdvisor.CHAT_MEMORY_RETRIEVE_SIZE_KEY, 100))
                .stream()
                .content();
        return content.concatWith(Flux.just("[complete]"));
    }


}
