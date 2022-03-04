import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:wei_xi_guan/view/view.dart';
import 'model.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TextFieldProvider>(
      create: (_) => TextFieldProvider(),
      child: MaterialApp(
        title: '微习惯',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 2;
  static List<Widget> _pageOption = [
    Image.asset('images/home.jpg'),
    Image.asset('images/feedback.jpg'),
    PageThree(),
    Image.asset('images/user.jpg')
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Color.fromRGBO(98, 103, 124, 1.0)),
              label: '主页',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.business,
                  color: Color.fromRGBO(98, 103, 124, 1.0)),
              label: '校务',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.date_range,
                  color: Color.fromRGBO(98, 103, 124, 1.0)),
              label: '微 习 惯',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon:
                  Icon(Icons.school, color: Color.fromRGBO(98, 103, 124, 1.0)),
              label: '个人中心',
              backgroundColor: Colors.white),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
      body: _pageOption[_selectedIndex],
    );
  }
}



// class MyBottomSheet extends StatelessWidget {
//   const MyBottomSheet({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BottomSheet(
//       elevation: 13,
//       backgroundColor: Colors.blue,
//         shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(8), topRight: Radius.circular(8))),
//         onClosing: () {},
//         builder: (context) {
//           return ;
//         });
//   }
// }

/*培养计划中的card：Card(
             margin: EdgeInsets.all(15),
             child: Padding(
               padding: const EdgeInsets.only(top: 10.0,bottom: 10.0),
               child: Row(
                 children: [
                   SizedBox(width: 10,),
                   Container(height: 60,width:50,child: Center(child: Text(romannumber,style:TextStyle(fontSize: 30),))),
                   Column(children: [],)
                 ],
               ),
             ),
           )
*/
