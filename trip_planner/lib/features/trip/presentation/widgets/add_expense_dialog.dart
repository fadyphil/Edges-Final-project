// lib/presentation/trip_details/widgets/add_expense_dialog.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_planner/core/presentation/blocs/api_states/api_state.dart';
import 'package:trip_planner/features/trip/domain/entities/expense_entity.dart';
import 'package:trip_planner/features/trip/presentation/blocs/my_trips_cubit.dart';
import 'package:trip_planner/features/trip/presentation/blocs/my_trips_state.dart';

class AddExpenseDialog extends StatefulWidget {
  final String tripId;
  const AddExpenseDialog({super.key, required this.tripId});

  @override
  State<AddExpenseDialog> createState() => _AddExpenseDialogState();
}

class _AddExpenseDialogState extends State<AddExpenseDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _amountController;
  late final TextEditingController _descriptionController;

  String _selectedCategory = 'Food';
  static const List<String> _categories = [
    'Food',
    'Transport',
    'Accommodation',
    'Activities',
    'Shopping',
    'Other',
  ];

  @override
  void initState() {
    super.initState();
    _amountController = TextEditingController();
    _descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    _amountController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _onSavePressed() {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState!.validate()) {
      final amount = double.tryParse(_amountController.text);
      if (amount == null) return;

      final newExpense = Expense(
        id: '', // Database will assign the ID
        category: _selectedCategory,
        description: _descriptionController.text,
        amount: amount,
        date: DateTime.now(),
      );

      context.read<MyTripsCubit>().addExpenseToTrip(widget.tripId, newExpense);
    }
  }

  @override
  Widget build(BuildContext context) {
    final keyboardPadding = MediaQuery.of(context).viewInsets.bottom;

    return BlocListener<MyTripsCubit, MyTripsState>(
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
      child: Padding(
        padding: EdgeInsets.only(
          bottom: keyboardPadding,
          left: 16,
          right: 16,
          top: 16,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Add Expense',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 24),
              Text('Category', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 12),
              Wrap(
                spacing: 12.0,
                runSpacing: 12.0,
                children: _categories.map((category) {
                  return ChoiceChip(
                    label: Text(category),
                    selected: _selectedCategory == category,
                    onSelected: (isSelected) {
                      if (isSelected) {
                        setState(() => _selectedCategory = category);
                      }
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: _amountController,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: const InputDecoration(
                  labelText: 'Amount',
                  prefixIcon: Icon(Icons.attach_money),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an amount.';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid number.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description (Optional)',
                  prefixIcon: Icon(Icons.edit_note),
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: BlocBuilder<MyTripsCubit, MyTripsState>(
                  buildWhen: (prev, curr) =>
                      prev.actionState != curr.actionState,
                  builder: (context, state) {
                    final isSubmitting = state.actionState.maybeWhen(
                      loading: () => true,
                      orElse: () => false,
                    );
                    return ElevatedButton(
                      onPressed: isSubmitting ? null : _onSavePressed,
                      child: isSubmitting
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text('Add Expense'),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
