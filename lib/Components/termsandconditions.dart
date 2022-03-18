import 'package:flutter/material.dart';
import 'package:maafos/Commons/TextStyles.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFD3184E),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
        title: Text(
          'Terms and Contions',
          style: kTextbuttonwhite,
        ),
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Container(
          padding: EdgeInsets.all(15),
          child: Text(
            "These Terms and Conditions describe the general online ordering terms and conditions between Us and You and different rights and obligations of the Parties.\n\nFor the sake of clarity, these Terms and Conditions apply (also) in case of online ordering through the MAAFOS Food delivery Application; the applications is the online ordering application used by the Client to place its order for different products and/or services.\n\nMAAFOS online ordering application is owned and operated by the licensor of the license agreement regarding the use of the application in order to order online.\nWithout affecting the generality of the present Terms and Conditions and for the sake of clarity You must also respect the license agreement regarding the use of the application in order to order online.\n\nThe Restaurant shall make all the necessary diligences to ensure that the information in relation with the online ordering is accurate and reliable. However, this cannot be infallible and errors may sometimes occur. You should take appropriate steps to verify all information in relation with the online ordering before using it. To the maximum extent permitted according to the applicable law, the Restaurant disclaims any warranty or representation of any kind, whether express or implied, as to any matter whatsoever relating to the online ordering, including without limitation the availability of the online ordering application.\n\nThe Restaurant may from time to time revise the information in relation with the online ordering application and/or process and reserves the right to make such changes without any obligation to notify any past, current or prospective clients. In no event shall the Restaurant be liable for any indirect, special, incidental or consequential damages arising out of any use of the information contained herein and/or in relation with the online ordering process.\n\nBy ordering online, you acknowledge and agree that the use of the online ordering application and/or processes at your own risk and the maximum extent permitted according to the applicable law, in no circumstances, shall We be liable for any direct, indirect, incidental, special, consequential, or punitive damages, losses, costs or expenses nor for any loss of profit that results from the use of, or inability to use this online ordering and/or any application and/or material on any site linked to this online ordering application (including but not limited to any viruses or any other errors or defects or failures in computer transmissions or network communications) even if We have been advised of the possibility of such damage. In addition, no liability can be accepted by Us in respect of any changes made to the content of the online ordering application and/or process by unauthorized third parties. All express or implied warranties or representations are excluded to the maximum extent permitted according to the applicable law.\n\nThe online ordering application and/or process may include content, information or links to third parties or third party sites. The Restaurant is not responsible for the content of any such sites or neither for the content of any third party advertising or sponsorship nor for compliance of such with any regulations. The links may be accessed at the user's own risk and the Restaurant makes no representations or warranties about the content, completeness, or accuracy of these links or the sites hyperlinked to this ordering online application. You agree to hold harmless and relieve the Restaurant from any liability whatsoever arising from your use of information from a third party or your use of any third-party website.",
            textAlign: TextAlign.justify,
          ),
        ),
      ),
    );
  }
}
