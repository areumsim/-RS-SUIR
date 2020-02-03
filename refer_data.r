# 0. 환경설정 ------------------------------
library(readr)
library(recommenderlab) # devtools::install_github("mhahsler/recommenderlab")
library(tidyverse)
library(stringr)
library(purrr)
library(ggthemes)
library(extrafont)

# 1. 데이터 가져오기 -----------------------
rating_df <- read.csv("C:/Users/haji/Desktop/ratingDB/SUIR/ratings_small.csv", header = T)
rating_df <- rating_df %>% 
  select(-timestamp) %>% 
  mutate(userId = str_c("u", userId), movieId = str_c("m", movieId))

movie_df <- read_csv("C:/Users/haji/Desktop/ratingDB/SUIR/movies.csv")
movie_df <- movie_df %>% 
  mutate(movieId = str_c("m", movieId))


# 2. 데이터 전처리 -------------------------
# 데이터프레임 -> 행렬 -> 희소행렬(realRatingMatrix)
rating_mat <- spread(rating_df, movieId, rating) %>% 
  remove_rownames() %>% 
  column_to_rownames(var="userId")

rating_rrm <- as(as(rating_mat, "matrix"), "realRatingMatrix")


# 3. 탐색적 데이터 분석 -------------------
## 3.1. 평점 전체적 분포 ------------------
rating_df %>% dplyr::count(rating) %>% 
  ggplot(data=., aes(x=as.factor(rating), y=n)) +
  geom_bar(stat="identity") +
  labs(x="평점", y="평점빈도수") +
  scale_y_continuous(labels = scales::comma)

## 3.2. 가장 평가가 많이 된 상위 30개 영화 ------------------
rating_df %>% dplyr::count(movieId, sort=TRUE) %>% 
  left_join(movie_df) %>% 
  top_n(30, n) %>% 
  DT::datatable()

## 3.2. 평점이 높은 상위 30개 영화 ------------
movie_top30_df <- rating_df %>% dplyr::count(movieId, sort=TRUE) %>% 
  left_join(movie_df) %>% 
  top_n(30, n)

rating_df %>% group_by(movieId) %>% 
  summarise(rating_avg = mean(rating)) %>% 
  right_join(movie_top30_df) %>% 
  arrange(desc(rating_avg)) %>% 
  DT::datatable()


# 4. 데이터 전처리 -------------------
## 4.1. 데이터 크기 비교
#결측값을 잘 정리하는 것과 함께 추천시스템 개발을 위해서 
#평점이 들어있는 행렬이 희소하기 때문에, 협업 필터링 추천모형에 적용될
#데이터를 생성시키기 위해 관련성 높은 데이터만 추려낼 필요가 있다.
#이를 위해 적어도 영화당 100명 이상 본 영화, 
#영화당 최소 200명이상 평점을 받은 영화를 기준으로 추천모형 개발에 준비할 데이터로 한정
rating_rrm <- rating_rrm[rowCounts(rating_rrm) > 100,
                         colCounts(rating_rrm) > 200]

# 데이터 크기 비교
print(object.size(rating_mat), units = "auto")
print(object.size(rating_rrm), units = "auto" )


# 5. 상위 유저 분석 -------------------
#상위 10%만 뽑아서 image 함수로 시각화를 하고
# normalize 함수를 통해 정규화를 통해 시각적으로 특정한 패턴을 발견할수 있는지 살펴본다.

# 상위 10 %만 탐색적 분석
min_movies <- quantile(rowCounts(rating_rrm), 0.90)
min_users <- quantile(colCounts(rating_rrm), 0.90)

# 정규화
rating_rrm_norm <- normalize(rating_rrm)

# 시각화
image(rating_rrm_norm[rowCounts(rating_rrm_norm) > min_movies,
                      colCounts(rating_rrm_norm) > min_users], main = "상위 10% 영화와 사용자 열지도(heatmap)")



