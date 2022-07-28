import 'package:flutter/material.dart';

import '../../../import_basic.dart';

// class WcLikeButton extends StatelessWidget {
//   WcLikeButton(
//       {Key? key,
//       required this.onLikeChanged,
//       required this.likeNum,
//       required this.isLiked})
//       : super(key: key);

//   final void Function(bool) onLikeChanged;
//   String likeNum;
//   bool isLiked;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.fromLTRB(0, 5, 9, 4),
//       color: Colors.transparent,
//       child: Row(
//         children: [
//           LikeButton(
//             valueChanged: onLikeChanged,
//             isFavorite: isLiked,
//             iconSize: 26,
//             iconColor: WcColors.red100,
//             iconDisabledColor: WcColors.grey100,
//           ),
//           SizedBox(
//             width: 5,
//           ),
//           Text(
//             likeNum,
//             style: GoogleFonts.montserrat(
//               fontSize: 14,
//               color: WcColors.grey140,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class WcLikeButton extends StatefulWidget {
  WcLikeButton({
    double? iconSize,
    Color? iconColor,
    Color? iconDisabledColor,
    bool? isLiked,
    required String likeNum,
    required void Function(bool) valueChanged,
    bool? disableLike,
    void Function()? onLikeTap,
    Key? key,
  })  : _iconSize = iconSize ?? 27.0,
        _iconColor = iconColor ?? WcColors.red100,
        _iconDisabledColor = iconDisabledColor ?? WcColors.grey100,
        _isLiked = isLiked ?? false,
        _valueChanged = valueChanged,
        _likeNum = likeNum,
        _diableLike = disableLike ?? false,
        _onLikeTap = onLikeTap,
        super(key: key);

  final double _iconSize;
  final Color _iconColor;
  final bool _isLiked;
  final void Function(bool) _valueChanged;
  final Color? _iconDisabledColor;
  final String _likeNum;
  final bool _diableLike;
  final void Function()? _onLikeTap;

  @override
  _WcLikeButtonState createState() => _WcLikeButtonState();
}

class _WcLikeButtonState extends State<WcLikeButton>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  late Animation<double> _sizeAnimation;

  late CurvedAnimation _curve;

  double _maxIconSize = 0.0;
  double _minIconSize = 0.0;

  final int _animationTime = 300;

  bool _isFavorite = false;
  bool _isAnimationCompleted = false;
  bool _disableLike = false;
  String _likeNum = '';
  void Function()? _onLikeTap;

  @override
  void initState() {
    super.initState();
    _onLikeTap = widget._onLikeTap;
    _likeNum = widget._likeNum;
    _isFavorite = widget._isLiked;
    _disableLike = widget._diableLike;
    _maxIconSize = (widget._iconSize < 20.0)
        ? 20.0
        : (widget._iconSize > 100.0)
            ? 100.0
            : widget._iconSize;
    final double _sizeDifference = _maxIconSize * 0.20;
    _minIconSize = _maxIconSize - _sizeDifference;

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: _animationTime),
    );

    _curve = CurvedAnimation(curve: Curves.slowMiddle, parent: _controller);
    Animation<Color?> _selectedColorAnimation = ColorTween(
      begin: widget._iconColor,
      end: widget._iconDisabledColor,
    ).animate(_curve);

    Animation<Color?> _deSelectedColorAnimation = ColorTween(
      begin: widget._iconDisabledColor,
      end: widget._iconColor,
    ).animate(_curve);

    _colorAnimation = (_isFavorite == true)
        ? _selectedColorAnimation
        : _deSelectedColorAnimation;
    _sizeAnimation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween<double>(
            begin: _minIconSize,
            end: _maxIconSize,
          ),
          weight: 50,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(
            begin: _maxIconSize,
            end: _minIconSize,
          ),
          weight: 50,
        ),
      ],
    ).animate(_curve);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _isAnimationCompleted = true;
        _isFavorite = !_isFavorite;
        widget._valueChanged(_isFavorite);
      } else if (status == AnimationStatus.dismissed) {
        _isAnimationCompleted = false;
        _isFavorite = !_isFavorite;
        widget._valueChanged(_isFavorite);
      }
    });
  }

  setAnimation() {}

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, _) {
        return GestureDetector(
          onTap: () {
            if (_disableLike == false) {
              setState(() {
                if (_isAnimationCompleted == true) {
                  _controller.reverse();
                } else {
                  _controller.forward();
                }
              });
            } else {
              setState(() {
                if (_onLikeTap != null) {
                  _onLikeTap!();
                }
              });
            }
          },
          child: Container(
            padding: const EdgeInsets.fromLTRB(0, 5, 9, 4),
            color: Colors.transparent,
            child: Row(
              children: [
                Icon(
                  (Icons.favorite),
                  color: _colorAnimation.value,
                  size: _sizeAnimation.value,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  _likeNum,
                  style: GoogleFonts.montserrat(
                    fontSize: 14,
                    color: WcColors.grey140,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
