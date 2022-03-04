import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'package:roman_numbers/roman_numbers.dart';

import '../model.dart';
import '../net.dart';

class PageThree extends StatefulWidget {
  const PageThree({Key? key}) : super(key: key);

  @override
  State<PageThree> createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('我的微习惯'),
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromRGBO(98, 103, 124, 1.0),
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      body: TodoHabitList(),
      floatingActionButton: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return FloatingActionButton(
          onPressed: () {
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
                            Text('添加新习惯',
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
                            Icon(Icons.done, color: Colors.white, size: 30),
                            const SizedBox(
                              width: 18,
                            )
                          ]),
                        ),
                        const SizedBox(height: 20),
                        Consumer<TextFieldProvider>(
                            builder: (context, provider, child) {
                          return TextField(
                            textAlign: TextAlign.start,
                            textAlignVertical: TextAlignVertical.bottom,
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black38,
                            ),
                            controller: provider.controller1,
                            decoration: InputDecoration(
                                helperText: '习惯名称',
                                icon: Container(
                                  padding: const EdgeInsets.only(
                                    left: 17,
                                    top: 20,
                                  ),
                                  height: 65,
                                  width: 34,
                                  child: const Text(
                                    '习惯',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black12,
                                    ),
                                  ),
                                ),
                                suffixIcon: InkWell(
                                  child: Icon(
                                    Icons.add,
                                    color: Color.fromRGBO(98, 103, 124, 1.0),
                                    size: 35,
                                  ),
                                  onTap: () {
                                    //点击右侧加号弹出选择习惯示例
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return SimpleDialog(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(12))),
                                            title: Container(
                                              padding: const EdgeInsets.only(
                                                  bottom: 5.0),
                                              decoration: const BoxDecoration(
                                                color: Color.fromRGBO(
                                                    98, 103, 124, 1.0),
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(12),
                                                  topRight: Radius.circular(12),
                                                ),
                                              ),
                                              child: Row(
                                                children: const [
                                                  Spacer(),
                                                  Text(
                                                    '选择习惯名称',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  Spacer(),
                                                ],
                                              ),
                                            ),
                                            titlePadding: const EdgeInsets.only(
                                                bottom: 20.0),
                                            contentPadding:
                                                const EdgeInsets.fromLTRB(
                                                    20, 0, 20, 20),
                                            children: [
                                              Wrap(
                                                spacing: 8.0,
                                                alignment: WrapAlignment.center,
                                                runSpacing: 4.0,
                                                runAlignment:
                                                    WrapAlignment.start,
                                                children: [
                                                  HabitTag('英语'),
                                                  HabitTag('健身'),
                                                  HabitTag('阅读')
                                                ],
                                              )
                                            ],
                                          );
                                        });
                                  },
                                )),
                          ); //习惯名
                        }), //习惯名
                        const SizedBox(height: 20),
                        Expanded(child: Consumer<TextFieldProvider>(
                          builder: (consumer, provider, child) {
                            return ListView.builder(
                                itemBuilder: (context, index) {
                                  return StepContext(stepNum: index + 1);
                                },
                                itemCount: provider.stepCount //howManyStep,
                                );
                          },
                        )),
                        Row(
                          children: [
                            Spacer(),
                            InkWell(
                              onTap: () {
                                Provider.of<TextFieldProvider>(context,
                                        listen: false)
                                    .addStep();
                              },
                              child: Icon(
                                Icons.add_circle_outlined,
                                size: 60,
                                color: Color.fromRGBO(98, 103, 124, 1.0),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        )
                      ],
                    ),
                  ));
                });
          },
//上面都是showBottomSheet
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 36,
          ),
          backgroundColor: const Color.fromRGBO(98, 103, 124, 1.0),
        );
      }),
    );
  }
}

class TodoHabitList extends StatefulWidget {
  const TodoHabitList({Key? key}) : super(key: key);

  @override
  _TodoHabitListState createState() => _TodoHabitListState();
}

class _TodoHabitListState extends State<TodoHabitList> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      UnCheckedHabitCard(title: Habit.habitName[0], subtitle: Habit.goal[0]),
      CheckedHabitCard(title: Habit.habitName[1], subtitle: Habit.goal[1]),
    ]);
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          /*  DrawerHeader(
                child: Center(
                  child: const
                    Text('北洋微习惯',style: TextStyle(fontSize: 35,color: Color.fromRGBO(98, 103, 124, 1.0)),),
                ),
                ),*/
          Center(
              child: Text(
            '北洋微习惯',
            style: TextStyle(
                fontSize: 35, color: Color.fromRGBO(98, 103, 124, 1.0)),
          )),
          Divider(height: 25, thickness: 1),
          // ListTile(
          //   leading: Icon(Icons.app_registration),
          //   title: Text('我的习惯'),
          // ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => FinishedHabitPage(
                        finishedHabitCount: 1,
                      )));
            },
            leading: Icon(Icons.assignment_turned_in),
            title: Text('已完成'),
          ),
        ],
      ),
    );
  }
}

class HabitTag extends StatefulWidget {
  HabitTag(this.tagName, {Key? key}) : super(key: key);

  @override
  State<HabitTag> createState() => _HabitTagState();
  String tagName;
}

class _HabitTagState extends State<HabitTag> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Provider.of<TextFieldProvider>(context, listen: false)
            .changeText(widget.tagName);
        Navigator.pop(context);
      },
      child: Container(
        alignment: Alignment.center,
        height: 30,
        width: 70,
        child: Text(
          widget.tagName,
          style: TextStyle(fontSize: 15, color: Colors.white),
        ),
        decoration: BoxDecoration(
          color: Color.fromRGBO(98, 103, 124, 1.0),
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
      ),
    );
  }
}

class StepContext extends StatefulWidget {
  final int stepNum;

  StepContext({Key? key, required this.stepNum}) : super(key: key);

  @override
  _StepContextState createState() => _StepContextState();
}

class _StepContextState extends State<StepContext> {
  @override
  Widget build(BuildContext context) {
    String stepRomanNum = RomanNumbers.toRoman(widget.stepNum);
    return Row(
      children: [
        Container(
          alignment: Alignment.bottomCenter,
          height: 60,
          width: 50,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  stepRomanNum,
                  style: TextStyle(fontSize: 25),
                ),
                Text(
                  '阶段',
                  style: TextStyle(fontSize: 10, color: Colors.grey),
                )
              ]),
        ),
        Expanded(
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                    helperText: '第51~70天',
                    hintText: '完成内容',
                    hintStyle:
                        const TextStyle(fontSize: 16, color: Colors.grey)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class FinishedHabitPage extends StatefulWidget {
  int finishedHabitCount;

  FinishedHabitPage({Key? key, required this.finishedHabitCount})
      : super(key: key);

  @override
  _FinishedHabitPageState createState() => _FinishedHabitPageState();
}

class _FinishedHabitPageState extends State<FinishedHabitPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromRGBO(98, 103, 124, 1.0),
        title: const Text('已完成习惯'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: widget.finishedHabitCount,
          itemBuilder: (context, index) {
            return FinishedHabitCard(
                index: index, name: Habit.habitName[index]);
          }),
    );
  }
}

class FinishedHabitCard extends StatefulWidget {
  int index;
  String name;

  FinishedHabitCard({Key? key, required this.index, required this.name})
      : super(key: key);

  @override
  State<FinishedHabitCard> createState() => _FinishedHabitCardState();
}

class _FinishedHabitCardState extends State<FinishedHabitCard> {
  List statesContent = ['背1个单词', '背3个单词', '背5个单词'];
  List<Widget> statesContentWidget = [];

  void biuldStatesContent() {
    for (int i = 0; i < statesContent.length; i++) {
      statesContentWidget.addAll([
        SizedBox(height: 3),
        SizedBox(
          height: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${statesContent[i]}',
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(width: 15),
              Container(
                color: Colors.black,
                height: double.infinity,
                width: 1,
              ),
              SizedBox(width: 15),
              Text('Day xx-xx', style: TextStyle(fontSize: 12)),

            ],
          ),
        )
      ]);
    }
    ;
  }

  @override
  void initState() {
    biuldStatesContent();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(10, 8, 10, 2),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 5, 8, 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
                children: [
                  SizedBox(width: 5),
                  Text('${widget.index + 1}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  SizedBox(width: 10),
                  Text('${widget.name}微习惯',style: TextStyle(fontSize: 18)),
            ]),
            ...statesContentWidget,
            const Text('打卡进度', style: TextStyle(color: Colors.grey,fontSize: 15)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 5),
                    //进度条
                    Stack(
                      children: [
                        Container(
                          height: 10,
                          width: 280,
                          decoration: const BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.all(
                                Radius.circular(5)),
                          ),
                        ),
                        Container(
                          height: 10,
                          width: 250, //   280*累计天数/100天
                          decoration: const BoxDecoration(
                            color:
                            Color.fromRGBO(98, 103, 124, 1.0),
                            borderRadius: BorderRadius.all(
                                Radius.circular(5)),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 3),
                    Row(
                      children: [
                        Text('2022/01/01', style: TextStyle(color: Colors.grey,fontSize: 15)),
                        SizedBox(width: 122,),
                        Text('2022/01/31', style: TextStyle(color: Colors.grey,fontSize: 15)),
                      ],),
                  ],
                ),
                Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('92/100',style: TextStyle(fontSize: 20)),
                    Text('打卡天数',style: TextStyle(fontSize: 10),)
                  ],
                ),

              ],
            ),

            
          ],
        ),
      ),
    );
  }
}
