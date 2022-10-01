import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../firestore/defaut/user_fs.dart';
import '../firestore/models/firestore_user_model.dart';

class AuthService extends GetxController {
  final _firebaseAuth = FirebaseAuth.instance;
  final _firebaseUser = FirebaseAuth.instance.currentUser.obs;

  @override
  void onInit() {
    super.onInit();
    _firebaseUser.bindStream(_firebaseAuth.userChanges());
  }

  FirebaseAuth get getFirebaseAuth => _firebaseAuth;
  set setFirebaseUser(User? firebaseUser) {
    _firebaseUser.value = firebaseUser;
  }

  void setUser(value) {
    _firebaseUser.value = value;
  }

  User? get user => _firebaseUser.value;

  String get safeName => _firebaseUser.value?.displayName ?? 'Untitled User';

  String get safeEmail => _firebaseUser.value?.email ?? 'Untitled Email';

  String get safePhotoUrl =>
      _firebaseUser.value?.photoURL ??
      'https://cdn-icons-png.flaticon.com/512/1144/1144709.png';

  //update user display name
  Future<void> updateUserDisplayName(String displayName) async {
    await _firebaseUser.value!.updateDisplayName(
      displayName,
    );
  }

  Future<String?> signInWithEmailAndPassoword(
      {required email, required password}) async {
    String? errorType;
    try {
      UserCredential credential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      setUser(credential.user);
      saveUser(password);

      errorType = null;
    } on FirebaseAuthException catch (e) {
      errorType = getMessageFromErrorCode(e.code, e.message, false);
    }
    return errorType;
  }

  Future<String?> registerWithEmailAndPassoword(
      {required email, required password}) async {
    String? errorType;
    try {
      UserCredential credential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      setUser(credential.user);
      saveUser(password);
      return null;
    } on FirebaseAuthException catch (e) {
      return getMessageFromErrorCode(e.code, e.message, true);
    }
  }

  Future<String?> sendPasswordReset({required email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return null;
    } on FirebaseAuthException catch (e) {
      return "Error: ${e.message}";
    }
  }

  Future<String?> signInWithGoogle() async {
    log("start signInWithGoogle");
    AuthCredential? credential;

    try {
      GoogleSignInAccount? account =
          await GoogleSignIn(scopes: ["email"]).signIn();

      GoogleSignInAuthentication? authentication =
          await account?.authentication;

      credential = GoogleAuthProvider.credential(
        accessToken: authentication?.accessToken,
        idToken: authentication?.idToken,
      );
    } on Exception {}
    if (credential == null) return null;

    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(credential);
      setUser(userCredential.user);
      saveUser(null);
      return null;
    } on FirebaseAuthException catch (e) {
      return getMessageFromErrorCode(e.code, e.message, false);
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    setUser(_firebaseAuth.currentUser);
  }

  bool isGoogle() {
    bool providerId = false;
    for (var i = 0; i < _firebaseAuth.currentUser!.providerData.length; i++) {
      if (_firebaseAuth.currentUser!.providerData[i].providerId ==
          GoogleAuthProvider.PROVIDER_ID) {
        providerId = true;
      }
    }
    return providerId;
  }

  bool isEmail() {
    bool providerId = false;
    for (var i = 0; i < _firebaseAuth.currentUser!.providerData.length; i++) {
      if (_firebaseAuth.currentUser!.providerData[i].providerId ==
          EmailAuthProvider.PROVIDER_ID) {
        providerId = true;
      }
    }
    return providerId;
  }

  String getMessageFromErrorCode(
      String errorCode, String? message, bool register) {
    String loginOrRegister = register ? "Register" : "Login";

    switch (errorCode) {
      case "ERROR_EMAIL_ALREADY_IN_USE":
      case "account-exists-with-different-credential":
      case "email-already-in-use":
        return "Email already used. Go to login page.";

      case "ERROR_WRONG_PASSWORD":
      case "wrong-password":
        return "Wrong email/password combination.";

      case "ERROR_USER_NOT_FOUND":
      case "user-not-found":
        return "No user found with this email.";

      case "ERROR_USER_DISABLED":
      case "user-disabled":
        return "User disabled.";

      case "ERROR_TOO_MANY_REQUESTS":
      case "operation-not-allowed":
        return "Too many requests to log into this account.";

      case "ERROR_OPERATION_NOT_ALLOWED":
        return "Server error, please try again later.";

      case "weak-password":
        return "Password is too weak.";

      case "ERROR_INVALID_EMAIL":
      case "invalid-email":
        return "Email address is invalid.";

      default:
        return "$loginOrRegister failed. ${message}";
    }
  }

  Future<void> changeUsername(String username) async {
    await _firebaseAuth.currentUser!.updateDisplayName(username);
    await FSUserService().readCloud().then((value) async {
      if (value != null) {
        value.displayName = username;
        await FSUserService().updateCloud(value);
      }
    });
  }

  Future<void> saveUser(
    String? password,
  ) async {
    final user = _firebaseAuth.currentUser;

    if (user != null) {
      FSUserService userService = FSUserService();
      userService.readCloud().then((value) {
        if (value != null) {
        } else {
          userService.savetoCloud(UserFS(
            uid: user.uid,
            displayName: user.displayName ?? "Untitled User",
            email: user.email ?? "Untitled Email",
            password: password,
            photoUrl: user.photoURL,
            createdAt: user.metadata.creationTime!.millisecondsSinceEpoch,
          ));
        }
      });
    }
  }
}
