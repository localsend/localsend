import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class WebShareLink {
  final String url;
  final VoidCallback onCopy;
  final VoidCallback onQr;
  final VoidCallback onZoom;

  const WebShareLink({required this.url, required this.onCopy, required this.onQr, required this.onZoom});
}

/// Keeps icon spacing consistent across links and wraps actions below URLs that need the width.
class WebShareLinks extends StatelessWidget {
  final List<WebShareLink> links;
  final TextStyle? style;
  final double minIconSpacing;
  final double maxIconSpacing;

  const WebShareLinks({super.key, required this.links, this.style, this.minIconSpacing = 2, this.maxIconSpacing = 4})
    : assert(minIconSpacing >= 0),
      assert(maxIconSpacing >= minIconSpacing);

  @override
  Widget build(BuildContext context) {
    if (links.isEmpty) return const SizedBox.shrink();

    return _LinkLayout(
      textDirection: Directionality.of(context),
      minIconSpacing: minIconSpacing,
      maxIconSpacing: maxIconSpacing,
      children: [
        for (final link in links) ...[
          Padding(
            padding: const EdgeInsets.all(5),
            child: IntrinsicWidth(child: SelectableText(link.url, style: style)),
          ),
          _action(Icons.content_copy, link.onCopy),
          _action(Icons.qr_code, link.onQr),
          _action(Icons.tv, link.onZoom),
        ],
      ],
    );
  }

  Widget _action(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Center(child: Icon(icon, size: 16)),
    );
  }
}

class _LinkLayout extends MultiChildRenderObjectWidget {
  final TextDirection textDirection;
  final double minIconSpacing;
  final double maxIconSpacing;

  const _LinkLayout({required this.textDirection, required this.minIconSpacing, required this.maxIconSpacing, required super.children});

  @override
  RenderObject createRenderObject(BuildContext context) => _RenderLinkLayout(textDirection, minIconSpacing, maxIconSpacing);

  @override
  void updateRenderObject(BuildContext context, covariant _RenderLinkLayout renderObject) {
    renderObject.textDirection = textDirection;
    renderObject.minIconSpacing = minIconSpacing;
    renderObject.maxIconSpacing = maxIconSpacing;
  }
}

class _LinkParentData extends ContainerBoxParentData<RenderBox> {}

class _RenderLinkLayout extends RenderBox
    with ContainerRenderObjectMixin<RenderBox, _LinkParentData>, RenderBoxContainerDefaultsMixin<RenderBox, _LinkParentData> {
  _RenderLinkLayout(this._textDirection, this._minIconSpacing, this._maxIconSpacing);

  TextDirection _textDirection;
  double _minIconSpacing;
  double _maxIconSpacing;
  set textDirection(TextDirection value) {
    if (_textDirection == value) return;
    _textDirection = value;
    markNeedsLayout();
  }

  set minIconSpacing(double value) {
    if (_minIconSpacing == value) return;
    _minIconSpacing = value;
    markNeedsLayout();
  }

  set maxIconSpacing(double value) {
    if (_maxIconSpacing == value) return;
    _maxIconSpacing = value;
    markNeedsLayout();
  }

  static const _urlActionGap = 5.0;
  static const _wrappedGap = 4.0;
  static const _iconWidth = 16.0;
  static const _actionHeight = 20.0;

  @override
  void setupParentData(RenderBox child) {
    if (child.parentData is! _LinkParentData) child.parentData = _LinkParentData();
  }

  @override
  void performLayout() {
    assert(constraints.hasBoundedWidth);
    final width = constraints.maxWidth;
    final children = <RenderBox>[];
    for (var child = firstChild; child != null; child = childAfter(child)) {
      children.add(child);
    }
    assert(children.length % 4 == 0);

    var widestUrl = 0.0;
    for (var i = 0; i < children.length; i += 4) {
      children[i].layout(BoxConstraints(maxWidth: width), parentUsesSize: true);
      widestUrl = math.max(widestUrl, children[i].size.width);
    }

    final minPadding = _minIconSpacing / 2;
    final maxPadding = _maxIconSpacing / 2;
    final padding = ((width - widestUrl - _urlActionGap - 3 * _iconWidth) / 6).clamp(minPadding, maxPadding);
    final actionWidth = _iconWidth + 2 * padding;
    final groupWidth = 3 * actionWidth;
    var y = 0.0;

    for (var i = 0; i < children.length; i += 4) {
      final url = children[i];
      final inline = url.size.width + _urlActionGap + groupWidth <= width;
      final actionY = inline ? y + (math.max(url.size.height, _actionHeight) - _actionHeight) / 2 : y + url.size.height + _wrappedGap;
      final actionX = inline ? url.size.width + _urlActionGap : 0.0;
      _position(url, 0, y, width);
      for (var action = 0; action < 3; action++) {
        final child = children[i + action + 1];
        child.layout(BoxConstraints.tightFor(width: actionWidth, height: _actionHeight), parentUsesSize: true);
        _position(child, actionX + action * actionWidth, actionY, width);
      }
      y += inline ? math.max(url.size.height, _actionHeight) : url.size.height + _wrappedGap + _actionHeight;
    }
    size = constraints.constrain(Size(width, y));
  }

  void _position(RenderBox child, double leading, double top, double width) {
    (child.parentData! as _LinkParentData).offset = Offset(_textDirection == TextDirection.ltr ? leading : width - leading - child.size.width, top);
  }

  @override
  void paint(PaintingContext context, Offset offset) => defaultPaint(context, offset);

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) => defaultHitTestChildren(result, position: position);
}
