import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import '../../data/models/podcast_model.dart';
import '../../core/theme/app_theme.dart';

class PodcastPlayerScreen extends StatefulWidget {
  final PodcastEpisode episode;
  const PodcastPlayerScreen({super.key, required this.episode});

  @override
  State<PodcastPlayerScreen> createState() => _PodcastPlayerScreenState();
}

class _PodcastPlayerScreenState extends State<PodcastPlayerScreen> {
  late final AudioPlayer _player;
  double _playbackSpeed = 1.0;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    _loadAudio();
  }

  Future<void> _loadAudio() async {
    try {
      await _player.setAsset(widget.episode.assetPath);
    } catch (e) {
      // Audio file may not exist yet
    }
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  void _cycleSpeed() {
    const speeds = [1.0, 1.25, 1.5, 2.0];
    final currentIdx = speeds.indexOf(_playbackSpeed);
    final nextIdx = (currentIdx + 1) % speeds.length;
    setState(() {
      _playbackSpeed = speeds[nextIdx];
    });
    _player.setSpeed(_playbackSpeed);
  }

  String _formatDuration(Duration d) {
    final minutes = d.inMinutes;
    final seconds = (d.inSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundDark,
      appBar: AppBar(
        backgroundColor: AppTheme.backgroundDark,
        foregroundColor: AppTheme.textPrimary,
        title: const Text('Podcast'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const Spacer(),
            // Episode info
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: AppTheme.surfaceDark,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: AppTheme.accentTeal.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Icon(
                  Icons.headset_rounded,
                  size: 56,
                  color: AppTheme.accentTeal,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              widget.episode.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: AppTheme.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              widget.episode.description,
              style: const TextStyle(
                fontSize: 14,
                color: AppTheme.textSecondary,
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            // Seek bar
            StreamBuilder<Duration>(
              stream: _player.positionStream,
              builder: (context, posSnap) {
                final position = posSnap.data ?? Duration.zero;
                final duration = _player.duration ?? Duration.zero;
                final maxVal = duration.inMilliseconds.toDouble().clamp(1.0, double.infinity);
                return Column(
                  children: [
                    SliderTheme(
                      data: SliderThemeData(
                        inactiveTrackColor: AppTheme.surfaceBorder,
                      ),
                      child: Slider(
                        value: position.inMilliseconds.toDouble().clamp(0.0, maxVal),
                        max: maxVal,
                        activeColor: AppTheme.accentTeal,
                        onChanged: (v) => _player.seek(Duration(milliseconds: v.toInt())),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _formatDuration(position),
                            style: const TextStyle(fontSize: 13, color: AppTheme.textTertiary),
                          ),
                          Text(
                            _formatDuration(duration),
                            style: const TextStyle(fontSize: 13, color: AppTheme.textTertiary),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 16),
            // Controls
            StreamBuilder<PlayerState>(
              stream: _player.playerStateStream,
              builder: (context, snapshot) {
                final playing = snapshot.data?.playing ?? false;
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Speed button
                    TextButton(
                      onPressed: _cycleSpeed,
                      child: Text(
                        '${_playbackSpeed}x',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.accentTeal,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Rewind 15s
                    IconButton(
                      iconSize: 36,
                      icon: const Icon(Icons.replay_10_rounded),
                      color: AppTheme.textSecondary,
                      onPressed: () {
                        final pos = _player.position;
                        _player.seek(pos - const Duration(seconds: 15));
                      },
                    ),
                    const SizedBox(width: 8),
                    // Play/Pause
                    IconButton(
                      iconSize: 64,
                      icon: Icon(
                        playing ? Icons.pause_circle_filled : Icons.play_circle_filled,
                      ),
                      color: AppTheme.accentTeal,
                      onPressed: playing ? _player.pause : _player.play,
                    ),
                    const SizedBox(width: 8),
                    // Forward 30s
                    IconButton(
                      iconSize: 36,
                      icon: const Icon(Icons.forward_30_rounded),
                      color: AppTheme.textSecondary,
                      onPressed: () {
                        final pos = _player.position;
                        _player.seek(pos + const Duration(seconds: 30));
                      },
                    ),
                    const SizedBox(width: 16),
                    const SizedBox(width: 48), // Balance the speed button
                  ],
                );
              },
            ),
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }
}
