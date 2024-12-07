import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_pdf/logic/resume_cubit.dart';

class PersonalInformation extends StatelessWidget {
  const PersonalInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResumeCubit, ResumeState>(
      builder: (context, state) {
        ResumeCubit cubit=context.read<ResumeCubit>();
        return Form(
          key: cubit.personalFormKey,
          child: Column(children: [
            const SizedBox(height: 32),
            TextFormField(
              controller: cubit.nameController,
              validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: 'Name',
                prefixIcon: const Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              keyboardType: TextInputType.phone,
              controller: cubit.phoneController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your phone';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'Phone',

                prefixIcon: const Icon(Icons.phone),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: cubit.emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'Email',

                prefixIcon: const Icon(Icons.email),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              keyboardType: TextInputType.streetAddress,
              controller: cubit.addressController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your address';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'Address',
                prefixIcon: const Icon(Icons.location_pin),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              keyboardType: TextInputType.url,
              controller: cubit.linkedInController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter LinkedIn Url';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'LinkedIn Link',
                prefixIcon: const Icon(Icons.link),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              keyboardType: TextInputType.url,
              controller: cubit.gitHubController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your github url';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'GitHub Link',
                prefixIcon: const Icon(Icons.link),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),

          ],),
        );
      },
    );
  }
}
