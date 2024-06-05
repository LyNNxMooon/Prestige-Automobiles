import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:prestige_automobile/constants/colors.dart';

class AMTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? validateName;
  final Validator? validator;
  final String? hint;
  final double? cornerRadius;
  final String? initValue;
  final bool? readOnlywillshowHint;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool? autofocus;
  final bool? observeText;
  final int? maxLength;
  final Icon? preIcon;
  final Color? fillColor;
  final Color? hintColor;
  final IconButton? suffixIcon;
  final Widget? suffix;
  final bool? selection;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final bool? isEnable;
  const AMTextFormField(
      {super.key,
      this.controller,
      this.validateName,
      this.validator,
      this.hint,
      this.hintColor,
      this.cornerRadius,
      this.initValue,
      this.readOnlywillshowHint,
      this.focusNode,
      this.keyboardType,
      this.textInputAction,
      this.autofocus,
      this.observeText,
      this.maxLength,
      this.preIcon,
      this.fillColor,
      this.suffixIcon,
      this.suffix,
      this.selection = true,
      this.onChanged,
      this.onFieldSubmitted,
      this.inputFormatters,
      this.maxLines,
      this.isEnable});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: isEnable,
      maxLines: maxLines,
      maxLength: maxLength,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      autofocus: autofocus ?? false,
      obscureText: observeText ?? false,
      initialValue: initValue,
      focusNode: focusNode,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      enableInteractiveSelection: selection,
      inputFormatters: inputFormatters,
      readOnly: readOnlywillshowHint ?? false,
      validator: validator != null
          ? () {
              switch (validator) {
                case Validator.userName:
                  return (value) => TextFieldValidator.name(value, context);
                case Validator.price:
                  return (value) => TextFieldValidator.price(value);
                case Validator.email:
                  return (value) => TextFieldValidator.email(value);
                case Validator.nrcNo:
                  return (value) => TextFieldValidator.nrcNo(value);
                case Validator.phone:
                  return (value) => TextFieldValidator.phone(value);
                case Validator.password:
                  return (value) => TextFieldValidator.password(value, context);
                case Validator.social:
                  return (value) => TextFieldValidator.social(value);
                case Validator.samePhoneNumber:
                  return (value) => TextFieldValidator.samePhoneNumber(value);
                case Validator.amount:
                  return (value) => TextFieldValidator.amount(value);
                default:
                  return (value) => TextFieldValidator.defaultEnterV(value);
              }
            }()
          : validateName != null
              ? (value) {
                  return TextFieldValidator.defaultEnterV(value, validateName);
                }
              : null,

      //               Container(
      // decoration: BoxDecoration(
      //     color: Get.isDarkMode ? Colors.white24 : Colors.grey[200],
      //     borderRadius: BorderRadius.all(Radius.circular(15.sp))),
      // child:
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(top: 5, bottom: 5, left: 12),
        // border: InputBorder.none,
        fillColor: kPrimaryColor,
        // borderRadius: cornerRadius ?? 4,
        // read: readOnlywillshowHint ?? false,
        hintText: hint,
        filled: true,
        hintStyle: TextStyle(color: kThirdColor),
        prefixIcon: preIcon,
        suffix: suffix,
        suffixIcon: suffixIcon,
        suffixIconColor: kPrimaryColor,
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: kSecondaryColor),
            borderRadius: BorderRadius.circular(10)),
        border: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: kSecondaryColor),
            borderRadius: BorderRadius.circular(10)),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: kSecondaryColor),
            borderRadius: BorderRadius.circular(10)),
      ),
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}

class TextFieldValidator {
  static String? defaultEnterV([dynamic value, String? validatename]) {
    // if (value is AddressDTO) {
    //   if (value.id != null) {
    //     return null;
    //   } else {
    //     return 'Enter $validatename';
    //   }
    // }
    if (value is String && value.isEmpty) {
      return '$validatename';
    }
    return null;
  }

  static String? price(String? price) {
    if (price!.isEmpty) {
      return 'Please enter amount!';
    }
    return null;
  }

  static String? nrcNo(String? price) {
    if (price!.isEmpty) {
      return 'Enter NRC Number !';
    } else if (price.length != 6) {
      return "Please enter validate NRC Number !";
    }
    return null;
  }

  static String? social(String? link) {
    if (link!.isEmpty) {
      return 'Please enter Social Link !';
    } else if (!link.contains("https://")) {
      return "Social link must be start with https://";
    }
    return null;
  }

  static String? amount(String? price) {
    if (price!.isEmpty) {
      return 'Please enter amount!';
    } else if (price.length > 15) {
      return "Please enter validate amount !";
    } else if (price.startsWith("0")) {
      return "Amount must not start with 0";
    }
    return null;
  }

  static String? phone(String? phone) {
    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(patttern);
    if (phone!.isEmpty) {
      return 'Please enter Phone Number !';
    } else if (!regExp.hasMatch(phone)) {
      return "Please enter validate Phone Number !";
    } else if (!phone.startsWith("09")) {
      return "Phone number must be start with 09";
    }
    return null;
  }

  static String? samePhoneNumber(String? phone) {
    return "Cannot be the same with Register Phone Number";
  }

  static String? password(String? psw, BuildContext context) {
    // RegExp regExp = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
    // RegExp regExp = RegExp(r'^(?=.*?[A-Z])(?=.*?[0-9]).{6,}$');
    if (psw!.isEmpty) {
      return 'Please enter password !';
    } else if (psw.length < 8) {
      return "Password must be at least 8 digits";
      // } else if (!regExp.hasMatch(psw)) {
      //   return "Password must be one number !";
    }
    return null;
  }

  static String? email(String? email) {
    RegExp regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (email!.isEmpty) {
      // return 'Please enter email !';
      return null;
    } else if (!regExp.hasMatch(email)) {
      return "Please enter valid email !";
    }
    return null;
  }

  static String? name(String? name, BuildContext context) {
    if (name!.isEmpty) {
      return 'Please enter your name !';
    }
    return null;
  }
}

enum Validator {
  userName,
  price,
  email,
  nrcNo,
  phone,
  password,
  social,
  samePhoneNumber,
  amount
}

// class TextFromdFieldStyle {
//   static InputDecoration boxborder({
//     String? label,
//     Color? fillColor,
//     String? hint,
//     Color? hintColor,
//     bool? read,
//     Icon? preIcon,
//     double? borderRadius,
//     IconButton? suffixIcon,
//     Widget? suffix,
//   }) {
//     return InputDecoration(
//       prefixIcon: preIcon,
//       suffixIcon: suffixIcon,
//       suffix: suffix,
//       fillColor: fillColor,
//       filled: true,
//       contentPadding:
//           const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),

//       labelText: label,
//       hintText: hint,
//       hintStyle: hintColor == null
//           ? const TextStyle(color: Colors.grey)
//           : TextStyle(color: hintColor),
//       // focusedBorder: OutlineInputBorder(
//       //     borderSide: const BorderSide(width: 1, color: Colors.grey),
//       //     borderRadius: BorderRadius.circular(borderRadius!)),
//       // border: OutlineInputBorder(
//       //     borderSide: const BorderSide(width: 1, color: Colors.grey),
//       //     borderRadius: BorderRadius.circular(borderRadius)),
//       // errorBorder: OutlineInputBorder(
//       //     borderSide: const BorderSide(width: 1, color: Colors.grey),
//       //     borderRadius: BorderRadius.circular(borderRadius)),
//       // enabledBorder: OutlineInputBorder(
//       //     borderSide: const BorderSide(width: 1, color: Colors.grey),
//       //     borderRadius: BorderRadius.circular(borderRadius))
//     );
//   }
// }
