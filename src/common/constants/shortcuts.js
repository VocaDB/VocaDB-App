export const shortcutTypes = {
    Songs: 'Songs',
    Albums: 'Albums',
    Artists: 'Artists'
}

export const shortcutItems = [
    {
        type: shortcutTypes.Songs,
        title: "Find songs",
        subtitle: "Find songs",
        icon: "song",
        userInfo: {
            url: "vocadb://songs"
        }
    },
    {
        type: shortcutTypes.Artists,
        title: "Find artists",
        subtitle: "Find artists",
        icon: "artist",
        userInfo: {
            url: "vocadb://artists"
        }
    },
    {
        type: shortcutTypes.Albums,
        title: "Find albums",
        subtitle: "Find albums",
        icon: "album",
        userInfo: {
            url: "vocadb://albums"
        }
    }
];