import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pets_app/core/resources/color_manager.dart';
import 'package:pets_app/core/utils/helpers/helper_functons.dart';

class DefaultTextFormField extends StatefulWidget {
  const DefaultTextFormField({
    this.textEditingController,
    this.isPassword = false,
    this.validator,
    required this.hintText,
    this.prefixImageName,
    this.textInputType,
    this.onChanged,
    this.maxLines = 1,
    this.isSearch = false,
    this.textCapitalization = TextCapitalization.none,
    this.textInputFormatter,
    super.key,
  });
  final TextEditingController? textEditingController;
  final bool isPassword;
  final String? Function(String?)? validator;
  final String hintText;
  final String? prefixImageName;
  final TextInputType? textInputType;
  final void Function(String)? onChanged;
  final int? maxLines;
  final bool isSearch;
  final TextCapitalization textCapitalization;
  final TextInputFormatter? textInputFormatter;

  @override
  State<DefaultTextFormField> createState() => _DefaultTextFormFieldState();
}

class _DefaultTextFormFieldState extends State<DefaultTextFormField> {
  late bool isObscure = widget.isPassword;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      onEditingComplete: () {
        FocusManager.instance.primaryFocus!.nextFocus();
      },
      inputFormatters: widget.textInputFormatter == null
          ? []
          : [
              widget.textInputFormatter!,
            ],
      textCapitalization: widget.textCapitalization,
      textInputAction: TextInputAction.done,
      controller: widget.textEditingController,
      onChanged: widget.onChanged,
      cursorColor: ColorManager.primary,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: widget.textInputType,
      style: HelperFunction.textTheme(context).bodySmall,
      maxLines: widget.maxLines,
      decoration: InputDecoration(
        errorMaxLines: 2,
        filled: true,
        fillColor: ColorManager.white,
        prefixIcon: widget.prefixImageName != null
            ? SvgPicture.asset(
                'assets/icons/${widget.prefixImageName}.svg',
                fit: BoxFit.scaleDown,
              )
            : null,
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
                icon: Icon(
                  isObscure ? Icons.visibility_off : Icons.visibility,
                  color: ColorManager.grey,
                ),
              )
            : null,
        hintText: widget.hintText,
        hintStyle: HelperFunction.textTheme(context).bodySmall,
        border: OutlineInputBorder(
          
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(color: ColorManager.grey,width: 2.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(
            color: ColorManager.primary,
            width: 2,
          ),
        ),
        errorStyle: HelperFunction.textTheme(context).bodyMedium!.copyWith(
              color: const Color.fromARGB(255, 255, 0, 0),
            ),
      ),
      validator: widget.validator,
      obscureText: isObscure,
    );
  }
}
