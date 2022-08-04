# 노션 개발일지 https://www.notion.so/930eafeafb9f49168abbc56b44130f49?v=b3ffc7f7ce0045ed95122c0f780f67a9


## 라이징 테스트-번개장터

## 1일차(7/16)
### 1주차 기획서 작성
### 번개톡 화면
### 로그인 화면

## 2일차(7/17)
### 이미지리소스, 런치스크린, 앱아이콘 추가

## 3일차(7/18)
### ImageSlideshow 라이브러리를 이용한 홈화면 배너(ImageSlideshow, Tabman 라이브러리 추가)
### 홈화면 80퍼센트 완료(스크롤시 상단 탭맨 고정시켜야함)
### searchViewController UI 진행중

#### 이미지 슬라이드 라벨페이지 안나타는 오류
#### 해결: 이미지 추가를 맨마지막에 하니깐 됐다
<pre>
<code>
    private func updateImageSlide() {
//        myImageSlide.setImageInputs(imageResources) - 순서를 마지막으로 해야 labelPage가 보인다.
        myImageSlide.contentScaleMode = .scaleAspectFill
        // 배너 자동 넘김
        myImageSlide.slideshowInterval = 3
        // 1/8 숫자 형식으로 페이지
        let labelPageIndicator = LabelPageIndicator() // 2/10
        labelPageIndicator.textColor = .white
        myImageSlide.pageIndicatorPosition = PageIndicatorPosition(horizontal: .right(padding: 20), vertical: .customBottom(padding: 30))
        myImageSlide.pageIndicator = labelPageIndicator
        myImageSlide.setImageInputs(imageResources)

    }
</pre>
</code>

## 4일차(7/19)
### searchViewController UI 진행완료
### RegistrationViewController UI 진행중
### MyInfoViewController UI 진행중
### 로그인 API 진행중

## 5일차(7/20)
### RegistrationViewController UI 진행완료
### MyInfoViewController UI 진행완료
### Login half modal 추가
### recommededProduct API 추가

#### 화면 이동 실패 
#### 해결: 스토리보드 이름을 추가하니깐 됐다

<pre>
<code>
@objc func presentModalController() {
//        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "MyInfoLoginViewController")
//                as? MyInfoLoginViewController else { print("test"); return }
//            self.present(nextVC, animated: true, completion: nil)
        
                let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                let mainViewController = storyboard.instantiateViewController(identifier: "MyInfoLoginViewController")
                mainViewController.modalPresentationStyle = .fullScreen
                self.present(mainViewController, animated: true, completion: nil)
    }
</pre>
</code>

#### API 이미지 가져오기 실패
#### Thread 1: Fatal error: 'try!' expression unexpectedly raised an error: Error Domain=NSCocoaErrorDomain Code=256 "The file “img.png” couldn’t be opened." UserInfo={NSURL=https://bungaejangteo.shop/static/img/img.png}
#### 해결중

<pre>
<code>
        let row = self.apiData[indexPath.row]

        let url:URL! = URL(string: row.imageUrl)
        
        let imageData = try! Data(contentsOf: url)
        
        cell.thumbnailImageView.image = UIImage(data: imageData)
</pre>
</code>


## 6일차(7/21)
### 로그인-본인인증(문자인증) API(POST,GET) 연결
### textField에 있는 값을 POST 요청하는 부분이 어려웠다

## 7일차(7/22)
### 상점 이름 설정 API(POST)

## 8일차(7/23)
### 홈 - 추천 브랜드 조회 API(GET) 브랜드 카테고리 별 상품 갯수가 다름. ()
### 검색 - 최근 검색어/요즘 많이 찾는 검색어 조회 API(GET) 연결
### 검색 - 추천브랜드 조회 API(GET) 연결

<pre>
<code>
post 방식으로 상점 닉네임을 지정은 할때 포스트맨에선 한글, 영어 상관없이 닉네임을 설정해도 잘됐는데 xcode textfield에선 한글로 치면 URL is not valid 이런 오류가 뜨고 영어로 치면 또 닉네임 설정이 잘되는 오류 ( URL encoding 함수 addingPercentEncoding를 이용해서 해결)
</pre>
</code>


## 9일차(7/24)
### 전체메뉴 UI 구현
### 전체메뉴 - 브랜드 리스트 조회/정렬 API(GET) 연결 (정렬은 다시 구현)
### 상점 수정 UI 구현
### 상점 수정 전 상점 정보 가져오는 API(GET) 연결

## 10일차(7/25)
### 상품 상세화면 UI 구현
### 상품 상세화면  API(GET) 연결

## 11일차(7/26)
### 상품 상세화면 컬렉션뷰 구현
### 내 상품(판매중,판매완료,예약중) API(GET) 연결

## 12일차(7/27)
### 팔로우, 팔로워 API(GET) 연결
### 계정설정 전 계정정보 API(GET)
### 찜 API(GET) 연결
### 내가 팔로우한 브랜드 조회  API(GET) 연결

## 13일차(7/28)
### 상품 신고 API(POST) 연결
### 상점 정보 수정 API(PATCH) 연결
### 마이페이지 정보 API(GET) 연결
### 번개톡,상품 상세화면 - 파워쇼핑 더미데이터 

# 사용한 API
## 총 24개 (UI 미구현 1개)
<img width="261" alt="스크린샷 2022-07-29 오후 2 44 21" src="https://user-images.githubusercontent.com/87438680/181690924-d424689b-4b92-406d-9588-1c73978b7c93.png">
