import 'package:flutter/material.dart';
import 'package:leejournal/utils/utils.dart';
import 'package:leejournal/widgets/small_text.dart';

class Speak2NoteBody extends StatefulWidget {
  String initialText;

  Speak2NoteBody({
    super.key,
    required this.initialText
   });

  @override
  State<Speak2NoteBody> createState() => _MomentBodyState();
}

class _MomentBodyState extends State<Speak2NoteBody> {
  bool _isEditingText = false;
  late TextEditingController _editingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _editingController = TextEditingController(text: widget.initialText);

  }

  @override
  void dispose() {
    _editingController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    if (_isEditingText) {
      return Column(
        children: [
          EditableText(
              onSubmitted: (newValue){
                setState(() {
                  widget.initialText = newValue;
                  _isEditingText =false;
                });
              },
              maxLines: null, // Allows for multiple lines
              expands: true, // Expands to fill the available space
              keyboardType: TextInputType.multiline,
              //autofocus: true,
              controller: _editingController,
              focusNode: FocusNode(),
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Urbanist-Medium',
                fontWeight: FontWeight.w500,
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
              cursorColor: Styles.primaryColor,
              backgroundCursorColor: Styles.primaryColorLight),
        ],
      );
    }
    return InkWell(
        onTap: () {
          setState(() {
            _isEditingText = true;
          });
        },
        child: SmallText(
          size: AppLayout.getHeight(12),
          color: Theme.of(context).textTheme.bodyLarge?.color,
          text : widget.initialText,)
    );
  }
}