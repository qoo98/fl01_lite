import 'package:fl01_lite/db/database.dart';
import 'package:fl01_lite/main.dart';
import 'package:fl01_lite/screens/ex2/add_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ex2 extends StatefulWidget {

  @override
  _ex2State createState() => _ex2State();
}

class _ex2State extends State<ex2> {

  List<Word> _memoList = [];

  @override
  void initState() {
    super.initState();
    _getAllMemo();
  }

   _getAllMemo() async {
    _memoList = await database.allMemo;
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text("My Memos", style: TextStyle(
          color: Colors.black
        ),),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () => _addMemoPage(),
              color: Colors.blue,
              icon: Icon(Icons.add))
        ],
      ),
      body: _memoListWidget(),
    );
  }

  _addMemoPage() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => AddScreen(
          status: EditStatus.ADD,
        )));
  }



  Widget _memoListWidget() {
    return ListView.builder(
      itemCount: _memoList.length,
      itemBuilder: (context, int position) => _memoItem(position)
    );
  }

  Widget _memoItem(int position) {
    return Slidable(
      endActionPane: ActionPane(
        motion: DrawerMotion(),
        children: [
          SlidableAction(
            onPressed: (context) => _deleteMemo(_memoList[position]),
          backgroundColor: Colors.red,
              label: "delete",)
        ],
      ),
      child: ListTile(
        title: Text("${_memoList[position].strMemo}", style: TextStyle(
          fontSize: 25.0
        )),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: () => _editMemo(_memoList[position]),
      ),
    );
  }

  _editMemo(Word selectedMemo) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AddScreen(
      word: selectedMemo,
      status: EditStatus.EDIT,
    )));
  }

  _deleteMemo(Word selectedMemo) async {
    await database.deleteMemo(selectedMemo);
    _getAllMemo();
  }
}
