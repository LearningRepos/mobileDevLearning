import React from "react";
import { View, Text, FlatList, StyleSheet } from "react-native";
import ColorBox from "../components/ColorBox";

class ColorPalette extends React.Component {
  render() {
    const { route } = this.props;
    return (
      <View>
        <Text style={styles.textHeader}>{route.params.paletteName}</Text>
        <FlatList
          data={route.params.colors}
          keyExtractor={(items) => items.colorName}
          renderItem={({ item }) => (
            <ColorBox colorName={item.colorName} colorHex={item.hexCode} />
          )}
          initialNumToRender={16}
        />
      </View>
    );
  }
}

const styles = StyleSheet.create({
  textHeader: {
    fontWeight: "bold",
    fontSize: 20,
    textAlign: "center",
  },
});

export default ColorPalette;
