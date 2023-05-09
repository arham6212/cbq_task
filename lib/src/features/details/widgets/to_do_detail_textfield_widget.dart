import 'package:flutter/material.dart';

class TodoDetailTextFieldWidget extends StatelessWidget {
  const TodoDetailTextFieldWidget({
    Key? key,
    required GlobalKey<FormState> formKey,
    required TextEditingController textEditingController,
  })  : _formKey = formKey,
        _textEditingController = textEditingController,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController _textEditingController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: TextFormField(
          maxLines: 12,
          enabled: false,
          controller: _textEditingController,
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
            hintText: 'Enter your text here',
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(color: Colors.grey, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(color: Colors.grey, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(color: Colors.blue, width: 2),
            ),
            contentPadding: const EdgeInsets.all(16.0),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
          onChanged: (value) {},
        ),
      ),
    );
  }
}
