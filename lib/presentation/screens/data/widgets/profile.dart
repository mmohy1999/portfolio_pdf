import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_pdf/logic/resume_cubit.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResumeCubit, ResumeState>(
      builder: (context, state) {
        ResumeCubit cubit=context.read<ResumeCubit>();
        return Form(
          key: cubit.profileFormKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10,),
              TextFormField(
                minLines: 1,
                maxLines: 3,
                keyboardType: TextInputType.text,
                controller: cubit.profileController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your profile';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Profile',
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
