import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

import '../../screens/visiting_user_screen.dart';
import '../../services/FirebaseAuthService.dart';
import '../../services/FirebaseFirestoreService.dart';
import '../../constants.dart';
import '../../models/user.dart';

import 'package:provider/provider.dart';

class UserAddingScreen extends StatefulWidget {
  const UserAddingScreen({Key key}) : super(key: key);

  @override
  _UserAddingScreenState createState() => _UserAddingScreenState();
}

class _UserAddingScreenState extends State<UserAddingScreen> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
    final ThemeData _theme = Theme.of(context);
    final MediaQueryData _mediaData = MediaQuery.of(context);
    final User _currentUser = Provider.of<User>(context, listen: false);
    List<User> _requestsUsers;

    void _tryToAddUser() {
      if (_formKey.currentState.validate()) {
        print(_formKey.currentContext.widget.toStringDeep());

        _formKey.currentState.save();
      }
    }

    return Stack(
      children: [
        ...Constants.buildBackground(),
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 10, 20),
                child: Text(
                  Constants.textUserAddingScreen,
                  style: _theme.textTheme.bodyText1.copyWith(
                    color: Constants.kHelperTextColor,
                    fontSize: 16,
                  ),
                ),
              ),
              Form(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: TextFormField(
                    maxLines: 1,
                    toolbarOptions: ToolbarOptions(
                      copy: true,
                      cut: true,
                      paste: true,
                      selectAll: true,
                    ),
                    style: _theme.textTheme.headline1,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      disabledBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Divider(
                height: 2,
                thickness: 1,
                endIndent: _mediaData.size.width > 800 ? 100 : 60,
                color: Colors.blueGrey.shade300,
                indent: _mediaData.size.width > 800 ? 100 : 60,
              ),
              SendRequestButton(
                mediaData: _mediaData,
                theme: _theme,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
                child: Text(
                  "Your Party ID:\n#jd23h2134",
                  style: _theme.textTheme.headline1.copyWith(
                    color: Constants.kHelperTextColor,
                    fontSize: 17,
                  ),
                ),
              ),
              Text(
                "Your Friend Requests",
                style: _theme.textTheme.headline1.copyWith(
                  // color: Constants.kHelperTextColor,
                  fontSize: 17,
                ),
              ),
              Divider(
                height: 2,
                thickness: 1.5,
                endIndent: _mediaData.size.width * 0.1,
                color: Colors.blueGrey.shade300,
                indent: _mediaData.size.width * 0.1,
              ),
              Container(
                height: _mediaData.size.height * 0.2,
                child: FutureBuilder(
                    future: Provider.of<FirebaseFirestoreService>(context,
                            listen: false)
                        .getAllUsersFromList(_currentUser.friendRequests),
                    initialData: [],
                    builder: (cntx, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting)
                        return Constants.displayLoadingSpinner();

                      final List<User> _data = snapshot.data as List<User>;

                      return ListView.builder(
                        itemCount: _currentUser.friendRequests.length,
                        itemBuilder: (ctx, index) {
                          return RequestTile(
                            currentUser: _currentUser,
                            theme: _theme,
                            mediaData: _mediaData,
                            sendingUser: _data.elementAt(index),
                            shouldAddDivider:
                                index == _currentUser.friendRequests.length - 1
                                    ? false
                                    : true,
                          );
                        },
                      );
                    }),
              ),
              Divider(
                height: 2,
                thickness: 1.5,
                endIndent: _mediaData.size.width * 0.1,
                color: Colors.blueGrey.shade300,
                indent: _mediaData.size.width * 0.1,
              ),
              SizedBox(
                height: 4,
              ),
              TextButton(
                child: Text("User Settings"),
                onPressed: () {},
              ),
              TextButton(
                child: Text("Log out"),
                onPressed: () {
                  Provider.of<FirebaseAuthService>(context, listen: false)
                      .logOut();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class RequestTile extends StatelessWidget {
  RequestTile({
    Key key,
    @required this.sendingUser,
    @required this.mediaData,
    @required this.shouldAddDivider,
    @required this.theme,
    @required this.currentUser,
  }) : super(key: key);
  final User sendingUser;
  final MediaQueryData mediaData;
  final bool shouldAddDivider;
  final ThemeData theme;
  final User currentUser;

  final TapGestureRecognizer _recognizer = TapGestureRecognizer();

  @override
  Widget build(BuildContext context) {
    _recognizer.onTap = () {
      Navigator.of(context).push(new MaterialPageRoute(
          builder: (ctx) => VisitingUserScreen(
                currentUser: currentUser,
                visitingUser: sendingUser,
              )));
    };

    return Column(
      children: [
        Container(
          height: mediaData.size.height * 0.05,
          width: mediaData.size.width * 0.8,
          padding: EdgeInsets.fromLTRB(2, 3, 2, 3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                flex: 2,
                child: Container(
                  child: RichText(
                    text: TextSpan(
                      text: '${sendingUser.username} ',
                      recognizer: _recognizer,
                      style: theme.textTheme.bodyText1
                          .copyWith(fontWeight: FontWeight.w600),
                      children: [
                        TextSpan(
                          text: ' wants to party !',
                          style: theme.textTheme.bodyText1,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RequestTileButton(
                      mediaData: mediaData,
                      theme: theme,
                      isAdding: true,
                    ),
                    RequestTileButton(
                      mediaData: mediaData,
                      theme: theme,
                      isAdding: false,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        if (shouldAddDivider)
          Divider(
            height: 2,
            thickness: 2,
            endIndent: mediaData.size.width > 800 ? 100 : 60,
            color: Colors.grey[300],
            indent: mediaData.size.width > 800 ? 100 : 60,
          ),
      ],
    );
  }
}

class RequestTileButton extends StatelessWidget {
  const RequestTileButton({
    Key key,
    @required this.mediaData,
    @required this.theme,
    @required this.isAdding,
  }) : super(key: key);

  final MediaQueryData mediaData;
  final ThemeData theme;
  final bool isAdding;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: mediaData.size.width * 0.4,
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: isAdding
            ? Constants.kButtonColor
            : Color.fromRGBO(255, 142, 142, 1),
        borderRadius: BorderRadius.all(Radius.circular(8)),
        border: Border.all(color: Color.fromRGBO(97, 92, 92, 1), width: 2),
        // boxShadow: [
        //   BoxShadow(offset: Offset(0, 1), color: Colors.black, blurRadius: 1)
        // ],
      ),

      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Image.asset(isAdding
                ? 'assets/icons/addUser-filled.png'
                : 'assets/icons/removeUser-filled.png'),
          ),
        ),
      ),
    );
  }
}

class SendRequestButton extends StatelessWidget {
  const SendRequestButton({
    Key key,
    @required this.mediaData,
    @required this.theme,
  }) : super(key: key);

  final MediaQueryData mediaData;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: mediaData.size.width * 0.4,
        decoration: BoxDecoration(
          color: Constants.kButtonColor,
          borderRadius: BorderRadius.all(Radius.circular(8)),
          border: Border.all(color: Color.fromRGBO(97, 92, 92, 1), width: 2),
          boxShadow: [
            BoxShadow(offset: Offset(0, 1), color: Colors.black, blurRadius: 1)
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Send Request',
                textAlign: TextAlign.center,
                style: theme.textTheme.headline1.copyWith(
                  color: Constants.kPurpleButtonTextColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
