const images = {
    logo: require('./img/logo.png'),
    unknownSong: require('./img/unknow_song.png'),
    unknownAlbum: require('./img/unknow_album.png'),
    unknownArtist: require('./img/unknow_artist.png'),
    placeholderUri: 'https://via.placeholder.com/90x90?text=NO_IMAGE',
    iconYoutube: require('./img/icon_youtube.png'),
    iconSoundcloud: require('./img/icon_soundcloud.png'),
    iconNicoNicoDouga: require('./img/icon_niconicodouga.jpg'),
    getArtistUri: id => 'https://vocadb.net/Artist/Picture/' + id,
    getAlbumUri: id => `https://static.vocadb.net/img/album/mainSmall/${id}.jpg`
};

export default images;