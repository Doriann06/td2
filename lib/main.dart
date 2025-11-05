import 'package:flutter/material.dart';
import 'UI/mytheme.dart';
import 'UI/home.dart';
import 'package:provider/provider.dart';
import 'UI/ViewModel.dart';
void main() {
  runApp(MyTD2App());
}

class MyTD2App extends StatelessWidget {
 @override
    Widget build(BuildContext context){
      return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_){
            SettingViewModel settingViewModel = SettingViewModel();
            //getSettings est deja appelee dans le constructeur
            return settingViewModel;
          }),
          ChangeNotifierProvider(
            create:(_){
              TaskViewModel taskViewModel = TaskViewModel();
              taskViewModel.generateTasks();
              return taskViewModel;
          } )
        ],
        child: Consumer<SettingViewModel>(
          builder: (context,SettingViewModel notifier,child){
            return MaterialApp(
              theme: notifier.isDark ? MyTheme.dark():MyTheme.light(),
              title: 'TD2',
              home: Home()
          );
          },
        ),
      );
    }
}

