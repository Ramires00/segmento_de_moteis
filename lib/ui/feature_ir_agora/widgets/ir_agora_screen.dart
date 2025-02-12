import 'package:flutter/material.dart';
import 'package:projetos/domain/models/motel.dart';
import 'package:projetos/ui/core/ui/button/rounded_button.dart';
import 'package:projetos/ui/core/ui/motel_schedule_appbar.dart';
import 'package:projetos/ui/feature_ir_agora/view_model/motels_view_model.dart';
import 'package:projetos/ui/feature_ir_agora/widgets/motel_card.dart';
import 'package:provider/provider.dart';

class IrAgoraScreen extends StatefulWidget {
  const IrAgoraScreen({
    required this.viewModel,
    super.key,
  });

  final MotelsViewModel viewModel;

  @override
  State<IrAgoraScreen> createState() => _IrAgoraScreenState();
}

class _IrAgoraScreenState extends State<IrAgoraScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
        (_) => context.read<MotelsViewModel>().getMotels());
  }

  @override
  Widget build(BuildContext context) {
    final List<Motel> motels = context.watch<MotelsViewModel>().motels;

    return Scaffold(
      appBar: MotelScheduleAppbar(),
      drawer: Drawer(),
      body: Center(
        child: context.watch<MotelsViewModel>().isLoading
            ? const CircularProgressIndicator()
            : ListView.builder(
                itemCount: motels.length,
                itemBuilder: (context, index) => MotelCard(
                  motelLogo: motels[index].logo ?? '',
                  motelName: motels[index].fantasia ?? '',
                  motelNeighborhood: motels[index].bairro ?? '',
                  suites: motels[index].suites ?? [],
                ),
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
