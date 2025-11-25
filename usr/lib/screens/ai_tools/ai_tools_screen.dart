import 'package:flutter/material.dart';

class AiToolsScreen extends StatelessWidget {
  const AiToolsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Tools'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16),
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: [
          _buildToolCard(
            context,
            'Smart Notes',
            'Generate notes from text or topics',
            Icons.description,
            Colors.blue,
          ),
          _buildToolCard(
            context,
            'Doubt Solver',
            'Ask questions and get instant answers',
            Icons.chat_bubble,
            Colors.green,
          ),
          _buildToolCard(
            context,
            'Flashcards',
            'Create study cards automatically',
            Icons.style,
            Colors.orange,
          ),
          _buildToolCard(
            context,
            'Quiz Maker',
            'Test your knowledge',
            Icons.quiz,
            Colors.purple,
          ),
          _buildToolCard(
            context,
            'Summarizer',
            'Shorten long paragraphs',
            Icons.short_text,
            Colors.teal,
          ),
          _buildToolCard(
            context,
            'Essay Helper',
            'Structure your essays',
            Icons.edit_note,
            Colors.redAccent,
          ),
        ],
      ),
    );
  }

  Widget _buildToolCard(BuildContext context, String title, String desc, IconData icon, Color color) {
    return Card(
      elevation: 4,
      shadowColor: color.withOpacity(0.3),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, size: 32, color: color),
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                desc,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
