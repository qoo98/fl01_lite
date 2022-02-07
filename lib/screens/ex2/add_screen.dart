import 'package:fl01_lite/db/database.dart';
import 'package:fl01_lite/main.dart';
import 'package:fl01_lite/screens/ex2/ex2.dart';
import 'package:flutter/material.dart';



enum EditStatus { ADD, EDIT }

class AddScreen extends StatefulWidget {
  final Word? word;
  final EditStatus status;

  AddScreen({required this.status, this.word});
  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  TextEditingController memoController = TextEditingController();

  String _titleText = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.status == EditStatus.ADD) {
      _titleText = "New Memo";
      memoController.text = "";
    } else {
      _titleText = "Edit Memo";
      memoController.text = widget.word!.strMemo;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(_titleText, style: TextStyle(
          color: Colors.black,
        ),),
        centerTitle: true,
        leadingWidth: 90,
        backgroundColor: Colors.white,
        leading: TextButton(
          child: Text(
            "Cancel",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 20.0,
            ),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          TextButton(
              // onPressed: !isSaveEnabled ? null : () => _registerMemo(),
              onPressed:  () => _registerMemo(),
              child: Text(
                "Save",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20.0,
                ),
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 40, right: 50.0, left: 50.0),
        child: TextField(
          keyboardType: TextInputType.text,
          minLines: 1,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: Colors.grey)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: Colors.grey))),
          controller: memoController,
        ),
      ),
    );
  }


  _insertMemo() async {
    var word = Word(
      strMemo: memoController.text
    );
    await database.addMemo(word);
    memoController.clear();
    Navigator.push(context, MaterialPageRoute(builder: (context) => ex2(
    )));
  }

  _registerMemo() {
    if(widget.status == EditStatus.ADD) {
      _insertMemo();
    } else {
      _updateMemo();
  }
  }


void _updateMemo() async {
    var word = Word(
      strMemo: memoController.text
    );
    await database.addMemo(word);
    await database.deleteMemo(widget.word!);
    Navigator.push(context, MaterialPageRoute(builder: (context) => ex2(
    )));
  }

}
