import 'package:flutter/material.dart';
import 'package:expenses_app/data/database.dart';
import 'package:expenses_app/data/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditScreen extends StatefulWidget {
  EditScreen({Key? key, required this.topic, required this.title, required this.description, required this.docId}) : super(key: key);

  final String topic;
  final String title;
  final String description;
  final String docId;

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  late TextEditingController _topicController;

  late TextEditingController _titleController;

  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _topicController = TextEditingController(text: widget.topic);
    _titleController = TextEditingController(text: widget.title);
    _descriptionController = TextEditingController(text: widget.description);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Expense Name',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              SizedBox(height: 20,),
              Container(width: double.infinity,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xffcbefef),

                ),
                child: TextField(
                  controller: _topicController,
                  decoration: InputDecoration(hintText: 'Expense amount'),
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
                  decoration: InputDecoration(hintText: 'Prise'),
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
                  decoration: InputDecoration(hintText: 'Date'),
                ),
              ),
              SizedBox(height: 20,),
              Container(width: double.infinity,

                decoration: BoxDecoration(
                ),
                child: Container(
                  margin: const EdgeInsets.only(left: 300.0),
                  decoration: BoxDecoration(
                    color: Color(0xffcbefef),
                    borderRadius: BorderRadius.circular(68),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.edit,
                      color: Colors.blueGrey,

                    ),
                    onPressed: () {
                      Database.updateItem(topic:_topicController.text, title: _titleController.text, description: _descriptionController.text, docId: widget.docId);
                      Navigator.pop(context);
                    },
                  ),
                ),
                  // child: Text("Edit"),
                ),
            ],
          ),
        ),
      ),
    );
  }
}