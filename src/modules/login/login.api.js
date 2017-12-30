const api = {
    auth: {
        login: () => new Promise((resolve, reject)=> {

            let mockResponse = {
                id: 1065
            }
            setTimeout(() => resolve(mockResponse), 1000)
        })
    }
}
export default api
