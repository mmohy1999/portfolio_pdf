import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../logic/resume_cubit.dart';

class WorkExperience extends StatefulWidget {
   const WorkExperience({super.key});

  @override
  State<WorkExperience> createState() => _WorkExperienceState();
}

class _WorkExperienceState extends State<WorkExperience> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResumeCubit, ResumeState>(
      builder: (context, state) {
        ResumeCubit cubit=context.read<ResumeCubit>();

        return Form(
          key: cubit.workFormKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for(int x = 0; x < cubit.positionControllers.length; x++)
                workWidget(cubit,x),
              if(cubit.positionControllers.length<3)
                Row(
                children: [
                  const Spacer(),
                  TextButton(onPressed: () {
                    setState(() {
                    cubit.addWork();
                    });
                  }, child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [ Icon(Icons.add),
                      SizedBox(width: 2,),
                      Text('Add Work'),
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

  Widget workWidget(ResumeCubit cubit, int index) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 10,),
        TextFormField(
          keyboardType: TextInputType.text,
          controller:cubit.positionControllers[index],
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your position name';
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: 'Position',
            prefixIcon:  const Icon(Icons.work),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        const SizedBox(height: 10,),
        TextFormField(
          keyboardType: TextInputType.text,
          controller:cubit.companyControllers[index],
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your company name';
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: 'company',
            prefixIcon:  const Icon(Icons.home_filled),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        const SizedBox(height: 10,),
        TextFormField(
          keyboardType: TextInputType.text,
          controller:cubit.workYearsControllers[index],
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter years';
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: 'Years',
            prefixIcon:  const Icon(Icons.date_range),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        const SizedBox(height: 10,),
      ],
    );
  }
}
