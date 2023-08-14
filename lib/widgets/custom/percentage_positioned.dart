import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/widgets/custom/after_layout.dart';

/// left 和 right 不能同时存在, 即 left == null || right == null == true
///
/// top 和 bottom 不能同时存在, 即 top == null || bottom == null == true
@immutable
final class PositionData {
  final double? left;
  final double? top;
  final double? right;
  final double? bottom;
  final double? width;
  final double? height;

  const PositionData(
      {this.left, this.top, this.right, this.bottom, this.width, this.height})
      : assert((left == null || right == null || width == null) &&
            (top == null || bottom == null || height == null));

  /// dynamic -> double?
  double? toSafeDouble(dynamic value) => (value is double?) ? value : null;

  fromMap(Map data) => PositionData(
        left: toSafeDouble(data['left']),
        top: toSafeDouble(data['top']),
        right: toSafeDouble(data['right']),
        bottom: toSafeDouble(data['bottom']),
        width: toSafeDouble(data['width']),
        height: toSafeDouble(data['height']),
      );

  @override
  String toString() {
    return 'PositionData(left: $left, top: $top, right: $right, bottom: $bottom, width: $width, height: $height)';
  }
}

/// 百分比定位
///
/// Percentage Positioned
class PercentagePositioned extends StatelessWidget {
  final AlignmentGeometry alignment;
  final TextDirection? textDirection;
  final StackFit fit;
  final Clip clipBehavior;

  /// 定位基准 Widget
  ///
  /// [Widget] that positioned children position relatively
  final Widget relativeWidget;

  /// 相对的 Widget 自身定位数据, 即是否需要 Positioned 组件包裹
  ///
  /// Relative [Widget] position data, non-positioned if null
  final PositionData? relativeWidgetData;

  /// 需相对于 relativeWidget 定位的子组件列表
  ///
  /// [Positioned] children list
  final List<Widget> positionedChildren;

  /// 需相对于 relativeWidget 定位的子组件定位数据
  ///
  /// non-positioned children position data
  final List<PositionData> positionedChildrenData;

  /// 非定位子组件
  ///
  /// Not [Positioned] children list
  final List<Widget>? nonPositionedChildren;
  const PercentagePositioned(
      {this.alignment = AlignmentDirectional.topStart,
      this.textDirection,
      this.fit = StackFit.loose,
      this.clipBehavior = Clip.hardEdge,
      required this.relativeWidget,
      // required this.isRelativeWidgetPositioned,
      this.relativeWidgetData,
      required this.positionedChildren,
      required this.positionedChildrenData,
      this.nonPositionedChildren,
      super.key})
      : assert(positionedChildren.length == positionedChildrenData.length);

  @override
  Widget build(BuildContext context) {
    double? safeAdd(double? a, double? b) {
      return a == null
          ? b
          : b == null
              ? a
              : a + b;
    }

    double? safeMultiply(double? a, double b) {
      return a == null ? null : a * b;
    }

    ValueNotifier<Size> relativeWidgetSize = ValueNotifier(Size.zero);

    void onResized(RenderAfterLayout renderAfterLayout) {
      debugPrint('size: ${renderAfterLayout.size}');
      relativeWidgetSize.value = renderAfterLayout.size;
    }

    return Stack(
        alignment: alignment,
        textDirection: textDirection,
        fit: fit,
        clipBehavior: clipBehavior,
        children: [
          if (relativeWidgetData != null)
            Positioned(
                left: relativeWidgetData?.left,
                top: relativeWidgetData?.top,
                right: relativeWidgetData?.right,
                bottom: relativeWidgetData?.bottom,
                width: relativeWidgetData?.width,
                height: relativeWidgetData?.height,
                child: AfterLayout(
                  callback: onResized,
                  child: relativeWidget,
                ))
          else
            AfterLayout(
              callback: onResized,
              child: relativeWidget,
            ),
          for (int index = 0; index < positionedChildren.length; index++)
            ValueListenableBuilder(
                valueListenable: relativeWidgetSize,
                builder: (BuildContext context, Size size, Widget? child) {
                  return size == Size.zero
                      ? Container()
                      : Positioned(
                          left: relativeWidgetData != null
                              ? safeAdd(
                                  relativeWidgetData?.left,
                                  safeMultiply(
                                      positionedChildrenData[index].left,
                                      size.width))
                              : safeMultiply(positionedChildrenData[index].left,
                                  size.width),
                          top: relativeWidgetData != null
                              ? safeAdd(
                                  relativeWidgetData?.top,
                                  safeMultiply(
                                      positionedChildrenData[index].top,
                                      size.height))
                              : safeMultiply(positionedChildrenData[index].top,
                                  size.height),
                          right: relativeWidgetData != null
                              ? safeAdd(
                                  relativeWidgetData?.right,
                                  safeMultiply(
                                      positionedChildrenData[index].right,
                                      size.width))
                              : safeMultiply(
                                  positionedChildrenData[index].right,
                                  size.width),
                          bottom: relativeWidgetData != null
                              ? safeAdd(
                                  relativeWidgetData?.bottom,
                                  safeMultiply(
                                      positionedChildrenData[index].bottom,
                                      size.height))
                              : safeMultiply(
                                  positionedChildrenData[index].bottom,
                                  size.height),
                          width: positionedChildrenData[index].width,
                          height: positionedChildrenData[index].height,
                          child: positionedChildren[index]);
                }),
          ...?nonPositionedChildren,
        ]);
  }
}
