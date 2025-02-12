import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:projetos/domain/models/suite.dart';
import 'package:projetos/ui/feature_ir_agora/widgets/suite_card.dart';

import '../../core/ui/button/favorite_button.dart';

class MotelCard extends StatelessWidget {
  const MotelCard({
    required this.motelLogo,
    required this.motelName,
    required this.motelNeighborhood,
    required this.suites,
    super.key,
  });

  final String motelLogo;
  final String motelName;
  final String motelNeighborhood;
  final List<Suite> suites;

  Widget get motelHeader => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(
              motelLogo,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                motelName,
                style: TextStyle(fontSize: 24),
              ),
              Text(
                motelNeighborhood,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          FavoriteIconButton(
            onChanged: (value) {},
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            motelHeader,
            CarouselSlider(
              items: suites
                  .map(
                    (suite) => SuiteCard(suite: suite),
                  )
                  .toList(),
              options: CarouselOptions(
                aspectRatio:
                    1 / (MediaQuery.of(context).devicePixelRatio * 0.7),
                enlargeCenterPage: true,
                autoPlay: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
