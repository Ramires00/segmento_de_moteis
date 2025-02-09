import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:projetos/config/constants/urls.dart';
import 'package:projetos/config/http/http_client.dart';
import 'package:projetos/data/repositories/motels_repository.dart';
import 'package:projetos/data/services/motels_service.dart';
import 'package:projetos/routing/router.dart';
import 'package:projetos/ui/feature_ir_agora/view_model/motels_view_model.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MotelsViewModel(
            repository: MotelsRepository(
              motelsService: MotelsService(
                httpClient: HttpClient(
                  dio: Dio(),
                  baseUrl: Urls.baseUrl,
                ),
              ),
            ),
          ),
        )
      ],
      child: MaterialApp.router(
        routerConfig: router,
      ),
    );
  }
}
