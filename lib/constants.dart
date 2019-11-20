const String APP_NAME = 'TouhouDB';
const String HOST = 'https://touhoudb.com';
const String AUTHORITY = 'touhoudb.com';

enum ContentLanguage { Default, Japanese, Romaji, English }

const List<Map<String, String>> contactSites = [
  {"title": "Website", "url": "https://touhoudb.com"},
  {"title": "Twitter", "url": "https://twitter.com/touhoudb"},
];

const List<Map<String, String>> contactDeveloperSites = [
  {
    "title": "Mail",
    "url": "mailto:augsorn.chanklad@gmail.com?subject=TouhouDB%20Feedback"
  },
  {"title": "Facebook", "url": "https://facebook.com/augsorn"},
  {"title": "Twitter", "url": "https://twitter.com/up2codio"},
  {"title": "VocaDB", "url": "https://vocadb.net/Profile/up2up"},
  {"title": "Github", "url": "https://github.com/VocaDB/VocaDB-App"},
];

const bool constShowFilterRank = false;

const List<String> constRankings = [
  'monthly',
  'overall',
];

const List<String> constSongTypes = [
  'Original',
  'Arrangement',
  'Instrumental',
  'MusicPV',
  'DramaPV',
  'Other',
];

const List<String> constAlbumTypes = [
  'Album',
  'Game',
  'Fanmade',
  'Other',
];

const List<String> constArtistTypes = [
  'Circle',
  'Label',
  'Producer',
  'Animator',
  'Illustrator',
  'Lyricist',
  'Vocalist',
  'Character',
  'OtherGroup',
  'OtherIndividual',
];

const List<String> constEventCategories = [
  'AlbumRelease',
  'Anniversary',
  'Club',
  'Concert',
  'Contest',
  'Other',
];

const List<String> constTagCategories = [
  'Animation',
  'Copyrights',
  'Distribution',
  'Editor notes',
  'Games',
  'Genres',
  'Instruments',
  'Job',
  'Languages',
  'Lyrics',
  'Media',
  'Release types',
  'Series',
  'Sources',
  'Themes',
  'Unsorted',
  'Vocalists',
];