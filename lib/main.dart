import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/core/theme/app_theme.dart';
import 'package:todo_app/core/models/tag_model.dart';
import 'package:todo_app/core/models/task_model.dart';
import 'package:todo_app/core/models/work_session_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Widgetları çizmeye hazır olduğundan emin ol.
  await Hive.initFlutter(); // Hive'ı flutter için başlat.

  // Adapter'ları Hive'a tanıt
  Hive.registerAdapter(TaskModelAdapter());
  Hive.registerAdapter(TagModelAdapter());
  Hive.registerAdapter(WorkSessionModelAdapter());

  runApp(const MyApp()); // uygulama başlatılıyor.
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To-Do App',
      theme: lightTheme,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Görevlerim')),
      body: const Center(
        child: Text(
          'Henüz görev eklenmedi.',
          // Renkleri artık doğrudan vermek yerine temadan çekiyoruz.
          // Bu, profesyonel bir yaklaşımdır.
          style: TextStyle(color: AppColors.onBackground, fontSize: 18),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Görev ekleme ekranına yönlendirme yapılacak.
        },
        // Temada tanımlandığı için ikon rengi otomatik olarak ayarlanacak.
        child: const Icon(Icons.add),
      ),
    );
  }
}
