import 'package:flutter/material.dart';
import 'package:study_flutter/customer_widget/custom_paint/customer_painter_route.dart';

class CustomerTest extends StatefulWidget {
  const CustomerTest({Key? key}) : super(key: key);

  @override
  State<CustomerTest> createState() => _CustomerTestState();
}

class _CustomerTestState extends State<CustomerTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('customer painter'),
      ),
      body: Column(
        children: const [
          CustomerPainterRoute(),
          SizedBox(
            height: 20,
          ),
          SizedBox(),
          
        ],
      ),
    );
  }
}