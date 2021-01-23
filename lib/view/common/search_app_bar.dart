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
          return SearchAppBarBody(
              stream: stream,
              widget: widget,
              queryController: queryController,
              context: context);
        } else {
          return widget.mainAppBar(stream, queryController.text);
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    queryController.dispose();
    stream.close();
  }
}

class SearchAppBarBody extends StatelessWidget {
  const SearchAppBarBody({
    Key key,
    @required this.stream,
    @required this.widget,
    @required this.queryController,
    @required this.context,
  }) : super(key: key);

  final StreamController<bool> stream;
  final SearchAppBar widget;
  final TextEditingController queryController;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: InkWell(child: BackButton(
        onPressed: () {
          stream.add(false);
          widget.onSubmit("");
        },
      )),
      backgroundColor: widget.primary,
      title: Align(
        alignment: Alignment.centerRight,
        child: ConstrainedBox(
          constraints: const BoxConstraints.tightFor(width: 500),
          child: TextField(
            controller: queryController,
            autofocus: true,
            onSubmitted: (String value) {
              //stream.add(false);
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
      ),
      actions: [
        IconButton(
          onPressed: () {
            //stream.add(true);
            widget.onSubmit(queryController.text);
          },
          icon: const Icon(Icons.search),
        ),
        const SizedBox(
          width: 10,
        )
      ],
    );
  }
}
