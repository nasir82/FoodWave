

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreServices{

  final CollectionReference collectionRef  = FirebaseFirestore.instance.collection("orders");
  Future<void> saveOnDatabase(String receipt) async{

    
  await  collectionRef.add({
        'date':DateTime.now(),
        'order': receipt
    });

    
  
  }
  Future<void> getUpdate()async{
    print(FirebaseAuth.instance.currentUser!.toString());
   await FirebaseFirestore.instance.collection("mycol").add({
      'name':"nasir",
      'mail':'gmail.com'

    });

  }
}