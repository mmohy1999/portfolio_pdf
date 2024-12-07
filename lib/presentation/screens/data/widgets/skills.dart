import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../logic/resume_cubit.dart';

class Skills extends StatefulWidget {
  const Skills({super.key});

  @override
  State<Skills> createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResumeCubit, ResumeState>(
      builder: (context, state) {
        ResumeCubit cubit=context.read<ResumeCubit>();

        return Form(
          key: cubit.skillFormKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for(int x = 0; x < cubit.skillControllers.length; x++)
                skillWidget(cubit,x),
              if(cubit.skillControllers.length<3)
              Row(
                children: [
                  const Spacer(),
                  TextButton(onPressed: () {
                    setState(() {
                    cubit.addSkill();
                    });
                  }, child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [ Icon(Icons.add),
                      SizedBox(width: 2,),
                      Text('Add skill'),
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

  Widget skillWidget(ResumeCubit cubit, int index) {
  return Column(
    mainAxisSize: MainAxisSize.min,

    children: [
      const SizedBox(height: 10,),
      TextFormField(
        keyboardType: TextInputType.text,
        controller:cubit.skillControllers[index],
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your skill';
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: 'skill',
          prefixIcon:  const Icon(Icons.add_box_sharp),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    ],
  );
  }
  }
