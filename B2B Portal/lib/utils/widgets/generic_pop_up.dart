import 'package:flutter/material.dart';

class GenericPopupMenu extends StatefulWidget {
  final List<Widget>? contentWidgets;
  final double width;
  final double height;

  const GenericPopupMenu({
    super.key,
    this.contentWidgets,
    this.width = 200,
    this.height = 150,
  });

  @override
  State<GenericPopupMenu> createState() => _GenericPopupMenuState();

  static OverlayEntry? _popupEntry;
  static OverlayEntry? _backdropEntry;

  static void show({
    required BuildContext context,
    required GlobalKey iconKey,
    List<Widget>? contentWidgets,
    double width = 200,
    double height = 150,
    VoidCallback? onClose,
  }) {
    // Toggle popup
    if (_popupEntry != null) {
      _removeEntries(onClose: onClose);
      return;
    }

    final overlay = Overlay.maybeOf(context);
    if (overlay == null) return;

    final renderBox = iconKey.currentContext?.findRenderObject() as RenderBox?;
    final overlayBox = overlay.context.findRenderObject() as RenderBox?;

    if (renderBox == null || overlayBox == null) return;

    final position = renderBox.localToGlobal(Offset.zero, ancestor: overlayBox);
    final size = renderBox.size;
    final screenSize = overlayBox.size;

    // Adjust position if popup overflows screen
    double left = position.dx;
    double top = position.dy + size.height + 5;

    if (left + width > screenSize.width) {
      left = screenSize.width - width - 10; // adjust right
    }

    if (top + height > screenSize.height) {
      top = position.dy - height - 5; // show above if overflow below
    }

    _popupEntry = OverlayEntry(
      builder:
          (_) => Positioned(
            left: left,
            top: top,
            child: Material(
              color: Colors.transparent,
              child: GenericPopupMenu(
                contentWidgets: contentWidgets,
                width: width,
                height: height,
              ),
            ),
          ),
    );

    _backdropEntry = OverlayEntry(
      builder:
          (_) => GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => _removeEntries(onClose: onClose),
            child: Container(
              width: screenSize.width,
              height: screenSize.height,
              color: Colors.transparent,
            ),
          ),
    );

    overlay.insert(_backdropEntry!); // behind
    overlay.insert(_popupEntry!); // above
  }

  static void _removeEntries({VoidCallback? onClose}) {
    _popupEntry?.remove();
    _backdropEntry?.remove();
    _popupEntry = null;
    _backdropEntry = null;
    onClose?.call();
  }
}

class _GenericPopupMenuState extends State<GenericPopupMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(2, 2)),
        ],
      ),
      child:
          widget.contentWidgets == null || widget.contentWidgets!.isEmpty
              ? const Center(child: Text("No Content Available"))
              : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.contentWidgets!,
              ),
    );
  }
}
