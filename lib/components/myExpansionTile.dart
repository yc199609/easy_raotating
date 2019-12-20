import 'package:flutter/material.dart';

const Duration _kExpand = Duration(milliseconds: 200);

class MyExpansionTile extends StatefulWidget {
  const MyExpansionTile({
    Key key,
    this.leading,
    @required this.title,
    this.backgroundColor,
    this.onExpansionChanged,
    this.children = const <Widget>[],
    this.trailing,
    this.onTap,
    this.isExpanded
  }) : super(key: key);

  final VoidCallback onTap;

  final bool isExpanded;

  final Widget leading;

  final Widget title;

  final ValueChanged<bool> onExpansionChanged;

  final List<Widget> children;

  final Color backgroundColor;

  final Widget trailing;

  @override
  _MyExpansionTileState createState() => _MyExpansionTileState();
}

class _MyExpansionTileState extends State<MyExpansionTile> with SingleTickerProviderStateMixin {
  static final Animatable<double> _easeOutTween = CurveTween(curve: Curves.easeOut);
  static final Animatable<double> _easeInTween = CurveTween(curve: Curves.easeIn);
  static final Animatable<double> _halfTween = Tween<double>(begin: 0.0, end: 0.5);

  final ColorTween _borderColorTween = ColorTween();
  final ColorTween _headerColorTween = ColorTween();
  final ColorTween _iconColorTween = ColorTween();
  final ColorTween _backgroundColorTween = ColorTween();

  AnimationController _controller;
  Animation<double> _iconTurns;
  Animation<double> _heightFactor;
  Animation<Color> _borderColor;
  Animation<Color> _headerColor;
  Animation<Color> _iconColor;
  Animation<Color> _backgroundColor;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: _kExpand, vsync: this);
    _heightFactor = _controller.drive(_easeInTween);
    _iconTurns = _controller.drive(_halfTween.chain(_easeInTween));
    _borderColor = _controller.drive(_borderColorTween.chain(_easeOutTween));
    _headerColor = _controller.drive(_headerColorTween.chain(_easeInTween));
    _iconColor = _controller.drive(_iconColorTween.chain(_easeInTween));
    _backgroundColor = _controller.drive(_backgroundColorTween.chain(_easeOutTween));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildChildren(BuildContext context, Widget child) {
    final Color borderSideColor = _borderColor.value ?? Colors.transparent;

    return Container(
      decoration: BoxDecoration(
        color: _backgroundColor.value ?? Colors.transparent,
        border: Border(
          top: BorderSide(color: borderSideColor),
          bottom: BorderSide(color: borderSideColor),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTileTheme.merge(
            iconColor: _iconColor.value,
            textColor: _headerColor.value,
            child: ListTile(
              onTap: widget.onTap,
              leading: widget.leading,
              title: widget.title,
              trailing: widget.trailing ?? RotationTransition(
                turns: _iconTurns,
                child: const Icon(Icons.expand_more),
              ),
            ),
          ),
          ClipRect(
            child: Align(
              heightFactor: _heightFactor.value,
              child: child,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void didChangeDependencies() {
    final ThemeData theme = Theme.of(context);
    _borderColorTween
      ..end = theme.dividerColor;
    _headerColorTween
      ..begin = theme.textTheme.subhead.color
      ..end = theme.accentColor;
    _iconColorTween
      ..begin = theme.unselectedWidgetColor
      ..end = theme.accentColor;
    _backgroundColorTween
      ..end = widget.backgroundColor;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isExpanded) {
      _controller.forward();
    } else {
      _controller.reverse().then<void>((void value) {
        if (!mounted)
          return;
        setState(() {});
      });
    }
    final bool closed = !widget.isExpanded && _controller.isDismissed;
    return AnimatedBuilder(
      animation: _controller.view,
      builder: _buildChildren,
      child: closed ? null : Column(children: widget.children),
    );
  }
}
