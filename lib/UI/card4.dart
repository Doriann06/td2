import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart';
import 'mytheme.dart';
import 'ViewModel.dart';
class Ecran4 extends StatefulWidget{
  const Ecran4({super.key});
  @override
  State<Ecran4> createState()=> _EcranSettingsState();
}
class _EcranSettingsState extends State<Ecran4> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SettingsList(
        darkTheme: SettingsThemeData(
          settingsListBackground: MyTheme.dark().scaffoldBackgroundColor,
          settingsSectionBackground: MyTheme.dark().scaffoldBackgroundColor
        ),
        lightTheme: SettingsThemeData(
          settingsListBackground: MyTheme.light().scaffoldBackgroundColor,
          settingsSectionBackground: MyTheme.light().scaffoldBackgroundColor
        ),
        sections: [
          SettingsSection(
            title: const Text('Theme'),
            tiles: [
              SettingsTile.switchTile(
              initialValue: context.watch<SettingViewModel>().isDark,
              onToggle: (bool vlaue){
                context.read<SettingViewModel>().isDark = vlaue;},
                title:const Text('Dark mode'),
                leading:const Icon(Icons.invert_colors),)
            ])
        ],
      ),
    );
  }
}