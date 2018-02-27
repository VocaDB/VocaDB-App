import { createAction } from 'redux-act'

export const followArtist = createAction('Follow artist', artist => ({ artist }))
export const unFollowArtist = createAction('UnFollow artist', artist => ({ artist }))
