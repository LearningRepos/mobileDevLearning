import React from "react";
import { View, Text, TouchableOpacity, StyleSheet } from "react-native";
import { FlatList } from "react-native-gesture-handler";

import PreviewColorBox from "../components/PreviewColorBox";

class ColorPreview extends React.Component {
  handlePress() {}
  render() {
    const { colors, colorHeader, navigation } = this.props;
    return (
      <View>
        <TouchableOpacity
          onPress={() =>
            navigation.navigate("ColorPalette", {
              paletteName: colorHeader,
              colors: colors,
            })
          }
        >
          <Text style={styles.header}>{colorHeader}</Text>
          <View style={{ flexDirection: "row" }}>
            <FlatList
              data={colors.slice(0, 5)}
              renderItem={({ item }) => {
                return <PreviewColorBox color={item.hexCode} />;
              }}
              keyExtractor={(item) => item.colorName}
              numColumns={5}
            />
          </View>
        </TouchableOpacity>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  header: {
    fontWeight: "bold",
    fontSize: 20,
    marginHorizontal: 10,
    marginVertical: 5,
  },
});

export default ColorPreview;
