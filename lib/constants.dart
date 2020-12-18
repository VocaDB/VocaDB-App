const String appName = 'VocaDB';
const String baseUrl = 'https://vocadb.net';
const String authority = 'vocadb.net';

/// Display language same as VocaDB website
enum ContentLanguage { Default, Japanese, Romaji, English }

/// Contact list of VocaDB
const List<Map<String, String>> contactSites = [
  {"title": "Website", "url": "https://vocadb.net"},
  {"title": "Facebook", "url": "https://www.facebook.com/vocadb"},
  {"title": "Twitter", "url": "https://twitter.com/VocaDB"},
  {"title": "VK", "url": "https://vk.com/vocadb"},
  {"title": "IRC #vocadb", "url": "https://vocadb.net/Home/Chat"},
];

/// Contact list of mobile app developer
const List<Map<String, String>> contactDeveloperSites = [
  {
    "title": "Mail",
    "url": "mailto:augsorn.chanklad@gmail.com?subject=VocaDB%20Feedback"
  },
  {"title": "Facebook", "url": "https://facebook.com/augsorn"},
  {"title": "Twitter", "url": "https://twitter.com/up2codio"},
  {"title": "VocaDB", "url": "https://vocadb.net/Profile/up2up"},
  {"title": "Github", "url": "https://github.com/VocaDB/VocaDB-App"},
];

/// Set to false for hide filter menu on ranking page
const bool constShowFilterRank = true;

/// Ranking category
const List<String> constRankings = [
  'daily',
  'weekly',
  'monthly',
  'overall',
];

/// List of song types
const List<String> constSongTypes = [
  'Original',
  'Remaster',
  'Remix',
  'Cover',
  'Instrumental',
  'Mashup',
  'MusicPV',
  'DramaPV',
  'Other',
];

/// List of album types
const List<String> constAlbumTypes = [
  'Album',
  'Single',
  'EP',
  'SplitAlbum',
  'Compilation',
  'Video',
  'Artbook',
  'Other',
];

/// List of artist types
const List<String> constArtistTypes = [
  'Circle',
  'Label',
  'Producer',
  'Animator',
  'Illustrator',
  'Lyricist',
  'Vocaloid',
  'UTAU',
  'CeVIO',
  'OtherVoiceSynthesizer',
  'OtherVocalist',
  'OtherGroup',
  'OtherIndividual',
];

/// List of release event categories
const List<String> constEventCategories = [
  'AlbumRelease',
  'Anniversary',
  'Club',
  'Concert',
  'Contest',
  'Other',
];

/// List of tag categories
const List<String> constTagCategories = [
  'Animation',
  'Copyrights',
  'Distribution',
  'Editor notes',
  'Event',
  'Games',
  'Genres',
  'Instruments',
  'Jobs',
  'Languages',
  'Lyrics',
  'Media',
  'Series',
  'Sources',
  'Themes',
  'Vocalists',
];
