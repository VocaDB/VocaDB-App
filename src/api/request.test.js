import request from './request'

describe('Request test', () => {
    it('Should create request success', () => {
        let r = request('/songs', null, { a: 'abc' })
        expect(typeof r).toEqual('object')
    })
})