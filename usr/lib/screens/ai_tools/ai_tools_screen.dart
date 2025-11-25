import 'package:flutter/material.dart';
import 'package:couldai_user_app/services/ai_service.dart';

class AiToolsScreen extends StatefulWidget {
  const AiToolsScreen({super.key});

  @override
  State<AiToolsScreen> createState() => _AiToolsScreenState();
}

class _AiToolsScreenState extends State<AiToolsScreen> {
  bool _isLoading = false;

  Future<void> _handleToolTap(BuildContext context, String title, Color color) async {
    // Show input dialog
    final TextEditingController _controller = TextEditingController();
    
    final String? input = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: TextField(
          controller: _controller,
          decoration: InputDecoration(
            hintText: 'Enter topic or question...',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
          maxLines: 3,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, _controller.text),
            style: ElevatedButton.styleFrom(backgroundColor: color),
            child: const Text('Generate'),
          ),
        ],
      ),
    );

    if (input != null && input.isNotEmpty) {
      setState(() => _isLoading = true);
      
      // Simulate AI processing
      try {
        final response = await AiService.generateResponse(title, input);
        
        if (!mounted) return;
        
        // Show result
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          builder: (context) => Container(
            padding: const EdgeInsets.all(24),
            height: MediaQuery.of(context).size.height * 0.6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '$title Result',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                const Divider(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      response,
                      style: const TextStyle(fontSize: 16, height: 1.5),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Saved to your library!')),
                      );
                    },
                    icon: const Icon(Icons.save_alt),
                    label: const Text('Save Result'),
                    style: ElevatedButton.styleFrom(backgroundColor: color),
                  ),
                ),
              ],
            ),
          ),
        );
      } finally {
        if (mounted) setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Tools'),
      ),
      body: Stack(
        children: [
          GridView.count(
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
          if (_isLoading)
            Container(
              color: Colors.black54,
              child: const Center(
                child: CircularProgressIndicator(color: Colors.white),
              ),
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
        onTap: () => _handleToolTap(context, title, color),
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
