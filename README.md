# Re:cord

### ⭐️ 서비스 이름과 소개 

| 서비스명   | 서비스 소개
| -------- | :-----: | 
| Re:cord  | 쉽게 지나치고 사라지는 나의 인간관계를 의미 있게 바꿔주는 인간 관계 아카이빙 서비스 |

</br>

### 🙏 iOS-Developers

| 황찬미 | 김정은 | 정윤선(윤선아왜아래에있어?ㅋㅋ)  | 김민서  |
| ----------------- | :-----: | ----- | ------ |
| <img src="https://user-images.githubusercontent.com/86944161/202859276-ba1f6402-c4ac-4a92-8342-36ee9d53564c.png" width="200">|<img src="https://user-images.githubusercontent.com/86944161/202859310-d45b1fba-e607-4e5d-b39f-569b9bfabef6.png" width="200">|<img src="https://user-images.githubusercontent.com/86944161/202859421-ea9e5728-85fc-4249-a60d-62490183091c.png" width="200">|<img src="https://user-images.githubusercontent.com/86944161/202859384-ea5527fc-6841-43f4-84ea-978fd277a97b.png" width="200">

</br>

### ✨ 역할 분배

| 담당 뷰      | 담당자 |   구현 기능 설명   |
| -------------  | :---: | ----- |
| API 연결   | `황찬미` | 서비스의 전반적인 플로우를 담당하고, 서버 통신 연결  |
| Main          | `김정은` | 우선순위에 따른 유저들의 목록을 보여 주는 메인뷰 구현|
| Splash, Onboarding, Detail, DetailDropDown           | `정윤선` | 스플래쉬, 온보딩 뷰와 유저의 디테일 확인뷰 구현 |
| Create, Edit        | `김민서` | 유저에 대한 생성뷰와 수정뷰 구현 |

</br>

### ☁️ Code convention

[StyleShare/swift-style-guide](https://github.com/StyleShare/swift-style-guide) 를 기본으로 따르고 필요에 따라 추가합니다.

</br>

### 🗂 Foldering

<img width="226" alt="image" src="https://user-images.githubusercontent.com/86944161/202860215-518234d6-71e1-4333-abe0-468dcc14d334.png">

</br>

### 🍎 UI 구조 스케치

| 담당 뷰      | 담당자 |   UI 구조 스케치   |
| -------------  | :---: | ----- |
| API 연결   | `황찬미` | 서비스의 전반적인 플로우를 담당하고, 서버 통신 연결  |
| Main          | `김정은` | 섹션별로 다른 데이터를 컬렉션뷰로 구현 |
| Splash, Onboarding, Detail, DetailDropDown           | `정윤선` | 뷰간의 데이터 전달, 버튼 클릭시 선택된 데이터 비활성화 |
| Create, Edit        | `김민서` | 유저에 대한 정보 데이터 전달, 편집 |

</br>

### 🍞 화면 전환 플로우

<img width="489" alt="KakaoTalk_Image_2022-11-20-02-24-07" src="https://user-images.githubusercontent.com/86944161/202863595-c0866fb3-0fa4-4405-b451-fa04a89c053a.png">

</br>

### 🥹 구현 시 가장 어려웠던 부분과 해결 방법

* 뷰 구현에 있어서는 전체적인 흐름을 정리해서 빠른 시간 내에 구현할 수 있었는데, 깃 사용에 아직 익숙하지 않아서 깃 충돌이 발생했습니다. 깃 충돌이 발생했을 때 , 어떻게 처리를 해야하는지 몰라서 해결하는데 시간이 오래걸렸습니다. 
* 친밀도 선택을 라디오 버튼으로 구현하는 것이 가장 어려웠습니다. 체크 박스와 다르게 한 가지 상태를 선택했을 때 다른 상태에 표시된 값이 사라져야 하는 점이 쉽지 않았습니다. 컬렉션 뷰를 사용하여 해결했습니다. didSet을 활용하여 라디오 버튼을 클릭된 값으로 변경했습니다.
* 처음 시작할 때부터 뷰 구현이 아직 익숙하지 않은 상태여서 뷰를 구현하는 데만 해도 시간이 상당히 오래 걸렸습니다. 어려운 뷰는 아니었음에도 불구하고 기본적인 코드를 작성하는데 많은 시간이 소요되어서 아직 절대적인 코드 작성 연습량이 부족하다는 생각을 하게 되었습니다.

</br>

### 💙 레코드 걸즈들 사진 💙

<img width="489" alt="KakaoTalk_Image_2022-11-20-02-24-07" src="https://user-images.githubusercontent.com/86944161/202863937-e7071414-c69c-4260-ad60-1e401f9f7782.jpg">
