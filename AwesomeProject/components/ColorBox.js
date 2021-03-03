import React from "react";
import { View, Text, StyleSheet } from "react-native";

const styles = StyleSheet.create({
  container: {
    alignItems: "center",
    justifyContent: "center",
    height: 50,
    marginVertical: 10,
    marginHorizontal: 30,
  },
});

class ColorBox extends React.Component {
  render() {
    const boxColor = { backgroundColor: this.props.colorHex };
    const colorText = {
      color:
        parseInt(this.props.colorHex.replace("#", ""), 16) > 0xffffff / 1.1
          ? "black"
          : "white",
    };
    return (
      <View style={[styles.container, boxColor]}>
        <Text style={colorText}>
          {this.props.colorName}: {this.props.colorHex}
        </Text>
      </View>
    );
  }
}

export default ColorBox;
