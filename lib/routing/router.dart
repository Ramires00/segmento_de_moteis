import 'package:go_router/go_router.dart';
import 'package:projetos/ui/feature_ir_agora/view_model/motels_view_model.dart';
import 'package:projetos/ui/feature_ir_agora/widgets/ir_agora_screen.dart';
import 'package:provider/provider.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => IrAgoraScreen(
        viewModel: context.read<MotelsViewModel>(),
      ),
    )
  ],
);
