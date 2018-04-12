import { fetchTagDetail, fetchTopSongsByTag, fetchTopArtistsByTag, fetchTopAlbumsByTag, searchTags } from './../tagSagas'
import api from './../tagApi'
import { call, put, all, select } from 'redux-saga/effects'
import * as actions from './../tagActions'
import * as appActions from './../../../app/appActions'
import * as mock from '../../../common/helper/mockGenerator'
import { selectTagDetailId } from './../../tag/tagSelector'

describe('Test tag sagas', () => {
    it('Should fetch tag detail success', () => {
        const action = actions.fetchTagDetail(1)
        const gen = fetchTagDetail(action)

        expect(JSON.stringify(gen.next(1).value)).toEqual(JSON.stringify(select(selectTagDetailId())))

        expect(gen.next(1).value).toEqual(all([
            call(api.getTag, 1),
            call(api.getTopSongsByTag, 1),
            call(api.getTopArtistsByTag, 1),
            call(api.getTopAlbumsByTag, 1)
        ]));

        const mockTagItem = mock.CreateTag()
        expect(gen.next([mockTagItem]).value).toEqual(put(actions.fetchTagDetailSuccess(mockTagItem)));

        expect(gen.next().done).toBeTruthy();
    })

    it('Should fetch top songs by tag', () => {
        const action = actions.fetchTopSongsByTag(1)
        const gen = fetchTopSongsByTag(action)

        expect(gen.next().value).toEqual(call(api.getTopSongsByTag, 1));

        const song1 = mock.CreateSong({ id: 1 })
        const song2 = mock.CreateSong({ id: 1 })
        const mockResponse = { items: [ song1, song2 ] }
        expect(gen.next(mockResponse).value).toEqual(put(actions.fetchTopSongsByTagSuccess(mockResponse.items)));

        expect(gen.next().done).toBeTruthy();
    })

    it('Should fetch top artists by tag', () => {
        const action = actions.fetchTopArtistsByTag(1)
        const gen = fetchTopArtistsByTag(action)

        expect(gen.next().value).toEqual(call(api.getTopArtistsByTag, 1));

        const artist1 = mock.CreateArtist({ id: 1 })
        const artist2 = mock.CreateArtist({ id: 1 })
        const mockResponse = { items: [ artist1, artist2 ] }
        expect(gen.next(mockResponse).value).toEqual(put(actions.fetchTopArtistsByTagSuccess(mockResponse.items)));

        expect(gen.next().done).toBeTruthy();
    })

    it('Should fetch top albums by tag', () => {
        const action = actions.fetchTopAlbumsByTag(1)
        const gen = fetchTopAlbumsByTag(action)

        expect(gen.next().value).toEqual(call(api.getTopAlbumsByTag, 1));

        const album1 = mock.CreateAlbum({ id: 1 })
        const album2 = mock.CreateAlbum({ id: 1 })
        const mockResponse = { items: [ album1, album2 ] }
        expect(gen.next(mockResponse).value).toEqual(put(actions.fetchTopAlbumsByTagSuccess(mockResponse.items)));

        expect(gen.next().done).toBeTruthy();
    })

    it('Should search tags', () => {
        const params = { query: 'abc' }
        const action = actions.searchTags(params)
        const gen = searchTags(action)


        expect(gen.next().value).toEqual(call(api.find, params));

        const tag1 = mock.CreateTag({ id: 1 })
        const tag2 = mock.CreateTag({ id: 1 })
        const mockResponse = { items: [ tag1, tag2 ] }
        expect(gen.next(mockResponse).value).toEqual(put(actions.addTagsSearchResult(mockResponse.items)));

        expect(gen.next().done).toBeTruthy();
    })
})