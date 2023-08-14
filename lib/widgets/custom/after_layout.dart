import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';

typedef AfterLayoutCallback = Function(RenderAfterLayout renderAfterLayout);

class AfterLayout extends SingleChildRenderObjectWidget {
  final AfterLayoutCallback callback;

  const AfterLayout({
    Key? key,
    required this.callback,
    Widget? child,
  }) : super(key: key, child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderAfterLayout(callback);
  }

  @override
  void updateRenderObject(
      BuildContext context, RenderAfterLayout renderObject) {
    renderObject.callback = callback;
  }
}

class RenderAfterLayout extends RenderProxyBox {
  RenderAfterLayout(this.callback);

  ValueSetter<RenderAfterLayout> callback;

  @override
  void performLayout() {
    super.performLayout();
    
    SchedulerBinding.instance
        .addPostFrameCallback((Duration _) => callback(this));
  }

  /// 组件在屏幕坐标中的起始偏移坐标
  Offset get offset => localToGlobal(Offset.zero);

  /// 组件在屏幕上占有的矩形空间区域
  ///
  /// &: Rectangle constructor operator.
  Rect get rect => offset & size;
}
