# [RS] SUIR
# Title : Unifying user-based and item-based collaborative filtering approaches by similarity fusion

[SUIR paper](https://www.researchgate.net/publication/221299518_Unifying_user-based_and_item-based_collaborative_filtering_approaches_by_similarity_fusion)

<!---------------------------------->
<br>
<br>

<font size = 5> Title: Unifying user-based and item-based collaborative filtering approaches by similarity fusion <br> 
Authors: Jun Wang, Arjen P. de Vries, Marcel J.T. Reinders1 <br>
Year: 2006  <br>
Journal: SIGIR(Special Interest Group on Information Retrieval) </font>
</div>

## Topic
+ Recommendation System, (collaborative filtering)

<br>

## Probelms
+ Data가 부족한 환경에서 예측 정확도가 낮다. 예측에 이용 할 유사 항목의 부재

<br>

## Motivation
+ 유사 사용자와 유사 아이템을 결합하여 ‘not-so-similar’ 에 대해 예측

<br>

## Proposed method
+ SUIR(Similar User Item ratings) : 유사한 사용자의 유사한 항목에 대한 known ratings

  SUIR = SUIRk,m = {xa,b | ua∈Su(uk) , ib∈Si(im), a≠k, b≠m}.
  ![image](https://user-images.githubusercontent.com/31869418/73611848-9ecc1600-4629-11ea-90ac-b3778325a2c4.png)
  
  ![image](https://user-images.githubusercontent.com/31869418/73611850-a12e7000-4629-11ea-90a6-2e9a2511d7bd.png)  

+ SUR(similar user ratings) ∝ 유사한 사용자의 

SIR(similar item ratings) ∝ 사용자 k의 유사 항목에 대한 known ratings

λ : SUR과 SIR 를 interpolation (0…1, 0:SIR에 종속, 1:SIR에 종속)

δ : SUIR과 SUR·SIR를 interpolation (0…1, 0: SUR·SIR에 종속, 1:SUIR에 종속)


<br>

## Experiments
+ Data Set : MovieLens(movielens.umn.edu), #user : 943, #movie : 1682, #ratings : 100,000 (ratings : 1-5)

각 사용자는 최소 20 개의 영화를 평가 

평가 지표 ： 평균 절대 오차 (MAE) 

![image](https://user-images.githubusercontent.com/31869418/73611855-b6a39a00-4629-11ea-8fde-1c7434962649.png)



<br>

## Conclusion
데이터 밀도가 낮은 경우 유사한 사용자 혹은 유사한 항목만으로 평가하는 것은 예측 성능이 낮다. 

이를 보안하기 위하여 유사한 사용자의 유사한 항목을 결합하여 평가를 예측하기 위한 방식을 제안하고 성능이 향상되는 것을 확인했다. 

본 논문에서 제시한 방식은 특히 희소한 데이터만 이용할 수 있는 경우에 추천 시스템의 품질을 개선하는데 효과적이다.

<br>

## References
+ 

<br>





<br>
