import 'package:flutter/material.dart';
import 'package:my_first_app/my_custom_widgets/simple_button.dart';

class PlanOptionsCard extends StatelessWidget {
  const PlanOptionsCard({
    required this.title,
    required this.price,
    this.features = const ['N/A'],
    required this.active,
    this.selected = false,
    required this.updateCardSelected,
  });
  final String title;
  final double price;
  final List<String> features;
  final bool active;
  final bool selected;
  final void Function(String) updateCardSelected;

  void _handleOnPress(){
    updateCardSelected(title);
  }

  @override
  Widget build(BuildContext context) {

    String buttonText;
    if(active){
      buttonText = selected ? 'Selected' : 'Select';
    }else{
      buttonText = 'Coming soon';
    }

    return Card(
      color: Colors.grey.shade200,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
        side: BorderSide(color: Colors.grey.shade300, width: 2),
      ),
      child: _buildCardContent(buttonText),
    );
  }

  Widget _buildCardContent(String buttonText) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCardHeader(),
          SizedBox(
            height: 20,
          ),
          _buildCardBody(),
          SizedBox(
            height: 80,
          ),
          Align(
            alignment: Alignment.center,
            child: SimpleButton(
              text: buttonText,
              onPressButton: active ? _handleOnPress : null,
              buttonSize: SimpleButtonSize.small,
              primaryColor: Colors.white,
              secondaryColor: Colors.orange,
              selected: selected,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            color: Colors.orange,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '\$$price/month',
          style: TextStyle(
            fontSize: 17,
            color: Colors.black87,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildCardBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var featureText in features)
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Row(
              children: [
                Icon(
                  Icons.arrow_forward,
                  color: Colors.orange,
                  size: 20,
                ),
                SizedBox(width: 8),
                Text(
                  '$featureText',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          )
      ],
    );
  }
}
