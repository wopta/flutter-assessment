import 'package:filosofia/widgets/input/Filosofia_outlined_dropdown.dart';
import 'package:filosofia/widgets/input/Filosofia_outlined_text_input.dart';
import 'package:filosofia/widgets/radiobutton/filosofia_radiobutton.dart';

import 'package:flutter/material.dart';
import 'package:filosofia/filosofia.dart';
import 'package:quote/bloc/quote_cubit.dart';
import 'package:quote/forms/filosofia_checkbox.dart';
import 'package:quote/model/quote_dto.dart';
import 'package:quote/model/work_dto.dart';
import 'package:widgets/birthdate_picker.dart';
import 'package:wopta/authentication/validator.dart';
import 'package:intl/intl.dart';

enum Answer { si, no }

class FormDetail extends StatefulWidget {
  final QuoteCubit cubit;
  final QuoteState state;

  FormDetail({required this.cubit});
  FormDetail({required this.cubit, required this.state});


  static String _displayStringForOption(WorkDTO option) => option.work;

  @override
  State<FormDetail> createState() => _FormDetailState();
}

class _FormDetailState extends State<FormDetail> {
  bool isSelected = false;

  Answer _hasChildrenSchoolAge = Answer.no;

  final listOccupations = ["Item_1", "Item_2", "Item_3"];


  final listTypeOccupations = ["Dipendente", "Autonomo", "Non lavoratore"];
  final listCoverage = ["24 Ore", "tempo libero", "professionale"];

  final listCoverageDropdown = FilosofiaDropDown(items: [], hint: 'Tipo di copertura');

  final listTypeOccupationsDropdown = FilosofiaDropDown(items: [], hint: 'Tipo di occupazione');

  final listAnswersQuestion = [
    "Si, ma dovrei rinunciare a qualcosa",
    "No, non ci riuscirei facilmente"
  ];

  final listAnswerQuestionDropdown = FilosofiaDropDown(
      items: [],
      hint: 'Selezionare una risposta');

  final listRisk = ["Da evitare", "Da accettare", "Da gestire"];

  final listRiskDropdown = FilosofiaDropDown(
      items: [],
      hint: 'Il rischio nella vita è da: ');

  String? selectedVal;
  WorkDTO? selectedWork;

  final _formKey = GlobalKey<FormState>();
  final checkBox = FilosofiaCheckbox();
  final dateFormatPattern = 'dd/MM/yy';
  DateTime dateSelected = DateTime.now();


  TextEditingController? workController =
  TextEditingController(text: '');
  TextEditingController? workTypeController =
  TextEditingController(text: '');
  TextEditingController? issue1500Controller =
  TextEditingController(text: '');
  TextEditingController? riskInLifeController =
  TextEditingController(text: '');


  @override
  void initState() {
    listAnswerQuestionDropdown.items = listAnswersQuestion;
    listRiskDropdown.items = listRisk;
    listCoverageDropdown.items = listCoverage;
    listTypeOccupationsDropdown.items = listTypeOccupations;
    loadInitialData();
    super.initState();
  }


  void loadInitialData(){
    print("STAMPO LO STATO DEL WIDGET: ${widget.state.selectedWork}");
    selectedVal = widget.state.selectedWork ?? "";

  //  listCoverageDropdown.selectedVal = widget.state.coverageType ?? "";
    _hasChildrenSchoolAge = widget.state.childrenAtSchool ? Answer.si : Answer.no;
    issue1500Controller!.text = widget.state.issue1500 != 0 ? listRisk[widget.state.issue1500] : listAnswersQuestion[0];
    riskInLifeController!.text = widget.state.riskInLifeIs != 0 ? listRisk[widget.state.riskInLifeIs] : listRisk[0];
  }

  @override
  Widget build(BuildContext context) {
    selectedVal = listOccupations[0];
    return Column(
      children: [
        formSection(),
        bottomSection()
      ],
    );
  }


  Widget bottomSection(){
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width/2,
          child:
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: FilosofiaTextButton(
                onPressed: () {

                  widget.cubit.goToNewPage(widget.state,
                      indexWizard: 0);
                },
                buttonStyle: FilosofiaButtonStyle.secondary,
                text: 'Indietro'
            ),
          )
        ),
        Container(
          width: MediaQuery.of(context).size.width/2,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: FilosofiaTextButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    //listAnswerQuestionDropdown.items = listAnswersQuestion;
                    //listRiskDropdown.items = listRisk;
                    int answer = transformDropdown(listAnswerQuestionDropdown, listAnswersQuestion);
                    int risk = transformDropdown(listRiskDropdown, listRisk);
                    issue1500Controller!.text = answer.toString();
                    riskInLifeController!.text = risk.toString();
                    WorkDTO currentSelected = selectedWorkDTO()!;

                    widget.cubit.submitForm(QuoteDTO(
                      //age: int.parse(widget.state.ageController.text),//DateTime.parse(cubit.state.ageController.text),
                        age: widget.state.age,
                        work: selectedVal!,
                        workType: listTypeOccupationsDropdown.selectedVal ?? "",
                        coverageType: listCoverageDropdown.selectedVal ?? '',
                        childrenScool: _hasChildrenSchoolAge == Answer.si,
                        issue1500: int.parse(issue1500Controller!.text),
                        riskInLifeIs: int.parse(riskInLifeController!.text),
                        classs: int.parse(currentSelected.classs) //int.parse(widget.state.classController.text)
                    )).then((promoList) {
                      widget.cubit.goToNewPage(widget.state,
                          indexWizard: 2,
                          selectedWork: selectedVal,
                          coverageType: listCoverageDropdown.selectedVal,
                          childrenAtSchool: _hasChildrenSchoolAge == Answer.si,
                          issue1500: int.parse(issue1500Controller!.text),
                          riskInLifeIs: int.parse(riskInLifeController!.text),
                          classs: int.parse(currentSelected.classs),
                          promo: promoList
                      );
                      //   widget.cubit.setPage(2, widget.state);
                    });
                  }
                },
                buttonStyle: FilosofiaButtonStyle.primary,
                text: 'Avanti'),
          )
        )


      ],
    );
  }


  Widget formSection(){
    return SingleChildScrollView(
        child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
            const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                  ),
                  Autocomplete<WorkDTO>(
                    fieldViewBuilder: (BuildContext context,
                        TextEditingController controller,
                        FocusNode focusNode,
                        onEditingComplete) {
                      return FilosofiaTextFormField(
                        labelText: 'Professioni',
                        height: 1,
                        filled: false,
                        controller: controller,
                        focusNode: focusNode,
                        onEditingComplete: onEditingComplete,
                      );
                    },
                    displayStringForOption: FormDetail._displayStringForOption,
                    optionsBuilder: (TextEditingValue textEditingValue) {
                      if (textEditingValue.text == '') {
                        return const Iterable<WorkDTO>.empty();
                      }
                      return widget.cubit.state.works!.where((WorkDTO option) {
                        if (option.work
                            .toLowerCase()
                            .contains(textEditingValue.text.toLowerCase())) {
                          return true;
                        }
                        selectedVal = textEditingValue.text;
                        return false;
                      });
                    },
                    onSelected: (WorkDTO selection) {
                      debugPrint('You just selected $selection');
                    },
                  ),
                  //Field n°1 : Age
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: FilosofiaTextFormField(
                      labelText: 'Età assicurato',
                      height: 1,
                      filled: false,
                      keyboardType: TextInputType.number,
                      controller: widget.cubit.state.ageController,
                      validator: (value) =>
                          Validator.validateField(field: value!),
                      onchange: (val) => {
                        //todo quando sarà wizard richiameremo una funzione che emetterà nuovamente gli stati
                      },
                key: _formKey,
                child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                      ),
                      Autocomplete<WorkDTO>(
                        fieldViewBuilder: (BuildContext context,
                            TextEditingController controller,
                            FocusNode focusNode,
                            onEditingComplete) {
                          return FilosofiaTextFormField(
                            labelText: 'Professioni',
                            height: 1,
                            filled: false,
                            controller: controller,
                            focusNode: focusNode,
                            onEditingComplete: onEditingComplete,
                          );
                        },
                        initialValue: TextEditingValue(text: selectedVal ?? ""),
                        displayStringForOption: FormDetail._displayStringForOption,
                        optionsBuilder: (TextEditingValue textEditingValue) {
                          if (textEditingValue.text == '') {
                            return const Iterable<WorkDTO>.empty();
                          }
                          return widget.state.works!.where((WorkDTO option) {
                            if (option.work
                                .toLowerCase()
                                .contains(textEditingValue.text.toLowerCase())) {
                              return true;
                            }
                            selectedVal = textEditingValue.text;
                            return false;
                          });
                        },
                        onSelected: (WorkDTO selection) {
                          debugPrint('You just selected $selection');
                        },
                      ),
                      //Field n°1 : Age
                      Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          child:
                          Text(
                            "Età assicurato ${widget.state.age}",
                            style: FilosofiaTheme.of(context).textTheme.cardSubtitleMd,
                          )
                        /*FilosofiaTextFormField(
                        labelText: 'Età assicurato',
                        height: 1,
                        filled: false,
                        keyboardType: TextInputType.number,
                        controller: ageController,
                        validator: (value) =>
                            Validator.validateField(field: value!)
                    ),
                  ),
                  //Field n°2 : Occupation
                  Padding(
                     */
                      ),
                      //Field n°2 : Occupation
                      /*    Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: FilosofiaTextFormField(
                      labelText: 'Professione titolare',
                      height: 1,
                      filled: false,
                      controller: widget.cubit.state.workTypeController,
                      controller: widget.state.workTypeController,
                      validator: (value) =>
                          Validator.validateField(field: value!),
                      onchange: (val) => {
                        //todo quando sarà wizard richiameremo una funzione che emetterà nuovamente gli stati
                      },
                    ),
                  ),
                  //Field n°3 : Type of occupation
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.0),
                    child: FilosofiaDropDown(
                        items: listTypeOccupations,
                        hint: 'Tipo di professione?'),
                  ),
                  ), */
                      //Field n°3 : Type of occupation
                      Padding(
                        padding:
                        const EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.0),
                        child: listTypeOccupationsDropdown,
                      ),

                      Padding(
                        padding:
                        const EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.0),
                        child: listCoverageDropdown,
                      ),


                  //Field n°4 : Children at school age?
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Stack(
                          children: [
                            Divider(),
                            Center(
                              child: Text(
                                'Ha figli in età scolare?',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    backgroundColor: FilosofiaTheme.of(context)
                                        .theme
                                        .materialTheme
                                        .backgroundColor,
                                    fontSize: 16),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              FilosofiaRadioButton(
                                value: Answer.si,
                                groupValue: _hasChildrenSchoolAge,
                                tag: 'Si',
                                onChanged: (value) {
                                  setState(() {
                                    _hasChildrenSchoolAge = value;
                                  });
                                },
                              ),
                              FilosofiaRadioButton(
                                value: Answer.no,
                                groupValue: _hasChildrenSchoolAge,
                                tag: 'No',
                                onChanged: (value) {
                                  setState(() {
                                    _hasChildrenSchoolAge = value;
                                  });
                                },
                              ),
                            ],
                          ),
                      ),
                    ],
                  ),
                      //Field n°4 : Children at school age?
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Stack(
                              children: [
                                Divider(),
                                Center(
                                  child: Text(
                                    'Ha figli in età scolare?',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        backgroundColor: FilosofiaTheme
                                            .of(context)
                                            .theme
                                            .materialTheme
                                            .backgroundColor,
                                        fontSize: 16),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                FilosofiaRadioButton(
                                  value: Answer.si,
                                  groupValue: _hasChildrenSchoolAge,
                                  tag: 'Si',
                                  onChanged: (value) {
                                    setState(() {
                                      _hasChildrenSchoolAge = value;
                                    });
                                  },
                                ),
                                FilosofiaRadioButton(
                                  value: Answer.no,
                                  groupValue: _hasChildrenSchoolAge,
                                  tag: 'No',
                                  onChanged: (value) {
                                    setState(() {
                                      _hasChildrenSchoolAge = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                  /*   Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  controller: cubit.state.childrenSchoolController,
                  onChanged: (val)=>{
                    //todo quando sarà wizard richiameremo una funzione che emetterà nuovamente gli stati
                  },
                  validator: (value) => Validator.validateField(field: value!),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide:
                        BorderSide(color: Colors.pinkAccent, width: 5.0)),
                    labelText: "Children School",
                    labelStyle: FilosofiaTheme.of(context)
                        .theme
                        .materialTheme
                        .textTheme
                        .headline5,
                    floatingLabelStyle: FilosofiaTheme.of(context)
                        .theme
                        .materialTheme
                        .textTheme
                        .headline5,
                    filled: false,
                    fillColor: Colors.grey[200],
                  ),
                ),
              ), */

                  //Field n°5 : Question
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Divider(),
                                Center(
                                  child: Text(
                                    'Quesito',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        backgroundColor:
                                            FilosofiaTheme.of(context)
                      //Field n°5 : Question
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    Divider(),
                                    Center(
                                      child: Text(
                                        'Quesito',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            backgroundColor:
                                            FilosofiaTheme
                                                .of(context)
                                                .theme
                                                .materialTheme
                                                .backgroundColor,
                                        fontSize: 16),
                                  ),
                                )
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 5.0),
                              child: Text(
                                  'Riusciresti ad affrontare un \n costo imprevisto di 1500 euro?',
                                  style: TextStyle(fontSize: 16),
                                  textAlign: TextAlign.center),
                            )
                          ],
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: FilosofiaDropDown(
                              items: listAnswersQuestion,
                              hint: 'Selezionare una risposta')),
                    ],
                  ),

                  //Field n°6 : Risk in life is to
                  Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: FilosofiaDropDown(
                          items: listRisk,
                          hint: 'Il rischio nella vita è da: ')),
                                            fontSize: 16),
                                      ),
                                    )
                                  ],
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5.0),
                                  child: Text(
                                      'Riusciresti ad affrontare un \n costo imprevisto di 1500 euro?',
                                      style: TextStyle(fontSize: 16),
                                      textAlign: TextAlign.center),
                                )
                              ],
                            ),
                          ),
                          dropdown(listAnswerQuestionDropdown, 5.0),
                        ],
                      ),
                      //Field n°6 : Risk in life is to
                      dropdown(listRiskDropdown, 10.0),
                    ]
                )
            )
        )
    );
  }

                  //Field n°8 : Property
                  /*Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: cubit.state.riskInLifeController,
                    validator: (value) => Validator.validateField(field: value!),
                    onChanged: (val)=>{
                      //todo quando sarà wizard richiameremo una funzione che emetterà nuovamente gli stati
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide:
                          BorderSide(color: Colors.pinkAccent, width: 5.0)),
                      labelText: "Risk In Life",
                      labelStyle: FilosofiaTheme.of(context)
                          .theme
                          .materialTheme
                          .textTheme
                          .headline5,
                      floatingLabelStyle: FilosofiaTheme.of(context)
                          .theme
                          .materialTheme
                          .textTheme
                          .headline5,
                      filled: false,
                      fillColor: Colors.grey[200],
                    ),
                  ),
                ),*/

                  /*Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: cubit.state.classController,
                    validator: (value) => Validator.validateField(field: value!),
                    onChanged: (val)=>{
                      //todo quando sarà wizard richiameremo una funzione che emetterà nuovamente gli stati
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide:
                          BorderSide(color: Colors.pinkAccent, width: 5.0)),
                      labelText: "Class",
                      labelStyle: FilosofiaTheme.of(context)
                          .theme
                          .materialTheme
                          .textTheme
                          .headline5,
                      floatingLabelStyle: FilosofiaTheme.of(context)
                          .theme
                          .materialTheme
                          .textTheme
                          .headline5,
                      filled: false,
                      fillColor: Colors.grey[200],
                    ),
                  ),
                ),*/
                  FilosofiaTextButton(
                      onPressed: () {
                        //   if (_formKey.currentState!.validate()) {
                        /*  cubit.submitForm(
                            QuoteDTO(
                            age: int.parse(cubit.state.ageController.text),//DateTime.parse(cubit.state.ageController.text),
                            work: selectedVal!,
                            workType: cubit.state.workTypeController.text,
                            coverageType: cubit.state.coverageTypeController.text,
                            childrenScool: checkBox.checked,
                            issue1500: int.parse(cubit.state.issue1500Controller.text),
                            riskInLifeIs: int.parse(cubit.state.riskInLifeController.text),
                            classs: int.parse(cubit.state.classController.text)
                          )
                        ); */
                        widget.cubit.setPage(2);

  Widget dropdown(child, insets){
    return Padding(
        padding: EdgeInsets.symmetric(vertical: insets),
        child: child);
  }


  int transformDropdown(FilosofiaDropDown dropdown, List elements) {
    for (int i = 0; i < elements.length; i++) {
      if (dropdown.selectedVal == elements[i]) {
        return i+1;
      }
    }
    return -1;
  }
  
  
  WorkDTO? selectedWorkDTO(){
    if(selectedVal == null) return null;
    var a = widget.state.works!.where((WorkDTO option) {
      if (option.work
          .toLowerCase()
          .contains(selectedVal!.toLowerCase())) {
        return true;
      }
      return false;
    });

                        //  }
                      },
                      buttonStyle: FilosofiaButtonStyle.primary,
                      text: 'Avanti'),
                ],
              ),
            )));
    if(a.isEmpty) return null;
    return a.first;
  }


}

