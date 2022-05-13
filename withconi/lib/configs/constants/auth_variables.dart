// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:withconi/controller/auth_controller.dart';

AuthController authController = AuthController.instance;
final Future<FirebaseApp> firebaseInitialization = Firebase.initializeApp();
final FirebaseAuth auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();
