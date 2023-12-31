# EmotionDiary-CoreML
#### 일기를 작성하면 어떤 하루를 보냈는지 감지하여 이모티콘으로 보여주는 토이 프로젝트
<br>

### 목적
---
머신을 직접 학습시키고 학습시킨 머신을 앱에 활용해보기
<br>
<br>


### 사용 기술
---
SwiftUI, CoreML (Text Classifier)
<br>
<br>

### 문제 해결 및 과정
---
#### 1. 머신을 학습시키기 위한 데이터를 하나하나 작성하면 시간이 많이 소비됨.
ChatGPT를 활용하여 JSON 형태의 데이터를 만들어서 학습 시켰다.
(참고 자료: https://developer.apple.com/documentation/naturallanguage/creating_a_text_classifier_model)
<br>
<br>

#### 2. Positive값과 Negative값의 정확도 퍼센테이지를 어떻게하면 받을 수 있을까?
Emotion 모델은 다음과 같이 정의해놓았다. <br>
![image](https://github.com/samusesapple/EmotionDiary-CoreML/assets/126672733/c4654b1b-5cc1-41cb-839e-acdfea18802b)
<br>

```NLModel().predictedLabel(for: String)``` 을 사용하면 더 높은 확률의 예측값 결과만 받을 수 있고, 각 케이스의 정확도 퍼센테이지는 알 수 없었다. 그러므로 (긍정, 부정) 두 가지 케이스 밖에 받을 수 없어 위에서 정의한 Emotion 모델의 5개 케이스를 모두 처리 할 수 없어 곤란했다. 

겹과값의 케이스가 'positive, negative' 총 2가지 케이스이기 때문에 ```NLModel().predictedLabelHypotheses(for: String, maximumCount: Int)``` 의 maximumCount의 아규먼트로 2를 넣어서 각 케이스의 정확률을 얻을 수 있었다.
<br>

![image](https://github.com/samusesapple/EmotionDiary-CoreML/assets/126672733/eb1569ad-45c3-4831-b6fd-e376354105e5)
![image](https://github.com/samusesapple/EmotionDiary-CoreML/assets/126672733/3399e6c2-00e0-448a-a665-2fbee53e630d)
<br>
<br>

### 구현 화면
---
![Simulator Screen Recording - iPhone 15 Pro - 2023-11-13 at 16 34 13](https://github.com/samusesapple/EmotionDiary-CoreML/assets/126672733/84201270-df34-48dd-a0b9-19b7e88e2e24)
![Simulator Screen Recording - iPhone 15 Pro - 2023-11-13 at 16 36 01](https://github.com/samusesapple/EmotionDiary-CoreML/assets/126672733/2926a1dc-d591-404c-b36b-7128ab484167)


