const String APP_NAME = 'VocaDB';
const String HOST = 'https://vocadb.net';
const String AUTHORITY = 'vocadb.net';

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
