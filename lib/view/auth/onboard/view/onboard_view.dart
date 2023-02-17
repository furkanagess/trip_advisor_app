import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:trip_advisor_app/core/base/view/base_view.dart';
import 'package:trip_advisor_app/core/constants/svg/svg_constants.dart';
import 'package:trip_advisor_app/core/extension/context_extension.dart';
import 'package:trip_advisor_app/view/auth/onboard/model/onboard_model.dart';
import 'package:trip_advisor_app/view/auth/onboard/viewModel/onboard_view_model.dart';

class OnboardView extends StatelessWidget {
  const OnboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<OnboardViewModel>(
      viewModel: OnboardViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, OnboardViewModel viewModel) => Scaffold(
        backgroundColor: context.colors.background,
        body: Padding(
          padding: context.paddingLow,
          child: Column(
            children: [
              Spacer(
                flex: 1,
              ),
              Expanded(
                flex: 7,
                child: PageView.builder(
                  itemCount: viewModel.onBoardPages.length,
                  itemBuilder: (context, index) {
                    return buildColumnBody(context, viewModel.onBoardPages[index]);
                  },
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: ListView.builder(
                        itemCount: 3,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: context.paddingLow,
                            child: CircleAvatar(
                              radius: 10.0,
                            ),
                          );
                        },
                      ),
                    ),
                    FloatingActionButton(
                      elevation: 0,
                      backgroundColor: context.colors.onSurface,
                      child: Text(
                        "Skip",
                        style: context.textTheme.bodyText2?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: context.colors.background,
                        ),
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column buildColumnBody(BuildContext context, OnBoardModel model) {
    return Column(
      children: [
        Expanded(
          flex: 7,
          child: buildSVGPicture(model.imagePath),
        ),
        buildColumnDescription(context, model),
      ],
    );
  }

  Padding buildColumnDescription(BuildContext context, OnBoardModel model) {
    return Padding(
      padding: context.paddingMediumHorizontal,
      child: Column(
        children: [
          AutoSizeText(
            textAlign: TextAlign.center,
            maxLines: 2,
            model.title,
            style: context.textTheme.headline4?.copyWith(
              fontWeight: FontWeight.bold,
              color: context.colors.secondary,
            ),
          ),
          SizedBox(height: context.height * 0.03),
          AutoSizeText(
            textAlign: TextAlign.center,
            maxLines: 4,
            model.description,
            style: context.textTheme.subtitle1?.copyWith(fontWeight: FontWeight.w400, color: context.colors.onBackground),
          ),
        ],
      ),
    );
  }

  SvgPicture buildSVGPicture(String path) => SvgPicture.asset(path);
}
