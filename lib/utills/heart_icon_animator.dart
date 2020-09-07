import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterapp/utills/config.dart';

class HeartIconAnimator extends StatefulWidget {
  final bool isLiked;
  final double size;
  final VoidCallback onTap;
  final Stream<void> triggerAnimationStream;

  final double height;
  final double width;

  HeartIconAnimator(
      {@required this.isLiked,
      this.size = 24.0,
      @required this.onTap,
      this.triggerAnimationStream,
      this.height,
      this.width});

  @override
  _HeartIconAnimatorState createState() => _HeartIconAnimatorState();
}

class _HeartIconAnimatorState extends State<HeartIconAnimator>
    with SingleTickerProviderStateMixin {
  AnimationController _likeController;
  Animation<double> _likeAnimation;

  @override
  void initState() {
    super.initState();
    final quick = const Duration(milliseconds: 500);
    final scaleTween = Tween(begin: 0.0, end: 1.0);
    _likeController = AnimationController(duration: quick, vsync: this);
    _likeAnimation = scaleTween.animate(
      CurvedAnimation(
        parent: _likeController,
        curve: Curves.elasticOut,
      ),
    );

    // Ensure a full scale like button on init.
    _likeController.animateTo(1.0, duration: Duration.zero);

    if (widget.triggerAnimationStream != null) {
      widget.triggerAnimationStream.listen((_) => _animate());
    }
  }

  @override
  void dispose() {
    _likeController.dispose();
    super.dispose();
  }

  void _animate() {
    _likeController
      ..reset()
      ..forward();
  }

  @override
  Widget build(BuildContext context) {
    return _TapableHeart(
      isLiked: widget.isLiked,
      size: widget.size,
      height: widget.height,
      width: widget.width,
      onTap: () {
        _animate();
        widget.onTap();
      },
      animation: _likeAnimation,
    );
  }
}

class _TapableHeart extends AnimatedWidget {
  final bool isLiked;
  final double size;
  final VoidCallback onTap;
  final double height;
  final double width;

  _TapableHeart({
    Key key,
    this.height,
    this.width,
    @required this.isLiked,
    @required this.size,
    @required this.onTap,
    @required Animation<double> animation,
  }) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: listenable,
      child: GestureDetector(
        child: isLiked
            ? SvgPicture.asset(
                'assets/like_filled.svg',
                height: height,
                width: width,
              )
            : SvgPicture.asset(
                'assets/like.svg',
                height: height,
                width: width,
              ),
        onTap: onTap,
      ),
    );
  }
}
