

</br>

 
<img src="https://user-images.githubusercontent.com/47681139/203914388-bcc9d1ac-9633-402b-8e39-59f043a79a1a.png" >
</br>




# **🐾    반려동물 '질병관리' 서비스 - WiTHCONi**







<img src="https://user-images.githubusercontent.com/47681139/203910273-4f1d65d3-6afa-4fb2-9b07-e67acd3ef202.png"  width="400">


> **WithConi
> = With + Conimal**


반려동물이라는 단어인 Conimal과 With를 결합하여 **반려동물과 함께하는 삶을 돕는다는 의미**를 담았습니다.  
반려동물의 보호자들이 1. **질병에 적합한 병원/약국**을 찾고, 2. **사람들과 질병 정보를 공유**하고,  
3. 자가진단을 통해 **질병을 빠르게 알고 관리**할 수 있도록 돕는 ‘반려동물 질병 관리’ 앱입니다.


<table>
    <thead>
        <tr>
            <th colspan=2>위드코니는 질병관리를 위해 아래 4가지 방법을 제공합니다.</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td >✔️ 병원/약국 찾기</td>
            <td>✔️ 자가진단</td>
        </tr>
         <tr>
            <td>✔️ 질병 커뮤니티 </td>
            <td>✔️ 질병백과</td>
        </tr>
    </tbody>
</table>

</br>


</br>

# 🤷🏻‍♀️  왜 만들었나요?

</br>

|이런 문제가 있었어요.|이렇게 해결하고 싶었어요.|
|---|---|
|🔒 반려동물을 **함께하는 가족**으로 여기는 사람들|🔑 **의심되는 질병**과 그 질병의 정보을 보호자가 신속히 알도록 돕자!|
|🔒 질병별로 **전문성있는 동물의료기관을 찾기 어려움**|🔑 병원/약국에 **방문한 반려동물과 질병**에 대한 **상세한 정보**를 제공하자!|
|🔒 질병을 위한 **진단법/치료법/약,수술법** 등의 정보를 얻기가 힘듦|🔑 비슷한 질병으로 고민하는 **보호자들이 정보를 공유**할 수 있도록 돕자.|


</br>
</br></br>

# 📱 앱 데모 영상

</br>





<table>
    <thead>
        <tr>
            <th>로그인/회원가입</th>    <th>홈화면 코니멀 및 질병 편집</th>    <th>병원/약국 찾기& 리뷰</th>    <th>커뮤니티</th> 
        </tr>
    </thead>
    <tbody>
   <tr>
           <td><img src="https://user-images.githubusercontent.com/47681139/203929316-a048da82-bf69-46b8-a057-ba5000265f55.gif"width="200"></td><td><img src="https://user-images.githubusercontent.com/47681139/203934454-159fbead-ee87-45c0-9fdf-2b78ffb30668.gif"width="200"></td>
      <td><img src="https://user-images.githubusercontent.com/47681139/203930235-2e39e4e7-04f2-4314-9dc4-5822a1a3df22.gif"                  width="200"></td><td><img src="https://user-images.githubusercontent.com/47681139/203929546-a2e8cd2d-9d0b-40a3-8b2e-607ad3bfec46.gif"                  width="200"></td>
 

       
       
       
 
 

  </tr>
    </tbody>
</table>




</br>


</br>
</br>





# ⚙️  ****Architecture****

</br>

<table>
    <tbody>
        <tr>
        <td >⚙️ 상태관리 : GetX</td>
            <td >⚠️ 에러처리 : Dartz 활용</td>
            <td>🧊 DTO : Freezed 활용</td>
            <td>🌐 Network : Dio</td>
        </tr>
    </tbody>
</table>

</br>

![image](https://user-images.githubusercontent.com/47681139/203920679-6e94b094-bd54-4049-8c2d-2036d10f5264.png)
</br>

- ***GetX 패턴을 일부 변형하여 사용***
- **Controller** : ResponseDTO → Ui model 변환 및 ui 업데이트를 위한 로직 담당
- **Repository** : Request DTO의 생성 및 전달, Map에서 ResponseDTO로의 변환 및 전달 담당
    - Request DTO의 존재 이유? Request DTO 내부에 request 방식,  api 주소 정보, token 필요 여부를 넣어 각 DTO가 독립적으로 작동할 수 있도록
- **Provider** : RequestDTO → Api DTO 생성, Map<String, dynamic> 데이터의 전달 담당
    - Api DTO의 존재 이유? header나 formData, query나 body 에 필요한 별개의 설정을 할 수 있도록
- **Dio** : api 직접 통신을 담당 + 구현한 Auth, Error Interceptor를 통해 token을 발급하고 적절한 Exception throw함

</br>

</br>
</br>



# 🌟  ****앱 주요 기능****

</br>

<img width="896" alt="Screen Shot 2022-11-25 at 3 58 59 PM" src="https://user-images.githubusercontent.com/47681139/203920453-e592334a-88a0-4cb9-b082-139a514a6c54.png">

<img width="924" alt="Screen Shot 2022-11-25 at 4 08 31 PM" src="https://user-images.githubusercontent.com/47681139/203921899-801a1033-0802-42d9-84d5-48f5569c90ad.png">

<img width="905" alt="Screen Shot 2022-11-25 at 4 04 58 PM" src="https://user-images.githubusercontent.com/47681139/203922057-674f2a60-8819-4dac-8043-d2ac1f68b5d6.png">

<img width="906" alt="Screen Shot 2022-11-25 at 4 05 11 PM" src="https://user-images.githubusercontent.com/47681139/203921413-9882b946-1202-47a0-b0d4-debb236d8df1.png">


</br>
</br>

 # 👨🏻‍💻 Team

</br>

- Flutter 개발자 1명
- 백엔드 개발자 1명


</br>


# ✋🏻 맡은 부분

</br>

- **프론트 앱 전체 개발**
    - Flutter 기반 Android/iOS에 동시 대응할 수 있는 앱 개발 담당
- **디자인**
    - 직접 Figma를 이용한 디자인/프로토타이핑을 담당. 해당 디자인을 기반으로 앱 개발 진행
- **기획**
