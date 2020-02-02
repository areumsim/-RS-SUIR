# [RS] SUIR
# Title : Unifying user-based and item-based collaborative filtering approaches by similarity fusion

<br>

    + Title: Unifying user-based and item-based collaborative filtering approaches by similarity fusion <br> 
    + Authors: Jun Wang, Arjen P. de Vries, Marcel J.T. Reinders1 <br>
    + Year: 2006  <br>
    + Journal: SIGIR(Special Interest Group on Information Retrieval) 
    [SUIR_paper](https://www.researchgate.net/publication/221299518_Unifying_user-based_and_item-based_collaborative_filtering_approaches_by_similarity_fusion)

</div>

## Topic
+ Recommendation System, (collaborative filtering) <br>

<br>

## Probelms
+ Data가 부족한 환경에서 예측 정확도가 낮다. 예측에 이용 할 유사 항목의 부재 <br>

<br>

## Motivation
+ 유사 사용자와 유사 아이템을 결합하여 ‘not-so-similar’ 에 대해 예측 

<br>

## Proposed method
+ SUIR(Similar User Item ratings) : 유사한 사용자의 유사한 항목에 대한 known ratings <br>
SUIR = SUIRk,m = {xa,b | ua∈Su(uk) , ib∈Si(im), a≠k, b≠m}. <br>
  ![image](https://user-images.githubusercontent.com/31869418/73611848-9ecc1600-4629-11ea-90ac-b3778325a2c4.png) <br>
  ![image](https://user-images.githubusercontent.com/31869418/73611850-a12e7000-4629-11ea-90a6-2e9a2511d7bd.png)   <br>

+ SUR(similar user ratings) ∝ 유사한 사용자의  <br>
SIR(similar item ratings) ∝ 사용자 k의 유사 항목에 대한 known ratings <br>
λ : SUR과 SIR 를 interpolation (0…1, 0:SIR에 종속, 1:SIR에 종속) <br>
δ : SUIR과 SUR·SIR를 interpolation (0…1, 0: SUR·SIR에 종속, 1:SUIR에 종속) <br>

<br>

## Experiments
+ Data Set : MovieLens(movielens.umn.edu), #user : 943, #movie : 1682, #ratings : 100,000 (ratings : 1-5) <br>
각 사용자는 최소 20 개의 영화를 평가  <br>
평가 지표 ： 평균 절대 오차 (MAE)  <br>
![image](https://user-images.githubusercontent.com/31869418/73611855-b6a39a00-4629-11ea-8fde-1c7434962649.png) <br>



<br>

## Conclusion
데이터 밀도가 낮은 경우 유사한 사용자 혹은 유사한 항목만으로 평가하는 것은 예측 성능이 낮다.  <br>
이를 보안하기 위하여 유사한 사용자의 유사한 항목을 결합하여 평가를 예측하기 위한 방식을 제안하고 성능이 향상되는 것을 확인했다.  <br>
본 논문에서 제시한 방식은 특히 희소한 데이터만 이용할 수 있는 경우에 추천 시스템의 품질을 개선하는데 효과적이다. <br>

<br>

## References
+ 

<br>





<br>
