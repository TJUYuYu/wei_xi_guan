import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:roman_numbers/roman_numbers.dart';
import 'package:wei_xi_guan/view/view.dart';

import 'model.dart';


class Habit {
  static Map <String, dynamic>habit_msg1 = {
    'id': 1,
    'name': '英语',
    'content': '背一个单词',
    'check_days': 30,
    'consecutive_check_days': 20,
    'last_check_date': '2022-1-31',
    'start_date': '2022-1-01',
    'states_number': 4,
  };
  static Map <String, dynamic>habit_msg2 = {
    'id': 2,
    'name': '健身',
    'content': '卷腹一次',
    'check_days': 50,
    'consecutive_check_days': 40,
    'last_check_date': '2022-2-31',
    'start_date': '2022-1-02',
    'states_number': 5,
  };

  static List<Map<String, dynamic>> habit_msgList = [
  ];

  static void buildHabit_msgList() {
    habit_msgList.add(habit_msg1);
    habit_msgList.add(habit_msg2);
  }

  static List<String> habitName = ['英语', '健身'];
  static List<String> goal = ['背3个单词', '卷腹1次'];
  static List<int> times = [2, 3];
}


class UnCheckedHabitCard extends StatefulWidget {
  final String title;
  final String subtitle;

  const UnCheckedHabitCard(
      {Key? key, required this.title, required this.subtitle})
      : super(key: key);

  @override
  _UnCheckedHabitCardState createState() => _UnCheckedHabitCardState();
}

class _UnCheckedHabitCardState extends State<UnCheckedHabitCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
      margin: EdgeInsets.fromLTRB(5, 10, 5, 0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        height: 60,
        child: Row(
          children: [
            SizedBox(width: 10),
            // Icon(Icons.circle_outlined, size: 40),
            Image.asset('images/完成-01.png', height: 40, width: 40),
            SizedBox(width: 10),
            Expanded(
              child: InkWell(
                //去除水波纹点击效果
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                //onTap跳转到管理页面。
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          HabitControlPage(
                            title: widget.title,
                            stepCount: 4,
                          )));
                },
                child: Row(
                  children: [
                    SizedBox(
                      height: 60,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 8),
                          Text(
                            widget.title,
                            style: TextStyle(fontSize: 16),
                          ),
                          Spacer(),
                          Text(widget.subtitle),
                          SizedBox(height: 8)
                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: 1,
                      height: 30,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text('5',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('天')
                          ],
                        ),
                        Text('累计打卡')
                      ],
                    ),
                    SizedBox(width: 10)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CheckedHabitCard extends StatefulWidget {
  final String title;
  final String subtitle;

  const CheckedHabitCard(
      {Key? key, required this.title, required this.subtitle})
      : super(key: key);

  @override
  _CheckedHabitCardState createState() => _CheckedHabitCardState();
}

class _CheckedHabitCardState extends State<CheckedHabitCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
      margin: EdgeInsets.fromLTRB(5, 10, 5, 0),
      child: Container(
        decoration: const BoxDecoration(
            color: Color.fromRGBO(10, 10, 10, 0.2),
            borderRadius: BorderRadius.all(Radius.circular(8))
        ),
        height: 60,
        child: Row(
          children: [
            SizedBox(width: 10),
            // Icon(Icons.circle_outlined, size: 40),
            Image.asset('images/完成-02.png', height: 40, width: 40),
            SizedBox(width: 10),
            Expanded(
              child: InkWell(
                highlightColor: Colors.transparent, //去除水波纹点击效果
                splashColor: Colors.transparent, //
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute( //跳转到管理页面。
                      builder: (context) =>
                          HabitControlPage(
                            title: widget.title,
                            stepCount: 4,
                          )));
                },
                child: Row(
                  children: [
                    SizedBox(
                      height: 60,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 8),
                          Text(
                            widget.title,
                            style: TextStyle(fontSize: 16),
                          ),
                          Spacer(),
                          Text(widget.subtitle),
                          SizedBox(height: 8)
                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: 1,
                      height: 30,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 10),
                    SizedBox(
                      height: 60,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text('5',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold)),
                              Text('天')
                            ],
                          ),
                          Text('累计打卡')
                        ],
                      ),
                    ),
                    SizedBox(width: 10)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


class HabitControlPage extends StatefulWidget {
  final int stepCount;
  final String title;

  const HabitControlPage(
      {Key? key, required this.title, required this.stepCount})
      : super(key: key);

  @override
  _HabitControlPageState createState() => _HabitControlPageState();
}

class _HabitControlPageState extends State<HabitControlPage> {
  List<Widget> list = [];

  void buildList() {
    for (int index = 0; index < widget.stepCount; index++) {
      Widget widget = Card(
        margin: EdgeInsets.fromLTRB(15, 20, 15, 0),
        child: SizedBox(
          height: 60,
          child: Row(
            children: [
              Container(
                alignment: Alignment.bottomCenter,
                height: 70,
                width: 50,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        RomanNumbers.toRoman(index + 1),
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        '阶段',
                        style: TextStyle(fontSize: 10, color: Colors.grey),
                      )
                    ]),
              ),
              Expanded(
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 3),
                        Text(
                          '${index + 1}阶段的内容',
                          style: TextStyle(fontSize: 16),
                        ),
                        Spacer(),
                        Text(
                          '已完成/进行中/待完成',
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(height: 6)
                      ],
                    ),
                    Spacer(),
                    Container(
                      width: 1,
                      height: 30,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 20),
                    Text('Day xx-xx'),
                    SizedBox(width: 20)
                  ],
                ),
              ),
            ],
          ),
        ),
      );
      list.add(widget);
    }
  }

  @override
  Widget build(BuildContext context) {
    buildList();
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: const Color.fromRGBO(98, 103, 124, 1.0),
          title: Text(
            widget.title + '培养计划',
            style: const TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          actions: [InkWell(
              onTap: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15))),
                    context: context,
                    builder: (BuildContext context) {
                      return SingleChildScrollView(
                          child: SizedBox(
                            height: 580,
                            width: double.infinity,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: 55,
                                  width: double.infinity,
                                  decoration: const BoxDecoration(
                                      color: Color.fromRGBO(98, 103, 124, 1.0),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(12),
                                          topRight: Radius.circular(12))),
                                  child: Row(children: [
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text('编辑计划',
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.white)),
                                    Spacer(),
                                    InkWell(
                                      child: const Icon(
                                        Icons.clear,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                      onTap: () => Navigator.pop(context),
                                    ),
                                    const SizedBox(width: 13),
                                    Icon(Icons.done, color: Colors.white,
                                        size: 30),
                                    const SizedBox(
                                      width: 18,
                                    )
                                  ]),
                                ),
                                const SizedBox(height: 20), //习惯名
                                const SizedBox(height: 20),
                                Expanded(
                                    child: Consumer<TextFieldProvider>(
                                      builder: (consumer, provider, child) {
                                        return ListView.builder(
                                            itemBuilder: (context, index) {
                                              return StepContext(
                                                  stepNum: index + 1);
                                            },
                                            itemCount: provider
                                                .stepCount //howManyStep,
                                        );
                                      },
                                    )
                                ),
                                Row(
                                  children: [
                                    Spacer(),
                                    InkWell(
                                      onTap: () {
                                        Provider.of<TextFieldProvider>(
                                            context, listen: false)
                                            .addStep();
                                      },
                                      child: Icon(
                                        Icons.add_circle_outlined,
                                        size: 60,
                                        color: Color.fromRGBO(
                                            98, 103, 124, 1.0),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    )
                                  ],
                                ),
                                SizedBox(height: 50,)
                              ],
                            ),
                          ));
                    });
              },
              child: Icon(Icons.edit)), SizedBox(width: 10,)],
        ),
        body: ListView(
            children: list +
                [
                  Card(
                    margin: EdgeInsets.fromLTRB(15, 20, 15, 0),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                      height: 80,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 250,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  '完成进度',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Row(
                                  children: [
                                    Spacer(),
                                    Text(
                                      'xx/100',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 10),
                                    )
                                  ],
                                ),
                                Stack(
                                  children: [
                                    Container(
                                      height: 6,
                                      width: 250,
                                      decoration: const BoxDecoration(
                                        color: Colors.black12,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                      ),
                                    ),
                                    Container(
                                      height: 6,
                                      width: 150, //   250*累计天数/100天
                                      decoration: const BoxDecoration(
                                        color:
                                        Color.fromRGBO(98, 103, 124, 1.0),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Text('2022/01/01',
                                        style: TextStyle(color: Colors.grey)),
                                    Spacer(),
                                    Text('2022/01/31',
                                        style: TextStyle(color: Colors.grey))
                                  ],
                                )
                              ],
                            ),
                          ),
                          Spacer(),
                          InkWell(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('52/100',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                Text('打卡天数',
                                    style: TextStyle(
                                      fontSize: 12,))
                              ],
                            ),
                          ),
                          const SizedBox(width: 15)
                        ],
                      ),
                    ),
                  )
                ]));
  }
}
