// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:real/domain/domain_user.dart';

// class AuthService {
//   final FirebaseAuth _fAuth = FirebaseAuth.instance;

//   Future<DomainUser> signInWithEmailAndPassword(
//       String email, String password) async {
//     try {
//       UserCredential result = await _fAuth.signInWithEmailAndPassword(
//           email: email, password: password);
//       User user = result.user;
//       return DomainUser.fromFirebase(user);
//     } catch (e) {
//       return null;
//     }
//   }

//   Future<DomainUser> registerWithEmailAndPassword(
//       String email, String password) async {
//     try {
//       UserCredential result = await _fAuth.createUserWithEmailAndPassword(
//           email: email, password: password);
//       User user = result.user;
//       return DomainUser.fromFirebase(user);
//     } catch (e) {
//       return null;
//     }
//   }

//   Future logOut() async {
//     await _fAuth.signOut();
//   }

//   Stream<DomainUser> get currentUser {
//     return _fAuth.authStateChanges().map(
//         (User user) => user != null ? DomainUser.fromFirebase(user) : null);
//   }
// }
