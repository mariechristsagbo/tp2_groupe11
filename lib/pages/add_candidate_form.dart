import 'package:flutter/material.dart';
import 'package:mini_projet_candidats/common/I_button.dart';
import 'package:mini_projet_candidats/common/i_input.dart';
import 'package:mini_projet_candidats/models/person_dart.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AddCandidateForm extends StatefulWidget {
  const AddCandidateForm({super.key});

  @override
  State<AddCandidateForm> createState() => _AddCandidateFormState();
}

class _AddCandidateFormState extends State<AddCandidateForm> {
  final _formKey = GlobalKey<FormState>();
  final Candidate person= Candidate();

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
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();


              var response = await http.post(
                Uri.parse('https://jsonplaceholder.typicode.com/users'),
                headers: {"Content-Type": "application/json"},
                body: json.encode(person.toMap()),
              );

              if (response.statusCode == 201 || response.statusCode == 200) {
                print('${response.statusCode}');
                Navigator.pop(context, person);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Inscription réussie'),
                    duration: Duration(seconds: 2),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Erreur lors de l\'envoi des données'),
                    duration: Duration(seconds: 2),
                  ),
                );
              }
            }
          },

          text: 'Ajouter',
        ),
      ),

    );
  }
}
