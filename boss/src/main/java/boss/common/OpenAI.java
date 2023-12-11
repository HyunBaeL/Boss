package boss.common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.common.primitives.Floats;
import com.theokanning.openai.completion.chat.ChatCompletionChunk;
import com.theokanning.openai.completion.chat.ChatCompletionRequest;
import com.theokanning.openai.completion.chat.ChatMessage;
import com.theokanning.openai.embedding.EmbeddingRequest;
import com.theokanning.openai.service.OpenAiService;

import io.reactivex.Flowable;
import io.reactivex.functions.Consumer;
import io.reactivex.schedulers.Schedulers;

public class OpenAI {
	//openAI API key
	private String API_KEY = "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";
	private OpenAiService service;
	private int maxToken = 512;
	private List<ChatMessage> messages;

	public OpenAI() {
		service = new OpenAiService(API_KEY);
//		messages = new ArrayList<ChatMessage>();
	}
	
	public String getRespByTxt(String prompt, String model) {
		System.out.println("user ask:"+prompt);
		ChatMessage msg = new ChatMessage("user", prompt);
		messages = new ArrayList<ChatMessage>();
		messages.add(msg);

		ChatCompletionRequest chatCompletionRequest = ChatCompletionRequest.builder()
				.messages(messages)
		        .model(model)
		        .maxTokens(maxToken)
		        .n(1)
		        .topP(1.0)
		        .stream(false)
		        .build();

		String answer = service.createChatCompletion(chatCompletionRequest).getChoices().get(0).getMessage().getContent();		
		System.out.println("AI ans:"+answer);
		
		return answer;
	}
	
	//embeddingRequest로 text를 숫자로 바꿈 
	public List<Double> getEmbedding(String text) {
		List<Double> res;
		
		List<String> in = new ArrayList<String>();
		in.add(text);
		String model = "text-embedding-ada-002";
		EmbeddingRequest embeddingRequest = EmbeddingRequest.builder()
				.input(in)
				.model(model)
				.build();
		
		res = service.createEmbeddings(embeddingRequest).getData().get(0).getEmbedding();
		
		return res;
	}
}