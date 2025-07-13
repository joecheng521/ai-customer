package com.joe.aicustomer.logs;


import org.jetbrains.annotations.NotNull;
import org.springframework.ai.chat.client.advisor.api.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.ai.chat.model.MessageAggregator;
import reactor.core.publisher.Flux;

/**
 * @author JOE
 */
@Slf4j
public class AILoggerAdvisor implements CallAroundAdvisor, StreamAroundAdvisor {
    @NotNull
    @Override
    public String getName() {
        return "AILoggerAdvisor";
    }

    @Override
    public int getOrder() {
        return 0;
    }


    @NotNull
    @Override
    public AdvisedResponse aroundCall(AdvisedRequest request, CallAroundAdvisorChain chain) {
        log.info("[Request] User: {}", request.userText());
        AdvisedResponse response = chain.nextAroundCall(request);
        String aiResponse = response.response().getResult().getOutput().toString();
        log.info("[Response] AI: {}", aiResponse);
        return response;
    }


    @NotNull
    @Override
    public Flux<AdvisedResponse> aroundStream(AdvisedRequest request, StreamAroundAdvisorChain chain) {
        log.info("[Request-Stream] User: {}", request.userText());
        return new MessageAggregator().aggregateAdvisedResponse(
                chain.nextAroundStream(request),
                aggregatedResponse -> {
                    String fullContent = aggregatedResponse.response().getResult().getOutput().toString();
                    log.info("[Response-Stream] AI: {}", fullContent);
                }
        );
    }
}
