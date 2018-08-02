import 'package:flutter/material.dart';
import 'package:advance_demo/task.dart';
import 'package:advance_demo/task_row.dart';

class ListModel {

  ListModel(this.listKey, items) : this.items = List.of(items);


  final GlobalKey<AnimatedListState> listKey;
  final List<Task> items;

  AnimatedListState get _animateList => listKey.currentState;

  void insert(int index, Task item) {
    items.insert(index, item);
    _animateList.insertItem(index, duration: Duration(milliseconds: 250));
  }

  Task removeAt(int index) {
    final Task removedItem = items.removeAt(index);
    if (removedItem != null) {
      _animateList.removeItem(
          index, (context, animation) {
        return TaskRow(task: removedItem, animation: animation,);
      },
          duration: Duration(milliseconds: (250 + 250 * (index / items.length)).toInt()));
    }

    return removedItem;
  }

  int get length => items.length;

  Task operator [](int index) => items[index];

  int indexOf(Task item) => items.indexOf(item);
}