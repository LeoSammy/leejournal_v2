import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:leejournal/utils/utils.dart';
import 'package:leejournal/widgets/widgets.dart';

class MomentBody extends StatefulWidget {
  String initialText;
  String initTitle;

  MomentBody({
   super.key,
    required this.initTitle,
   required this.initialText});

  @override
  State<MomentBody> createState() => _MomentBodyState();
}

class _MomentBodyState extends State<MomentBody> {
  bool _isEditingText = false;
  late TextEditingController _editingController;
  late TextEditingController _editingControllerTitle;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _editingController = TextEditingController(text: widget.initialText);
    _editingControllerTitle = TextEditingController(text: widget.initTitle);

  }

  @override
  void dispose() {
    _editingController.dispose();
    _editingControllerTitle.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    if (_isEditingText) {
      return Column(

        children: [
          //TODO : update to change image on tap
          InkWell(
            onTap: (){
              print("Change image");
            },
            child: Container(
              height: size.height * 0.22,
              decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(AppLayout.getHeight(10)),
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/img1.png'))
              ),
            ),
          ),
          Gap(AppLayout.getHeight(10)),
          EditableText(
              onSubmitted: (newValue){
                setState(() {
                  widget.initTitle = newValue;
                  _isEditingText =false;
                });
              },
              textAlign: TextAlign.start,
              minLines: 1,
              maxLines: 3, // Allows for multiple lines
             // expands: true, // Expands to fill the available space
              keyboardType: TextInputType.multiline,
              //autofocus: true,
              controller: _editingControllerTitle,
              focusNode: FocusNode(),
              style: TextStyle(
                wordSpacing: 1.5,
                fontSize: 13.5,
                backgroundColor: Colors.white.withOpacity(0.5),
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.w600,
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
              cursorColor: Styles.primaryColor,
              backgroundCursorColor: Styles.primaryColorLight),
          Gap(AppLayout.getHeight(10)),
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
                fontSize: 12.5,
                fontFamily: 'Urbanist-Medium',
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
