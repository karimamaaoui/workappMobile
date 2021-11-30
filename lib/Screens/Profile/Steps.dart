import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:khedma/Screens/Profile/user.dart';
import 'package:khedma/common/theme_helper.dart';


class StepScreen extends StatelessWidget {
  final int idUser;
  const StepScreen({
    Key key,
    @required this.idUser,


  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  StepsScreen(idUser:idUser),
    );
  }
}

class StepsScreen extends StatefulWidget {
  final int idUser;
  const StepsScreen({
    Key key,
    @required this.idUser,
  }) : super(key: key);
  //const StepsScreen({Key key}) : super(key: key);
  @override
  _StepsScreen createState() => _StepsScreen();
}

class _StepsScreen extends State<StepsScreen> {
  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;
  final _formKey2 = GlobalKey<FormState>();
  bool checkedValue2 = false;
  bool checkboxValue2 = false;
  final _formKey3 = GlobalKey<FormState>();
  int _activeStepIndex = 0;
  TextEditingController FirstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController jobTypeController = TextEditingController();
  TextEditingController qualificationController = TextEditingController();
  TextEditingController issuedByController = TextEditingController();
  TextEditingController yearOfPassingController = TextEditingController();
  TextEditingController skillController = TextEditingController();
  TextEditingController jobApplyForController = TextEditingController();
  TextEditingController workExperienceController = TextEditingController();
  TextEditingController expectedSalaryController = TextEditingController();


  _StepsScreen();
 List<Step> stepList() => [
    Step(

      state: _activeStepIndex <= 0 ? StepState.editing : StepState.complete,
      isActive: _activeStepIndex >= 0,
      title: const Text('Personal Bio'),
      content:Form(
        key: _formKey,
        child: Column(
          children: [
            GestureDetector(
              child: Stack(
                children: [

                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                          width: 25, color: Colors.white),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 20,
                          offset: const Offset(5, 5),
                        ),
                      ],
                    ),
                    child: SvgPicture.asset(
                      "assets/icons/Step1.svg",
                      height: MediaQuery.of(context).size.height * 0.23,
                    ),
                  ),

                ],
              ),
            ),
            SizedBox(height: 30,),
            Container(
              child: TextFormField(
                decoration: ThemeHelper().textInputDecoration('First Name', 'Enter your first name'),
                controller: FirstNameController,
              ),
              decoration: ThemeHelper().inputBoxDecorationShaddow(),

            ),
            SizedBox(height: 30,),
            Container(
              child: TextFormField(
                decoration: ThemeHelper().textInputDecoration('Last Name', 'Enter your first name'),
                controller: lastNameController,

              ),
              decoration: ThemeHelper().inputBoxDecorationShaddow(),
            ),

            SizedBox(height: 20.0),
            Container(
              child: TextFormField(
                decoration: ThemeHelper().textInputDecoration(
                    "Phone", "Enter your phone number"),
                controller: phoneController,
                validator: (val) {
                  if (val.isEmpty) {
                    return "Please enter your phone number";
                  }
                  return null;
                },
              ),
              decoration: ThemeHelper().inputBoxDecorationShaddow(),
            ),
            SizedBox(height: 20.0),
            Container(
              child: TextFormField(
                decoration: ThemeHelper().textInputDecoration('Gender', 'Enter your first name'),
                controller: genderController,
              ),
              decoration: ThemeHelper().inputBoxDecorationShaddow(),
            ),





            FormField<bool>(
              builder: (state) {
                return Column(
                  children: <Widget>[

                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        state.errorText ?? '',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Theme.of(context).errorColor,fontSize: 12,),
                      ),
                    )
                  ],
                );
              },

            ),



          ],
        ),
      ),
    ),
    Step(
        state:
        _activeStepIndex <= 1 ? StepState.editing : StepState.complete,
        isActive: _activeStepIndex >= 1,
        title: const Text('Educational'),
        content: Form(
          key: _formKey2,
          child: Column(
            children: [
              GestureDetector(
                child: Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                            width: 5, color: Colors.white),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 20,
                            offset: const Offset(5, 5),
                          ),
                        ],
                      ),
                      child: SvgPicture.asset(
                        "assets/icons/Education.svg",
                        height: MediaQuery.of(context).size.height * 0.25,
                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(height: 30,),
              Container(
                child: TextFormField(
                  decoration: ThemeHelper().textInputDecoration('Job type', 'Enter your job type'),
                  controller: jobApplyForController,

                ),
                decoration: ThemeHelper().inputBoxDecorationShaddow(),
              ),

              SizedBox(height: 20.0),
              Container(
                child: TextFormField(
                  decoration: ThemeHelper().textInputDecoration('Qualification', 'Enter your Qualification'),
                  controller: qualificationController
                ),
                decoration: ThemeHelper().inputBoxDecorationShaddow(),
              ),
              SizedBox(height: 20.0),
              Container(
                child: TextFormField(
                  decoration: ThemeHelper().textInputDecoration('Issued by college', 'Enter your College name'),
                  controller: issuedByController
                ),
                decoration: ThemeHelper().inputBoxDecorationShaddow(),
              ),
              SizedBox(height: 20.0),
              Container(
                child: TextFormField(
                  decoration: ThemeHelper().textInputDecoration('Year of passing', 'Enter your year of passing'),
                  controller: yearOfPassingController
                ),
                decoration: ThemeHelper().inputBoxDecorationShaddow(),
              ),




              FormField<bool>(
                builder: (state) {
                  return Column(
                    children: <Widget>[

                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          state.errorText ?? '',
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Theme.of(context).errorColor,fontSize: 12,),
                        ),
                      )
                    ],
                  );
                },

              ),



            ],
          ),
        ),),
    Step(
      state:
      _activeStepIndex <= 1 ? StepState.editing : StepState.complete,
      isActive: _activeStepIndex >= 1,
      title: const Text('Professional'),
      content: Form(
        key: _formKey3,
        child: Column(
          children: [
            GestureDetector(
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                          width: 5, color: Colors.white),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 20,
                          offset: const Offset(5, 5),
                        ),
                      ],
                    ),
                    child: SvgPicture.asset(
                      "assets/icons/Professional.svg",
                      height: MediaQuery.of(context).size.height * 0.25,
                    ),
                  ),

                ],
              ),
            ),
            SizedBox(height: 30,),
            Container(
              child: TextFormField(
                decoration: ThemeHelper().textInputDecoration('Skill', 'Enter your Skills'),
                controller: skillController,
              ),
              decoration: ThemeHelper().inputBoxDecorationShaddow(),
            ),

            SizedBox(height: 20.0),
            Container(
              child: TextFormField(
                decoration: ThemeHelper().textInputDecoration("Job apply for", "Enter your preferred job"),
                controller: jobApplyForController,
                keyboardType: TextInputType.emailAddress,
                validator: (val) {
                  if(!(val.isEmpty) && !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$").hasMatch(val)){
                    return "Enter a valid email address";
                  }
                  return null;
                },
              ),
              decoration: ThemeHelper().inputBoxDecorationShaddow(),
            ),
            SizedBox(height: 20.0),
            Container(
              child: TextFormField(
                decoration: ThemeHelper().textInputDecoration(
                    "Work Experience",
                    "Enter your Work Experience"),
                controller: workExperienceController,
                keyboardType: TextInputType.phone,
                validator: (val) {
                  if(!(val.isEmpty) && !RegExp(r"^(\d+)*$").hasMatch(val)){
                    return "Enter a valid phone number";
                  }
                  return null;
                },
              ),
              decoration: ThemeHelper().inputBoxDecorationShaddow(),
            ),
            SizedBox(height: 20.0),
            Container(
              child: TextFormField(
                obscureText: true,
                controller: expectedSalaryController,
                decoration: ThemeHelper().textInputDecoration(
                    "Expected Salary", "Enter your expected salary"),
                validator: (val) {
                  if (val.isEmpty) {
                    return "Please enter your password";
                  }
                  return null;
                },
              ),
              decoration: ThemeHelper().inputBoxDecorationShaddow(),
            ),




            FormField<bool>(
              builder: (state) {
                return Column(
                  children: <Widget>[

                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        state.errorText ?? '',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Theme.of(context).errorColor,fontSize: 12,),
                      ),
                    )
                  ],
                );
              },

            ),



          ],
        ),
      ),),
    Step(
        state: StepState.complete,
        isActive: _activeStepIndex >= 2,
        title: const Text('Confirm'),
        content: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('FirstName: ${FirstNameController.text}'),
                Text('LastName: ${lastNameController.text}'),
                Text('Phone: ${phoneController.text}'),
                Text('Gender : ${genderController.text}'),
                Text('Job Type : ${jobTypeController.text}'),
                Text('Qualification : ${qualificationController.text}'),
                Text('Issued By College : ${issuedByController.text}'),
                Text('Year Of Passing : ${yearOfPassingController.text}'),
                Text('Skill : ${skillController.text}'),
                Text('Job Apply For : ${jobTypeController.text}'),
                Text('Work Experience : ${workExperienceController.text}'),
                Text('Expected Salary : ${expectedSalaryController.text}'),
                Text("eeeee ff")

              ],
            ))),

  ];
  @override
  Widget build(BuildContext context) {
    print("read from stepsScreen");
    return Scaffold(

      appBar: AppBar(

      ),

    body: Stepper(
        type: StepperType.vertical,
        currentStep: _activeStepIndex,
        steps: stepList(),
        onStepContinue: () {
          if (_activeStepIndex < (stepList().length - 1)) {
            setState(() {
              _activeStepIndex += 1;
            });
          } else {
            print('Submited');
          }
        },
        onStepCancel: () {
          if (_activeStepIndex == 0) {
            return;
          }

          setState(() {
            _activeStepIndex -= 1;
          });
        },
        onStepTapped: (int index) {
          setState(() {
            _activeStepIndex = index;
          });
        },

        controlsBuilder: (context, ControlsDetails controls)  {
          final isLastStep = _activeStepIndex == stepList().length - 1;
          return Container(

            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: controls.onStepContinue,
                    child: (isLastStep)
                        ? const Text('Submit')
                        : const Text('Next'),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                if (_activeStepIndex > 0)
                  Expanded(
                    child: ElevatedButton(
                      onPressed: controls.onStepCancel,
                      child: const Text('Back'),
                    ),
                  )
              ],
            ),
          );
        },
      ),
    );
  }
}