import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BetsRecord extends FirestoreRecord {
  BetsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "caption" field.
  String? _caption;
  String get caption => _caption ?? '';
  bool hasCaption() => _caption != null;

  // "receiverAmount" field.
  double? _receiverAmount;
  double get receiverAmount => _receiverAmount ?? 0.0;
  bool hasReceiverAmount() => _receiverAmount != null;

  // "receiverHasConfirmed" field.
  bool? _receiverHasConfirmed;
  bool get receiverHasConfirmed => _receiverHasConfirmed ?? false;
  bool hasReceiverHasConfirmed() => _receiverHasConfirmed != null;

  // "receiverOdds" field.
  double? _receiverOdds;
  double get receiverOdds => _receiverOdds ?? 0.0;
  bool hasReceiverOdds() => _receiverOdds != null;

  // "senderOdds" field.
  double? _senderOdds;
  double get senderOdds => _senderOdds ?? 0.0;
  bool hasSenderOdds() => _senderOdds != null;

  // "senderAmount" field.
  double? _senderAmount;
  double get senderAmount => _senderAmount ?? 0.0;
  bool hasSenderAmount() => _senderAmount != null;

  // "senderHasConfirmed" field.
  bool? _senderHasConfirmed;
  bool get senderHasConfirmed => _senderHasConfirmed ?? false;
  bool hasSenderHasConfirmed() => _senderHasConfirmed != null;

  // "senderUid" field.
  String? _senderUid;
  String get senderUid => _senderUid ?? '';
  bool hasSenderUid() => _senderUid != null;

  // "receiverUid" field.
  String? _receiverUid;
  String get receiverUid => _receiverUid ?? '';
  bool hasReceiverUid() => _receiverUid != null;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  bool hasState() => _state != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  void _initializeFields() {
    _caption = snapshotData['caption'] as String?;
    _receiverAmount = castToType<double>(snapshotData['receiverAmount']);
    _receiverHasConfirmed = snapshotData['receiverHasConfirmed'] as bool?;
    _receiverOdds = castToType<double>(snapshotData['receiverOdds']);
    _senderOdds = castToType<double>(snapshotData['senderOdds']);
    _senderAmount = castToType<double>(snapshotData['senderAmount']);
    _senderHasConfirmed = snapshotData['senderHasConfirmed'] as bool?;
    _senderUid = snapshotData['senderUid'] as String?;
    _receiverUid = snapshotData['receiverUid'] as String?;
    _state = snapshotData['state'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('bets');

  static Stream<BetsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BetsRecord.fromSnapshot(s));

  static Future<BetsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BetsRecord.fromSnapshot(s));

  static BetsRecord fromSnapshot(DocumentSnapshot snapshot) => BetsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BetsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BetsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BetsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BetsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBetsRecordData({
  String? caption,
  double? receiverAmount,
  bool? receiverHasConfirmed,
  double? receiverOdds,
  double? senderOdds,
  double? senderAmount,
  bool? senderHasConfirmed,
  String? senderUid,
  String? receiverUid,
  String? state,
  DateTime? timestamp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'caption': caption,
      'receiverAmount': receiverAmount,
      'receiverHasConfirmed': receiverHasConfirmed,
      'receiverOdds': receiverOdds,
      'senderOdds': senderOdds,
      'senderAmount': senderAmount,
      'senderHasConfirmed': senderHasConfirmed,
      'senderUid': senderUid,
      'receiverUid': receiverUid,
      'state': state,
      'timestamp': timestamp,
    }.withoutNulls,
  );

  return firestoreData;
}

class BetsRecordDocumentEquality implements Equality<BetsRecord> {
  const BetsRecordDocumentEquality();

  @override
  bool equals(BetsRecord? e1, BetsRecord? e2) {
    return e1?.caption == e2?.caption &&
        e1?.receiverAmount == e2?.receiverAmount &&
        e1?.receiverHasConfirmed == e2?.receiverHasConfirmed &&
        e1?.receiverOdds == e2?.receiverOdds &&
        e1?.senderOdds == e2?.senderOdds &&
        e1?.senderAmount == e2?.senderAmount &&
        e1?.senderHasConfirmed == e2?.senderHasConfirmed &&
        e1?.senderUid == e2?.senderUid &&
        e1?.receiverUid == e2?.receiverUid &&
        e1?.state == e2?.state &&
        e1?.timestamp == e2?.timestamp;
  }

  @override
  int hash(BetsRecord? e) => const ListEquality().hash([
        e?.caption,
        e?.receiverAmount,
        e?.receiverHasConfirmed,
        e?.receiverOdds,
        e?.senderOdds,
        e?.senderAmount,
        e?.senderHasConfirmed,
        e?.senderUid,
        e?.receiverUid,
        e?.state,
        e?.timestamp
      ]);

  @override
  bool isValidKey(Object? o) => o is BetsRecord;
}
