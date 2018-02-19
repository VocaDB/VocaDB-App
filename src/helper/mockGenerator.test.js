import * as mockGenerator from './mockGenerator'

describe('Test mock generator', () => {
    it('Should create song', () => {
        const song = mockGenerator.CreateSong({ defaultName: 'Melt'})
        expect(song).toBeTruthy()
        expect(song.id).toEqual(1032)
        expect(song.defaultName).toEqual('Melt')
    })

    it('Should create artist', () => {
        const artist = mockGenerator.CreateArtist({ defaultName: 'Hatsune Miku'})
        expect(artist).toBeTruthy()
        expect(artist.id).toEqual(1)
        expect(artist.defaultName).toEqual('Hatsune Miku')
    })

    it('Should create artists role (without artist)', () => {
        const artistRole = mockGenerator.CreateArtistRole({ roles: 'Other'})
        expect(artistRole).toBeTruthy()
        expect(artistRole.id).toEqual(917)
        expect(artistRole.roles).toEqual('Other')
    })

    it('Should create artists role (with artist)', () => {
        const artistRole = mockGenerator.CreateArtistRole()
        const artist = mockGenerator.CreateArtist()
        artistRole.artist = artist

        expect(artistRole).toBeTruthy()
        expect(artistRole.id).toEqual(917)
        expect(artistRole.roles).toEqual('Default')
        expect(artistRole.artist).toBeTruthy()
        expect(artistRole.artist.id).toEqual(1)
    })

    it('Should create album', () => {
        const album = mockGenerator.CreateAlbum({ defaultName: '999' })
        expect(album).toBeTruthy()
        expect(album.id).toEqual(1)
        expect(album.defaultName).toEqual('999')
    })

    it('Should create tag', () => {
        const tag = mockGenerator.CreateTag({ id: 1, name: 'English' })
        expect(tag).toBeTruthy()
        expect(tag.id).toEqual(1)
        expect(tag.name).toEqual('English')
    })

    it('Should create event', () => {
        const event = mockGenerator.CreateEvent()
        expect(event).toBeTruthy()
    })

    it('Should create web link', () => {
        const webLink = mockGenerator.CreateWebLink({ id: 1, category: 'Other' })
        expect(webLink).toBeTruthy()
        expect(webLink.id).toEqual(1)
        expect(webLink.category).toEqual('Other')
    })

    it('Should create PV', () => {
        const pv = mockGenerator.CreatePV({ id: 2, author: 'miku' })
        expect(pv).toBeTruthy()
        expect(pv.id).toEqual(2)
        expect(pv.author).toEqual('miku')
    })

    it('Should create song entry', () => {
        const songEntry = mockGenerator.CreateEntry('Song', { defaultName: 'Melt'})
        expect(songEntry).toBeTruthy()
        expect(songEntry.id).toEqual(1032)
        expect(songEntry.defaultName).toEqual('Melt')
    })

    it('Should create artist entry', () => {
        const artistEntry = mockGenerator.CreateEntry('Artist', { defaultName: 'Hatsune Miku'})
        expect(artistEntry).toBeTruthy()
        expect(artistEntry.id).toEqual(1)
        expect(artistEntry.defaultName).toEqual('Hatsune Miku')
    })
})