import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'bet_card_model.dart';
export 'bet_card_model.dart';

class BetCardWidget extends StatefulWidget {
  const BetCardWidget({super.key});

  @override
  _BetCardWidgetState createState() => _BetCardWidgetState();
}

class _BetCardWidgetState extends State<BetCardWidget> {
  late BetCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BetCardModel());

    _model.betCaptionController ??= TextEditingController();

    _model.senderOddsController ??= TextEditingController();

    _model.receiverOddsController ??= TextEditingController();

    _model.betAmountController ??= TextEditingController();

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
                child: Container(
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
                        StreamBuilder<List<UsersRecord>>(
                          stream: queryUsersRecord(),
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
                            List<UsersRecord> dropDownUsersRecordList =
                                snapshot.data!;
                            return FlutterFlowDropDown<String>(
                              controller: _model.dropDownValueController ??=
                                  FormFieldController<String>(
                                _model.dropDownValue ??= null,
                              ),
                              options: List<String>.from(dropDownUsersRecordList
                                  .map((e) => e.uid)
                                  .toList()),
                              optionLabels: dropDownUsersRecordList
                                  .map((e) => e.email)
                                  .toList(),
                              onChanged: (val) =>
                                  setState(() => _model.dropDownValue = val),
                              width: 300.0,
                              height: 50.0,
                              searchHintTextStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
                              searchTextStyle:
                                  FlutterFlowTheme.of(context).bodyMedium,
                              textStyle:
                                  FlutterFlowTheme.of(context).bodyMedium,
                              hintText: 'Select user to make bet',
                              searchHintText: 'Search for an item...',
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              elevation: 2.0,
                              borderColor:
                                  FlutterFlowTheme.of(context).alternate,
                              borderWidth: 2.0,
                              borderRadius: 8.0,
                              margin: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 4.0, 16.0, 4.0),
                              hidesUnderline: true,
                              isOverButton: true,
                              isSearchable: true,
                              isMultiSelect: false,
                            );
                          },
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 4.0, 16.0, 0.0),
                          child: Autocomplete<String>(
                            initialValue: const TextEditingValue(),
                            optionsBuilder: (textEditingValue) {
                              if (textEditingValue.text == '') {
                                return const Iterable<String>.empty();
                              }
                              return ['Option 1'].where((option) {
                                final lowercaseOption = option.toLowerCase();
                                return lowercaseOption.contains(
                                    textEditingValue.text.toLowerCase());
                              });
                            },
                            optionsViewBuilder: (context, onSelected, options) {
                              return AutocompleteOptionsList(
                                textFieldKey: _model.betCaptionKey,
                                textController: _model.betCaptionController!,
                                options: options.toList(),
                                onSelected: onSelected,
                                textStyle:
                                    FlutterFlowTheme.of(context).bodyMedium,
                                textHighlightStyle: const TextStyle(),
                                elevation: 4.0,
                                optionBackgroundColor:
                                    FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                optionHighlightColor:
                                    FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                maxHeight: 200.0,
                              );
                            },
                            onSelected: (String selection) {
                              setState(() =>
                                  _model.betCaptionSelectedOption = selection);
                              FocusScope.of(context).unfocus();
                            },
                            fieldViewBuilder: (
                              context,
                              textEditingController,
                              focusNode,
                              onEditingComplete,
                            ) {
                              _model.betCaptionFocusNode = focusNode;

                              _model.betCaptionController =
                                  textEditingController;
                              return TextFormField(
                                key: _model.betCaptionKey,
                                controller: textEditingController,
                                focusNode: focusNode,
                                onEditingComplete: onEditingComplete,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.betCaptionController',
                                  const Duration(milliseconds: 2000),
                                  () => setState(() {}),
                                ),
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Bet Caption',
                                  labelStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0xFFF64668),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  suffixIcon: _model
                                          .betCaptionController!.text.isNotEmpty
                                      ? InkWell(
                                          onTap: () async {
                                            _model.betCaptionController
                                                ?.clear();
                                            setState(() {});
                                          },
                                          child: const Icon(
                                            Icons.clear,
                                            color: Color(0xFF757575),
                                            size: 22.0,
                                          ),
                                        )
                                      : null,
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                                maxLines: null,
                                keyboardType: TextInputType.phone,
                                validator: _model.betCaptionControllerValidator
                                    .asValidator(context),
                              );
                            },
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 4.0, 16.0, 0.0),
                              child: SizedBox(
                                width: 100.0,
                                child: Autocomplete<String>(
                                  initialValue: const TextEditingValue(),
                                  optionsBuilder: (textEditingValue) {
                                    if (textEditingValue.text == '') {
                                      return const Iterable<String>.empty();
                                    }
                                    return ['Option 1'].where((option) {
                                      final lowercaseOption =
                                          option.toLowerCase();
                                      return lowercaseOption.contains(
                                          textEditingValue.text.toLowerCase());
                                    });
                                  },
                                  optionsViewBuilder:
                                      (context, onSelected, options) {
                                    return AutocompleteOptionsList(
                                      textFieldKey: _model.senderOddsKey,
                                      textController:
                                          _model.senderOddsController!,
                                      options: options.toList(),
                                      onSelected: onSelected,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      textHighlightStyle: const TextStyle(),
                                      elevation: 4.0,
                                      optionBackgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                      optionHighlightColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                      maxHeight: 200.0,
                                    );
                                  },
                                  onSelected: (String selection) {
                                    setState(() => _model
                                        .senderOddsSelectedOption = selection);
                                    FocusScope.of(context).unfocus();
                                  },
                                  fieldViewBuilder: (
                                    context,
                                    textEditingController,
                                    focusNode,
                                    onEditingComplete,
                                  ) {
                                    _model.senderOddsFocusNode = focusNode;

                                    _model.senderOddsController =
                                        textEditingController;
                                    return TextFormField(
                                      key: _model.senderOddsKey,
                                      controller: textEditingController,
                                      focusNode: focusNode,
                                      onEditingComplete: onEditingComplete,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.senderOddsController',
                                        const Duration(milliseconds: 2000),
                                        () => setState(() {}),
                                      ),
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Odds',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0xFFF64668),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        suffixIcon: _model.senderOddsController!
                                                .text.isNotEmpty
                                            ? InkWell(
                                                onTap: () async {
                                                  _model.senderOddsController
                                                      ?.clear();
                                                  setState(() {});
                                                },
                                                child: const Icon(
                                                  Icons.clear,
                                                  color: Color(0xFF757575),
                                                  size: 22.0,
                                                ),
                                              )
                                            : null,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      maxLines: null,
                                      keyboardType: TextInputType.phone,
                                      validator: _model
                                          .senderOddsControllerValidator
                                          .asValidator(context),
                                    );
                                  },
                                ),
                              ),
                            ),
                            Text(
                              'TO',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 20.0,
                                  ),
                            ),
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20.0, 4.0, 16.0, 0.0),
                                child: SizedBox(
                                  width: 100.0,
                                  child: Autocomplete<String>(
                                    initialValue: const TextEditingValue(),
                                    optionsBuilder: (textEditingValue) {
                                      if (textEditingValue.text == '') {
                                        return const Iterable<String>.empty();
                                      }
                                      return ['Option 1'].where((option) {
                                        final lowercaseOption =
                                            option.toLowerCase();
                                        return lowercaseOption.contains(
                                            textEditingValue.text
                                                .toLowerCase());
                                      });
                                    },
                                    optionsViewBuilder:
                                        (context, onSelected, options) {
                                      return AutocompleteOptionsList(
                                        textFieldKey: _model.receiverOddsKey,
                                        textController:
                                            _model.receiverOddsController!,
                                        options: options.toList(),
                                        onSelected: onSelected,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        textHighlightStyle: const TextStyle(),
                                        elevation: 4.0,
                                        optionBackgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                        optionHighlightColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        maxHeight: 200.0,
                                      );
                                    },
                                    onSelected: (String selection) {
                                      setState(() =>
                                          _model.receiverOddsSelectedOption =
                                              selection);
                                      FocusScope.of(context).unfocus();
                                    },
                                    fieldViewBuilder: (
                                      context,
                                      textEditingController,
                                      focusNode,
                                      onEditingComplete,
                                    ) {
                                      _model.receiverOddsFocusNode = focusNode;

                                      _model.receiverOddsController =
                                          textEditingController;
                                      return TextFormField(
                                        key: _model.receiverOddsKey,
                                        controller: textEditingController,
                                        focusNode: focusNode,
                                        onEditingComplete: onEditingComplete,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.receiverOddsController',
                                          const Duration(milliseconds: 2000),
                                          () => setState(() {}),
                                        ),
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Odds',
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0xFFF64668),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          suffixIcon: _model
                                                  .receiverOddsController!
                                                  .text
                                                  .isNotEmpty
                                              ? InkWell(
                                                  onTap: () async {
                                                    _model
                                                        .receiverOddsController
                                                        ?.clear();
                                                    setState(() {});
                                                  },
                                                  child: const Icon(
                                                    Icons.clear,
                                                    color: Color(0xFF757575),
                                                    size: 22.0,
                                                  ),
                                                )
                                              : null,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        maxLines: null,
                                        keyboardType: TextInputType.phone,
                                        validator: _model
                                            .receiverOddsControllerValidator
                                            .asValidator(context),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 4.0, 16.0, 0.0),
                            child: SizedBox(
                              width: 100.0,
                              child: Autocomplete<String>(
                                initialValue: const TextEditingValue(),
                                optionsBuilder: (textEditingValue) {
                                  if (textEditingValue.text == '') {
                                    return const Iterable<String>.empty();
                                  }
                                  return ['Option 1'].where((option) {
                                    final lowercaseOption =
                                        option.toLowerCase();
                                    return lowercaseOption.contains(
                                        textEditingValue.text.toLowerCase());
                                  });
                                },
                                optionsViewBuilder:
                                    (context, onSelected, options) {
                                  return AutocompleteOptionsList(
                                    textFieldKey: _model.betAmountKey,
                                    textController: _model.betAmountController!,
                                    options: options.toList(),
                                    onSelected: onSelected,
                                    textStyle:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    textHighlightStyle: const TextStyle(),
                                    elevation: 4.0,
                                    optionBackgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                    optionHighlightColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                    maxHeight: 200.0,
                                  );
                                },
                                onSelected: (String selection) {
                                  setState(() => _model
                                      .betAmountSelectedOption = selection);
                                  FocusScope.of(context).unfocus();
                                },
                                fieldViewBuilder: (
                                  context,
                                  textEditingController,
                                  focusNode,
                                  onEditingComplete,
                                ) {
                                  _model.betAmountFocusNode = focusNode;

                                  _model.betAmountController =
                                      textEditingController;
                                  return TextFormField(
                                    key: _model.betAmountKey,
                                    controller: textEditingController,
                                    focusNode: focusNode,
                                    onEditingComplete: onEditingComplete,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.betAmountController',
                                      const Duration(milliseconds: 2000),
                                      () => setState(() {}),
                                    ),
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Amount',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFFF64668),
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      suffixIcon: _model.betAmountController!
                                              .text.isNotEmpty
                                          ? InkWell(
                                              onTap: () async {
                                                _model.betAmountController
                                                    ?.clear();
                                                setState(() {});
                                              },
                                              child: const Icon(
                                                Icons.clear,
                                                color: Color(0xFF757575),
                                                size: 22.0,
                                              ),
                                            )
                                          : null,
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    maxLines: null,
                                    keyboardType: TextInputType.phone,
                                    validator: _model
                                        .betAmountControllerValidator
                                        .asValidator(context),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            try {
                              final result = await FirebaseFunctions.instance
                                  .httpsCallable('sendBet')
                                  .call({
                                "receiverUid": _model.dropDownValue,
                                "betCaption": _model.betCaptionController.text,
                                "senderOdds": _model.senderOddsController.text,
                                "receiverOdds":
                                    _model.receiverOddsController.text,
                                "amount": _model.betAmountController.text,
                              });
                              _model.cloudFunctionhnd =
                                  SendBetCloudFunctionCallResponse(
                                succeeded: true,
                              );
                            } on FirebaseFunctionsException catch (error) {
                              _model.cloudFunctionhnd =
                                  SendBetCloudFunctionCallResponse(
                                errorCode: error.code,
                                succeeded: false,
                              );
                            }

                            Navigator.pop(context);

                            setState(() {});
                          },
                          text: 'Send Bet',
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: const Color(0xFFF64668),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                ),
                            elevation: 3.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
