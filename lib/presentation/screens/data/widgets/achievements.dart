import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../logic/resume_cubit.dart';

class Achievements extends StatefulWidget {
  const Achievements({super.key});

  @override
  State<Achievements> createState() => _AchievementsState();
}

class _AchievementsState extends State<Achievements> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResumeCubit, ResumeState>(
      builder: (context, state) {
        ResumeCubit cubit=context.read<ResumeCubit>();

        return Form(
          key: cubit.achievementFormKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for(int i = 0; i < cubit.achievementNameControllers.length; i++)
                achievementWidget(cubit,i),
              if(cubit.achievementNameControllers.length<3)
                Row(
                children: [
                  const Spacer(),
                  TextButton(onPressed: () {
                    setState(() {
                      cubit.addAchievement();
                    });
                  }, child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [ Icon(Icons.add),
                      SizedBox(width: 2,),
                      Text('Add Achievement'),
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

  Widget achievementWidget(ResumeCubit cubit, int index){
   return  Column(
     mainAxisSize: MainAxisSize.min,
     children: [
       const SizedBox(height: 10,),
       TextFormField(
         keyboardType: TextInputType.text,
         controller:cubit.achievementNameControllers[index],
         validator: (value) {
           if (value == null || value.isEmpty) {
             return 'Please enter your achievement name';
           }
           return null;
         },
         decoration: InputDecoration(
           labelText: 'achievements Name',
           prefixIcon:  const Icon(Icons.add_box_sharp),
           border: OutlineInputBorder(
             borderRadius: BorderRadius.circular(10.0),
           ),
         ),
       ),
       const SizedBox(height: 10,),
       TextFormField(
         keyboardType: TextInputType.text,
         controller:cubit.achievementDetailsControllers[index],
         validator: (value) {
           if (value == null || value.isEmpty) {
             return 'Please enter your achievement details';
           }
           return null;
         },
         decoration: InputDecoration(
           labelText: 'detiels',
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
