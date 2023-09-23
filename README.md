# GP_project
### 2021-2 Game Programming Project (2021년도 3학년 2학기 게임프로그래밍 프로젝트)

# 게임 소개
### 유니티를 이용해 제작한 레이싱 게임입니다. 

<img src="https://github.com/nunnunnana/GP_project/assets/99165741/66fdca28-3e43-4dba-83b1-1a099605a013.png" width="600" height="400"/>

<img src="https://github.com/nunnunnana/GP_project/assets/99165741/cfeb3e5e-04f5-4d2c-aa46-c33ec43288ba.png" width="600" height="400"/>

![GP_플레이 영상](https://github.com/nunnunnana/GP_project/assets/99165741/5cfbf545-9dd2-4c40-ac3d-a08e0270eaa0)


# 조작법
W : 전진 
S : 후진 
A,D : 핸들 좌우 이동
space : 브레이크
Z, X, C : 시점 변경(1인칭, 3인칭, 탑뷰)

---

## 제작과정

### 모델
- 자동차는 무료 에셋 사용
- 텍스처, 노말맵, 메시가 세분화 돼있는 에셋 선정

### 브레이크, 후미등 조명 구현
- 특정 위치에 조명이 나와야하기 때문에 포토샵으로 MaskMap 제작

<img src="https://github.com/nunnunnana/GP_project/assets/99165741/dea109a9-b797-4017-aac3-35d830a139df.png" width="900" height="200"/>


- MaskMap을 이용해 텍스처에 특정 부분만 빛나는 쉐이더 코드

https://github.com/nunnunnana/GP_project/blob/93c65d2d0491ee89759c3d5f39709ec403146a24/GP_project/Assets/Azerilo/BackLightShader.shader#L1

- 입력 값에 따라 머트리얼 적용

https://github.com/nunnunnana/GP_project/blob/93c65d2d0491ee89759c3d5f39709ec403146a24/GP_project/Assets/Azerilo/lightScript.cs#L18-L36

<img src="https://github.com/nunnunnana/GP_project/assets/99165741/b8de3e27-01a6-4ec8-b924-6a424034c688.png" width="900" height="250"/>


### 백미러, 사이드 미러 구현
- CubeMap 텍스처를 이용해 이미지를 텍스처로 만든 후 오브젝트에 적용

https://github.com/nunnunnana/GP_project/blob/93c65d2d0491ee89759c3d5f39709ec403146a24/GP_project/Assets/Azerilo/CubemapShader.shader#L1

<img src="https://github.com/nunnunnana/GP_project/assets/99165741/5e88ce57-a4a8-4ac0-a51c-687e2a11f422.png" width="600" height="250"/>


### 가속 효과 구현
- 카메라와 자동차 사이에 Quad 생성

- 굴절 효과를 주기위한 텍스처
<img src="https://github.com/nunnunnana/GP_project/assets/99165741/ca6d1666-e158-4132-bf73-caa965eb0915.png" width="200" height="200"/>

- 실시간으로 Quad에 보여지게 하고 텍스처를 사용해 화면에 굴절 효과를 줌
https://github.com/nunnunnana/GP_project/blob/93c65d2d0491ee89759c3d5f39709ec403146a24/GP_project/Assets/Azerilo/QuadView.shader#L1

- 자동차 객체를 찾아서 굴절 효과를 주는 변수를 가져오고 자동차에 속도에 따라 변수 값 변경
https://github.com/nunnunnana/GP_project/blob/93c65d2d0491ee89759c3d5f39709ec403146a24/GP_project/Assets/Azerilo/QuadViewScript.cs#L13-L37

<img src="https://github.com/nunnunnana/GP_project/assets/99165741/33da9c2d-bbaa-4008-bd78-53be4349223b.png" width="900" height="200"/>


### 자동차 조작, 시점 구현

- 자동차 객체 스크립트
https://github.com/nunnunnana/GP_project/blob/93c65d2d0491ee89759c3d5f39709ec403146a24/GP_project/Assets/Azerilo/Car.cs#L14-L73

- 조향 기능
https://github.com/nunnunnana/GP_project/blob/93c65d2d0491ee89759c3d5f39709ec403146a24/GP_project/Assets/Azerilo/HandleRoll.cs#L14-L28

- 시점 스크립트
https://github.com/nunnunnana/GP_project/blob/93c65d2d0491ee89759c3d5f39709ec403146a24/GP_project/Assets/Azerilo/Cm_Script.cs#L11-L30

### 미니어처 효과

- 카메라와 자동차 사이에 Plane 2개 생성
<img src="https://github.com/nunnunnana/GP_project/assets/99165741/a7d6a394-3e7b-4fba-b074-09053bee2644.png" width="400" height="300"/>

- 가우시안 알고리즘을 사용해 원본 이미지를 부드럽게 변경
- 2-pass를 이용해서 가로 방향으로 블러처리 후 그 다음 화면에 세로 방향으로 블러처리

- 가로 방향 블러처리
https://github.com/nunnunnana/GP_project/blob/93c65d2d0491ee89759c3d5f39709ec403146a24/GP_project/Assets/Azerilo/Blur.shader#L37-L58

- 세로 방향 블러처리
https://github.com/nunnunnana/GP_project/blob/93c65d2d0491ee89759c3d5f39709ec403146a24/GP_project/Assets/Azerilo/Blur.shader#L88-L105

<img src="https://github.com/nunnunnana/GP_project/assets/99165741/7028bed4-6cfe-40df-b2c8-a1f9c2909757.png" width="700" height="300"/>

