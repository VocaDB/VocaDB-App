const images = {
    logo: require('./img/logo.png'),
    getArtistUri: id => 'http://vocadb.net/Artist/Picture/' + id,
    getAlbumUri: id => 'http://vocadb.net/Album/CoverPicture/' + id
};

export default images;