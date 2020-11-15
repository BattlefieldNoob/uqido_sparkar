import 'dart:async';

import 'package:flutter/material.dart';

typedef AppBarCallback = AppBar Function(
    StreamController<bool> stream, String searching);

class SearchAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Color statusBarColor;
  final Color primary;
  final bool autoSelected;
  final AppBarCallback mainAppBar;
  final Color mainTextColor;
  final String initialQuery;
  final String searchHint;
  final Function(String search) onSubmit;
  final double searchFontSize;

  SearchAppBar({
    @required this.primary,
    this.mainTextColor = Colors.white,
    this.statusBarColor,
    this.initialQuery,
    this.autoSelected = false,
    this.searchHint = "Search here...",
    @required this.mainAppBar,
    @required this.onSubmit,
    this.searchFontSize = 20,
  });

  @override
  Size get preferredSize {
    return Size.fromHeight(60.0);
  }

  @override
  _SearchAppBarState createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> {
  final TextEditingController queryController = TextEditingController();
  final StreamController<bool> stream = StreamController<bool>.broadcast();
  bool state = false;

  _SearchAppBarState() {
    stream.stream.listen((onData) {
      state = onData;
    });
  }

  Widget build(BuildContext context) {
    if (widget.initialQuery != null) {
      queryController.text = widget.initialQuery;
      widget.onSubmit(widget.initialQuery);
    }

    return StreamBuilder(
      stream: stream.stream,
      builder: (BuildContext context, AsyncSnapshot<bool> snap) {
        bool _show = widget.autoSelected;

        if (snap.hasData) {
          _show = snap.data;
        }

        if (_show) {
          return searchAppBar(
            context: context,
          );
        } else {
          return showMainAppBar();
        }
      },
    );
  }

  Widget showMainAppBar() {
    return widget.mainAppBar(stream, queryController.text);
  }

  Widget searchAppBar({@required BuildContext context}) {
    return AppBar(
        leading: InkWell(child: BackButton(
          onPressed: () {
            stream.add(false);
          },
        )),
        backgroundColor: widget.primary,
        title: Align(
          alignment: Alignment.centerRight,
          child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(width: 500),
            child: TextField(
              controller: queryController,
              autofocus: true,
              onSubmitted: (String value) {
                stream.add(false);
                widget.onSubmit(value);
              },
              style: TextStyle(
                fontSize: widget.searchFontSize,
                color: widget.mainTextColor,
              ),
              cursorColor: widget.mainTextColor,
              decoration: InputDecoration(
                hintText: widget.searchHint,
                border: InputBorder.none,
                hintStyle: TextStyle(
                  color: widget.mainTextColor.withAlpha(100),
                ),
              ),
            ),
          ),
        ));
  }

  @override
  void dispose() {
    super.dispose();
    queryController.dispose();
    stream.close();
  }
}
