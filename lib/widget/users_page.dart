import 'package:flutter/material.dart';
import 'package:fluttertinity/model/user.dart';
import 'package:fluttertinity/network/user_restful.dart';
import 'package:fluttertinity/router.dart';
import 'package:fluttertinity/widget/app_drawer.dart';
import 'package:fluttertinity/widget/edit_user_page.dart';

class UsersPage extends StatefulWidget {
  UsersPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  UserRestWebservice userRestful = UserRestWebservice();
  DismissDirection dismissDirection = DismissDirection.startToEnd;
  Widget usersFutureBuilder;
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text("Fluttertinity"),
      ),
      body: SafeArea(
              child: FutureBuilder(
            future: userRestful.getUsers(),
            builder:
                (BuildContext context, AsyncSnapshot<List<User>> usersSnapshot) {
              if (usersSnapshot.connectionState == ConnectionState.done &&
                  usersSnapshot.hasData) {
                return ListView.builder(
                  itemCount: usersSnapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Dismissible(
                      key: UniqueKey(),
                      direction: dismissDirection,
                      onDismissed: (direction) async {
                        List<User> users = List();
                        users.add(usersSnapshot.data[index]);
                        var numOfDeletedRecord = await deleteUser(users);
                        print(numOfDeletedRecord.toString());
                      },
                      background: Container(
                        color: Colors.redAccent,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Delete ${usersSnapshot.data[index].id}",
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ),
                      child: ListTile(
                        leading: Text(usersSnapshot.data[index].id.toString()),
                        title: Text(usersSnapshot.data[index].name),
                        subtitle: Text(usersSnapshot.data[index].email),
                        trailing: Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          Navigator.of(context).pushNamed(
                              RouterManager.editUserPageRoute,
                              arguments: EditUserPageArguments(
                                  user: usersSnapshot.data[index]));
                        },
                      ),
                    );
                  },
                );
              } else {
                if (usersSnapshot.connectionState == ConnectionState.active ||
                    usersSnapshot.connectionState == ConnectionState.waiting)
                  return Center(child: CircularProgressIndicator());
                return Center(
                  child: Text("No Users"),
                );
              }
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(RouterManager.editUserPageRoute,
              arguments: EditUserPageArguments(
                  user: User(id: null, name: "", email: ""), isNewUser: true));
        },
        tooltip: 'New User',
        child: Icon(Icons.add),
      ),
    );
  }

  Future<int> deleteUser(List<User> users) async {
    return userRestful.deleteUsers(users: users);
  }
}
