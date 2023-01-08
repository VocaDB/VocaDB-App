import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vocadb_app/src/features/albums/presentation/album_detail_screen/album_detail_screen.dart';
import 'package:vocadb_app/src/features/albums/presentation/user_albums/user_albums_filter_screen.dart';
import 'package:vocadb_app/src/features/albums/presentation/user_albums/user_albums_screen.dart';
import 'package:vocadb_app/src/features/artists/presentation/artist_detail_screen/artist_detail_screen.dart';
import 'package:vocadb_app/src/features/artists/presentation/followed_artists/followed_artists_filter_screen.dart';
import 'package:vocadb_app/src/features/artists/presentation/followed_artists/followed_artists_screen.dart';
import 'package:vocadb_app/src/features/authentication/data/auth_repository.dart';
import 'package:vocadb_app/src/features/authentication/presentation/account/account_screen.dart';
import 'package:vocadb_app/src/features/authentication/presentation/sign_in/sign_in_screen.dart';
import 'package:vocadb_app/src/features/entries/presentation/entries_search_screen/entries_search_filter_screen.dart';
import 'package:vocadb_app/src/features/entries/presentation/entries_search_screen/entries_search_screen.dart';
import 'package:vocadb_app/src/features/home/presentation/main_screen/main_screen.dart';
import 'package:vocadb_app/src/features/home/presentation/menu_screen/contact_us_screen.dart';
import 'package:vocadb_app/src/features/settings/presentation/settings_screen/setting_screen.dart';
import 'package:vocadb_app/src/features/home/presentation/ranking_screen/ranking_filter_screen.dart';
import 'package:vocadb_app/src/features/pvs/presentation/playlist_screen/playlist_screen.dart';
import 'package:vocadb_app/src/features/releaseEvents/presentation/release_event_detail_screen/release_event_detail_screen.dart';
import 'package:vocadb_app/src/features/songs/data/constants/fake_songs_list.dart';
import 'package:vocadb_app/src/features/songs/domain/song.dart';
import 'package:vocadb_app/src/features/songs/presentation/rated_songs_screen/rated_songs_filter_screen.dart';
import 'package:vocadb_app/src/features/songs/presentation/rated_songs_screen/rated_songs_screen.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/song_detail_screen.dart';
import 'package:vocadb_app/src/features/tags/presentation/tag_detail_screen/tag_detail_screen.dart';
import 'package:vocadb_app/src/routing/go_router_refresh_stream.dart';

enum AppRoute {
  home,
  songDetail,
  account,
  signIn,
  albumDetail,
  artistDetail,
  tagDetail,
  releaseEventDetail,
  entriesSearch,
  entriesFilter,
  rankingFilter,
  settings,
  contactUs,
  userRatedSongs,
  userRatedSongFilter,
  userFollowedArtists,
  userFollowedArtistsFilter,
  userAlbums,
  userAlbumsFilter,
  playlist,
}

final goRouterProvider = Provider<GoRouter>(
  (ref) {
    final authRepository = ref.watch(authRepositoryProvider);

    return GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      redirect: (context, state) {
        final isLoggedIn = authRepository.currentUser != null;
        if (isLoggedIn) {
          if (state.location == '/Login') {
            return '/';
          }
        } else {
          if (state.location == '/Profile') {
            return '/';
          }
        }
        return null;
      },
      refreshListenable:
          GoRouterRefreshStream(authRepository.authStateChanges()),
      routes: [
        GoRoute(
          path: '/',
          name: AppRoute.home.name,
          builder: (context, state) => const MainScreen(),
          routes: [
            GoRoute(
              path: 'S/:id',
              name: AppRoute.songDetail.name,
              builder: (context, state) {
                final songId = state.params['id']!;
                return SongDetailScreen(song: Song(id: int.parse(songId)));
              },
            ),
            GoRoute(
              path: 'A/:id',
              name: AppRoute.albumDetail.name,
              builder: (context, state) {
                final albumId = state.params['id']!;
                return AlbumDetailScreen(albumId: albumId);
              },
            ),
            GoRoute(
              path: 'Ar/:id',
              name: AppRoute.artistDetail.name,
              builder: (context, state) {
                final artistId = state.params['id']!;
                return ArtistDetailScreen(artistId: artistId);
              },
            ),
            GoRoute(
              path: 'T/:id',
              name: AppRoute.tagDetail.name,
              builder: (context, state) {
                final tagId = state.params['id']!;
                return TagDetailScreen(tagId: tagId);
              },
            ),
            GoRoute(
              path: 'E/:id',
              name: AppRoute.releaseEventDetail.name,
              builder: (context, state) {
                final releaseEventId = state.params['id']!;
                return ReleaseEventDetailScreen(releaseEventId: releaseEventId);
              },
            ),
            GoRoute(
              path: 'MySongs',
              name: AppRoute.userRatedSongs.name,
              builder: (context, state) {
                return const RatedSongsScreen();
              },
              routes: [
                GoRoute(
                  path: 'filter',
                  name: AppRoute.userRatedSongFilter.name,
                  pageBuilder: (context, state) => MaterialPage(
                    key: state.pageKey,
                    fullscreenDialog: true,
                    child: const RatedSongsFilterScreen(),
                  ),
                ),
              ],
            ),
            GoRoute(
              path: 'MyFollowedArtists',
              name: AppRoute.userFollowedArtists.name,
              builder: (context, state) {
                return const FollowedArtistsScreen();
              },
              routes: [
                GoRoute(
                  path: 'filter',
                  name: AppRoute.userFollowedArtistsFilter.name,
                  pageBuilder: (context, state) => MaterialPage(
                    key: state.pageKey,
                    fullscreenDialog: true,
                    child: const FollowedArtistsFilterScreen(),
                  ),
                ),
              ],
            ),
            GoRoute(
              path: 'MyAlbums',
              name: AppRoute.userAlbums.name,
              builder: (context, state) {
                return const UserAlbumsScreen();
              },
              routes: [
                GoRoute(
                  path: 'filter',
                  name: AppRoute.userAlbumsFilter.name,
                  pageBuilder: (context, state) => MaterialPage(
                    key: state.pageKey,
                    fullscreenDialog: true,
                    child: const UserAlbumsFilterScreen(),
                  ),
                ),
              ],
            ),
            GoRoute(
              // TODO : might implement by accept and fetch by userId
              path: 'Profile',
              name: AppRoute.account.name,
              builder: (context, state) {
                return const AccountScreen();
              },
            ),
            GoRoute(
              path: 'Login',
              name: AppRoute.signIn.name,
              pageBuilder: (context, state) => MaterialPage(
                key: state.pageKey,
                fullscreenDialog: true,
                child: const SignInScreen(),
              ),
            ),
            GoRoute(
              path: 'Search',
              name: AppRoute.entriesSearch.name,
              pageBuilder: (context, state) => MaterialPage(
                key: state.pageKey,
                fullscreenDialog: true,
                child: const EntriesSearchScreen(),
              ),
              routes: [
                GoRoute(
                  path: 'filter',
                  name: AppRoute.entriesFilter.name,
                  pageBuilder: (context, state) => MaterialPage(
                    key: state.pageKey,
                    fullscreenDialog: true,
                    child: const EntriesSearchFilter(),
                  ),
                ),
              ],
            ),
            GoRoute(
              path: 'RankingFilters',
              name: AppRoute.rankingFilter.name,
              pageBuilder: (context, state) => MaterialPage(
                key: state.pageKey,
                fullscreenDialog: true,
                child: const RankingFilterScreen(),
              ),
            ),
            GoRoute(
              path: 'Playlist',
              name: AppRoute.playlist.name,
              pageBuilder: (context, state) => MaterialPage(
                key: state.pageKey,
                fullscreenDialog: true,
                child: const PlaylistScreen(
                  songs: kFakeSongsList,
                ),
              ),
            ),
            GoRoute(
              path: 'Settings',
              name: AppRoute.settings.name,
              pageBuilder: (context, state) => MaterialPage(
                key: state.pageKey,
                fullscreenDialog: true,
                child: const SettingScreen(),
              ),
            ),
            GoRoute(
              path: 'Contact us',
              name: AppRoute.contactUs.name,
              pageBuilder: (context, state) => MaterialPage(
                key: state.pageKey,
                fullscreenDialog: true,
                child: const ContactUsScreen(),
              ),
            ),
          ],
        ),
      ],
    );
  },
);
