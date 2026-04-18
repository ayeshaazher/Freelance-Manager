import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ShareRecord extends FirestoreRecord {
  ShareRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "shareURL" field.
  String? _shareURL;
  String get shareURL => _shareURL ?? '';
  bool hasShareURL() => _shareURL != null;

  void _initializeFields() {
    _shareURL = snapshotData['shareURL'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('share');

  static Stream<ShareRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ShareRecord.fromSnapshot(s));

  static Future<ShareRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ShareRecord.fromSnapshot(s));

  static ShareRecord fromSnapshot(DocumentSnapshot snapshot) => ShareRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ShareRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ShareRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ShareRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ShareRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createShareRecordData({
  String? shareURL,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'shareURL': shareURL,
    }.withoutNulls,
  );

  return firestoreData;
}

class ShareRecordDocumentEquality implements Equality<ShareRecord> {
  const ShareRecordDocumentEquality();

  @override
  bool equals(ShareRecord? e1, ShareRecord? e2) {
    return e1?.shareURL == e2?.shareURL;
  }

  @override
  int hash(ShareRecord? e) => const ListEquality().hash([e?.shareURL]);

  @override
  bool isValidKey(Object? o) => o is ShareRecord;
}
