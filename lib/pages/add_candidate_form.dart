import 'package:flutter/material.dart';
import 'package:mini_projet_candidats/common/I_button.dart';
import 'package:mini_projet_candidats/common/i_input.dart';
import 'package:mini_projet_candidats/models/person_dart.dart';

class AddCandidateForm extends StatefulWidget {
  const AddCandidateForm({super.key});

  @override
  State<AddCandidateForm> createState() => _AddCandidateFormState();
}

class _AddCandidateFormState extends State<AddCandidateForm> {
  final _formKey = GlobalKey<FormState>();
  final Person person= Person();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ajouter un candidat"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(top: 40),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              IIinput(
                name: 'Nom du candidat',

                validator: (value) {
                  if (value!.isEmpty) {
                    return " Champ obligatoire";
                  }
                },
                onSaved: (value) {

                  // print("Valeur à sauvegarder $value");
                  person.name=value;

                },

                prefixIcon: Icon(Icons.person),
              ),


              SizedBox(height: 25.0,),
              IIinput(
                name: 'Prénom du candidat',

                validator: (value) {
                  if (value!.isEmpty) {
                    return " Champ obligatoire";
                  }
                },
                onSaved: (value) {

                  // print("Valeur à sauvegarder $value");
                  person.surname=value;

                },

                prefixIcon: Icon(Icons.person),

              ),
              SizedBox(height: 25,),

              IIinput(
                name: 'Description du parti politique',

                validator: (value) {
                  if (value!.isEmpty) {
                    return " Champ obligatoire";
                  }
                },
                onSaved: (value) {

                  // print("Valeur à sauvegarder $value");
                  person.description=value;

                },

                prefixIcon: Icon(Icons.description),

              ),

              /*IIinput(
                name: 'Date de naissance',

                validator: (value) {
                  if (value!.isEmpty) {
                    return " Champ obligatoire";
                  }
                },
                onSaved: (value) {

                  // print("Valeur à sauvegarder $value");
                  person.birthDate=value;

                },

                prefixIcon: Icon(Icons.person),
              ),*/
              SizedBox(height: 10,),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: IButton(
          onPressed: () {
            if(  _formKey.currentState!.validate()){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Inscription réussie'),
                  duration: Duration(seconds: 1),
                ),
              );
              _formKey.currentState!.save();
              Navigator.pop(context, person);
            }
          },
          text: 'Ajouter',
        ),
      ),
    );
  }
}
