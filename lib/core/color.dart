import 'package:flutter/material.dart';

Color blueCT = const Color(0xFF3B74B9);


Widget CustomTextField({
  Function(String)? onChanged,
  String? Function(String?)? validator,
  required TextEditingController controller,
  required String label,
  required int maxLen,
  required int maxLines,
}) {
  return TextFormField(
    // focusNode: focusNode,
    // style: styleRegister1,
    controller: controller,
    cursorColor: blueCT,
    autocorrect: false,onChanged: onChanged,
    validator: validator,
    maxLength: maxLen,
    maxLines: maxLines,
    keyboardType: TextInputType.text,
    obscureText: false,
    decoration: InputDecoration(
      counterText: '',
      labelText: label,
      isDense: true,
      contentPadding: const EdgeInsets.fromLTRB(12, 20, 0, 9),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          width: 0,
          style: BorderStyle.none,
          color: blueCT,
        ),
      ),
      // hintText: 'Phone Number',
      fillColor: blueCT.withOpacity(0.1),
      filled: true,
    ),
  );
}

Future<dynamic> customAlert({
  required BuildContext context,
  required String title,
  required Widget subtitle,
  required String buttonTitle,
  required Function onPressed,
}) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: AlertDialog(
          insetPadding: EdgeInsets.zero,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          title: Builder(
            builder: (context) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  Text(title),
                  const SizedBox(height: 30),
                  Container(
                    child: subtitle,
                  ),
                ],
              );
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all( 10.0), // ada bawaan padding
              child: Row(
                children: [
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () => onPressed(),
                    child: Text( buttonTitle),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}


Future<dynamic> customAlertYesNo({
  required BuildContext context,
  required String title,
  required Widget subtitle,
  required String buttonTitle,
  required String buttonTitle2,
  required Function onPressed,
  required Function onPressed2,
}) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: AlertDialog(
          insetPadding: EdgeInsets.zero,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          title: Builder(
            builder: (context) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  Text(title),
                  const SizedBox(height: 30),
                  Container(
                    child: subtitle,
                  ),

                ],
              );
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0), // ada bawaan padding
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(),
                   ElevatedButton(
                    onPressed: () => onPressed(),
                    child: Text( buttonTitle),
                     style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                     ),

                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () => onPressed2(),
                    child: Text( buttonTitle2),

                  ),
                  const Spacer(),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}