import 'package:pdf/widgets.dart' as pw;
import 'package:portfolio_pdf/data/rusume.dart';
class PdfPageWidget{

  static englishPage(Resume resume){
    return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.SizedBox(height: 6,),
          pw.Center(
              child: pw.Column(
                  children: [
                    pw.Text(resume.personalInformation!.name,style:  pw.TextStyle(fontSize: 32,fontWeight: pw.FontWeight.bold)),
                    pw.Text('${resume.personalInformation!.phone} | ${resume.personalInformation!.address}'),
                    pw.Text('${resume.personalInformation!.email} | ${resume.personalInformation!.linkedIn}'),
                    pw.Text('Github: ${resume.personalInformation!.gitHub}'),
                  ]
              )
          ),
          pw.Divider(height: 2),
          pw.SizedBox(height: 6,),
          pw.Text('Profile:',style: pw.TextStyle(fontWeight: pw.FontWeight.bold,decoration: pw.TextDecoration.underline)),
          pw.SizedBox(height: 2,),
          pw.Text(resume.profile!.profile),
          pw.Divider(height: 2),
          pw.SizedBox(height: 6,),
          pw.Text('Education:',style: pw.TextStyle(fontWeight: pw.FontWeight.bold,decoration: pw.TextDecoration.underline)),
          pw.SizedBox(height: 2,),

          for(int i=0;i<resume.educations!.length;i++)
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    mainAxisSize: pw.MainAxisSize.min,
                    children: [
                      pw.Text('${resume.educations![i].degree} degree'),
                      pw.Text('at ${resume.educations![i].university}')
                    ]
                ),
                pw.Text(resume.educations![i].years)
              ],),
          pw.Divider(height: 2),
          pw.SizedBox(height: 6,),
          pw.Text('Work Experiences:',style: pw.TextStyle(fontWeight: pw.FontWeight.bold,decoration: pw.TextDecoration.underline)),
          pw.SizedBox(height: 2,),
          for(int i=0;i<resume.workExperiences!.length;i++)
            pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text('${resume.workExperiences![i].position} (${resume.workExperiences![i].company})'),
                  pw.Text(resume.workExperiences![i].years),
                ]
            ),
          pw.Divider(height: 2),
          pw.SizedBox(height: 6,),
          pw.Text('projects:',style: pw.TextStyle(fontWeight: pw.FontWeight.bold,decoration: pw.TextDecoration.underline)),
          pw.SizedBox(height: 2,),
          for(int i=0;i<resume.projects!.length;i++)
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              mainAxisSize: pw.MainAxisSize.min,
              children: [
                pw.Text('${resume.projects![i].name}:',style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                pw.Text(resume.projects![i].details),
                pw.SizedBox(height: 4,)
              ],
            ),
          pw.Divider(height: 2),
          pw.SizedBox(height: 6,),
          pw.Text('achievements:',style: pw.TextStyle(fontWeight: pw.FontWeight.bold,decoration: pw.TextDecoration.underline)),
          pw.SizedBox(height: 2,),
          for(int i=0;i<resume.achievements!.length;i++)
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              mainAxisSize: pw.MainAxisSize.min,
              children: [
                pw.Text('${resume.achievements![i].name}:'),
                pw.Text(resume.achievements![i].details),
              ],
            ),
          pw.Divider(height: 2),
          pw.SizedBox(height: 6,),
          pw.Text('Skills:',style: pw.TextStyle(fontWeight: pw.FontWeight.bold,decoration: pw.TextDecoration.underline)),
          pw.SizedBox(height: 2,),
          pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                for(int i=0;i<resume.skills!.length;i++)
                  pw.Text('-${resume.skills![i].skill}')
              ]
          )

        ]
    );
  }
  static arabicPage(Resume resume, pw.Font font,){
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.SizedBox(height: 6),
        pw.Center(
          child: pw.Column(
            children: [
              pw.Text(resume.personalInformation!.name, style: pw.TextStyle(fontSize: 32, fontWeight: pw.FontWeight.bold, font: font)),
              pw.Text('${resume.personalInformation!.phone} | ${resume.personalInformation!.address}', style: pw.TextStyle(font: font)),
              pw.Text('${resume.personalInformation!.email} | ${resume.personalInformation!.linkedIn}', style: pw.TextStyle(font: font)),
              pw.Text('جيت هاب: ${resume.personalInformation!.gitHub}', style: pw.TextStyle(font: font)),
            ],
          ),
        ),
        pw.Divider(height: 2),
        pw.SizedBox(height: 6),
        pw.Text('الملف الشخصي:', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, decoration: pw.TextDecoration.underline, font: font)),
        pw.SizedBox(height: 2),
        pw.Text(resume.profile!.profile, style: pw.TextStyle(font: font)),
        pw.Divider(height: 2),
        pw.SizedBox(height: 6),
        pw.Text('التعليم:', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, decoration: pw.TextDecoration.underline, font: font)),
        pw.SizedBox(height: 2),

        for (int i = 0; i < resume.educations!.length; i++)
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                mainAxisSize: pw.MainAxisSize.min,
                children: [
                  pw.Text('${resume.educations![i].degree} درجة', style: pw.TextStyle(font: font)),
                  pw.Text('في ${resume.educations![i].university}', style: pw.TextStyle(font: font)),
                ],
              ),
              pw.Text(resume.educations![i].years, style: pw.TextStyle(font: font)),
            ],
          ),
        pw.Divider(height: 2),
        pw.SizedBox(height: 6),
        pw.Text('الخبرات العملية:', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, decoration: pw.TextDecoration.underline, font: font)),
        pw.SizedBox(height: 2),
        for (int i = 0; i < resume.workExperiences!.length; i++)
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text('${resume.workExperiences![i].position} (${resume.workExperiences![i].company})', style: pw.TextStyle(font: font)),
              pw.Text(resume.workExperiences![i].years, style: pw.TextStyle(font: font)),
            ],
          ),
        pw.Divider(height: 2),
        pw.SizedBox(height: 6),
        pw.Text('المشاريع:', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, decoration: pw.TextDecoration.underline, font: font)),
        pw.SizedBox(height: 2),
        for (int i = 0; i < resume.projects!.length; i++)
          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            mainAxisSize: pw.MainAxisSize.min,
            children: [
              pw.Text('${resume.projects![i].name}:', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, font: font)),
              pw.Text(resume.projects![i].details, style: pw.TextStyle(font: font)),
              pw.SizedBox(height: 4),
            ],
          ),
        pw.Divider(height: 2),
        pw.SizedBox(height: 6),
        pw.Text('الإنجازات:', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, decoration: pw.TextDecoration.underline, font: font)),
        pw.SizedBox(height: 2),
        for (int i = 0; i < resume.achievements!.length; i++)
          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            mainAxisSize: pw.MainAxisSize.min,
            children: [
              pw.Text('${resume.achievements![i].name}:', style: pw.TextStyle(font: font)),
              pw.Text(resume.achievements![i].details, style: pw.TextStyle(font: font)),
            ],
          ),
        pw.Divider(height: 2),
        pw.SizedBox(height: 6),
        pw.Text('المهارات:', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, decoration: pw.TextDecoration.underline, font: font)),
        pw.SizedBox(height: 2),
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            for (int i = 0; i < resume.skills!.length; i++)
              pw.Text('-${resume.skills![i].skill}', style: pw.TextStyle(font: font)),
          ],
        ),
      ],
    );

  }

}