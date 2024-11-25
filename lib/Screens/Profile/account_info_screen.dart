import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodlyluss/Widgets/app_text_field.dart';
import 'package:foodlyluss/Widgets/custom_app_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:foodlyluss/Widgets/my_button.dart';
class AccountInfoScreen extends StatefulWidget {
  const AccountInfoScreen({super.key});

  @override
  State<AccountInfoScreen> createState() => _AccountInfoScreenState();
}

class _AccountInfoScreenState extends State<AccountInfoScreen> {
  late AppLocalizations applocale = AppLocalizations.of(context)!;

  late TextEditingController nameditingController;
  late TextEditingController emaileditingController;
  late TextEditingController mobileeditingController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameditingController = TextEditingController();
    emaileditingController = TextEditingController();
    mobileeditingController = TextEditingController();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    nameditingController.dispose();
    emaileditingController.dispose();
    mobileeditingController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: applocale.accountInformation),
          Expanded(
              child: ListView(
                shrinkWrap: true,
                padding:EdgeInsets.symmetric(horizontal: 30.w),
                children: [
                  SizedBox(height: 100.h,),
                  AppTextField(
                      controller: nameditingController,
                      hint: 'wisam',

                     hasEditIcon: true,

                  ),
                  SizedBox(height: 20.h,),
                  AppTextField(
                      controller: emaileditingController,
                      hint: 'email@email.com',
                    inputType: TextInputType.emailAddress,
                    hasEditIcon: true,

                  ),
                  SizedBox(height: 20.h,),
                  AppTextField(
                      controller: mobileeditingController,
                      hint: '06516584',
                      inputType: TextInputType.number,
                    hasEditIcon: true,

                  ),
                  SizedBox(height: 50.h,),
                  MyButton(text: applocale.saveChanges)

                ],
              ))

        ],
      ),
    );
  }
}
