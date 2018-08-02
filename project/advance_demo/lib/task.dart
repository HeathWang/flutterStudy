import 'package:flutter/material.dart';

class Task {
  final String name;
  final String category;
  final String time;
  final Color color;
  final bool completed;

  Task({this.name, this.category, this.time, this.color, this.completed});
}

List<Task> tasks = [
  Task(
      name: "Catch up with Brian",
      category: "Mobile Project",
      time: "5pm",
      color: Colors.orange,
      completed: false),
  Task(
      name: "Make icons",
      category: "Web App",
      time: "3pm",
      color: Colors.cyan,
      completed: true),
  Task(
      name: "Design explorations",
      category: "Company Website",
      time: "2pm",
      color: Colors.pink,
      completed: false),
  Task(
      name: "Lunch with Mary",
      category: "Grill House",
      time: "12pm",
      color: Colors.cyan,
      completed: true),
  Task(
      name: "Develop discuss",
      category: "Hangouts",
      time: "12am",
      color: Colors.greenAccent,
      completed: true),
  Task(
      name: "Sport",
      category: "Hangouts",
      time: "18am",
      color: Colors.lightBlue,
      completed: false),

  Task(
      name: "Teem Meeting",
      category: "Hangouts",
      time: "10am",
      color: Colors.cyan,
      completed: true),
];