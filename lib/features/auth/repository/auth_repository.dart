// fonksiyonların asıl oluşturulduğu yer
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/models/user.dart';

final authRepositoryProvider = Provider((ref) => AuthRepository(
    firebaseFirestore: FirebaseFirestore.instance,
    auth: FirebaseAuth.instance));

class AuthRepository {
  FirebaseFirestore firebaseFirestore;
  FirebaseAuth auth;
  AuthRepository({
    required this.firebaseFirestore,
    required this.auth,
  });

  Future<void> createUser(String email, String password) async {
    await auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then(
      (value) {
        UserModel userModel = UserModel(email: email, uid: value.user!.uid);
        saveDataToFirestore(userModel);
      },
    );
  }

  Future<void> saveDataToFirestore(UserModel userModel) async {
    await firebaseFirestore
        .collection("users")
        .doc(userModel.uid)
        .set(userModel.toMap());
    createUser("", "password");
  }

  Future<UserModel> signIn(String email, String password) async {
    await auth.signInWithEmailAndPassword(email: email, password: password);

    return await firebaseFirestore
        .collection("users")
        .doc(auth.currentUser!.uid)
        .get()
        .then((value) {
      UserModel userModel = UserModel.fromMap(value.data()!);
      return userModel;
    });
  }
}
