import 'package:flutter/material.dart';

import 'package:projetos/ui/core/ui/button/rounded_button.dart';
import 'package:projetos/ui/core/ui/motel_schedule_appbar.dart';
import 'package:projetos/ui/feature_ir_agora/view_model/motels_view_model.dart';
import 'package:provider/provider.dart';

class IrAgoraScreen extends StatelessWidget {
  const IrAgoraScreen({
    required this.viewModel,
    super.key,
  });

  final MotelsViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MotelScheduleAppbar(),
      drawer: Drawer(),
      body: Center(
        child: context.watch<MotelsViewModel>().isLoading
            ? const CircularProgressIndicator()
            : Column(
                children: [
                  const Text("Motels are loaded!"),
                ],
              ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: RoundedButton(
        label: 'mapa',
        onPressed: () {},
        icon: Icons.map_outlined,
      ),
    );
  }
}
