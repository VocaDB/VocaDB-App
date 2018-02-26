// Site or service name
const sites = [
    { match: /youtube/gi, source: require('./img/icon_youtube.png') },
    { match: /(NND|Nico)/gi, source: require('./img/icon_niconicodouga.jpg') },
    { match: /(soundcloud)/gi, source: require('./img/icon_soundcloud.png') },
]

export default {
    find: name => {
        let matchedSource = sites.find(site => new RegExp(site.match).test(name))
        return (matchedSource)? matchedSource.source : undefined
    }
}