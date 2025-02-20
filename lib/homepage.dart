import 'package:flutter/cupertino.dart';
import 'main.dart';
class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        automaticallyImplyLeading: false,
        middle: Text('Reddit', style: TextStyle(color: CupertinoColors.systemRed, fontSize: 20, fontWeight: FontWeight.bold),),
        trailing: CupertinoButton(child: Icon(CupertinoIcons.settings), onPressed: (){
          showCupertinoDialog(context: context, builder: (context){
            return CupertinoAlertDialog(
              title: Text('Logout'),
              content: Text('Are you sure?'),
              actions: [
                CupertinoButton(child: Text("Yes"), onPressed: (){
                  Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context)=> MyApp()));
                }),
                CupertinoButton(child: Text("No", style: TextStyle(color: CupertinoColors.destructiveRed),), onPressed: (){
                  Navigator.pop(context);
                })
              ],
            );
          });
        }),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SafeArea(child: Column(
          children: [
            Text ('Homepage')
          ],
        )),
      ),
    );
  }
}
