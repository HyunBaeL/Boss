package boss.common;

import java.text.MessageFormat;

import com.google.common.primitives.Floats;

import io.pinecone.PineconeClient;
import io.pinecone.PineconeClientConfig;
import io.pinecone.PineconeConnection;
import io.pinecone.PineconeConnectionConfig;
import io.pinecone.proto.DeleteRequest;
import io.pinecone.proto.DeleteResponse;
import io.pinecone.proto.QueryRequest;
import io.pinecone.proto.QueryResponse;
import io.pinecone.proto.UpsertRequest;
import io.pinecone.proto.UpsertResponse;
import io.pinecone.proto.Vector;

//pinecone APIkey (pinecone :vector를 관리하는 db)
public class Pinecone {
	private static Pinecone instance = null;
	private String indexId = "hhenyy";
	private String projectId = "zkapdvp";
	private String host = "gcp-starter";
	private String API_KEY = "2cbe5eb8-dfa2-4080-b1c3-e4d7aadbc6e5";
	private String pineconeURL = "";
	private PineconeClient dataPlaneClient;
	private PineconeConnectionConfig connectionConfig;
	private PineconeClientConfig clientConfig;
	
	public static Pinecone getInstance() {
		if(instance == null) {
			instance = new Pinecone();
		}

		return instance;
	}
	
	//private Pinecone() 메서드는 클래스의 생성자로, 클래스의 인스턴스를 생성할 때 호출됨. 
	//생성자는 private로 선언되어 있으므로 외부에서 직접 호출할 수 없고, 클래스 내부에서만 호출될 수 있음
	//Pinecone 생정자가 호출되면
	private Pinecone() {
		//MessageFormat.format() 메서드를 사용하여 Pinecone 서비스의 엔드포인트 URL을 형식화한 결과물을 저장
		//{0}과 {1}자리에 이후에 오는 indexId와 projectId로 대체하여 pineconeURL에 저장
		pineconeURL = MessageFormat.format("https://{0}-{1}.svc.environment.pinecone.io", indexId, projectId);
		//PineconeClientConfig 및 PineconeConnectionConfig 클래스의 인스턴스를 생성하고, 
		//여러 메서드를 사용하여 API 키, 환경, 프로젝트 이름, 인덱스 이름 등을 설정
		clientConfig = new PineconeClientConfig()
                .withApiKey(API_KEY)
                .withEnvironment(host)
                .withProjectName(projectId);
        connectionConfig = new PineconeConnectionConfig()
                .withIndexName(indexId);

        //dataPlaneClient 변수는 PineconeClient 클래스의 인스턴스를 초기화한 결과물을 저장
        dataPlaneClient = new PineconeClient(clientConfig);
	}
	
	//pinecone에 숫자로 바뀐 임베딩을 넣음 
	//upsert의 parameter로 upsertData로 임베딩된 숫자가 들어옴 ,productId는 pid를 받음
	public void upsert(float[] upsertData, int productId) {
		// upsert
		PineconeConnection conn = dataPlaneClient.connect(connectionConfig);
        String upsertId = String.valueOf(productId);
        
        Vector upsertVector = Vector.newBuilder()
                .setId(upsertId)
                .addAllValues(Floats.asList(upsertData))
                .build();

        UpsertRequest request = UpsertRequest.newBuilder()
                .addVectors(upsertVector)
                .build();

        UpsertResponse upsertResponse = conn.getBlockingStub().upsert(request);	
        System.out.println("uid " + upsertId +" Put " + upsertResponse.getUpsertedCount() + " vectors into the index");
	}
	
	public void delete(int productId) {
		// upsert
		PineconeConnection conn = dataPlaneClient.connect(connectionConfig);
        String vectorId = String.valueOf(productId);
        
        DeleteRequest request = DeleteRequest.newBuilder()
        		.addIds(vectorId)
        		.build();

        try {
	        DeleteResponse deleteResponse = conn.getBlockingStub().delete(request);
	        System.out.println("vectorId " + vectorId +" deleted");
        } catch(Exception e) {
        	System.out.println("vectorId " + vectorId +" deleted fail");
        }
	}
	
	//임베딩두개로 코사인시밀러리티(벡터내적과비슷한것) 구하면 0~1사이의 값이 나오고 이게 높을수록 유사한것
	//저장된 상품 정보를 embedding하여 vector DB에 저장해두고 유저가 질문한 내용을 embedding하여 
	//vector DB에 query를 하면 두 개의 embedding으로 유사도를 구하게 되고 이때 코사인유사도 값이 0.8이상이면 해당 상품추천 
	//여기서 임베딩구할때 오픈ai API씀 
	public int query(float[] queryData, int topK) {
		PineconeConnection conn = dataPlaneClient.connect(connectionConfig);

        QueryRequest queryRequest = QueryRequest
                .newBuilder()
                .addAllVector(Floats.asList(queryData))
                .setTopK(topK)
                .build();

        System.out.println("Sending query request:");
        System.out.println(queryRequest);

        QueryResponse queryResponse = conn.getBlockingStub().query(queryRequest);

        System.out.println("Got query response:");
        System.out.println(queryResponse);
        
        String res = queryResponse.getMatches(0).getId() + "," + String.valueOf(queryResponse.getMatches(0).getScore());
        
        int productId = Integer.valueOf(res.split(",")[0]);
		float score = Float.valueOf(res.split(",")[1]);
		if(score < 0.8)
			productId = -1;
        
        return productId;
	}
}