import 'package:flutter/material.dart';
import 'package:projetos/ui/core/ui/button/flat_icon_button.dart';
import 'package:projetos/ui/core/ui/button/flat_rounded_button.dart';
import 'package:projetos/ui/core/ui/button/flat_text_button_trailing_icon.dart';

class MotelScheduleAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  const MotelScheduleAppbar({super.key});

  PreferredSize get preferredSizeWidget => PreferredSize(
        preferredSize: Size.fromHeight(30.0),
        child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: FlatTextButtonTrailingIcon(
              label: 'Minha localização',
              trailing: Icon(
                Icons.keyboard_arrow_down_rounded,
                size: 30,
                color: Colors.white,
              ),
              onPressed: () {},
            )),
      );

  Widget get title => Row(
        children: [
          FlatRoundedButton(
            onPressed: () {},
            label: 'ir agora',
            icon: Icons.bolt,
          ),
          FlatRoundedButton(
            onPressed: () {},
            label: 'ir outro dia',
            icon: Icons.calendar_month,
          ),
        ],
      );

  List<Widget> get actions => [
        FlatIconButton(
          icon: Icons.search,
          onPressed: () {},
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.white),
      backgroundColor: Colors.red,
      title: title,
      actions: actions,
      bottom: preferredSizeWidget,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
        100.0,
      );
}
