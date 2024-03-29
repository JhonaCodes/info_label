import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:alchemist/alchemist.dart';
import 'package:info_label/info_label.dart';

void main() {
  group("GOLDEN_INFO_LABEL_TEST", () {
    goldenTest('TypeInfoLabel', fileName: 'golden_type_info_label_test', builder: () {
      return GoldenTestGroup(
        children: [
          /// GoldenTestScenario for TypeInfoLabel.success
          // GoldenTestScenario(
          //   name: "TypeInfoLabel.success",
          //   child: const InfoLabel(
          //     text: "Success",
          //     typeInfoLabel: TypeInfoLabel.success,
          //   ),
          // ),

          /// GoldenTestScenario for TypeInfoLabel.error
          GoldenTestScenario(
            name: "TypeInfoLabel.error",
            child: const InfoLabel(
              text: "Error",
              typeInfoLabel: TypeInfoLabel.error,
            ),
          ),

          /// GoldenTestScenario for TypeInfoLabel.neutral
          GoldenTestScenario(
            name: "TypeInfoLabel.neutral",
            child: const InfoLabel(
              text: "Neutral",
              typeInfoLabel: TypeInfoLabel.neutral,
            ),
          ),

          /// GoldenTestScenario for TypeInfoLabel.warning
          GoldenTestScenario(
            name: "TypeInfoLabel.warning",
            child: const InfoLabel(
              text: "Warning",
              typeInfoLabel: TypeInfoLabel.warning,
            ),
          ),

          /// GoldenTestScenario for TypeInfoLabel.empty
          GoldenTestScenario(
            name: "TypeInfoLabel.empty",
            child: const InfoLabel(
              text: "Empty",
              typeInfoLabel: TypeInfoLabel.empty,
            ),
          ),

          /// GoldenTestScenario for TypeInfoLabel.dark
          GoldenTestScenario(
            name: "TypeInfoLabel.dark",
            child: const InfoLabel(
              text: "Dark",
              typeInfoLabel: TypeInfoLabel.dark,
            ),
          ),

          /// GoldenTestScenario for TypeInfoLabel.info
          GoldenTestScenario(
            name: "TypeInfoLabel.info",
            child: const InfoLabel(
              text: "Info",
              typeInfoLabel: TypeInfoLabel.info,
            ),
          ),

          /// GoldenTestScenario for TypeInfoLabel.pending
          GoldenTestScenario(
            name: "TypeInfoLabel.pending",
            child: const InfoLabel(
              text: "Pending",
              typeInfoLabel: TypeInfoLabel.pending,
            ),
          ),

          /// GoldenTestScenario for TypeInfoLabel.confirmed
          GoldenTestScenario(
            name: "TypeInfoLabel.confirmed",
            child: const InfoLabel(
              text: "Confirmed",
              typeInfoLabel: TypeInfoLabel.confirmed,
            ),
          ),

          /// GoldenTestScenario for TypeInfoLabel.expired
          GoldenTestScenario(
            name: "TypeInfoLabel.expired",
            child: const InfoLabel(
              text: "Expired",
              typeInfoLabel: TypeInfoLabel.expired,
            ),
          ),

          /// GoldenTestScenario for TypeInfoLabel.disabled
          GoldenTestScenario(
            name: "TypeInfoLabel.disabled",
            child: const InfoLabel(
              text: "Disabled",
              typeInfoLabel: TypeInfoLabel.disabled,
            ),
          ),

          /// GoldenTestScenario for TypeInfoLabel.critical
          GoldenTestScenario(
            name: "TypeInfoLabel.critical",
            child: const InfoLabel(
              text: "Critical",
              typeInfoLabel: TypeInfoLabel.critical,
            ),
          ),

          /// GoldenTestScenario for TypeInfoLabel.none
          GoldenTestScenario(
            name: "TypeInfoLabel.none",
            child: const InfoLabel(
              text: "None",
              typeInfoLabel: TypeInfoLabel.none,
            ),
          ),
        ],
      );
    });

    goldenTest('Left - Right icon', fileName: 'golden_type_info_icons_test', builder: (){
          return GoldenTestGroup(

            children: [

              GoldenTestScenario(
                name: "TypeInfoLabel.info + Left icon",
                child: const InfoLabel(
                  text: "Info",
                  leftIcon: Icon(Icons.error_outline, size: 12,),
                  typeInfoLabel: TypeInfoLabel.info,
                ),
              ),

              GoldenTestScenario(
                name: "TypeInfoLabel.info + Right icon",
                child: const InfoLabel(
                  text: "Info",
                  rightIcon: Icon(Icons.error_outline, size: 12,),
                  typeInfoLabel: TypeInfoLabel.info,
                ),
              ),


              GoldenTestScenario(
                name: "TypeInfoLabel.info + Right and left icon",
                child: const InfoLabel(
                  text: "Info",
                  rightIcon: Icon(Icons.arrow_forward,size: 12,),
                  leftIcon:  Icon(Icons.arrow_back,size: 12,),
                  typeInfoLabel: TypeInfoLabel.info,
                ),
              ),

            ],

          );
        });


    goldenTest('Variations of Customized InfoLabel Tests', fileName: 'golden_customized_info_label_variations_test', builder: (){
      return GoldenTestGroup(
        children: [
          // Customized InfoLabel 1
          // GoldenTestScenario(
          //   name: "Customized InfoLabel 1",
          //   child: const InfoLabel(
          //     text: "Custom 1",
          //     typeInfoLabel: TypeInfoLabel.warning,
          //     backgroundColor: Colors.yellow,
          //     textColor: Colors.black,
          //     fontSize: 16,
          //     roundedCorners: 10,
          //     margins: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          //     typeColor: TypeDistributionColor.fullContrast,
          //   ),
          // ),

          // Customized InfoLabel 2
          GoldenTestScenario(
            name: "Customized InfoLabel 2",
            child: const InfoLabel(
              text: "Custom 2",
              typeInfoLabel: TypeInfoLabel.info,
              backgroundColor: Colors.blue,
              textColor: Colors.white,
              fontSize: 20,
              roundedCorners: 20,
              margins: EdgeInsets.all(16),
              typeColor: TypeDistributionColor.solidBorderTextContrastBackground,
            ),
          ),

          // Customized InfoLabel 3
          GoldenTestScenario(
            name: "Customized InfoLabel 3",
            child: const InfoLabel(
              text: "Custom 3",
              typeInfoLabel: TypeInfoLabel.error,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 18,
              roundedCorners: 8,
              margins: EdgeInsets.symmetric(horizontal: 20),
              typeColor: TypeDistributionColor.solidTextContrastBackgroundBorder,
            ),
          ),

          // Customized InfoLabel 4
          GoldenTestScenario(
            name: "Customized InfoLabel 4",
            child: const InfoLabel(
              text: "Custom 4",
              typeInfoLabel: TypeInfoLabel.success,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 14,
              roundedCorners: 12,
              margins: EdgeInsets.all(12),
              typeColor: TypeDistributionColor.solidBackgroundBorderContrastText,
            ),
          ),

          // Customized InfoLabel 5
          GoldenTestScenario(
            name: "Customized InfoLabel 5",
            child: const InfoLabel(
              text: "Custom 5",
              typeInfoLabel: TypeInfoLabel.warning,
              backgroundColor: Colors.amber,
              textColor: Colors.black,
              fontSize: 16,
              roundedCorners: 10,
              margins: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              typeColor: TypeDistributionColor.solidTextContrastBackgroundBorder,
            ),
          ),

          // Customized InfoLabel 6
          GoldenTestScenario(
            name: "Customized InfoLabel 6",
            child: const InfoLabel(
              text: "Custom 6",
              typeInfoLabel: TypeInfoLabel.info,
              backgroundColor: Colors.blue,
              textColor: Colors.white,
              fontSize: 18,
              roundedCorners: 8,
              margins: EdgeInsets.all(10),
              typeColor: TypeDistributionColor.solidBorderTextContrastBackground,
            ),
          ),

          // Customized InfoLabel 7
          GoldenTestScenario(
            name: "Customized InfoLabel 7",
            child: const InfoLabel(
              text: "Custom 7",
              typeInfoLabel: TypeInfoLabel.error,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 20,
              roundedCorners: 15,
              margins: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              typeColor: TypeDistributionColor.solidTextContrastBackgroundBorder,
            ),
          ),

          // Customized InfoLabel 8
          GoldenTestScenario(
            name: "Customized InfoLabel 8",
            child: const InfoLabel(
              text: "Custom 8",
              typeInfoLabel: TypeInfoLabel.warning,
              backgroundColor: Colors.amber,
              textColor: Colors.black,
              fontSize: 14,
              roundedCorners: 12,
              margins: EdgeInsets.all(16),
              typeColor: TypeDistributionColor.solidBorderTextContrastBackground,
            ),
          ),

          // Customized InfoLabel 9
          GoldenTestScenario(
            name: "Customized InfoLabel 9",
            child: const InfoLabel(
              text: "Custom 9",
              typeInfoLabel: TypeInfoLabel.info,
              backgroundColor: Colors.blue,
              textColor: Colors.white,
              fontSize: 16,
              roundedCorners: 10,
              margins: EdgeInsets.symmetric(horizontal: 24),
              typeColor: TypeDistributionColor.solidBackgroundTextContrastBorder,
            ),
          ),

          // Customized InfoLabel 10
          GoldenTestScenario(
            name: "Customized InfoLabel 10",
            child: const InfoLabel(
              text: "Custom 10",
              typeInfoLabel: TypeInfoLabel.success,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 20,
              roundedCorners: 15,
              margins: EdgeInsets.all(20),
              typeColor: TypeDistributionColor.fullContrast,
            ),
          ),

          // Customized InfoLabel 11
          GoldenTestScenario(
            name: "Customized InfoLabel 11",
            child: const InfoLabel(
              text: "Custom 11",
              typeInfoLabel: TypeInfoLabel.pending,
              backgroundColor: Colors.orange,
              textColor: Colors.black,
              fontSize: 18,
              roundedCorners: 8,
              margins: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              typeColor: TypeDistributionColor.solidBorderTextContrastBackground,
            ),
          ),

          // Customized InfoLabel 12
          GoldenTestScenario(
            name: "Customized InfoLabel 12",
            child: const InfoLabel(
              text: "Custom 12",
              typeInfoLabel: TypeInfoLabel.info,
              backgroundColor: Colors.blue,
              textColor: Colors.white,
              fontSize: 16,
              roundedCorners: 12,
              margins: EdgeInsets.all(16),
              typeColor: TypeDistributionColor.solidBorderTextContrastBackground,
            ),
          ),

          // Customized InfoLabel 13
          GoldenTestScenario(
            name: "Customized InfoLabel 13",
            child: const InfoLabel(
              text: "Custom 13",
              typeInfoLabel: TypeInfoLabel.warning,
              backgroundColor: Colors.amber,
              textColor: Colors.black,
              fontSize: 18,
              roundedCorners: 10,
              margins: EdgeInsets.all(12),
              typeColor: TypeDistributionColor.solidBackgroundBorderContrastText,
            ),
          ),

          // Customized InfoLabel 14
          GoldenTestScenario(
            name: "Customized InfoLabel 14",
            child: const InfoLabel(
              text: "Custom 14",
              typeInfoLabel: TypeInfoLabel.success,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 20,
              roundedCorners: 15,
              margins: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              typeColor: TypeDistributionColor.fullContrast,
            ),
          ),

          // Customized InfoLabel 15
          GoldenTestScenario(
            name: "Customized InfoLabel 15",
            child: const InfoLabel(
              text: "Custom 15",
              typeInfoLabel: TypeInfoLabel.info,
              backgroundColor: Colors.blue,
              textColor: Colors.white,
              fontSize: 18,
              roundedCorners: 12,
              margins: EdgeInsets.all(20),
              typeColor: TypeDistributionColor.solidBorderTextContrastBackground,
            ),
          ),

          // Customized InfoLabel 16
          GoldenTestScenario(
            name: "Customized InfoLabel 16",
            child: const InfoLabel(
              text: "Custom 16",
              typeInfoLabel: TypeInfoLabel.error,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16,
              roundedCorners: 10,
              margins: EdgeInsets.all(12),
              typeColor: TypeDistributionColor.solidTextContrastBackgroundBorder,
            ),
          ),

          // Customized InfoLabel 17
          GoldenTestScenario(
            name: "Customized InfoLabel 17",
            child: const InfoLabel(
              text: "Custom 17",
              typeInfoLabel: TypeInfoLabel.warning,
              backgroundColor: Colors.amber,
              textColor: Colors.black,
              fontSize: 20,
              roundedCorners: 15,
              margins: EdgeInsets.all(16),
              typeColor: TypeDistributionColor.solidBorderTextContrastBackground,
            ),
          ),

          // Customized InfoLabel 18
          GoldenTestScenario(
            name: "Customized InfoLabel 18",
            child: const InfoLabel(
              text: "Custom 18",
              typeInfoLabel: TypeInfoLabel.info,
              backgroundColor: Colors.blue,
              textColor: Colors.white,
              fontSize: 18,
              roundedCorners: 12,
              margins: EdgeInsets.all(20),
              typeColor: TypeDistributionColor.solidBorderTextContrastBackground,
            ),
          ),

          // Customized InfoLabel 19
          GoldenTestScenario(
            name: "Customized InfoLabel 19",
            child: const InfoLabel(
              text: "Custom 19",
              typeInfoLabel: TypeInfoLabel.success,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16,
              roundedCorners: 10,
              margins: EdgeInsets.all(12),
              typeColor: TypeDistributionColor.solidBorderTextContrastBackground,
            ),
          ),

          // Customized InfoLabel 20
          GoldenTestScenario(
            name: "Customized InfoLabel 20",
            child: const InfoLabel(
              text: "Custom 20",
              typeInfoLabel: TypeInfoLabel.warning,
              backgroundColor: Colors.amber,
              textColor: Colors.black,
              fontSize: 20,
              roundedCorners: 15,
              margins: EdgeInsets.all(16),
              typeColor: TypeDistributionColor.solidBorderTextContrastBackground,
            ),
          ),
        ],
      );
    });



  });
}
