import React from "react";
import { View, FlatList, Text, TouchableOpacity } from "react-native";
import ColorPreview from "../components/ColorPreview";
import axios from "axios";

class Home extends React.Component {
  constructor(props) {
    super(props);
    this.state = { palettes: [], refreshing: false };
    this.addPalette = this.addPalette.bind(this);
  }
  componentDidMount() {
    axios
      .get("https://color-palette-api.kadikraman.now.sh/palettes")
      .then(({ data }) => this.setState({ palettes: data }));
  }
  addPalette(newColorArray, paletteName) {
    let oldColorArray = newColorArray;
    let rawColorArray = oldColorArray.filter(
      (color, index) => color["selected"] === true
    );
    this.setState({
      palettes: [
        ...this.state.palettes,
        { colors: rawColorArray, paletteName: paletteName },
      ],
    });
  }
  render() {
    const { navigation } = this.props;
    return (
      <View>
        <FlatList
          data={this.state.palettes}
          keyExtractor={(item) => item.paletteName}
          renderItem={({ item }) => {
            return (
              <ColorPreview
                colors={item.colors}
                colorHeader={item.paletteName}
                navigation={navigation}
              />
            );
          }}
          ListHeaderComponent={
            <TouchableOpacity
              onPress={() =>
                navigation.navigate("Add New Palette", this.addPalette)
              }
            >
              <Text
                style={{
                  fontWeight: "bold",
                  fontSize: 20,
                  marginHorizontal: 10,
                  color: "teal",
                  marginTop: 10,
                }}
              >
                Add a color scheme
              </Text>
            </TouchableOpacity>
          }
        />
      </View>
    );
  }
}

export default Home;
