import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'bet_card_widget.dart' show BetCardWidget;
import 'package:flutter/material.dart';

class BetCardModel extends FlutterFlowModel<BetCardWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for BetCaption widget.
  final betCaptionKey = GlobalKey();
  FocusNode? betCaptionFocusNode;
  TextEditingController? betCaptionController;
  String? betCaptionSelectedOption;
  String? Function(BuildContext, String?)? betCaptionControllerValidator;
  // State field(s) for SenderOdds widget.
  final senderOddsKey = GlobalKey();
  FocusNode? senderOddsFocusNode;
  TextEditingController? senderOddsController;
  String? senderOddsSelectedOption;
  String? Function(BuildContext, String?)? senderOddsControllerValidator;
  // State field(s) for ReceiverOdds widget.
  final receiverOddsKey = GlobalKey();
  FocusNode? receiverOddsFocusNode;
  TextEditingController? receiverOddsController;
  String? receiverOddsSelectedOption;
  String? Function(BuildContext, String?)? receiverOddsControllerValidator;
  // State field(s) for BetAmount widget.
  final betAmountKey = GlobalKey();
  FocusNode? betAmountFocusNode;
  TextEditingController? betAmountController;
  String? betAmountSelectedOption;
  String? Function(BuildContext, String?)? betAmountControllerValidator;
  // Stores action output result for [Cloud Function - sendBet] action in Button widget.
  SendBetCloudFunctionCallResponse? cloudFunctionhnd;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    betCaptionFocusNode?.dispose();

    senderOddsFocusNode?.dispose();

    receiverOddsFocusNode?.dispose();

    betAmountFocusNode?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
