import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:portfolio_pdf/presentation/screens/pdf_viewer/pdf_viewer_screen.dart';
import 'package:portfolio_pdf/presentation/widget/pdf_page.dart';

import '../data/rusume.dart';

part 'resume_state.dart';

class ResumeCubit extends Cubit<ResumeState> {
  ResumeCubit() : super(ResumeInitial());
  int currentStep=0;
  final personalFormKey = GlobalKey<FormState>();
  final profileFormKey = GlobalKey<FormState>();
  final educationFormKey = GlobalKey<FormState>();
  final workFormKey = GlobalKey<FormState>();
  final projectFormKey = GlobalKey<FormState>();
  final achievementFormKey = GlobalKey<FormState>();
  final skillFormKey = GlobalKey<FormState>();
  Resume resume=Resume();
  String pdfAlignment='RTL';

  //region Controls
  // Personal Information Controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController linkedInController = TextEditingController();
  final TextEditingController gitHubController = TextEditingController();

  // Profile Controller
  final TextEditingController profileController = TextEditingController();

  // Education Controllers
  final List<TextEditingController> degreeControllers = [TextEditingController()];
  final List<TextEditingController> universityControllers = [TextEditingController()];
  final List<TextEditingController> yearsControllers = [TextEditingController()];

  // Work Experience Controllers
  final List<TextEditingController> positionControllers = [
  TextEditingController(),
  ];
  final List<TextEditingController> companyControllers = [
    TextEditingController(),
  ];
  final List<TextEditingController> workYearsControllers = [
    TextEditingController(),
  ];

  // Project Controllers with
  final List<TextEditingController> projectNameControllers = [
    TextEditingController(),
  ];
  final List<TextEditingController> projectDetailsControllers = [
    TextEditingController(),
  ];

  // Achievement Controllers
  final List<TextEditingController> achievementNameControllers = [
    TextEditingController(),
  ];
  final List<TextEditingController> achievementDetailsControllers = [
    TextEditingController(),
  ];

  // Skill Controllers
  final List<TextEditingController> skillControllers = [
    TextEditingController(),
  ];
//endregion

  //region add sections
  addEducation()async{

    if(degreeControllers.length<3){
   degreeControllers.add(TextEditingController());
   universityControllers.add(TextEditingController());
   yearsControllers.add(TextEditingController());
  }
  }
  addAchievement(){
    if(achievementNameControllers.length<3){
      achievementNameControllers.add(TextEditingController());
      achievementDetailsControllers.add(TextEditingController());
  }
  }
  addProject(){
    if(projectNameControllers.length<3){
      projectNameControllers.add(TextEditingController());
      projectDetailsControllers.add(TextEditingController());
  }
  }
  addSkill(){
    if(skillControllers.length<3){
      skillControllers.add(TextEditingController());
  }
  }
  addWork(){
    if(positionControllers.length<3){
      positionControllers.add(TextEditingController());
      companyControllers.add(TextEditingController());
      workYearsControllers.add(TextEditingController());
  }
  }
 //endregion

  //region steps view
  void onStepTapped(int index){
    if(currentStep>index){
      currentStep=index;
    }
  }
  void onStepContinue(BuildContext context){
   if(currentStep==0&&personalFormKey.currentState!.validate()){
     currentStep++;
   }else if(currentStep==1&&profileFormKey.currentState!.validate()){
     currentStep++;
   }else if(currentStep==2&&educationFormKey.currentState!.validate()){
     currentStep++;
   }else if(currentStep==3&&workFormKey.currentState!.validate()){
     currentStep++;
   }else if(currentStep==4&&projectFormKey.currentState!.validate()){
     currentStep++;
   }else if(currentStep==5&&achievementFormKey.currentState!.validate()){
     currentStep++;
   }else if(currentStep==6&&skillFormKey.currentState!.validate()){
     formToModel();
     modelToPdf(context);
   }
  }
  //endregion

  //region Pdf
  formToModel(){
    resume.personalInformation=PersonalInformation(
        nameController.text,
        phoneController.text,
        emailController.text,
        addressController.text,
        linkedInController.text,
        gitHubController.text);
    //--------------------------------------------------------
    resume.profile=Profile(profileController.text);
    //-------------------------------------------
    print(degreeControllers.length);
    resume.educations=[];
     for (int i=0;i<degreeControllers.length;i++) {
       resume.educations!.add(
           Education(degreeControllers[i].text,
               universityControllers[i].text,
               yearsControllers[i].text)
       );
     }
     //-------------------------------------------
    resume.workExperiences=[];
     for (int i=0;i<positionControllers.length;i++) {
       resume.workExperiences!.add(
           WorkExperience(positionControllers[i].text,
               companyControllers[i].text,
               workYearsControllers[i].text)
       );
     }
     //-------------------------------------------
    resume.projects=[];

     for (int i=0;i<projectNameControllers.length;i++) {
       resume.projects!.add(
           Project(projectNameControllers[i].text,
               projectDetailsControllers[i].text,
           )
       );
     }
    //-------------------------------------------
    resume.achievements=[];

    for (int i=0;i<achievementNameControllers.length;i++) {
      resume.achievements!.add(
          Achievement(achievementNameControllers[i].text,
            achievementDetailsControllers[i].text,
          )
      );
    }
    //-------------------------------------------
    resume.skills=[];

    for (int i=0;i<skillControllers.length;i++) {
      resume.skills!.add(
          Skill(skillControllers[i].text,
          )
      );
    }


  }
  modelToPdf(BuildContext context)async{
    final pdf = pw.Document();
    final ttf = await _loadFont('assets/fonts/Cairo-Regular.ttf');

    pdf.addPage(
      pw.Page(
        pageTheme: pw.PageTheme(
          textDirection: pdfAlignment == "LTR" ? pw.TextDirection.ltr : pw.TextDirection.rtl,
        ),
        build: (pw.Context context) {
        if (pdfAlignment == "LTR" ) {
          return PdfPageWidget.englishPage(resume,);
        }
        return PdfPageWidget.arabicPage(resume, ttf);
        },
      ),
    );


    final root = Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationDocumentsDirectory();

    final file = File('${root!.path}/example.pdf');
    await file.writeAsBytes(await pdf.save());
    viewPdf(context, file);
  }

  viewPdf(BuildContext context,File file)async{
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  PdfViewerScreen(file: file)));
  }
  //endregion
  Future<pw.Font> _loadFont(String path) async {
    final fontData = await rootBundle.load(path);
    return pw.Font.ttf(fontData);
  }
}
