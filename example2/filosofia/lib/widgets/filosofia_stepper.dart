import 'package:filosofia/filosofia.dart';
import 'package:flutter/material.dart';

class FilosofiaStepper extends StatelessWidget {
  final List<IconData> _icons;
  final List<String>? _titles;
  final int _curStep;
  final Color _activeColor;
  final Color _inactiveColor = Colors.grey.shade200;
  final double lineWidth = 4.0;
  final Axis direction;
  final FilosofiaStepperTheme? theme;

  FilosofiaStepper(
      {Key? key,
      required List<IconData> icons,
      required int curStep,
      List<String>? titles,
      required Color color,
      required this.direction,
      this.theme})
      : _icons = icons,
        _titles = titles,
        _curStep = curStep,
        _activeColor = color,
        assert(curStep > 0 == true && curStep <= icons.length),
        super(key: key);

  List<Widget> _iconViews(BuildContext context, FilosofiaStepperTheme theme) {
    var list = <Widget>[];

    _icons.asMap().forEach(
      (i, icon) {
        final shouldBePainted = (i == 0 || _curStep > i + 1 || _curStep == _icons.length);

        var circleColor = shouldBePainted ? _activeColor : _inactiveColor;
        var lineColor = _curStep > i + 1 ? _activeColor : _inactiveColor;
        var iconColor = shouldBePainted ? _inactiveColor : _activeColor;

        final isActive = (i == 0 || _curStep > i || _curStep == _icons.length);

        const iconContainerSize = 30.0;

        final iconContainer = Container(
          width: iconContainerSize,
          height: iconContainerSize,
          padding: const EdgeInsets.all(0),
          decoration: BoxDecoration(
            color: circleColor,
            borderRadius: const BorderRadius.all(Radius.circular(25.0)),
            border: Border.all(
              color: _activeColor,
              width: 2.0,
            ),
          ),
          child: Icon(
            icon,
            color: iconColor,
            size: iconContainerSize / 2,
          ),
        );

        list.add(
          //dot with icon view
          direction == Axis.horizontal
              ? iconContainer
              : Row(
                  children: [
                    iconContainer,
                    if (_titles != null)
                      Padding(
                        padding: EdgeInsets.only(left: FilosofiaTheme.of(context).spacing.md_lg),
                        child: Text(
                          _titles![i],
                          style: isActive
                              ? theme.activeTitleStyle
                              : theme.inactiveTitleStyle,
                        ),
                      ),
                  ],
                ),
        );

        //line between icons
        if (i != _icons.length - 1) {
          list.add(
            direction == Axis.horizontal
                ? Expanded(
                    flex: 8,
                    child: Container(
                      height: lineWidth,
                      color: lineColor,
                    ),
                  )
                : ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxHeight: iconContainerSize * 1.5,
                      minHeight: iconContainerSize,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: (iconContainerSize - lineWidth) / 2),
                      child: Container(
                        width: lineWidth,
                        color: lineColor,
                      ),
                    ),
                  ),
          );
        }
      },
    );

    return list;
  }

  Widget _titleViews(BuildContext context) {
    final currentTitle = _titles![_curStep - 1];
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Status: ',
          style: FilosofiaTheme.of(context).textTheme.cardSubtitleSm,
        ),
        Text(
          currentTitle,
          style: FilosofiaTheme.of(context).textTheme.cardTitleSm,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme =
        this.theme ?? FilosofiaTheme.of(context).theme.stepperPrimaryTheme;
    return Container(
      padding: const EdgeInsets.only(
        top: 32.0,
        left: 24.0,
        right: 24.0,
      ),
      child: Column(
        children: <Widget>[
          Flex(
            direction: direction,
            mainAxisAlignment: direction == Axis.horizontal
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.center,
            crossAxisAlignment: direction == Axis.horizontal
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.start,
            children: _iconViews(context, theme),
          ),
          const SizedBox(
            height: 10,
          ),
          if (_titles != null && direction != Axis.vertical)
            _titleViews(context)
        ],
      ),
    );
  }
}
