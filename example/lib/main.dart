import 'package:flutter/material.dart';
import 'package:stoolap_flutter/stoolap_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StoolapDatabase.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const StoolapDemo(),
      theme: ThemeData.dark(),
    );
  }
}

class StoolapDemo extends StatefulWidget {
  const StoolapDemo({super.key});

  @override
  State<StoolapDemo> createState() => _StoolapDemoState();
}

class _StoolapDemoState extends State<StoolapDemo> {
  final _db = StoolapDatabase();
  final _controller = TextEditingController();
  bool _isReady = false;

  @override
  void initState() {
    super.initState();
    _initDb();
  }

  Future<void> _initDb() async {
    await _db.open('demo.db');
    await _db.execute('CREATE TABLE IF NOT EXISTS notes (id INTEGER PRIMARY KEY, content TEXT)');
    setState(() => _isReady = true);
  }

  Future<void> _addNote() async {
    if (_controller.text.isEmpty) return;
    await _db.execute('INSERT INTO notes (content) VALUES (?)', params: [_controller.text]);
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isReady) return const Scaffold(body: Center(child: CircularProgressIndicator()));

    return Scaffold(
      appBar: AppBar(title: const Text('Stoolap Vector DB')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(hintText: 'Enter note...'),
                  ),
                ),
                IconButton(icon: const Icon(Icons.add), onPressed: _addNote),
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder<List<StoolapRow>>(
              stream: _db.watch('SELECT * FROM notes ORDER BY id DESC'),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
                final rows = snapshot.data!;
                return ListView.builder(
                  itemCount: rows.length,
                  itemBuilder: (context, index) {
                    final values = rows[index].values;
                    final content = values.length > 1 ? values[1] : "No content";
                    return ListTile(
                      title: Text(content.toString()),
                      leading: const Icon(Icons.note),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
