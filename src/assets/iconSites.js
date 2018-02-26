// Site or service name
const sites = [
    { match: 'Youtube', source: require('./img/icon_youtube.png') },
    { match: /(NND|Nico)/g, source: require('./img/icon_niconicodouga.jpg') },
    { match: /(SoundCloud)/g, source: require('./img/icon_soundcloud.png') },
]

export default {
    find: name => {
        let matchedSource = sites.find(site => new RegExp(site.match).test(name))
        return (matchedSource)? matchedSource.source : undefined
    }
}