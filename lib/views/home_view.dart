import 'package:flutter/material.dart';
import 'package:sqfliteyotubenotaapp/helper/datebase_helper.dart';
import 'package:sqfliteyotubenotaapp/model/user_model.dart';


class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<UserModel> userlist = [];

  String name, phone, email;

  GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Center(
            child: Text("Contacts")
        ),
      ),
      body: getAllUser(),
      floatingActionButton: _buildFloatingActionButton(context),
    );
  }



  getAllUser() {
    return FutureBuilder(
        future: _getData(),
        builder: (context, snapshot) {
          return createListView(context, snapshot);
        });
  }
  Future<List<UserModel>> _getData() async {
    var dbHelper = DataHelper.db;

   await dbHelper.getAllUser().then((value) {
      userlist = value;
    });
    return userlist;
  }

  createListView(BuildContext context, AsyncSnapshot snapshot) {
    userlist = snapshot.data;

    if (userlist != null) {
      return ListView.builder(
          itemCount: userlist.length,
          itemBuilder: (context, index) {
            return _buildItem(userlist[index],index);
          });
    } else {
      return Container();
    }
  }

  _buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        openAlertBox(context);
      },
      backgroundColor: Colors.deepOrangeAccent,
      child: Icon(Icons.add),
    );
  }

  openAlertBox(BuildContext context) {
    return showDialog<void>(
        builder: (context) {
          return AlertDialog(
            content: Container(
              width: 300,
              height: 200,
              child: Form(
                key: _key,
                child: Column(
                  children: [
                    TextFormField(
                      initialValue: name,
                      decoration: InputDecoration(
                        hintText: 'Add Name',
                        border: InputBorder.none,
                        fillColor: Colors.grey[300],
                      ),
                      validator: (value) {
                        return null;
                      },
                      onSaved: (String value) {
                        name = value;
                      },
                    ),
                    TextFormField(
                      initialValue: phone,
                      decoration: InputDecoration(
                        hintText: 'Add Phone',
                        border: InputBorder.none,
                        fillColor: Colors.grey[300],
                      ),
                      validator: (value) {
                        return null;
                      },
                      onSaved: (String value) {
                        phone = value;
                      },
                    ),
                    TextFormField(
                      initialValue: email,
                      decoration: InputDecoration(
                        hintText: 'Add Email',
                        border: InputBorder.none,
                        fillColor: Colors.grey[300],
                      ),
                      validator: (value) {
                        return null;
                      },
                      onSaved: (String value) {
                        email = value;
                      },
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        addUser(context);
                      },
                      child: Text("Add User"),
                    )
                  ],
                ),
              ),
            ),
          );
        },
        context: context);
  }
  void addUser(context)async {
    _key.currentState.save();
    var dbHelper = DataHelper.db;
    dbHelper
        .insertUser(UserModel(name: name, phone: phone, email: email))
        .then((value){
      Navigator.pop(context);
      setState(() {

      });
    });
  }

  _buildItem(UserModel model, int index) {
    return Card(
      child:ListTile(
        title: Row(
          children: [
            Column(
              children: [
                Container(
                  child: CircleAvatar(
                    radius: 30,
                    child: Text(
                      model.name.substring(0,1).toLowerCase(),
                      style: TextStyle(
                          fontSize: 35,
                          color: Colors.white
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Icon(
                        Icons.account_circle
                    ),
                    Padding(padding: EdgeInsets.only(right: 10)),
                    Text(model.name,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black
                      ),
                      softWrap: true,
                      maxLines: 2,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Icon(
                        Icons.phone
                    ),
                    Padding(padding: EdgeInsets.only(right: 10)),
                    Text(model.phone,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black
                      ),
                      softWrap: true,
                      maxLines: 2,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Icon(
                        Icons.email
                    ),
                    Padding(padding: EdgeInsets.only(right: 10)),
                    Text(model.email,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black
                      ),
                      softWrap: true,
                      maxLines: 2,
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
        trailing: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: IconButton(
            onPressed: (){

            },
            icon: Icon(Icons.edit),
          ),
        ),
      ) ,
    );
  }







}
