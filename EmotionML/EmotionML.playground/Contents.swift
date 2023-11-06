import Cocoa
import CreateML

// 1. 학습시킬 데이터 table, 학습시킨 데이터를 테스트할 table 생성하기
guard let trainDataFileURL = Bundle.main.url(forResource: "emotion_train_data", withExtension: "json"),
      let testDataFileURL = Bundle.main.url(forResource: "emotion_test_data", withExtension: "json") else {
    fatalError("Fail to load resource file url")
}

do {
    let trainDataTable = try MLDataTable(contentsOf: trainDataFileURL)
    let testDataTable = try MLDataTable(contentsOf: testDataFileURL)
    
    // 2. 만든 table로 MLTextClassifier 만들기
    let emotionClassifier = try MLTextClassifier.init(trainingData: trainDataTable,
                                                      textColumn: "detail",
                                                      labelColumn: "label")
    
    // 3. 만든 emotionClassifier를 test 데이터로 측정하기
    let evaluationMetrics = try emotionClassifier.evaluation(on: testDataTable,
                                                            textColumn: "detail",
                                                            labelColumn: "label")
    
    // 학습 정확도 (1.0 - 학습 에러 발생 확률) * 100 -> 백분율
    let trainingAccuracy = "\((1.0 - max(0.0, emotionClassifier.trainingMetrics.classificationError)) * 100)%"
    
    // 유효성 정확도 (1.0 - 유효성 에러 발생 확률) * 100 -> 백분율
    let validationAccuracy = "\((1.0 - max(0.0, emotionClassifier.validationMetrics.classificationError)) * 100)%"
    
    // 평가 결과 정확도
    let evaluationAccuracy = "\((1.0 - evaluationMetrics.classificationError) * 100)%"

    print("""
    - 학습 정확도: \(trainingAccuracy)
    - 유효성 정확도: \(validationAccuracy)
    - 평가 결과 정확도: \(evaluationAccuracy)
    """)

    // 원하는 경로에 MLModel 파일 저장하기
    let mlModelFilePathURL = URL(fileURLWithPath: "/Users/hyunkwansung/Documents/GitHub/EmotionDiary-CoreML/EmotionML/EmotionClassifier.mlmodel")
    
    let metadata = MLModelMetadata(author: "samSung",
                                     shortDescription: "this is emotion text classifier",
                                     version: "1.0")
    
    // 만든 emotionClassifier로 지정한 filePath에 metadata를 넣어서 모델 만들기 + 저장하기
    try emotionClassifier.write(to: mlModelFilePathURL,
                                metadata: metadata)
} catch {
    print(error.localizedDescription)
}

