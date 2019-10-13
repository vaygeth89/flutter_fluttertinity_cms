import 'package:flutter/material.dart';
import 'package:fluttertinity/model/user.dart';
import 'package:fluttertinity/network/user_restful.dart';
import 'package:fluttertinity/router.dart';

class EditUserPageArguments {
  final User user;
  final isNewUser;

  EditUserPageArguments({@required this.user, this.isNewUser = false});
}

class EditUserPage extends StatefulWidget {
  final EditUserPageArguments arguments;
  EditUserPage({Key key, @required this.arguments}) : super(key: key);

  _EditUserPageState createState() => _EditUserPageState();
}

class _EditUserPageState extends State<EditUserPage> {
  TextEditingController nameController = TextEditingController();
  var nameFocusNode = FocusNode();
  var emailController = TextEditingController();
  var emailFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.arguments.user.name;
    emailController.text = widget.arguments.user.email;
  }

  @override
  Widget build(BuildContext context) {
    String titlePart = widget.arguments.isNewUser
        ? "New User"
        : "User: " + widget.arguments.user.id.toString();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          titlePart,
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(25.0, 0, 25, 0),
            child: Form(
              key: UniqueKey(),
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: nameController,
                    focusNode: nameFocusNode,
                    decoration: InputDecoration(labelText: "Name"),
                  ),
                  TextField(
                    controller: emailController,
                    focusNode: emailFocusNode,
                    decoration: InputDecoration(labelText: "Email"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.cloud_upload),
        onPressed: () async {
          UserRestWebservice userRestWebservice = UserRestWebservice();
          User user;

          if (widget.arguments.isNewUser) {
            user = User(
                
                name: nameController.text,
                email: emailController.text);
             userRestWebservice.createUser(user);
          } else {
            user = User(id: widget.arguments.user.id,name: nameController.text, email: emailController.text);
             userRestWebservice.updateUser(user);
          }
          Navigator.of(context)
              .pushReplacementNamed(RouterManager.usersPageRoute);
        },
      ),
    );
  }
}
