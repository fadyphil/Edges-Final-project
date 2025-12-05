// lib/presentation/profile/widgets/edit_profile_dialog.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_planner/core/domain/entities/user_profile_entity.dart';
import 'package:trip_planner/core/presentaion/blocs/profile/profile_cubit.dart';
import 'package:trip_planner/core/presentaion/blocs/profile/profile_state.dart';
import 'package:trip_planner/core/presentation/blocs/api_states/api_state.dart';

class EditProfileDialog extends StatefulWidget {
  final UserProfile initialProfile;
  const EditProfileDialog({super.key, required this.initialProfile});

  @override
  State<EditProfileDialog> createState() => _EditProfileDialogState();
}

class _EditProfileDialogState extends State<EditProfileDialog> {
  late final TextEditingController _nameController;
  // Local state to manage the selected currency in the dropdown
  late String _selectedCurrency;

  static const List<String> _currencies = [
    'USD',
    'EUR',
    'GBP',
    'JPY',
    'AUD',
    'CAD',
    'CHF',
    'CNY',
    'INR',
  ];

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.initialProfile.name);
    _selectedCurrency = widget.initialProfile.preferredCurrency;
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _onSave() {
    final newName = _nameController.text.trim();
    final newCurrency = _selectedCurrency;

    // Check if the name has changed and is not empty
    if (newName.isNotEmpty && newName != widget.initialProfile.name) {
      context.read<ProfileCubit>().updateUserName(newName);
    }

    // Check if the currency has changed
    if (newCurrency != widget.initialProfile.preferredCurrency) {
      context.read<ProfileCubit>().updateUserCurrency(newCurrency);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listenWhen: (prev, curr) => prev.actionState != curr.actionState,
      listener: (context, state) {
        state.actionState.whenOrNull(
          success: (_) => Navigator.of(context).pop(),
          error: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Error: $message'),
                backgroundColor: Colors.red,
              ),
            );
          },
        );
      },
      child: AlertDialog(
        title: const Text('Edit Preferences'),
        content: SingleChildScrollView(
          // Use a scroll view in case the keyboard is large
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // --- Name Field ---
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Your Name',
                  icon: Icon(Icons.person_outline),
                ),
              ),
              const SizedBox(height: 24),

              // --- Currency Dropdown ---
              DropdownButtonFormField<String>(
                value: _selectedCurrency,
                decoration: const InputDecoration(
                  labelText: 'Preferred Currency',
                  icon: Icon(Icons.attach_money_outlined),
                ),
                items: _currencies.map((String currency) {
                  return DropdownMenuItem<String>(
                    value: currency,
                    child: Text(currency),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    setState(() {
                      _selectedCurrency = newValue;
                    });
                  }
                },
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          BlocBuilder<ProfileCubit, ProfileState>(
            buildWhen: (prev, curr) => prev.actionState != curr.actionState,
            builder: (context, state) {
              final isSaving = state.actionState.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
              return ElevatedButton(
                onPressed: isSaving ? null : _onSave,
                child: isSaving
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Save'),
              );
            },
          ),
        ],
      ),
    );
  }
}
