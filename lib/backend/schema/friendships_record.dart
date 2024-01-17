import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class FriendshipsRecord extends FirestoreRecord {
  FriendshipsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "uid1" field.
  String? _uid1;
  String get uid1 => _uid1 ?? '';
  bool hasUid1() => _uid1 != null;

  // "uid2" field.
  String? _uid2;
  String get uid2 => _uid2 ?? '';
  bool hasUid2() => _uid2 != null;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  bool hasState() => _state != null;

  void _initializeFields() {
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _uid1 = snapshotData['uid1'] as String?;
    _uid2 = snapshotData['uid2'] as String?;
    _state = snapshotData['state'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('friendships');

  static Stream<FriendshipsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FriendshipsRecord.fromSnapshot(s));

  static Future<FriendshipsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FriendshipsRecord.fromSnapshot(s));

  static FriendshipsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FriendshipsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FriendshipsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FriendshipsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FriendshipsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FriendshipsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFriendshipsRecordData({
  DateTime? timestamp,
  String? uid1,
  String? uid2,
  String? state,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'timestamp': timestamp,
      'uid1': uid1,
      'uid2': uid2,
      'state': state,
    }.withoutNulls,
  );

  return firestoreData;
}

class FriendshipsRecordDocumentEquality implements Equality<FriendshipsRecord> {
  const FriendshipsRecordDocumentEquality();

  @override
  bool equals(FriendshipsRecord? e1, FriendshipsRecord? e2) {
    return e1?.timestamp == e2?.timestamp &&
        e1?.uid1 == e2?.uid1 &&
        e1?.uid2 == e2?.uid2 &&
        e1?.state == e2?.state;
  }

  @override
  int hash(FriendshipsRecord? e) =>
      const ListEquality().hash([e?.timestamp, e?.uid1, e?.uid2, e?.state]);

  @override
  bool isValidKey(Object? o) => o is FriendshipsRecord;
}
