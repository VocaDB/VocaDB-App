import React from 'react'
import { Text, View, ActivityIndicator, Image } from 'react-native'
import Content from '../../../components/Content/index'
import ScrollableTabView from 'react-native-scrollable-tab-view'
import { SongRowList } from './../../song/songHOC'
import { ArtistRowList } from './../../artist/artistHOC'
import AlbumGridView from './../../album/AlbumGridView'
import ArtistList from './../../artist/ArtistList'
import WebLinkList from '../../webLink/WebLinkList'
import Theme from '../../../theme'
import Tag from './../Tag'
import { Button } from 'react-native-material-ui'


class TagDetail extends React.Component {

    state = {
        shouldRender: false
    }

    componentDidMount () {
        const { params } = this.props.navigation.state
        if(params) {
            const tagId = params.id
            this.props.fetchTag(tagId)
        }

        setTimeout(() => { this.setState({ shouldRender: true }) }, 0)
    }

    render () {

        const { tag, topSongs, topArtists, topAlbums } = this.props;

        if(!this.state.shouldRender) {
            return (<View></View>)
        }

        if(!topSongs.length && !topArtists.length && !topAlbums.length) {
            return (
                <View style={{ flex: 1 }}>
                    <ActivityIndicator size="large" color="#0000ff" />
                </View>
            )
        }

        const RenderOrNull = props => {
            if(props.shouldRender) {
                return (
                    <View style={{ padding: 8 }}>
                        {props.children}
                    </View>
                )
            }

            return null;
        }

        const SectionHeader = props => (<Text style={[Theme.subhead, { marginVertical: 8 }]}>{props.text}</Text>)

        const parentTag = tag.parent;
        const urlThumb = (tag && tag.mainPicture && tag.mainPicture.urlSmallThumb) ? tag.mainPicture.urlSmallThumb : null;

        const About = () => (
            <Content>
                <RenderOrNull shouldRender={urlThumb}>
                    <View style={{ height: 120, justifyContent: 'center' }}>
                        <Image
                            style={{ flex: 1, margin: 24 }}
                            source={{ uri: urlThumb }}
                            resizeMode='contain'
                        />
                    </View>
                </RenderOrNull>
                <RenderOrNull shouldRender={(tag && tag.description)}>
                    <SectionHeader text='Description' />
                    <Text style={Theme.body} selectable>{tag.description}</Text>
                </RenderOrNull>
                <RenderOrNull shouldRender={(tag && tag.categoryName)}>
                    <SectionHeader text='Category' />
                    <Text style={Theme.body} selectable>{tag.categoryName}</Text>
                </RenderOrNull>
                <RenderOrNull shouldRender={parentTag}>
                    <SectionHeader text='Parent' />
                    <View style={{ flexDirection: 'row', flexWrap: 'wrap', alignItems: 'flex-start' }}>
                        {parentTag && <Tag
                            key={parentTag.id}
                            name={parentTag.name}
                            style={{ margin: 4 }}
                            onPress={() => this.props.onPressTag(parentTag)}/>}
                    </View>
                </RenderOrNull>
                <RenderOrNull shouldRender={(tag && tag.relatedTags && tag.relatedTags.length)}>
                    <SectionHeader text='Related tags' />
                    <View style={{ flexDirection: 'row', flexWrap: 'wrap', alignItems: 'flex-start' }}>
                        { tag.relatedTags.map(t => {
                            return <Tag
                                key={t.id}
                                name={t.name}
                                style={{ margin: 4 }}
                                onPress={() => this.props.onPressTag(t)}/>
                        })}
                    </View>
                </RenderOrNull>
                <RenderOrNull shouldRender={(tag && tag.webLinks && tag.webLinks.length)}>
                    <SectionHeader text='Related links' />
                    <WebLinkList webLinks={tag.webLinks} />
                </RenderOrNull>
                <RenderOrNull shouldRender={(tag && tag.createDate)}>
                    <SectionHeader text='Addition date' />
                    <Text style={Theme.body} selectable>{tag.createDate}</Text>
                </RenderOrNull>
                <Button onPress={() => this.props.onPressToVocaDB(tag)} primary text="View more on VocaDB site" />
                <View style={{ height: 18 }} />
            </Content>
        )

        const renderTopSongs = () => {
            if(topSongs && topSongs.length) {
                return (<SongRowList tabLabel='Top songs' data={topSongs} onPressItem={this.props.onPressSong} />)
            }

            return null;
        }

        const renderTopArtists = () => {
            if(topArtists && topArtists.length) {
                return (<ArtistRowList tabLabel='Top artists' data={topArtists} onPressItem={this.props.onPressArtist}  />)
            }

            return null;
        }

        const renderTopAlbums = () => {
            if(topAlbums && topAlbums.length) {
                return (<AlbumGridView tabLabel='Top albums' albums={this.props.topAlbums} onPressItem={this.props.onPressAlbum} />)
            }

            return null;
        }

        return (
            <ScrollableTabView>
                {renderTopSongs()}
                {renderTopArtists()}
                {renderTopAlbums()}
                <About tabLabel='About' />
            </ScrollableTabView>
        )
    }
}

export default TagDetail