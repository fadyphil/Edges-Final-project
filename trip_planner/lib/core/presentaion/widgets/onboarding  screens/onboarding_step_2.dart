// lib/presentation/onboarding/widgets/onboarding_step_currency.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_planner/core/presentaion/blocs/onboarding/onboarding_cubit.dart';
import 'package:trip_planner/core/presentaion/blocs/onboarding/onboarding_state.dart';

class OnboardingStepCurrency extends StatelessWidget {
  const OnboardingStepCurrency({super.key});

  // A simple list of currencies for the user to choose from.
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
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // The decorative icon from the design
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(
                context,
              ).colorScheme.secondary.withValues(alpha: .1),
            ),
            child: Icon(
              Icons.account_balance_wallet_outlined,
              size: 48,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          const SizedBox(height: 32),

          // The main headline
          Text(
            "Your Currency",
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),

          // The descriptive sub-headline
          Text(
            "Choose your preferred currency for budgeting",
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(color: Colors.grey.shade600),
          ),
          const SizedBox(height: 32),

          // The Dropdown, wrapped in a BlocBuilder to get the current state
          BlocBuilder<OnboardingCubit, OnboardingState>(
            // We only need to rebuild this widget when the currency changes
            buildWhen: (previous, current) =>
                previous.currency != current.currency,
            builder: (context, state) {
              return DropdownButtonFormField<String>(
                value: state.currency,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade50,
                ),
                items: _currencies.map((String currency) {
                  return DropdownMenuItem<String>(
                    value: currency,
                    child: Text(currency),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    // This is the connection to the cubit.
                    context.read<OnboardingCubit>().currencyChanged(newValue);
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
