import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'profile_card_model.dart';
export 'profile_card_model.dart';

class ProfileCardWidget extends StatefulWidget {
  const ProfileCardWidget({
    super.key,
    required this.displayName,
    required this.email,
    this.receiverUID,
  });

  final String? displayName;
  final String? email;
  final String? receiverUID;

  @override
  _ProfileCardWidgetState createState() => _ProfileCardWidgetState();
}

class _ProfileCardWidgetState extends State<ProfileCardWidget> {
  late ProfileCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileCardModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(0.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 10.0,
          sigmaY: 8.0,
        ),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).accent4,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: StreamBuilder<List<FriendshipsRecord>>(
                  stream: queryFriendshipsRecord(
                    queryBuilder: (friendshipsRecord) => friendshipsRecord
                        .where(
                          'uid2',
                          isEqualTo: currentUserUid,
                        )
                        .where(
                          'uid1',
                          isEqualTo: widget.receiverUID,
                        ),
                    singleRecord: true,
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    List<FriendshipsRecord> profileCardFriendshipsRecordList =
                        snapshot.data!;
                    final profileCardFriendshipsRecord =
                        profileCardFriendshipsRecordList.isNotEmpty
                            ? profileCardFriendshipsRecordList.first
                            : null;
                    return Container(
                      width: double.infinity,
                      constraints: const BoxConstraints(
                        maxWidth: 700.0,
                      ),
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 12.0,
                            color: Color(0x33000000),
                            offset: Offset(0.0, 5.0),
                          )
                        ],
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 12.0, 24.0, 12.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 70.0,
                                    height: 70.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: AuthUserStreamWidget(
                                        builder: (context) => ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          child: CachedNetworkImage(
                                            fadeInDuration:
                                                const Duration(milliseconds: 500),
                                            fadeOutDuration:
                                                const Duration(milliseconds: 500),
                                            imageUrl: currentUserPhoto,
                                            width: 100.0,
                                            height: 100.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            valueOrDefault<String>(
                                              widget.displayName,
                                              'Name',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .headlineSmall,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 4.0, 0.0, 0.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                widget.email,
                                                'email',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              profileCardFriendshipsRecord
                                                  ?.state,
                                              'IDK',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30.0,
                                    borderWidth: 1.0,
                                    buttonSize: 44.0,
                                    icon: Icon(
                                      Icons.close_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if (!(profileCardFriendshipsRecord != null))
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 20.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 60.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        shape: BoxShape.rectangle,
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    14.0, 0.0, 0.0, 0.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                try {
                                                  final result =
                                                      await FirebaseFunctions
                                                          .instance
                                                          .httpsCallable(
                                                              'sendFriendRequest')
                                                          .call({
                                                    "sender": currentUserUid,
                                                    "receiver":
                                                        widget.receiverUID,
                                                  });
                                                  _model.cloudFunctionzsv =
                                                      SendFriendRequestCloudFunctionCallResponse(
                                                    succeeded: true,
                                                  );
                                                } on FirebaseFunctionsException catch (error) {
                                                  _model.cloudFunctionzsv =
                                                      SendFriendRequestCloudFunctionCallResponse(
                                                    errorCode: error.code,
                                                    succeeded: false,
                                                  );
                                                }

                                                setState(() {});
                                              },
                                              text: 'Send Friend Request',
                                              options: FFButtonOptions(
                                                height: 40.0,
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 24.0, 0.0),
                                                iconPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color: const Color(0xFFF64668),
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: Colors.white,
                                                        ),
                                                elevation: 3.0,
                                                borderSide: const BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 0.0),
                                  child: StreamBuilder<List<FriendshipsRecord>>(
                                    stream: queryFriendshipsRecord(
                                      queryBuilder: (friendshipsRecord) =>
                                          friendshipsRecord
                                              .where(
                                                'uid2',
                                                isEqualTo: currentUserUid,
                                              )
                                              .where(
                                                'uid1',
                                                isEqualTo: widget.receiverUID,
                                              )
                                              .where(
                                                'state',
                                                isEqualTo: 'pending',
                                              ),
                                      singleRecord: true,
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<FriendshipsRecord>
                                          containerFriendshipsRecordList =
                                          snapshot.data!;
                                      // Return an empty Container when the item does not exist.
                                      if (snapshot.data!.isEmpty) {
                                        return Container();
                                      }
                                      final containerFriendshipsRecord =
                                          containerFriendshipsRecordList
                                                  .isNotEmpty
                                              ? containerFriendshipsRecordList
                                                  .first
                                              : null;
                                      return Container(
                                        width: double.infinity,
                                        height: 60.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          shape: BoxShape.rectangle,
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      14.0, 0.0, 0.0, 0.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  try {
                                                    final result =
                                                        await FirebaseFunctions
                                                            .instance
                                                            .httpsCallable(
                                                                'acceptFriendRequest')
                                                            .call({
                                                      "requestDocId":
                                                          containerFriendshipsRecord
                                                              ?.reference.id,
                                                    });
                                                    _model.cloudFunctionx0h =
                                                        AcceptFriendRequestCloudFunctionCallResponse(
                                                      succeeded: true,
                                                    );
                                                  } on FirebaseFunctionsException catch (error) {
                                                    _model.cloudFunctionx0h =
                                                        AcceptFriendRequestCloudFunctionCallResponse(
                                                      errorCode: error.code,
                                                      succeeded: false,
                                                    );
                                                  }

                                                  setState(() {});
                                                },
                                                text: 'Accept',
                                                options: FFButtonOptions(
                                                  height: 40.0,
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  iconPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: const Color(0xFFF64668),
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            color: Colors.white,
                                                          ),
                                                  elevation: 3.0,
                                                  borderSide: const BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      14.0, 0.0, 0.0, 0.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  try {
                                                    final result =
                                                        await FirebaseFunctions
                                                            .instance
                                                            .httpsCallable(
                                                                'declineFriendRequest')
                                                            .call({
                                                      "requestDocId":
                                                          containerFriendshipsRecord
                                                              ?.reference.id,
                                                    });
                                                    _model.cloudFunction13g =
                                                        DeclineFriendRequestCloudFunctionCallResponse(
                                                      succeeded: true,
                                                    );
                                                  } on FirebaseFunctionsException catch (error) {
                                                    _model.cloudFunction13g =
                                                        DeclineFriendRequestCloudFunctionCallResponse(
                                                      errorCode: error.code,
                                                      succeeded: false,
                                                    );
                                                  }

                                                  setState(() {});
                                                },
                                                text: 'Delete',
                                                options: FFButtonOptions(
                                                  height: 40.0,
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  iconPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: const Color(0xFFF64668),
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            color: Colors.white,
                                                          ),
                                                  elevation: 3.0,
                                                  borderSide: const BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      20.0, 12.0, 20.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 60.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(12.0),
                                      shape: BoxShape.rectangle,
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'Create Bet',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium,
                                            ),
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 18.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
