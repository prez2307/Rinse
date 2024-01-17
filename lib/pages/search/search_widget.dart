import '/backend/backend.dart';
import '/components/profile_card_widget.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:text_search/text_search.dart';
import 'search_model.dart';
export 'search_model.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget>
    with TickerProviderStateMixin {
  late SearchModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchModel());

    _model.textController ??= TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Search Users',
            style: FlutterFlowTheme.of(context).headlineSmall,
          ),
          actions: const [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 0.0),
                child: Autocomplete<String>(
                  initialValue: const TextEditingValue(),
                  optionsBuilder: (textEditingValue) {
                    if (textEditingValue.text == '') {
                      return const Iterable<String>.empty();
                    }
                    return ['Option 1'].where((option) {
                      final lowercaseOption = option.toLowerCase();
                      return lowercaseOption
                          .contains(textEditingValue.text.toLowerCase());
                    });
                  },
                  optionsViewBuilder: (context, onSelected, options) {
                    return AutocompleteOptionsList(
                      textFieldKey: _model.textFieldKey,
                      textController: _model.textController!,
                      options: options.toList(),
                      onSelected: onSelected,
                      textStyle: FlutterFlowTheme.of(context).bodyMedium,
                      textHighlightStyle: const TextStyle(),
                      elevation: 4.0,
                      optionBackgroundColor:
                          FlutterFlowTheme.of(context).primaryBackground,
                      optionHighlightColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      maxHeight: 200.0,
                    );
                  },
                  onSelected: (String selection) {
                    setState(() => _model.textFieldSelectedOption = selection);
                    FocusScope.of(context).unfocus();
                  },
                  fieldViewBuilder: (
                    context,
                    textEditingController,
                    focusNode,
                    onEditingComplete,
                  ) {
                    _model.textFieldFocusNode = focusNode;

                    _model.textController = textEditingController;
                    return TextFormField(
                      key: _model.textFieldKey,
                      controller: textEditingController,
                      focusNode: focusNode,
                      onEditingComplete: onEditingComplete,
                      onChanged: (_) => EasyDebounce.debounce(
                        '_model.textController',
                        const Duration(milliseconds: 2000),
                        () => setState(() {}),
                      ),
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Search',
                        labelStyle: FlutterFlowTheme.of(context).labelMedium,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
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
                        fillColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        prefixIcon: Icon(
                          Icons.search_outlined,
                          color: FlutterFlowTheme.of(context).secondaryText,
                        ),
                        suffixIcon: _model.textController!.text.isNotEmpty
                            ? InkWell(
                                onTap: () async {
                                  _model.textController?.clear();
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
                      validator:
                          _model.textControllerValidator.asValidator(context),
                    );
                  },
                ),
              ),
              FFButtonWidget(
                onPressed: () async {
                  await queryUsersRecordOnce()
                      .then(
                        (records) => _model.simpleSearchResults = TextSearch(
                          records
                              .map(
                                (record) => TextSearchItem.fromTerms(record, [
                                  record.email,
                                  record.phoneNumber,
                                  record.displayName]),
                              )
                              .toList(),
                        )
                            .search(_model.textController.text)
                            .map((r) => r.object)
                            .toList(),
                      )
                      .onError((_, __) => _model.simpleSearchResults = [])
                      .whenComplete(() => setState(() {}));
                },
                text: 'Search',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 40.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: const Color(0xFFF64668),
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
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
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 0.0),
                  child: Builder(
                    builder: (context) {
                      final searchresults = _model.simpleSearchResults.toList();
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        itemCount: searchresults.length,
                        itemBuilder: (context, searchresultsIndex) {
                          final searchresultsItem =
                              searchresults[searchresultsIndex];
                          return Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 1.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  enableDrag: false,
                                  context: context,
                                  builder: (context) {
                                    return GestureDetector(
                                      onTap: () => _model
                                              .unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: ProfileCardWidget(
                                          displayName:
                                              searchresultsItem.displayName,
                                          email: searchresultsItem.email,
                                          receiverUID: searchresultsItem.uid,
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              },
                              child: Container(
                                width: 100.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 0.0,
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      offset: const Offset(0.0, 1.0),
                                    )
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(40.0),
                                        child: Image.network(
                                          searchresultsItem.photoUrl,
                                          width: 60.0,
                                          height: 60.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                searchresultsItem.displayName,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      searchresultsItem.email,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(4.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      formatNumber(
                                                        searchresultsItem
                                                            .accountBalance,
                                                        formatType:
                                                            FormatType.decimal,
                                                        decimalType: DecimalType
                                                            .automatic,
                                                        currency: '',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: const Color(
                                                                    0xFFF64668),
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Card(
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        elevation: 1.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(40.0),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Icon(
                                            Icons.keyboard_arrow_right_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
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
