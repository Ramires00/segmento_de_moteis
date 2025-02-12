import 'package:flutter/material.dart';
import 'package:projetos/domain/models/categoria_item.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    required this.itens,
    super.key,
  });

  final List<CategoriaItem> itens;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: itens
                  .map(
                    (item) =>
                        ImageIcon(NetworkImage(item.icone ?? ''), size: 40),
                  )
                  .toList()
                  .sublist(0, 4),
            ),
            Row(
              children: [
                Text(
                  'Ver\ntodos',
                  style: TextStyle(color: Colors.grey.shade700),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
