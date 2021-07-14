import 'package:flutter/material.dart';
import 'package:my_first_app/plan_options_dialog.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('I\'m Rafael Franco and this is my first flutter app!'),
        elevation: 2.0,
      ),
      body: Container(
        color: Colors.grey.shade100,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: Text(
                  'See all plan options',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(40.0),
                ),
                onPressed: () => showDialog(
                  context: context,
                  builder: (context) => PlanOptionsDialog(
                    title: 'Select a plan',
                    description: 'Pick a plan option for this profile:',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
