import 'package:calculatorapp/constant/colors.dart';
import 'package:calculatorapp/provide/cal_provider.dart';
import 'package:calculatorapp/screens/widgets_data.dart';
import 'package:flutter/material.dart';
import '../widgets/cal_button.dart';
import '../widgets/textfield.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    const padding = EdgeInsets.symmetric(horizontal: 25, vertical: 30);
    const decoration = BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)));

    return Consumer<CalculatorProvider>(
      builder: (context,provider,_) {
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            title: const Text("Calculator"),
            backgroundColor: Colors.black,
          ),
          body: Column(
            children: [
              CustomTextField(
                controller: provider.compController,
              ),
              const Spacer(),
              Container(
                height: screenHeight * 0.6,
                width: double.infinity,
                padding: padding,
                decoration: decoration,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(4, (index) => buttonList[index]),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(4, (index) => buttonList[index + 4]),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(4, (index) => buttonList[index + 8]),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 25),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: List.generate(
                                      3, (index) => buttonList[index + 12]),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 25),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: List.generate(
                                      3, (index) => buttonList[index + 15]),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const CalculateButton()
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}
