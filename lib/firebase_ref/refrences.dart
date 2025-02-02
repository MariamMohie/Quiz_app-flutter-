
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

final fireStore =FirebaseFirestore.instance;
final questionPaperRF = fireStore.collection('questionPapers');

final userRF =fireStore.collection('Users');
DocumentReference questionRF({
  required String paperId,
  required String questionId,
})=>questionPaperRF.doc(paperId).collection('questions').doc(questionId);
Reference get firebaseStorage => FirebaseStorage.instance.ref();
