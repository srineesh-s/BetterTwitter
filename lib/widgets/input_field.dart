import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final bool password;
  final bool isReadOnly;
  final String placeholder;
  final String validationMessage;
  final Function? enterPressed;
  final bool smallVersion;
  final FocusNode? fieldFocusNode;
  final FocusNode? nextFocusNode;
  final TextInputAction textInputAction;
  final String? additionalNote;
  final Function(String)? onChanged;
  final bool
      noFunctionTap; //This is to stop the icon on the textfield to stop clicking.

  InputField(
      {required this.controller,
      required this.placeholder,
      this.enterPressed,
      this.noFunctionTap = false,
      this.fieldFocusNode,
      this.nextFocusNode,
      this.additionalNote,
      this.onChanged,
      this.validationMessage = " ",
      this.textInputAction = TextInputAction.next,
      this.textInputType = TextInputType.text,
      this.password = false,
      this.isReadOnly = false,
      this.smallVersion = false});

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  late bool isPassword;
  double fieldHeight = 55;

  @override
  void initState() {
    super.initState();
    isPassword = widget.password;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 71.00,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xffffffff),
            boxShadow: [
              BoxShadow(
                offset: const Offset(10.00, 20.00),
                color: const Color(0xff000000).withOpacity(0.14),
                blurRadius: 30,
              ),
            ],
            borderRadius: BorderRadius.circular(63.00),
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextFormField(
                  controller: widget.controller,
                  keyboardType: widget.textInputType,
                  focusNode: widget.fieldFocusNode,
                  textInputAction: widget.textInputAction,
                  onChanged: widget.onChanged,
                  obscureText: isPassword,
                  readOnly: widget.isReadOnly,
                  decoration: InputDecoration.collapsed(
                    hintText: widget.placeholder,
                  ),
                ),
              ),
              widget.password
                  ? Container(
                      width: fieldHeight,
                      height: fieldHeight,
                      alignment: Alignment.center,
                      child: Icon(
                          isPassword ? Icons.visibility : Icons.visibility_off))
                  : Container(
                      width: fieldHeight,
                      height: fieldHeight,
                      alignment: Alignment.center,
                      child: const Icon(Icons.perm_identity)),
            ],
          ),
        ),
        if (widget.validationMessage != null)
          Text(
            widget.validationMessage,
          ),
        if (widget.additionalNote != null) const SizedBox(height: 5),
        if (widget.additionalNote != null) Text(widget.additionalNote ?? ""),
      ],
    );
  }
}
