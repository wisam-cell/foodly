import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:foodlyluss/Helpers/navigator_helper.dart';
import 'package:foodlyluss/Screens/filter_screen.dart';
import 'package:foodlyluss/Widgets/icon_container.dart';
class SearchFilterRow extends StatefulWidget {
  final Function(String)? onChanged;
  const SearchFilterRow({
    this.onChanged,
    super.key});

  @override
  State<SearchFilterRow> createState() => _SearchFilterRowState();
}

class _SearchFilterRowState extends State<SearchFilterRow>with NavigatorHelper {
  late AppLocalizations applocale = AppLocalizations.of(context)!;
  final Color _greyColor = const Color(0xffC9C5C4);

  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: TextField(
                   controller: controller,
                 onChanged:widget.onChanged ,
                 decoration: InputDecoration(
                   filled: true,
                   fillColor: Colors.white,

                   hintText: applocale.searchFilter,
                   hintStyle: TextStyle(
                     color: _greyColor,
                     fontWeight: FontWeight.w500,
                     fontSize: 14.sp,
                   ),
                   prefixIcon: Icon(
                     Icons.search,
                     color: _greyColor,
                   ),

                   enabledBorder: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(15.r),
                       borderSide: BorderSide.none
                   ),
                   focusedBorder: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(15.r),
                       borderSide: BorderSide.none
                   ),

                 ),
              ),
            ),
        SizedBox(width: 13.w,),
        IconContainer(icon: 'filter_icon',onTap: ()=>jump(context, to: FilterScreen()),)
      ],
    );
  }
}
