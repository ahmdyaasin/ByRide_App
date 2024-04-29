import 'package:byride_app/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class DefaultTextInput extends StatelessWidget {
  const DefaultTextInput(
      {super.key,
      this.textController,
      this.label,
      this.icon,
      this.hint,
      this.type,
      this.onchange,
      this.intialValue, required this.password});
  final TextEditingController? textController;
  final String? label;
  final PhosphorIconData? icon;
  final String? hint;
  final TextInputType? type;
  final Function(String)? onchange;
  final String? intialValue;
  final bool password;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: const EdgeInsets.only(bottom: 5),
              child: label != null
                  ? Text(
                      label!,
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Colors.black54),
                    )
                  : null),
          onchange == null
              ? TextFormField(
                  controller: textController,
                  obscureText: password,
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Colors.black87),
                  decoration: InputDecoration(
                    hintText: hint,
                    hintStyle: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Colors.black38),
                    prefixIcon: Padding(
                        padding:
                            const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                        child: PhosphorIcon(
                          icon ?? PhosphorIconsDuotone.pencil,
                          color: primaryColor,
                          
                          size: 25,
                        )),
                    isDense: true,
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                    // hintText: hintText,
                    filled: true,
                    fillColor: Colors.grey[50],
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide:  BorderSide(
                        color: textGrey.withOpacity(0.2),
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(
                        color: primaryColor,
                        width: 2.0,
                      ),
                    ),
                  ))
              : intialValue != null
                  ? TextFormField(
                    obscureText: password,
                      initialValue: intialValue,
                      textAlign: TextAlign.left,
                      onChanged: onchange as void Function(String),
                      keyboardType: type,
                      controller: textController,
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Colors.black87),
                      decoration: InputDecoration(
                        hintText: hint,
                        hintStyle: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Colors.black38),
                        prefixIcon: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 12),
                            child: PhosphorIcon(
                              icon ?? PhosphorIconsDuotone.pencil,
                              color: primaryColor,
                              duotoneSecondaryColor: secondaryColor,
                              
                              size: 25,
                            )),
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 8),
                        // hintText: hintText,
                        filled: true,
                        fillColor: Colors.grey[50],
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                            color: primaryColorLow,
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                            color: primaryColor,
                            width: 2.0,
                          ),
                        ),
                      ))
                  : TextFormField(
                    obscureText: password,
                      textAlign: TextAlign.left,
                      onChanged: onchange as void Function(String),
                      keyboardType: type,
                      controller: textController,
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Colors.black87),
                      decoration: InputDecoration(
                        hintText: hint,
                        hintStyle: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Colors.black38),
                        prefixIcon: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 12),
                            child: PhosphorIcon(
                              icon ?? PhosphorIconsDuotone.pencil,
                              color: primaryColor,
                              duotoneSecondaryColor: secondaryColor,
                              
                              size: 25,
                            )),
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 8),
                        // hintText: hintText,
                        filled: true,
                        fillColor: Colors.grey[50],
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                            color: primaryColorLow,
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                            color: primaryColor,
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
        ],
      ),
    );
  }
}
