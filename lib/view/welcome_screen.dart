import 'package:educate/local/cache_helper.dart';
import 'package:educate/widgets/constant.dart';
import 'package:educate/widgets/custom_buttonn.dart';
import 'package:educate/widgets/custom_form_field.dart';
import 'package:educate/widgets/navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  static GlobalKey<FormState> formKey = GlobalKey<FormState>();
  static TextEditingController userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height*0.15,),
                  SizedBox(
                    width: Get.width * 0.75,
                    height: Get.width * 0.75,
                    child: Lottie.asset("assets/lottie/animation_lmaqueo3.json"),
                  ),
                  const SizedBox(height: 20,),
                  CustomFormField(
                    controller: userNameController,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return 'رجائا ادخل الاسم';
                      }
                    },
                    hintText: 'الاسم',
                  ),
                  const SizedBox(height: 20,),
                  CustomBottomm(
                    borderRadius: BorderRadius.circular(16),
                    horizontal: 10,
                    vertical: 12,
                    fontSize: 16,
                    colorText: KprimaryScafoldColor,
                    fontWeight: FontWeight.bold,
                    text: 'التالي',
                    colorBottom: KprimaryColor,
                    onTap: (){
                      if (formKey.currentState!.validate()) {
                        CacheHelper.saveData(key:'name',value: userNameController.text);
                        navigateAndFinish(context, const HomeScreen());

                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
