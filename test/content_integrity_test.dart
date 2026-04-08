import 'package:flutter_test/flutter_test.dart';
import 'package:po_training/data/module_contents/module_content_registry.dart';
import 'package:po_training/data/quiz_banks/po_quiz_bank.dart';
import 'package:po_training/data/quiz_banks/po_flashcards.dart';
import 'package:po_training/data/models/topic_content_model.dart';

void main() {
  group('Module Content Registry', () {
    test('all 14 modules are registered', () {
      expect(moduleContentRegistry.length, 14);
    });

    test('all module IDs are non-empty strings', () {
      for (final entry in moduleContentRegistry.entries) {
        expect(entry.key, isNotEmpty, reason: 'Module ID should not be empty');
        expect(entry.key, matches(RegExp(r'^[a-z\-]+$')),
            reason: 'Module ID "${entry.key}" should be kebab-case');
      }
    });

    test('every module has at least one tab', () {
      for (final entry in moduleContentRegistry.entries) {
        expect(entry.value.tabs.isNotEmpty, true,
            reason: 'Module "${entry.key}" should have at least one tab');
      }
    });

    test('every tab has a non-empty title', () {
      for (final entry in moduleContentRegistry.entries) {
        for (final tab in entry.value.tabs) {
          expect(tab.title, isNotEmpty,
              reason: 'Tab in "${entry.key}" has empty title');
        }
      }
    });

    test('every tab has at least one content block', () {
      for (final entry in moduleContentRegistry.entries) {
        for (final tab in entry.value.tabs) {
          expect(tab.blocks.isNotEmpty, true,
              reason:
                  'Tab "${tab.title}" in "${entry.key}" has no content blocks');
        }
      }
    });

    test('no tab has more than 100 blocks (sanity check)', () {
      for (final entry in moduleContentRegistry.entries) {
        for (final tab in entry.value.tabs) {
          expect(tab.blocks.length, lessThan(100),
              reason:
                  'Tab "${tab.title}" in "${entry.key}" has ${tab.blocks.length} blocks — likely too many');
        }
      }
    });

    test('expected module IDs are present', () {
      const expectedIds = [
        'po-fundamentals',
        'le-orthoses',
        'ue-orthoses',
        'spinal-orthoses',
        'prosthetic-components',
        'transtibial',
        'transfemoral',
        'ue-prosthetics',
        'gait-analysis',
        'materials-fabrication',
        'pediatric-po',
        'advanced-tech',
        'amputation-rehab',
        'special-populations',
      ];
      for (final id in expectedIds) {
        expect(moduleContentRegistry.containsKey(id), true,
            reason: 'Missing module: $id');
      }
    });
  });

  group('Table Block Integrity', () {
    test('all TableBlocks have consistent column counts', () {
      for (final entry in moduleContentRegistry.entries) {
        for (final tab in entry.value.tabs) {
          for (final block in tab.blocks) {
            if (block is TableBlock) {
              final colCount = block.columns.length;
              for (int r = 0; r < block.rows.length; r++) {
                expect(block.rows[r].length, colCount,
                    reason:
                        'Table "${block.title}" in "${entry.key}" > "${tab.title}": '
                        'row $r has ${block.rows[r].length} cells but header has $colCount columns');
              }
            }
          }
        }
      }
    });

    test('no TableBlock has empty headers', () {
      for (final entry in moduleContentRegistry.entries) {
        for (final tab in entry.value.tabs) {
          for (final block in tab.blocks) {
            if (block is TableBlock) {
              expect(block.columns.isNotEmpty, true,
                  reason:
                      'Table "${block.title}" in "${entry.key}" has no headers');
            }
          }
        }
      }
    });
  });

  group('Quiz Bank Integrity', () {
    test('quiz bank has questions', () {
      expect(POQuizBank.allQuestions.isNotEmpty, true);
    });

    test('every question has 4 options', () {
      for (int i = 0; i < POQuizBank.allQuestions.length; i++) {
        final q = POQuizBank.allQuestions[i];
        expect(q.options.length, 4,
            reason: 'Question $i has ${q.options.length} options, expected 4');
      }
    });

    test('correctIndex is within bounds for every question', () {
      for (int i = 0; i < POQuizBank.allQuestions.length; i++) {
        final q = POQuizBank.allQuestions[i];
        expect(q.correctIndex, greaterThanOrEqualTo(0),
            reason: 'Question $i correctIndex is negative');
        expect(q.correctIndex, lessThan(q.options.length),
            reason:
                'Question $i correctIndex ${q.correctIndex} >= ${q.options.length}');
      }
    });

    test('every question has a non-empty explanation', () {
      for (int i = 0; i < POQuizBank.allQuestions.length; i++) {
        final q = POQuizBank.allQuestions[i];
        expect(q.explanation, isNotEmpty,
            reason: 'Question $i has empty explanation');
      }
    });

    test('every question has a moduleId', () {
      for (int i = 0; i < POQuizBank.allQuestions.length; i++) {
        final q = POQuizBank.allQuestions[i];
        expect(q.moduleId, isNotNull,
            reason: 'Question $i has null moduleId');
        expect(q.moduleId, isNotEmpty,
            reason: 'Question $i has empty moduleId');
      }
    });

    test('all quiz moduleIds map to registered modules', () {
      final registeredIds = moduleContentRegistry.keys.toSet();
      for (int i = 0; i < POQuizBank.allQuestions.length; i++) {
        final q = POQuizBank.allQuestions[i];
        if (q.moduleId != null) {
          expect(registeredIds.contains(q.moduleId), true,
              reason:
                  'Question $i references module "${q.moduleId}" which is not registered');
        }
      }
    });

    test('difficulty is one of basic/intermediate/board', () {
      const validDifficulties = {'basic', 'intermediate', 'board'};
      for (int i = 0; i < POQuizBank.allQuestions.length; i++) {
        final q = POQuizBank.allQuestions[i];
        if (q.difficulty != null) {
          expect(validDifficulties.contains(q.difficulty), true,
              reason:
                  'Question $i has invalid difficulty "${q.difficulty}"');
        }
      }
    });

    test('no duplicate questions', () {
      final seen = <String>{};
      for (int i = 0; i < POQuizBank.allQuestions.length; i++) {
        final q = POQuizBank.allQuestions[i].question;
        expect(seen.contains(q), false,
            reason: 'Duplicate question at index $i: "$q"');
        seen.add(q);
      }
    });
  });

  group('Flashcard Integrity', () {
    final allFlashcards = [
      ...FundamentalsOrthosesFlashcards.cards,
      ...ProstheticComponentsFlashcards.cards,
      ...GaitAnalysisFlashcards.cards,
      ...AmputationRehabFlashcards.cards,
    ];

    test('flashcard decks are non-empty', () {
      expect(FundamentalsOrthosesFlashcards.cards.isNotEmpty, true);
      expect(ProstheticComponentsFlashcards.cards.isNotEmpty, true);
      expect(GaitAnalysisFlashcards.cards.isNotEmpty, true);
      expect(AmputationRehabFlashcards.cards.isNotEmpty, true);
    });

    test('every flashcard has non-empty front and back', () {
      for (int i = 0; i < allFlashcards.length; i++) {
        final f = allFlashcards[i];
        expect(f.front, isNotEmpty,
            reason: 'Flashcard $i has empty front');
        expect(f.back, isNotEmpty,
            reason: 'Flashcard $i has empty back');
      }
    });

    test('all flashcard moduleIds map to registered modules', () {
      final registeredIds = moduleContentRegistry.keys.toSet();
      for (int i = 0; i < allFlashcards.length; i++) {
        final f = allFlashcards[i];
        if (f.moduleId != null) {
          expect(registeredIds.contains(f.moduleId), true,
              reason:
                  'Flashcard $i references module "${f.moduleId}" which is not registered');
        }
      }
    });
  });
}
