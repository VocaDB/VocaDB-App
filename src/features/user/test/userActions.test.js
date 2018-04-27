import { fetchAlbums, updateAlbums } from "../userActions";
import * as mock from './../../../common/helper/mockGenerator'

describe('Test song action', () => {

    it('should return action fetch collection', () => {

        const album1 = mock.CreateAlbum({ id: 1 })
        const album2 = mock.CreateAlbum({ id: 2 })

        const mockResponse = [
            {
                album: album1,
                mediaType: "DigitalDownload",
                purchaseStatus: "Wishlisted",
                rating: 5
            },
            {
                album: album2,
                mediaType: "PhysicalDisc",
                purchaseStatus: "Owned",
                rating: 5
            }
        ];

        const expectedResult = {
            entities: {
                albums: {
                    '1': album1,
                    '2': album2
                }
            },
            result: [
                {
                    album: 1,
                    mediaType: "DigitalDownload",
                    purchaseStatus: "Wishlisted",
                    rating: 5
                },
                {
                    album: 2,
                    mediaType: "PhysicalDisc",
                    purchaseStatus: "Owned",
                    rating: 5
                }
            ]
        }

        const actualResult = updateAlbums(mockResponse);

        expect(actualResult).toBeTruthy()
        expect(actualResult.payload).toEqual(expectedResult)
    })
})