import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_first_app/my_custom_widgets/simple_button.dart';
import 'package:my_first_app/plan_options_card.dart';
import 'package:my_first_app/plan_options_data.dart';

class PlanOptionsDialog extends StatefulWidget {
  PlanOptionsDialog(
      {required this.title,
        this.description,
        this.planDescription = 'Plan Options'});
  final String title;
  final String? description;
  final String planDescription;
  final planOptionsData = planOptionsServerData;

  @override
  _PlanOptionsDialogState createState() => _PlanOptionsDialogState();
}

class _PlanOptionsDialogState extends State<PlanOptionsDialog> {
  bool submittedEnable = false;
  String cardSelectedTitle = '';

  void updateCardSelected(String title){
    setState(() => cardSelectedTitle = title);
    if(cardSelectedTitle.isNotEmpty){
      setState(() => submittedEnable = true);
    }
  }

  void _onSubmit(){
    showDialog(context: context, builder: (context) {
      return AlertDialog(
          title: Text('Thanks for buying the plan: $cardSelectedTitle'),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 2.0,
      backgroundColor: Colors.white,
      child: _buildDialogContainer(context),
    );
  }

  Widget _buildDialogContainer(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.height * 0.9,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(
                  Icons.clear_rounded,
                  size: 40,
                  color: Colors.black87,
                ),
                hoverColor: Colors.transparent,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 10),
              if (widget.description != null) Text(widget.description!),
            ],
          ),
          _buildDialogBody()
        ],
      ),
    );
  }


  Widget _buildDialogBody() {
    return Padding(
          padding: const EdgeInsets.only(left: 100, right: 100),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Step 3 of 3',
                      style: TextStyle(color: Colors.orange),
                    ),
                    SizedBox(height: 10),
                    Text(
                      widget.planDescription,
                    ),
                  ],
                ),
                _buildPlanOptionCards(),
                Align(
                  alignment: Alignment.bottomRight,
                  child: SimpleButton(
                    text: 'Next Step',
                    buttonSize: SimpleButtonSize.medium,
                    primaryColor: Colors.orange.shade500,
                    secondaryColor: Colors.white,
                    onPressButton: submittedEnable ? _onSubmit : null,
                  ),
                ),
              ],
            ),
          ),
        );
  }

  Widget _buildPlanOptionCards() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: IntrinsicHeight(
        child: Row(
          children: [
            for (var plan in widget.planOptionsData)
              Expanded(
                flex: 1,
                child: PlanOptionsCard(
                  title: plan['title'],
                  price: plan['monthlyPrice'],
                  active: plan['active'],
                  features: plan['features'],
                  selected: plan['title'] == cardSelectedTitle ? true : false,
                  updateCardSelected: updateCardSelected,
                ),
              )
          ],
        ),
      ),
    );
  }

}
