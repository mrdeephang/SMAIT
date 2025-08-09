import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // 🔹 Sign Up
  Future<String?> signUp({
    required String fullName,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    if (password != confirmPassword) {
      return "Passwords do not match.";
    }
    try {
      // Create user in Firebase Auth
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Save extra user info in Firestore
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'fullName': fullName,
        'email': email,
        'createdAt': DateTime.now(),
      });

      return null; // null = success
    } on FirebaseAuthException catch (e) {
      return e.message; // return Firebase error message
    } catch (e) {
      return "Something went wrong. Please try again.";
    }
  }

  // 🔹 Login
  Future<String?> login({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      return "Login failed.";
    }
  }

  // 🔹 Change Password
  Future<String?> changePassword({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    if (newPassword != confirmPassword) {
      return "Passwords do not match.";
    }
    try {
      User? user = _auth.currentUser;
      if (user == null) return "No user logged in.";

      // Re-authenticate before changing password
      AuthCredential credential = EmailAuthProvider.credential(
        email: user.email!,
        password: currentPassword,
      );
      await user.reauthenticateWithCredential(credential);

      // Update password
      await user.updatePassword(newPassword);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      return "Password change failed.";
    }
  }

  // 🔹 Get Current User's Name
  Future<String?> getUserName() async {
    try {
      User? user = _auth.currentUser;
      if (user == null) return null;

      DocumentSnapshot doc = await _firestore.collection('users').doc(user.uid).get();
      return doc['fullName'];
    } catch (e) {
      return null;
    }
  }

  // 🔹 Logout
  Future<void> logout() async {
    await _auth.signOut();
  }
}
