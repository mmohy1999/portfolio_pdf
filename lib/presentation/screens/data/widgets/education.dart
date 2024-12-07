import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_pdf/logic/resume_cubit.dart';

class Education extends StatefulWidget {
  const Education({super.key});

  @override
  State<Education> createState() => _EducationState();
}

class _EducationState extends State<Education> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResumeCubit, ResumeState>(
      builder: (context, state) {
        ResumeCubit cubit=context.read<ResumeCubit>();
        return Form(
          key: cubit.educationFormKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for(int i = 0; i < cubit.degreeControllers.length; i++)
                educationWidget(cubit,i),
              if(cubit.degreeControllers.length<3)
              Row(
                children: [
                  const Spacer(),
                  TextButton(onPressed: () {
                    setState(() {
                      cubit.addEducation();
                    });
                  }, child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [ Icon(Icons.add),
                      SizedBox(width: 2,),
                      Text('Add Education'),
                    ],
                  )),
                  const SizedBox(width: 20,),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  Widget educationWidget(ResumeCubit cubit, int index) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 10,),
        TextFormField(
          keyboardType: TextInputType.text,
          controller: cubit.degreeControllers[index],
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your degree name';
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: 'Degree Name',
            prefixIcon: const Icon(Icons.score),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        const SizedBox(height: 10,),
        TextFormField(
          keyboardType: TextInputType.text,
          controller:cubit.universityControllers[index],
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your university name';
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: 'University Name',
            prefixIcon: const Icon(Icons.home_filled),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        const SizedBox(height: 10,),
        TextFormField(
          keyboardType: TextInputType.text,
          controller:cubit.yearsControllers[index],
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter years';
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: 'Years',
            prefixIcon: const Icon(Icons.date_range),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        const SizedBox(height: 10,),
        const Divider(),
      ],
    );
  }
}
