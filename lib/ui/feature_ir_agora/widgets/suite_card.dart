import 'package:flutter/material.dart';
import 'package:projetos/domain/models/suite.dart';
import 'package:projetos/ui/feature_ir_agora/widgets/category_card.dart';
import 'package:projetos/ui/feature_ir_agora/widgets/period_tile.dart';

class SuiteCard extends StatelessWidget {
  const SuiteCard({
    required this.suite,
    super.key,
  });

  final Suite suite;

  List<Widget> get periodTiles => suite.periodos != null
      ? suite.periodos!.map((p) => PeriodTile(period: p)).toList()
      : [const SizedBox.shrink()];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        spacing: 12,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.network(
              suite.fotos?[0] ?? '',
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Icon(
                Icons.holiday_village,
                size: 50,
              ),
            ),
          ),
          Center(
            child: Text(
              suite.nome ?? '',
              style: TextStyle(fontSize: 24, color: Colors.black87),
            ),
          ),
          CategoryCard(
            itens: suite.categoriaItens ?? [],
          ),
          ...periodTiles
        ],
      ),
    );
  }
}
