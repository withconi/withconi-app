// import 'package:withconi/data/enums/enum.dart';

// // PlaceDetail Response, PlacePreviewList Response, Conimal 만드는 요청,
// // 내 리뷰 불러오기 리스트 요청 값들 변경된 것입니다!!

// Map<String, dynamic> placeDetailResponse = {
//   'runtimeType': 'hospital',
//   'placeType': 'hospital',
//   'locId': '장소의 아이디값',
//   'address': '서울광역시 어쩌구 어쩌구',
//   'visitVerified': true,
//   'isBookmarked': true,
//   'coordinate': {'lat': 34.567, 'lng': 25.2342},
//   'phone': '02-234-1234',
//   'name': '행복한 동물병원',
//   'openingStatus': 'open',
//   'thumbnail': 'https://ajsdfiojadpfij.com',
//   'totalVisitingCats': 14,
//   'totalVisitingDogs': 16,
//   'diseaseHistory': {
//     'totalDiseaseCount': 12,
//     'diseaseHistoryList': [
//       {
//         'diseaseType': DiseaseType.cardiovascular,
//         'totalDiseaseTypeCount': 12,
//         'diseaseTypeItemList': [
//           {
//             'diseaseName': '심장비대증',
//             'diseasePercent': 54,
//           },
//           {
//             'diseaseName': '심근경색',
//             'diseasePercent': 20,
//           }
//         ]
//       }
//     ]
//   },
//   'reviewHistory': {
//     'totalReviewCount': 12,
//     'reviewHistoryMap': {
//       'high': {
//         'totalReviewRateCount': 10,
//         'reviewHistoryMap': {
//           "explanation": 0,
//           "kindness": 3,
//           "price": 2,
//           "adequateExamination": 1,
//           "effectiveness": 10,
//           "waiting_experience": 0
//         }
//       },
//       'middle': {
//         'totalReviewRateCount': 10,
//         'reviewHistoryMap': {
//           "explanation": 0,
//           "kindness": 3,
//           "price": 2,
//           "adequateExamination": 1,
//           "effectiveness": 10,
//           "waitingExperience": 0
//         }
//       },
//       'low': {
//         'totalReviewRateCount': 10,
//         'reviewHistoryMap': {
//           "explanation": 0,
//           "kindness": 3,
//           "price": 2,
//           "adequateExamination": 1,
//           "effectiveness": 10,
//           "waitingExperience": 0
//         }
//       },
//     }
//   },
// };

// Map<String, dynamic> placePreviewResponse = {
//   'data': {
//     'totalDocuments': 3,
//     'list': [
//       {
//         'runtimeType': 'pharmacy',
//         'placeType': 'pharmacy',
//         'locId': '장소의 아이디값',
//         'address': '서울광역시 어쩌구 어쩌구',
//         'visitVerified': true,
//         'isBookmarked': true,
//         'coordinate': {'lat': 34.567, 'lng': 25.2342},
//         'phone': '02-234-1234',
//         'name': '황약국',
//         'openingStatus': 'open',
//         'thumbnail': 'https://ajsdfiojadpfij.com',
//         'mostVisitedDiseaseType': brainNeurology,
//         'totalReviews': 34,
//       },
//       {
//         'runtimeType': 'hospital',
//         'placeType': 'hospital',
//         'locId': '장소의 아이디값',
//         'address': '서울광역시 어쩌구 어쩌구',
//         'visitVerified': true,
//         'isBookmarked': true,
//         'coordinate': {'lat': 34.567, 'lng': 25.2342},
//         'phone': '02-234-1234',
//         'name': '행복한 동물병원',
//         'openingStatus': 'closed',
//         'thumbnail': 'https://ajsdfiojadpfij.com',
//         'mostVisitedDiseaseType': brainNeurology,
//         'totalReviews': 34,
//       }
//     ],
//   },
// };

// Map<String, dynamic> createReviewRequest = {
//   'data': {
//     'locId': '장소의 아이디값',
//     'visitVerified': true, // visitVerified
//     'conimals': [],
//     'diseaseTypeList': [
//       brainNeurology,
//       digestive,
//     ],
//     'revieRate': ReviewRate.high, // status
//     'diseaseIdList': ['122231331', '123444342'],
//     'reviewItems': [
//       adequateExamination,
//       effectiveness,
//     ],
//     'reviewDesc': '여러번 방문했었는데 생각보다 좋았어요 가격도 착하고어쩌구',
//   }
// };

// //이건 내 리뷰 불러오기 할때 리스트로 보내주시는 형식 수정한 부분입니다.
// // 바뀐것은,  placePreview 를 같이 보내주셔야 할 것 같아요!!
// Map<String, dynamic> reviewListResponse = {
//   'totalDocuments': 12,
//   'results': [
//     {
//       'createdAt': '121424141212',
//       'conimals': [],
//       'diseaseTypeList': [
//         brainNeurology,
//         DiseaseType.digestive,
//       ],
//       'revieRate': high, // status
//       'diseaseIdList': ['122231331', '123444342'],
//       'diseaseList': ['object 형태로 된 disease 리스트'],
//       'reviewRate': ReviewRate.high,
//       'reviewItems': [
//         adequateExamination,
//         effectiveness,
//       ],
//       'reviewDesc': '여러번 방문했었는데 생각보다 좋았어요 가격도 착하고어쩌구',
//       'placePreview': {
//         'runtimeType': 'pharmacy',
//         'placeType': 'pharmacy',
//         'locId': '장소의 아이디값',
//         'address': '서울광역시 어쩌구 어쩌구',
//         'visitVerified': true,
//         'isBookmarked': true,
//         'coordinate': {'lat': 34.567, 'lng': 25.2342},
//         'phone': '02-234-1234',
//         'name': '황약국',
//         'openingStatus': 'open',
//         'thumbnail': 'https://ajsdfiojadpfij.com',
//         'mostVisitedDiseaseType': brainNeurology,
//         'totalReviews': 34,
//       },
//     }
//   ]
// };

// Map<String, dynamic> createConimalRequest = {
//   'diseases': diseaseIdList,
//   'name': name,
//   'species': species.code,
//   'gender': gender.code,
//   'birthDate': birthDate.millisecondsSinceEpoch,
//   'adoptedDate': adoptedDate.millisecondsSinceEpoch,
//   'breed': breed,
//   'isNeutralized': isNeutralized,
// };

// /*

// comment랑 post쓸때 authorId 있는데, 이거 uid랑 동일? 보내야 하나
// 아니면 token 사용하니까 ㄱㅊ?

// */
