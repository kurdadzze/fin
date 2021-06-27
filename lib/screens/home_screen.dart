import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:expenses_app/data/database.dart';
import 'package:expenses_app/screens/add_new_screen.dart';
import 'package:expenses_app/screens/edit_screen.dart';

import 'package:expenses_app/model/expanses.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(250),
          child: AppBar(title: Text("Personal Expanses"),

          )
      ),

      body: StreamBuilder<QuerySnapshot>(
        stream: Database.readItems(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("opps! error");
          } else if (snapshot.hasData || snapshot.data != null) {
            return ListView.separated(
                itemBuilder: (context, index) {
                  String topic = snapshot.data!.docs[index].get("topic");
                  String title = snapshot.data!.docs[index].get("title");
                  String docId = snapshot.data!.docs[index].id;
                  String description = snapshot.data!.docs[index].get("description");
                  return Card(
                    child: ListTile(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => EditScreen(topic: topic,title: title, description: description, docId: docId,),),),
                      onLongPress:() => Database.deleteItem(docId: snapshot.data!.docs[index].id),
                      trailing: Text(topic),
                      title: Text(title),
                      subtitle: Text(description),
                    ),
                  );

                },
                separatorBuilder: (context, index) => SizedBox(height: 15,),
                itemCount: snapshot.data!.docs.length);
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AddNewScreen(),),),
        child: Icon(Icons.add),
      ),
    );
  }
}


// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   final List<Expenses> expenses = [
//     Expenses(
//       createdTime: DateTime.now(),
//     ),
//   ];
//
//   int selectedIndex = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(250),
//         child: AppBar(title: Text("Personal Expanses"),
//
//         )
//
//         // title: Text("Fireapp"),
//         // centerTitle: true,
//       ),
//
//
//       body: StreamBuilder<QuerySnapshot>(
//         stream: Database.readItems(),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             return Text("opps! error");
//           } else if (snapshot.hasData || snapshot.data != null) {
//             return ListView.separated(
//
//                 itemBuilder: (context, index) {
//                   String topic = snapshot.data!.docs[index].get("topic");
//                   String title = snapshot.data!.docs[index].get("title");
//                   String docId = snapshot.data!.docs[index].id;
//                   String description =
//                       snapshot.data!.docs[index].get("description");
//
//                   return Container(
//                     margin: EdgeInsets.symmetric(
//                       horizontal: 25,
//                     ),
//                     child: Card(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(18),
//                       ),
//
//                       child: ListTile(
//                         onTap: () => Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (_) => EditScreen(
//                               topic: topic,
//                               title: title,
//                               description: description,
//                               docId: docId,
//                             ),
//                           ),
//                         ),
//                         onLongPress: () => Database.deleteItem(
//                             docId: snapshot.data!.docs[index].id),
//                         trailing: Text(topic),
//                         title: Text(title),
//                         subtitle: Text(description),
//                       ),
//                     ),
//                   );
//                 },
//                 separatorBuilder: (context, index) => SizedBox(
//                       height: 15,
//                     ),
//                 itemCount: snapshot.data!.docs.length);
//           }
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (_) => AddNewScreen(),
//           ),
//         ),
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
