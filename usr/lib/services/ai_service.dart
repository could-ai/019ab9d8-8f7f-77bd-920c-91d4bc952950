import 'package:flutter/material.dart';

class AiService {
  // Simulate AI response for different tools
  static Future<String> generateResponse(String toolName, String input) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 2));

    switch (toolName) {
      case 'Smart Notes':
        return "Here are the smart notes for '$input':\n\n1. Key Concept: The main idea is...\n2. Important Dates: Remember 1947...\n3. Summary: In conclusion, this topic covers...";
      case 'Doubt Solver':
        return "Here is the solution for your doubt about '$input':\n\nStep 1: Analyze the problem.\nStep 2: Apply the formula F = ma.\nStep 3: Calculate the result.\n\nAnswer: The force is 50N.";
      case 'Flashcards':
        return "Flashcards created for '$input':\n\n[Q] What is the capital of France?\n[A] Paris\n\n[Q] What is H2O?\n[A] Water";
      case 'Quiz Maker':
        return "Quiz generated for '$input':\n\n1. What is the powerhouse of the cell?\n   a) Nucleus\n   b) Mitochondria (Correct)\n   c) Ribosome";
      case 'Summarizer':
        return "Summary of '$input':\n\nThis text discusses the importance of AI in education. It highlights how personalized learning can improve student outcomes.";
      case 'Essay Helper':
        return "Essay Outline for '$input':\n\nI. Introduction\n   - Hook\n   - Thesis Statement\n\nII. Body Paragraph 1\n   - Argument A\n\nIII. Conclusion\n   - Restate Thesis";
      default:
        return "I can help you with that! Please provide more details.";
    }
  }
}
