import 'package:edge_market/ui/views/my_network/my_network_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class MyNetworkBuildStatusColumn extends StackedView<MyNetworkViewModel> {
  final String title;
  final int count;
  const MyNetworkBuildStatusColumn(
      {Key? key, required this.title, required this.count})
      : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    MyNetworkViewModel viewModel,
    Widget? child,
  ) {
    return Expanded(
      child: Column(
        children: [
          Text("$count",
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          const SizedBox(height: 4),
          Text(title, style: const TextStyle(fontSize: 14, color: Colors.grey)),
        ],
      ),
    );
  }

  @override
  MyNetworkViewModel viewModelBuilder(BuildContext context) =>
      MyNetworkViewModel();
}
