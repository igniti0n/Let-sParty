import 'package:LetsParty/widgets/purple_button.dart';
import 'package:flutter/material.dart';

import '../../../screens/navigation_screens/party_creation_screens/navigation_party_creation_widget.dart';
import '../../../constants.dart';
import '../../../services/ImagePickerService.dart';

class PartyCreationScreenTitle extends StatelessWidget {
  PartyCreationScreenTitle({
    Key key,
    this.onNext,
    @required this.initialValue,
  }) : super(key: key);
  final GlobalKey<FormState> _formkey = new GlobalKey<FormState>();
  final String initialValue;
  final Function(Map<String, dynamic> data) onNext;

  Map<String, dynamic> _titlePicutureData = {
    'title': '',
    'imageUrl': '',
  };

  void _tryToContinue() {
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();
      onNext(_titlePicutureData);
    }
  }

  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context);
    final _theme = Theme.of(context);
    print('BUILDING TITLE');

    return Stack(
      children: [
        ...Constants.buildBackground(),
        SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 20, 20, 0),
                child: Form(
                  key: _formkey,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/icons/beer.png',
                        height: 50,
                      ),
                      Container(
                        width: _media.size.width / 1.5,

                        //TODO: ENFORCE TITLE LENGHT
                        child: TextFormField(
                          initialValue: initialValue,
                          validator: (text) {
                            if (text.length > 15) return 'Title too long';
                          },
                          onSaved: (text) {
                            _titlePicutureData['title'] = text.trim();
                          },
                          textAlign: TextAlign.center,
                          style:
                              _theme.textTheme.headline1.copyWith(fontSize: 26),
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            hintText: 'Your party title',
                            border: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            focusedErrorBorder: InputBorder.none,
                            contentPadding: EdgeInsets.all(2),
                          ),
                        ),
                      ),
                      Image.asset(
                        'assets/icons/toast.png',
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                height: 2,
                thickness: 1,
                endIndent: 20,
                color: Colors.blueGrey.shade300,
                indent: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
                child: Text(
                  Constants.textPartyCreationTitle,
                  style: _theme.textTheme.bodyText1
                      .copyWith(color: Constants.kHelperTextColor, height: 1.5),
                ),
              ),
              Container(
                color: Color.fromRGBO(199, 199, 214, 0.5),
                height: _media.size.height * 0.3,
                child: Placeholder(
                  color: Colors.grey[400],
                ),
              ),
              Row(
                children: [
                  PurpleButtonCliped(
                      media: _media, theme: _theme, onTap: () {}, text: 'hello')
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
                child: Text(
                  Constants.textPartyCreationImage,
                  style: _theme.textTheme.bodyText1.copyWith(
                    color: Constants.kHelperTextColor,
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
        ),
        NavigationPartyCreationWidget(
          media: _media,
          onNext: () {
            _tryToContinue();
          },
          onPrevious: () => Navigator.of(context).pop(),
        )
        //   bottom: 40,
        //   left: _media.size.width / 4.6,
        // ),
      ],
    );
  }
}
