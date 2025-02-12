import 'package:flutter/material.dart';
import 'package:projetos/domain/models/periodo.dart';

class PeriodTile extends StatelessWidget {
  const PeriodTile({
    required this.period,
    super.key,
  });

  final Periodo period;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      period.tempoFormatado ?? '',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'R\$ ${period.valor?.toStringAsFixed(2).replaceFirst('.', ',')}',
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                  ],
                ),
                Icon(Icons.arrow_forward_ios, color: Colors.grey.shade600),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
