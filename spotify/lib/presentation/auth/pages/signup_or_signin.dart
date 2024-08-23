import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';
import 'package:spotify/common/widgets/appbar/app_bar.dart';
import 'package:spotify/common/widgets/button/basic_app_button.dart';
import 'package:spotify/core/configs/assets/app_images.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';
import 'package:spotify/presentation/auth/pages/signin.dart';
import 'package:spotify/presentation/auth/pages/signup.dart';

class SignupOrSigninPage extends StatelessWidget {
  const SignupOrSigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BasicAppBar(),
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(
              AppVectors.topPattern,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(
              AppVectors.bottomPattern,
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(
              AppImages.authBG,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AppVectors.logo,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    "Enjoy Listening To Music",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  const Text(
                    "Spotify is here to entertain you invincibly.",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                      color: AppColors.darkGrey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: BasicAppButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => SignUpPage(),
                              ),
                            );
                          },
                          title: "Register",
                        ),
                      ),
                      const SizedBox(width: 20,),
                      Expanded(
                        flex: 1,
                        child: TextButton(
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => SignInPage(),
                              ),
                            );
                          },
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: context.isDarkMode ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
