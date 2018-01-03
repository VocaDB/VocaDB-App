import config from './../../constants/config'

export const prependEntries = (recentList, newEntry) => {
    if(!recentList) {
        recentList = [newEntry]
    } else {
        recentList.unshift(newEntry)
        if(recentList.length > config.maxRecentSearch) {
            recentList.pop()
        }
    }

    return recentList
}