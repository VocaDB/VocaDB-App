const String appName = 'VocaDB';
const String baseUrl = 'https://vocadb.net';
const String authority = 'vocadb.net';

enum ContentLanguage { Default, Japanese, Romaji, English }

const List<Map<String, String>> contactSites = [
  {"title": "Website", "url": "https://vocadb.net"},
  {"title": "Facebook", "url": "https://www.facebook.com/vocadb"},
  {"title": "Twitter", "url": "https://twitter.com/VocaDB"},
  {"title": "VK", "url": "https://vk.com/vocadb"},
  {"title": "IRC #vocadb", "url": "https://vocadb.net/Home/Chat"},
];

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

const bool constShowFilterRank = true;

const List<String> constRankings = [
  'daily',
  'weekly',
  'monthly',
  'overall',
];

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
