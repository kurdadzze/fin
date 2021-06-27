import 'package:flutter/material.dart';
import 'package:expenses_app/data/database.dart';

class AddNewScreen extends StatelessWidget {
  AddNewScreen({Key? key}) : super(key: key);

  TextEditingController _topicController = TextEditingController();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Add New Screen'),
      // ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text('Add Expenses',
              //   style: TextStyle(
              //     fontWeight: FontWeight.bold,
              //     fontSize: 22,
              //   ),
              // ),
              SizedBox(height: 200,),
              Container(width: double.infinity,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                 color: Color(0xffcbefef),
                ),

                child: TextField(
                  controller: _topicController,
                  decoration: InputDecoration(hintText: 'please enter amount'),
                ),
              ),

              SizedBox(height: 20,),
              Container(width: double.infinity,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xffcbefef),

                ),

                child: TextField(
                  controller: _titleController,
                  decoration: InputDecoration(hintText: 'please enter title'),
                ),
              ),
              SizedBox(height: 20,),

              Container(width: double.infinity,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xffcbefef),
                ),
                child: TextField(
                  controller: _descriptionController,
                  decoration: InputDecoration(hintText: 'please enter date'),
                ),
              ),
              SizedBox(height: 20,),
              Container(width: double.infinity,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(


                ),
                child: ElevatedButton(
                  onPressed: () {
                    Database.addItem(topic: _topicController.text, title: _titleController.text, description: _descriptionController.text);
                    Navigator.pop(context);
                  },
                  child: Container(

                    child: Text("Add",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,


                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}