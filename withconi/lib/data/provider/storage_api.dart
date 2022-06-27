import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

import '../../configs/constants/auth_variables.dart';

//TODO: storage 업로드하는 api 만들어야 함

class StorageAPI {
  final storageRef = firebaseStorage.ref();

  uploadFile(File file) async {
    try {
      // 스토리지에 업로드할 파일 경로
      final firebaseStorageRef = storageRef
          .child('post') //'post'라는 folder를 만들고
          .child('${DateTime.now().millisecondsSinceEpoch}');

      // 파일 업로드
      final uploadTask = firebaseStorageRef.putFile(
          file, SettableMetadata(contentType: 'image/png'));

      // 완료까지 기다림
      await uploadTask.whenComplete(() => null);

      // 업로드 완료 후 url
      final downloadUrl = await firebaseStorageRef.getDownloadURL();

      // 문서 작성
      // await FirebaseFirestore.instance.collection('post').add({
      //   'contents': textEditingController.text,
      //   'displayName': widget.user.displayName,
      //   'email': widget.user.email,
      //   'photoUrl': downloadUrl,
      //   'userPhotoUrl': widget.user.photoURL
      // });

      return downloadUrl;
    } catch (e) {
      print(e);
    }
  }
}
