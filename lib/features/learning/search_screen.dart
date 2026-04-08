import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/theme/app_theme.dart';
import '../../data/models/module_model.dart';
import '../../data/models/topic_content_model.dart';
import '../../data/module_contents/module_content_registry.dart';
import '../../data/module_data.dart';
import 'module_content_screen.dart';

/// A search result linking matched text back to its source module.
class _SearchResult {
  final String moduleId;
  final String moduleTitle;
  final String matchedText;
  final String blockContext; // e.g. "Header", "Pearl", "Table: ..."

  const _SearchResult({
    required this.moduleId,
    required this.moduleTitle,
    required this.matchedText,
    required this.blockContext,
  });
}

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  List<_SearchResult> _results = [];
  List<String> _recentSearches = [];
  bool _hasSearched = false;

  static const String _recentSearchesKey = 'recent_searches';
  static const int _maxRecentSearches = 5;

  @override
  void initState() {
    super.initState();
    _loadRecentSearches();
    // Auto-focus the search field on open.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  // ── Recent searches persistence ──

  Future<void> _loadRecentSearches() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _recentSearches = prefs.getStringList(_recentSearchesKey) ?? [];
    });
  }

  Future<void> _saveRecentSearch(String query) async {
    final trimmed = query.trim();
    if (trimmed.isEmpty) return;
    final prefs = await SharedPreferences.getInstance();
    _recentSearches.remove(trimmed);
    _recentSearches.insert(0, trimmed);
    if (_recentSearches.length > _maxRecentSearches) {
      _recentSearches = _recentSearches.sublist(0, _maxRecentSearches);
    }
    await prefs.setStringList(_recentSearchesKey, _recentSearches);
  }

  Future<void> _clearRecentSearches() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_recentSearchesKey);
    setState(() {
      _recentSearches = [];
    });
  }

  // ── Search logic ──

  void _performSearch(String query) {
    final trimmed = query.trim();
    if (trimmed.isEmpty) {
      setState(() {
        _results = [];
        _hasSearched = false;
      });
      return;
    }

    _saveRecentSearch(trimmed);

    final lowerQuery = trimmed.toLowerCase();
    final results = <_SearchResult>[];

    for (final entry in moduleContentRegistry.entries) {
      final moduleId = entry.key;
      final topicData = entry.value;
      final moduleTitle = topicData.title;

      for (final tab in topicData.tabs) {
        for (final block in tab.blocks) {
          final matches = _extractMatches(block, lowerQuery);
          for (final match in matches) {
            results.add(_SearchResult(
              moduleId: moduleId,
              moduleTitle: moduleTitle,
              matchedText: match.text,
              blockContext: match.context,
            ));
          }
        }
      }
    }

    setState(() {
      _results = results;
      _hasSearched = true;
    });
  }

  List<_MatchInfo> _extractMatches(ContentBlock block, String lowerQuery) {
    final matches = <_MatchInfo>[];

    if (block is HeaderBlock) {
      if (block.title.toLowerCase().contains(lowerQuery)) {
        matches.add(_MatchInfo(text: block.title, context: 'Section Header'));
      }
    } else if (block is TextBlock) {
      if (block.text.toLowerCase().contains(lowerQuery)) {
        matches.add(_MatchInfo(text: block.text, context: 'Text'));
      }
    } else if (block is PearlBlock) {
      if (block.title.toLowerCase().contains(lowerQuery) ||
          block.text.toLowerCase().contains(lowerQuery)) {
        matches.add(_MatchInfo(
          text: '${block.title}: ${block.text}',
          context: 'Board Pearl',
        ));
      }
    } else if (block is BulletCardBlock) {
      if (block.title.toLowerCase().contains(lowerQuery)) {
        matches.add(_MatchInfo(text: block.title, context: 'Bullet Card'));
      }
      for (final point in block.points) {
        if (point.toLowerCase().contains(lowerQuery)) {
          matches.add(_MatchInfo(
            text: point,
            context: 'Bullet: ${block.title}',
          ));
        }
      }
    } else if (block is TableBlock) {
      final allText = [
        block.title,
        ...block.columns,
        ...block.rows.expand((row) => row),
      ];
      for (final text in allText) {
        if (text.toLowerCase().contains(lowerQuery)) {
          matches.add(_MatchInfo(
            text: text,
            context: 'Table: ${block.title}',
          ));
        }
      }
    } else if (block is ComparisonCardBlock) {
      final allText = [
        block.title,
        block.description,
        ...block.keyPoints,
      ];
      for (final text in allText) {
        if (text.toLowerCase().contains(lowerQuery)) {
          matches.add(_MatchInfo(
            text: text,
            context: 'Comparison: ${block.title}',
          ));
        }
      }
    } else if (block is MnemonicBlock) {
      if (block.mnemonic.toLowerCase().contains(lowerQuery) ||
          block.explanation.toLowerCase().contains(lowerQuery)) {
        matches.add(_MatchInfo(
          text: '${block.mnemonic} - ${block.explanation}',
          context: 'Mnemonic',
        ));
      }
    } else if (block is NumberedListBlock) {
      for (final item in block.items) {
        final combined = '${item.key}: ${item.value}';
        if (combined.toLowerCase().contains(lowerQuery)) {
          matches.add(_MatchInfo(text: combined, context: 'Numbered List'));
        }
      }
    } else if (block is ScaleBlock) {
      final allText = [
        block.scaleName,
        block.description,
        ...block.columns,
        ...block.rows.expand((row) => row),
        if (block.boardPearl != null) block.boardPearl!,
      ];
      for (final text in allText) {
        if (text.toLowerCase().contains(lowerQuery)) {
          matches.add(_MatchInfo(
            text: text,
            context: 'Scale: ${block.scaleName}',
          ));
        }
      }
    } else if (block is MedicationCardBlock) {
      final allText = [
        block.name,
        block.drugClass,
        block.mechanism,
        block.indication,
        block.dosing,
        block.sideEffects,
        block.boardPearl,
      ];
      for (final text in allText) {
        if (text.isNotEmpty && text.toLowerCase().contains(lowerQuery)) {
          matches.add(_MatchInfo(
            text: text,
            context: 'Medication: ${block.name}',
          ));
        }
      }
    } else if (block is CheckpointBlock) {
      final allText = [
        block.question,
        ...block.options,
        block.explanation,
      ];
      for (final text in allText) {
        if (text.toLowerCase().contains(lowerQuery)) {
          matches.add(_MatchInfo(
            text: text,
            context: 'Checkpoint',
          ));
        }
      }
    } else if (block is CaseScenarioBlock) {
      if (block.title.toLowerCase().contains(lowerQuery) ||
          block.vignette.toLowerCase().contains(lowerQuery) ||
          block.summaryPearl.toLowerCase().contains(lowerQuery)) {
        matches.add(_MatchInfo(
          text: block.title,
          context: 'Case Scenario',
        ));
      }
    }

    return matches;
  }

  // ── Navigation ──

  void _navigateToModule(String moduleId) {
    final module = ModuleData.standardModules.firstWhere(
      (m) => m.id == moduleId,
      orElse: () => ModuleModel(
        id: moduleId,
        title: moduleId,
        description: '',
      ),
    );
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ModuleContentScreen(module: module),
      ),
    );
  }

  // ── Build ──

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundDark,
      appBar: AppBar(
        backgroundColor: AppTheme.backgroundDark,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: AppTheme.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'SEARCH',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color: AppTheme.textPrimary,
            letterSpacing: 1.5,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          _buildSearchField(),
          Expanded(child: _buildBody()),
        ],
      ),
    );
  }

  Widget _buildSearchField() {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 12),
      decoration: BoxDecoration(
        color: AppTheme.surfaceDark,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: _focusNode.hasFocus
              ? AppTheme.accentTeal.withValues(alpha: 0.5)
              : AppTheme.surfaceBorder,
        ),
      ),
      child: TextField(
        controller: _controller,
        focusNode: _focusNode,
        style: const TextStyle(
          color: AppTheme.textPrimary,
          fontSize: 15,
        ),
        cursorColor: AppTheme.accentTeal,
        decoration: InputDecoration(
          hintText: 'Search all modules...',
          hintStyle: const TextStyle(
            color: AppTheme.textTertiary,
            fontSize: 15,
          ),
          prefixIcon: const Icon(
            Icons.search_rounded,
            color: AppTheme.accentTeal,
            size: 22,
          ),
          suffixIcon: _controller.text.isNotEmpty
              ? IconButton(
                  icon: const Icon(
                    Icons.clear_rounded,
                    color: AppTheme.textTertiary,
                    size: 20,
                  ),
                  onPressed: () {
                    _controller.clear();
                    _performSearch('');
                  },
                )
              : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
        ),
        textInputAction: TextInputAction.search,
        onChanged: (value) {
          setState(() {}); // Rebuild to show/hide clear button.
          if (value.trim().length >= 2) {
            _performSearch(value);
          } else if (value.trim().isEmpty) {
            _performSearch('');
          }
        },
        onSubmitted: _performSearch,
      ),
    );
  }

  Widget _buildBody() {
    // Show recent searches when no active search.
    if (!_hasSearched && _controller.text.trim().isEmpty) {
      return _buildRecentSearches();
    }

    // No results state.
    if (_hasSearched && _results.isEmpty) {
      return _buildNoResults();
    }

    // Results grouped by module.
    return _buildResultsList();
  }

  Widget _buildRecentSearches() {
    if (_recentSearches.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search_rounded,
              size: 64,
              color: AppTheme.textTertiary.withValues(alpha: 0.4),
            ),
            const SizedBox(height: 16),
            const Text(
              'Search across all modules',
              style: TextStyle(
                fontSize: 16,
                color: AppTheme.textTertiary,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Find topics, pearls, tables, and more',
              style: TextStyle(
                fontSize: 13,
                color: AppTheme.textTertiary,
              ),
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'RECENT SEARCHES',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.textTertiary,
                  letterSpacing: 1,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: _clearRecentSearches,
                child: const Text(
                  'Clear',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppTheme.accentTealDim,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ..._recentSearches.map((search) => GestureDetector(
                onTap: () {
                  _controller.text = search;
                  _controller.selection = TextSelection.fromPosition(
                    TextPosition(offset: search.length),
                  );
                  _performSearch(search);
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
                  margin: const EdgeInsets.only(bottom: 4),
                  decoration: BoxDecoration(
                    color: AppTheme.surfaceDark,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppTheme.surfaceBorder),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.history_rounded,
                        color: AppTheme.textTertiary,
                        size: 18,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        search,
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppTheme.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildNoResults() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search_off_rounded,
            size: 64,
            color: AppTheme.textTertiary.withValues(alpha: 0.4),
          ),
          const SizedBox(height: 16),
          const Text(
            'No results found',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppTheme.textSecondary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Try a different search term',
            style: TextStyle(
              fontSize: 13,
              color: AppTheme.textTertiary.withValues(alpha: 0.8),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResultsList() {
    // Group results by module.
    final grouped = <String, List<_SearchResult>>{};
    for (final result in _results) {
      grouped.putIfAbsent(result.moduleId, () => []).add(result);
    }

    final query = _controller.text.trim().toLowerCase();

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: grouped.length,
      itemBuilder: (context, index) {
        final moduleId = grouped.keys.elementAt(index);
        final moduleResults = grouped[moduleId]!;
        final moduleTitle = moduleResults.first.moduleTitle;

        // Find the module color.
        final moduleIndex = ModuleData.standardModules.indexWhere(
          (m) => m.id == moduleId,
        );
        final color = moduleIndex >= 0 && moduleIndex < AppTheme.moduleColors.length
            ? AppTheme.moduleColors[moduleIndex]
            : AppTheme.accentTeal;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Module header
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 8),
              child: Row(
                children: [
                  Container(
                    width: 3,
                    height: 16,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(1),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      moduleTitle.toUpperCase(),
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                        color: color,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: color.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      '${moduleResults.length}',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: color,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Result cards
            ...moduleResults.take(5).map((result) => GestureDetector(
                  onTap: () => _navigateToModule(result.moduleId),
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(bottom: 6),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppTheme.surfaceDark,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppTheme.surfaceBorder),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Context label
                        Text(
                          result.blockContext,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: color.withValues(alpha: 0.7),
                            letterSpacing: 0.5,
                          ),
                        ),
                        const SizedBox(height: 4),
                        // Highlighted matched text
                        _buildHighlightedText(
                          result.matchedText,
                          query,
                        ),
                      ],
                    ),
                  ),
                )),
            // "Show more" if there are many results
            if (moduleResults.length > 5)
              GestureDetector(
                onTap: () => _navigateToModule(moduleId),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    '+ ${moduleResults.length - 5} more results in this module',
                    style: TextStyle(
                      fontSize: 12,
                      color: color.withValues(alpha: 0.7),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  /// Builds a Text widget with the matching substring highlighted in teal.
  Widget _buildHighlightedText(String text, String query) {
    if (query.isEmpty) {
      return Text(
        _truncate(text, 120),
        style: const TextStyle(
          fontSize: 13,
          color: AppTheme.textSecondary,
          height: 1.4,
        ),
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      );
    }

    final lowerText = text.toLowerCase();
    final matchIndex = lowerText.indexOf(query);

    if (matchIndex < 0) {
      return Text(
        _truncate(text, 120),
        style: const TextStyle(
          fontSize: 13,
          color: AppTheme.textSecondary,
          height: 1.4,
        ),
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      );
    }

    // Show a window around the match.
    final windowStart = (matchIndex - 30).clamp(0, text.length);
    final windowEnd = (matchIndex + query.length + 60).clamp(0, text.length);
    final snippet = text.substring(windowStart, windowEnd);
    final snippetMatchStart = matchIndex - windowStart;
    final snippetMatchEnd = snippetMatchStart + query.length;

    final prefix = windowStart > 0 ? '...' : '';
    final suffix = windowEnd < text.length ? '...' : '';

    final before = snippet.substring(0, snippetMatchStart);
    final match = snippet.substring(snippetMatchStart, snippetMatchEnd);
    final after = snippet.substring(snippetMatchEnd);

    return RichText(
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        style: const TextStyle(
          fontSize: 13,
          color: AppTheme.textSecondary,
          height: 1.4,
        ),
        children: [
          if (prefix.isNotEmpty)
            TextSpan(text: prefix),
          TextSpan(text: before),
          TextSpan(
            text: match,
            style: const TextStyle(
              color: AppTheme.accentTeal,
              fontWeight: FontWeight.w700,
              backgroundColor: Color(0xFF0A2A25),
            ),
          ),
          TextSpan(text: after),
          if (suffix.isNotEmpty)
            TextSpan(text: suffix),
        ],
      ),
    );
  }

  String _truncate(String text, int maxLength) {
    if (text.length <= maxLength) return text;
    return '${text.substring(0, maxLength)}...';
  }
}

class _MatchInfo {
  final String text;
  final String context;
  const _MatchInfo({required this.text, required this.context});
}
