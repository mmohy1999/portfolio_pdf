import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../logic/resume_cubit.dart';

class Projects extends StatefulWidget {
  const Projects({super.key});

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResumeCubit, ResumeState>(
      builder: (context, state) {
        ResumeCubit cubit=context.read<ResumeCubit>();

        return Form(
          key: cubit.projectFormKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for(int x = 0; x < cubit.projectNameControllers.length; x++)
                projectWidget(cubit,x),
              if(cubit.projectNameControllers.length<3)
              Row(
                children: [
                  const Spacer(),
                  TextButton(onPressed: () {
                    setState(() {
                     cubit.addProject();
                    });
                  }, child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [ Icon(Icons.add),
                      SizedBox(width: 2,),
                      Text('Add Project'),
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

  Widget projectWidget(ResumeCubit cubit, int index) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 10,),
        TextFormField(
          keyboardType: TextInputType.text,
          controller:cubit.projectNameControllers[index],
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your project name';
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: 'project Name',
            prefixIcon:  const Icon(Icons.laptop),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        const SizedBox(height: 10,),
        TextFormField(
          keyboardType: TextInputType.text,
          controller: cubit.projectDetailsControllers[index],
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your project details';
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: 'details',
            prefixIcon:  const Icon(Icons.text_snippet_outlined),
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
