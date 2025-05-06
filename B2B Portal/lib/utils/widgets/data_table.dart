import 'package:flutter/material.dart';

/// A generic model adapter type that provides a way to access data from any model.
typedef FieldAccessor<T> = String Function(T model);

typedef ActionCallback<T> = void Function(T model);

class GenericDataTable<T> extends StatefulWidget {
  final List<T> data;
  final Map<String, FieldAccessor<T>> columns;
  final ActionCallback<T>? onEdit;
  final ActionCallback<T>? onDelete;
  final ActionCallback<T>? onPublish;
  final String Function(T)? filterBy;

  const GenericDataTable({
    super.key,
    required this.data,
    required this.columns,
    this.onEdit,
    this.onDelete,
    this.onPublish,
    this.filterBy,
  });

  @override
  State<GenericDataTable<T>> createState() => _GenericDataTableState<T>();
}

class _GenericDataTableState<T> extends State<GenericDataTable<T>> {
  String _searchQuery = '';
  int? _sortColumnIndex;
  bool _isAscending = true;

  List<T> get _filteredData {
    return widget.data.where((item) {
      final filterValue = widget.filterBy?.call(item) ?? _concatFields(item);
      return filterValue.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();
  }

  String _concatFields(T item) {
    return widget.columns.values.map((accessor) => accessor(item)).join(' ');
  }

  void _onSort(int columnIndex, bool ascending) {
    final columnKey = widget.columns.keys.toList()[columnIndex];
    final accessor = widget.columns[columnKey]!;
    setState(() {
      _sortColumnIndex = columnIndex;
      _isAscending = ascending;
      widget.data.sort((a, b) {
        final aValue = accessor(a).toLowerCase();
        final bValue = accessor(b).toLowerCase();
        return ascending ? aValue.compareTo(bValue) : bValue.compareTo(aValue);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextField(
            decoration: const InputDecoration(
              hintText: 'Search...',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              setState(() {
                _searchQuery = value;
              });
            },
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            sortColumnIndex: _sortColumnIndex,
            sortAscending: _isAscending,
            columns: [
              ...widget.columns.entries.mapIndexed(
                (i, entry) => DataColumn(
                  label: Text(entry.key),
                  onSort: (colIndex, ascending) => _onSort(colIndex, ascending),
                ),
              ),
              const DataColumn(label: Text('Actions')),
            ],
            rows:
                _filteredData.map((model) {
                  return DataRow(
                    cells: [
                      ...widget.columns.values.map(
                        (accessor) => DataCell(Text(accessor(model))),
                      ),
                      DataCell(
                        Row(
                          children: [
                            if (widget.onEdit != null)
                              IconButton(
                                icon: const Icon(Icons.edit, size: 20),
                                onPressed: () => widget.onEdit!(model),
                              ),
                            if (widget.onDelete != null)
                              IconButton(
                                icon: const Icon(
                                  Icons.delete_outline,
                                  size: 20,
                                ),
                                onPressed: () => widget.onDelete!(model),
                              ),
                            if (widget.onPublish != null)
                              IconButton(
                                icon: const Icon(
                                  Icons.publish_outlined,
                                  size: 20,
                                ),
                                onPressed: () => widget.onPublish!(model),
                              ),
                          ],
                        ),
                      ),
                    ],
                  );
                }).toList(),
          ),
        ),
      ],
    );
  }
}

extension IndexedMap<K, V> on Iterable<K> {
  Iterable<T> mapIndexed<T>(T Function(int index, K item) f) sync* {
    int index = 0;
    for (final item in this) {
      yield f(index++, item);
    }
  }
}
