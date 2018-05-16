// Site or service name
const sites = [
    { match: /youtube/gi, source: require('./img/icon_youtube.png') },
    { match: /(NND|Nico)/gi, source: require('./img/icon_niconicodouga.jpg') },
    { match: /(soundcloud)/gi, source: require('./img/icon_soundcloud.png') },
    { match: /(piapro)/gi, source: require('./img/icon_piapro.png') },
    { match: /(vimeo)/gi, source: require('./img/icon_vimeo.png') },
    { match: /(facebook)/gi, source: require('./img/icon_facebook.png') },
    { match: /(twitter)/gi, source: require('./img/icon_twitter.png') },
    { match: /(bilibili)/gi, source: require('./img/icon_bilibili.png') },
    { match: /(spotify)/gi, source: require('./img/icon_spotify.png') },
    { match: /(wikipedia)/gi, source: require('./img/icon_wikipedia.png') },
    { match: /(bandcamp)/gi, source: require('./img/icon_bandcamp.png') },
]

export default {
    find: name => {
        let matchedSource = sites.find(site => new RegExp(site.match).test(name))
        return (matchedSource)? matchedSource.source : undefined
    }
}