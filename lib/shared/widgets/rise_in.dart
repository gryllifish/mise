import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mise/core/constants/app_durations.dart';

/// Rises and fades its child in, or fades it out, depending on [visible].
///
/// Entrance from the design: 18px lower and 97% scale, eased in after
/// [enterDelay]. Use the delay to stagger lists.
class RiseIn extends StatefulWidget {
  const RiseIn({
    required this.child,
    this.visible = true,
    this.enterDelay = Duration.zero,
    this.onHidden,
    super.key,
  });

  final bool visible;
  final Duration enterDelay;
  final VoidCallback? onHidden;
  final Widget child;

  @override
  State<RiseIn> createState() => _RiseInState();
}

class _RiseInState extends State<RiseIn> with SingleTickerProviderStateMixin {
  static const _enterOffset = Offset(0, 18);
  static const _enterScale = 0.97;

  late final _controller = AnimationController(
    vsync: this,
    duration: AppDurations.page,
    reverseDuration: AppDurations.medium,
  );
  late final CurvedAnimation _curve = CurvedAnimation(
    parent: _controller,
    curve: AppCurves.emphasized,
    reverseCurve: Curves.easeInCubic,
  );
  Timer? _enterTimer;
  bool _reduceMotion = false;
  bool _started = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _reduceMotion = context.reduceMotion;
    // Entering here, not in initState, so the motion setting is known.
    if (!_started && widget.visible) {
      _started = true;
      _enter();
    }
  }

  @override
  void didUpdateWidget(RiseIn oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.visible == oldWidget.visible) return;
    if (widget.visible) {
      _enter();
    } else {
      _enterTimer?.cancel();
      if (_reduceMotion) {
        _controller.value = 0;
        widget.onHidden?.call();
        return;
      }
      // TickerFuture only completes when the animation finishes, not when
      // it's interrupted by a re-entry.
      unawaited(
        _controller.reverse().then((_) {
          if (!widget.visible) widget.onHidden?.call();
        }),
      );
    }
  }

  void _enter() {
    _enterTimer?.cancel();
    if (_reduceMotion) {
      _controller.value = 1;
      return;
    }
    _enterTimer = Timer(widget.enterDelay, () {
      if (mounted && widget.visible) _controller.forward();
    });
  }

  @override
  void dispose() {
    _enterTimer?.cancel();
    _curve.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !widget.visible,
      child: AnimatedBuilder(
        animation: _curve,
        builder: (context, child) {
          final hidden = 1 - _curve.value;
          return Opacity(
            opacity: _curve.value.clamp(0, 1),
            child: Transform.translate(
              offset: _enterOffset * hidden,
              child: Transform.scale(
                scale: 1 - (1 - _enterScale) * hidden,
                child: child,
              ),
            ),
          );
        },
        child: widget.child,
      ),
    );
  }
}
