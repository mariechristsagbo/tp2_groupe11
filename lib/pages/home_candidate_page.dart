import 'package:flutter/material.dart';
import '../models/person_dart.dart';
import 'add_candidate_form.dart';

class HomeCandidatePage extends StatefulWidget {
  const HomeCandidatePage({super.key});

  @override
  State<HomeCandidatePage> createState() => _HomeCandidatePageState();
}

class _HomeCandidatePageState extends State<HomeCandidatePage> {
  String name = "";
  bool liked = false;
  List<Candidate> persons = [];
  List<Candidate> friends = [];


  @override
  Widget build(BuildContext context) {
    return  Scaffold (
      appBar: AppBar(
        title: Text('Hello Samiat',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat',
              fontSize: 25),
        ),
        actions: [
          SizedBox(
            width: 48.0,
            height: 48.0,
            child: Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: Image.asset(
                'assets/icons/notifications.png',
                width: 35.0,
                height: 35.0,
              ),
            ),
          )


        ],
      ),

      body: Container(
        color: Colors.grey[100],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Candidate',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    '${persons.length} Candidate (s)',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: persons.length,
                itemBuilder: (context, index) {
                  Candidate person = persons[index];
                  return Card(
                    margin: EdgeInsets.all(10.0),
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image.network(
                              'https://guardian.ng/wp-content/uploads/2022/06/Adebayo-2.jpg',
                              width: 80.0,
                              height: 80.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${person.name} ${person.surname}",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5.0),
                                Text(
                                  "${person.description}",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),


      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.how_to_vote),
            label: 'Vote',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),


      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Candidate? newPerson = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddCandidateForm(),
              ));

          if (newPerson != null) {
            setState(() => persons.add(newPerson));
          }
        },
        child: Icon(Icons.add),
      ),




    );
  }



}
