import config from './../../constants/config'

export const prependEntries = (recentList, newEntry) => {
    if(!recentList) {
        recentList = [newEntry]
    } else {
        let duplicated = recentList.find(recent => recent.id === newEntry.id)
        if(duplicated) {
            return recentList
        }

        recentList.unshift(newEntry)
        if(recentList.length > config.maxRecentSearch) {
            recentList.pop()
        }
    }

    return recentList
}