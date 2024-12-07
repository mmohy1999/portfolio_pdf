import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../logic/resume_cubit.dart';
import 'widgets/achievements.dart';
import 'widgets/education.dart';
import 'widgets/personal_information.dart';
import 'widgets/profile.dart';
import 'widgets/projects.dart';
import 'widgets/skills.dart';
import 'widgets/work_experience.dart';


class DataScreen extends StatefulWidget {
  const DataScreen({super.key, required this.alignment});
  final String alignment;

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResumeCubit(),
      child: BlocBuilder<ResumeCubit, ResumeState>(
        builder: (context, state) {
          ResumeCubit cubit= context.read<ResumeCubit>();
          cubit.pdfAlignment=widget.alignment;
          return Scaffold(
            body: SafeArea(child:
            Stepper(steps: [
              Step(
                  isActive: cubit.currentStep == 0,
                  title:  const Text("Personal Information"),
                  content: const PersonalInformation()
              ),
              Step(
                isActive: cubit.currentStep == 1,
                title:  const Text("Profile"),
                content: const Profile(),
              ),
              Step(
                isActive: cubit.currentStep == 2,
                title: const Text('Education'),
                content: const Education(),
              ),
              Step(
                isActive: cubit.currentStep == 3,
                title: const Text('Work Experience'),
                content: const WorkExperience(),
              ),
              Step(
                isActive: cubit.currentStep == 4,
                title: const Text('Projects'),
                content: const Projects(),
              ),
              Step(
                isActive: cubit.currentStep == 5,
                title: const Text('Achievements'),
                content: const Achievements(),
              ),
              Step(
                isActive: cubit.currentStep == 6,
                title: const Text('Skills'),
                content: const Skills(),
              ),
            ],
              onStepTapped: (value) {
                setState(() {
                  cubit.onStepTapped(value);
                });
              },
              currentStep: cubit.currentStep,
              onStepContinue: () {
                setState(() {
                  cubit.onStepContinue(context);
                });
              },

            )),
          );
        },
      ),
    );
  }
}
