const getExtensionFromMime = mime => {
    switch (mime) {
        case 'image/jpeg':
        case 'image/pjpeg':
            return '.jpg';
        case "image/png":
            return ".png";
        case 'image/gif':
            return ".gif";
        case "image/bmp":
            return ".bmp";
        case "image/x-ms-bmp":
            return ".bmp";
        case "audio/mp3":
        case "audio/mpeg":
            return ".mp3";
        default:
            return '';
    }
}


const images = {
    logo: require('./img/logo.png'),
    unknownSong: require('./img/unknow_song.png'),
    unknownAlbum: require('./img/unknow_album.png'),
    unknownArtist: require('./img/unknow_artist.png'),
    placeholderUri: 'https://via.placeholder.com/90x90?text=NO_IMAGE',
    iconYoutube: require('./img/icon_youtube.png'),
    iconSoundcloud: require('./img/icon_soundcloud.png'),
    iconNicoNicoDouga: require('./img/icon_niconicodouga.jpg'),
    getArtistUri: (id, mime) => `https://static.vocadb.net/img/artist/mainSmall/${id}${getExtensionFromMime(mime)}`,
    getAlbumUri: (id, mime) => `https://static.vocadb.net/img/album/mainSmall/${id}${getExtensionFromMime(mime)}`
};

export default images;