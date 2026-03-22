class PodcastEpisode {
  final String id;
  final String title;
  final String description;
  final String moduleId;
  final String assetPath;

  const PodcastEpisode({
    required this.id,
    required this.title,
    required this.description,
    required this.moduleId,
    required this.assetPath,
  });
}

class PodcastData {
  static const List<PodcastEpisode> episodes = [
    PodcastEpisode(
      id: 'orthotic-principles-podcast',
      title: 'Orthotic Principles Board Review',
      description:
          'Board-focused podcast covering AFO types, spinal orthoses, and biomechanical principles.',
      moduleId: 'po-fundamentals',
      assetPath: 'assets/audio/orthotic_principles_podcast.m4a',
    ),
    PodcastEpisode(
      id: 'prosthetic-components-podcast',
      title: 'Prosthetic Components Board Review',
      description:
          'Deep dive into prosthetic feet, knees, sockets, and suspension systems.',
      moduleId: 'prosthetic-components',
      assetPath: 'assets/audio/prosthetic_components_podcast.m4a',
    ),
    PodcastEpisode(
      id: 'gait-analysis-podcast',
      title: 'Gait Analysis Board Review',
      description:
          'Prosthetic gait deviations, energy expenditure, and normal gait cycle.',
      moduleId: 'gait-analysis',
      assetPath: 'assets/audio/gait_analysis_podcast.m4a',
    ),
    PodcastEpisode(
      id: 'amputation-rehab-podcast',
      title: 'Amputation Rehab Board Review',
      description:
          'Amputation levels, K-levels, phantom pain, and rehabilitation continuum.',
      moduleId: 'amputation-rehab',
      assetPath: 'assets/audio/amputation_rehab_podcast.m4a',
    ),
  ];
}
