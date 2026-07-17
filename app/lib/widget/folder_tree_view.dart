import 'package:flutter/material.dart';
import 'package:localsend_app/model/cross_file.dart';
import 'package:localsend_app/model/folder_tree.dart';
import 'package:localsend_app/util/file_size_helper.dart';
import 'package:localsend_app/widget/file_thumbnail.dart';

/// A widget that displays files in a collapsible folder tree structure.
class FolderTreeView extends StatefulWidget {
  final List<CrossFile> files;
  final Widget Function(CrossFile file)? trailing;
  final void Function(CrossFile file)? onTap;

  const FolderTreeView({
    super.key,
    required this.files,
    this.trailing,
    this.onTap,
  });

  @override
  State<FolderTreeView> createState() => _FolderTreeViewState();
}

class _FolderTreeViewState extends State<FolderTreeView> {
  late final FolderNode _root;

  @override
  void initState() {
    super.initState();
    _root = buildFolderTree(widget.files);
    // All folders collapsed by default - user taps to expand
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _buildFolderChildren(_root, 0),
    );
  }

  List<Widget> _buildFolderChildren(FolderNode node, int depth) {
    final widgets = <Widget>[];

    // Sort children: folders first, then by name
    final sortedChildren = List<FolderNode>.from(node.children)
      ..sort((a, b) => a.name.compareTo(b.name));

    for (final child in sortedChildren) {
      widgets.add(_buildFolderTile(child, depth));
      if (child.isExpanded) {
        widgets.addAll(_buildFolderChildren(child, depth + 1));
      }
    }

    // Add files at this level
    for (final file in node.files) {
      widgets.add(_buildFileTile(file, depth));
    }

    return widgets;
  }

  Widget _buildFolderTile(FolderNode folder, int depth) {
    return Padding(
      padding: EdgeInsets.only(left: depth * 16.0),
      child: InkWell(
        onTap: () {
          setState(() {
            folder.isExpanded = !folder.isExpanded;
          });
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Row(
            children: [
              Icon(
                folder.isExpanded ? Icons.folder_open : Icons.folder,
                color: Theme.of(context).colorScheme.primary,
                size: 24,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      folder.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '${folder.totalFileCount} files, ${folder.totalSize.asReadableFileSize}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              Icon(
                folder.isExpanded ? Icons.expand_less : Icons.expand_more,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFileTile(CrossFile file, int depth) {
    return Padding(
      padding: EdgeInsets.only(left: (depth + 1) * 16.0),
      child: InkWell(
        onTap: widget.onTap != null ? () => widget.onTap!(file) : null,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          child: Row(
            children: [
              SmartFileThumbnail.fromCrossFile(file),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      file.name.split('/').last,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 14),
                    ),
                    Text(
                      file.size.asReadableFileSize,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              if (widget.trailing != null) widget.trailing!(file),
            ],
          ),
        ),
      ),
    );
  }
}
