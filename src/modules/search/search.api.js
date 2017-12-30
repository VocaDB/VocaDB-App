import SampleEntries from './../../sample/entries'

const api = {
    entry: {
        list: () => new Promise((resolve, reject)=> {
            setTimeout(() => resolve(SampleEntries), 1000)
        })
    }
}
export default api
