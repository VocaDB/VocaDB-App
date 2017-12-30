import SampleSongList from './../../sample/songList'
import SampleAlbumList from './../../sample/albums'
import SampleEventList from './../../sample/events'

const api = {
    songs: {
        // list: () => fetch('https://vocadb.net/api/songs?sort=AdditionDate').then(response => response.json())
        list: () => new Promise((resolve, reject) => {
                setTimeout(() => resolve(SampleSongList), 3000)
        })
    },
    albums: {
        list: () => new Promise((resolve, reject)=> {
            resolve(SampleAlbumList)
        })
    },
    events: {
        list: () => new Promise((resolve, reject)=> {
            resolve(SampleEventList)
        })
    }
}
export default api
