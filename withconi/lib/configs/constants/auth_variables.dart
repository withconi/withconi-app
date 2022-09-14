// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

final Future<FirebaseApp> firebaseInitialization = Firebase.initializeApp();
final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();
final FirebaseDynamicLinks firebaseDynamicLinks = FirebaseDynamicLinks.instance;
