// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AccountBalanceHistoryStruct extends FFFirebaseStruct {
  AccountBalanceHistoryStruct({
    double? balance,
    DateTime? date,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _balance = balance,
        _date = date,
        super(firestoreUtilData);

  // "balance" field.
  double? _balance;
  double get balance => _balance ?? 0.0;
  set balance(double? val) => _balance = val;
  void incrementBalance(double amount) => _balance = balance + amount;
  bool hasBalance() => _balance != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;
  bool hasDate() => _date != null;

  static AccountBalanceHistoryStruct fromMap(Map<String, dynamic> data) =>
      AccountBalanceHistoryStruct(
        balance: castToType<double>(data['balance']),
        date: data['date'] as DateTime?,
      );

  static AccountBalanceHistoryStruct? maybeFromMap(dynamic data) => data is Map
      ? AccountBalanceHistoryStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'balance': _balance,
        'date': _date,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'balance': serializeParam(
          _balance,
          ParamType.double,
        ),
        'date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static AccountBalanceHistoryStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      AccountBalanceHistoryStruct(
        balance: deserializeParam(
          data['balance'],
          ParamType.double,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'AccountBalanceHistoryStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AccountBalanceHistoryStruct &&
        balance == other.balance &&
        date == other.date;
  }

  @override
  int get hashCode => const ListEquality().hash([balance, date]);
}

AccountBalanceHistoryStruct createAccountBalanceHistoryStruct({
  double? balance,
  DateTime? date,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AccountBalanceHistoryStruct(
      balance: balance,
      date: date,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AccountBalanceHistoryStruct? updateAccountBalanceHistoryStruct(
  AccountBalanceHistoryStruct? accountBalanceHistory, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    accountBalanceHistory
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAccountBalanceHistoryStructData(
  Map<String, dynamic> firestoreData,
  AccountBalanceHistoryStruct? accountBalanceHistory,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (accountBalanceHistory == null) {
    return;
  }
  if (accountBalanceHistory.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      accountBalanceHistory.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final accountBalanceHistoryData = getAccountBalanceHistoryFirestoreData(
      accountBalanceHistory, forFieldValue);
  final nestedData =
      accountBalanceHistoryData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      accountBalanceHistory.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAccountBalanceHistoryFirestoreData(
  AccountBalanceHistoryStruct? accountBalanceHistory, [
  bool forFieldValue = false,
]) {
  if (accountBalanceHistory == null) {
    return {};
  }
  final firestoreData = mapToFirestore(accountBalanceHistory.toMap());

  // Add any Firestore field values
  accountBalanceHistory.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAccountBalanceHistoryListFirestoreData(
  List<AccountBalanceHistoryStruct>? accountBalanceHistorys,
) =>
    accountBalanceHistorys
        ?.map((e) => getAccountBalanceHistoryFirestoreData(e, true))
        .toList() ??
    [];
