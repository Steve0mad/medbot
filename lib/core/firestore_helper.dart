import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medbot/model/user.dart';

class FirestoreHelper {
  static CollectionReference<User> getUserCollection() {
    var refernce = FirebaseFirestore.instance.collection("Users").withConverter(
      fromFirestore: (snapshot, options) {
        Map<String, dynamic>? doc = snapshot.data();

        return User.fromFiresotre(doc);
      },
      toFirestore: (user, options) {
        return user.toFiresotre();
      },
    );
    return refernce;
  }

  static Future<void> AddNewUser(User user) async {
    var userCollection = getUserCollection();
   var docReference= userCollection.doc(user.id);
   await docReference.set(user);

  }
  static  Future<User?> getUser(String userId)async{
    var userCollection = getUserCollection();
    var docReference =userCollection.doc(userId);
   var snapshot= await docReference.get();
   var user = snapshot.data();
   return user;
  }
}
