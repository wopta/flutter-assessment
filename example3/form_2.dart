import 'package:filosofia/filosofia.dart';
import 'package:filosofia/widgets/input/Filosofia_outlined_dropdown.dart';
import 'package:filosofia/widgets/input/Filosofia_outlined_text_input.dart';
import 'package:filosofia/widgets/input/filosofia_switch.dart';
import 'package:filosofia/widgets/radiobutton/filosofia_radiobutton.dart';
import 'package:flutter/material.dart';
import 'package:network/network.dart';
import 'package:quote/bloc/quote_bloc.dart';
import 'package:quote/model/work_dto.dart';
import 'package:quote/widgets/wizard_footer.dart';

class FormInsurance extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  FormInsurance({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuoteBloc, QuoteState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              formSection(state, context),
              bottomSection(
                () => onReturn(context),
                () => onForward(context),
                context,
                disabled: !state.isFormInsuranceValid,
              )
            ],
          ),
        );
      },
    );
  }

  void onReturn(BuildContext context) {
    context.read<QuoteBloc>().goToPreviousPage();
  }

  void onForward(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<QuoteBloc>().add(const InsuranceFormSubmitted());
    }
  }

  Widget formSection(QuoteState state, BuildContext context) {
    final textFieldConstraints = FilosofiaBreakpoints.isMobile(context)
        ? const BoxConstraints()
        : const BoxConstraints(maxWidth: 220);
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: FilosofiaConstrainedBox(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: FilosofiaTheme.of(context).spacing.sm,
              horizontal: FilosofiaTheme.of(context).spacing.lg,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: FilosofiaTheme.of(context).spacing.sm,
                  ),
                  child: Text(
                    'I tuoi dati',
                    style: FilosofiaTheme.of(context).textTheme.cardTitleMd,
                  ),
                ),
                // region Profession
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: FilosofiaTheme.of(context).spacing.md,
                  ),
                  child: Autocomplete<WorkDTO>(
                    fieldViewBuilder: (
                      BuildContext context,
                      TextEditingController controller,
                      FocusNode focusNode,
                      onEditingComplete,
                    ) {
                      return FilosofiaTextFormField(
                        labelText: 'Professione',
                        height: 1,
                        filled: false,
                        controller: controller,
                        focusNode: focusNode,
                        onEditingComplete: onEditingComplete,
                      );
                    },
                    initialValue:
                        TextEditingValue(text: state.selectedWork?.work ?? ""),
                    displayStringForOption: (WorkDTO option) => option.work,
                    optionsBuilder: (TextEditingValue textEditingValue) {
                      return state.works!.where((WorkDTO option) => option.work
                          .toLowerCase()
                          .contains(textEditingValue.text.toLowerCase()));
                    },
                    onSelected: (WorkDTO selection) {
                      context
                          .read<QuoteBloc>()
                          .add(ProfessionSelected(work: selection));
                    },
                  ),
                ),
                //endregion
                // region Work type
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5.0,
                    horizontal: 2.0,
                  ),
                  child: FilosofiaDropDown(
                    validator: (value) {
                      if (value == null) {
                        return 'Seleziona un tipo di occupazione';
                      }
                      return null;
                    },
                    value: state.selectedWorkType,
                    onChanged: (workType) {
                      context
                          .read<QuoteBloc>()
                          .add(WorkTypeSelected(workType: workType));
                    },
                    items: state.workTypes,
                    hint: 'Tipo di occupazione',
                  ),
                ),
                // endregion
                // region Dependents
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: FilosofiaTheme.of(context).spacing.sm,
                  ),
                  child: Wrap(
                    spacing: FilosofiaTheme.of(context).spacing.md,
                    alignment: WrapAlignment.center,
                    runAlignment: WrapAlignment.center,
                    children: [
                      ConstrainedBox(
                        constraints: textFieldConstraints,
                        child: Text(
                          'Hai famigliari a carico?',
                          style: FilosofiaTheme.of(context)
                              .textTheme
                              .sectionTitleMd,
                        ),
                      ),
                      FilosofiaSwitch(
                        left: "No",
                        right: "Si",
                        value: state.hasChildrenOfSchoolAge,
                        onChanged: (value) {
                          context
                              .read<QuoteBloc>()
                              .add(HasDependantsSelected(hasDependants: value));
                        },
                      )
                    ],
                  ),
                ),
                // endregion
                // region Financial risk question
                Wrap(
                  spacing: FilosofiaTheme.of(context).spacing.md,
                  runSpacing: FilosofiaTheme.of(context).spacing.md,
                  children: [
                    ConstrainedBox(
                      constraints: textFieldConstraints,
                      child: Text(
                        'Riusciresti ad affrontare una spesa di 1.500 euro?',
                        style:
                            FilosofiaTheme.of(context).textTheme.sectionTitleMd,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: state.financialRiskOptions
                          .map(
                            (option) => FilosofiaRadioButton(
                              value: option,
                              groupValue: state.selectedFinancialRisk,
                              tag: option.value,
                              onChanged: (financialRisk) => context
                                  .read<QuoteBloc>()
                                  .add(FinancialRiskSelected(
                                      financialRisk: financialRisk)),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
                // endregion
                // region Life Risk question
                SizedBox(
                  height: FilosofiaTheme.of(context).spacing.lg,
                ),
                Wrap(
                  spacing: FilosofiaTheme.of(context).spacing.md,
                  runSpacing: FilosofiaTheme.of(context).spacing.md,
                  children: [
                    ConstrainedBox(
                      constraints: textFieldConstraints,
                      child: Text(
                        'Il rischio nella tua vita è da:',
                        style:
                            FilosofiaTheme.of(context).textTheme.sectionTitleMd,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: state.lifeRiskOptions
                          .map(
                            (option) => FilosofiaRadioButton(
                              value: option,
                              groupValue: state.selectedLifeRisk,
                              tag: option.value,
                              onChanged: (lifeRisk) => context
                                  .read<QuoteBloc>()
                                  .add(LifeRiskSelected(lifeRisk: lifeRisk)),
                            ),
                          )
                          .toList(),
                    )
                  ],
                )
                // endregion
              ],
            ),
          ),
        ),
      ),
    );
  }
}
