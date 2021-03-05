import React from "react";
import { View } from "react-native";

class PreviewColorBox extends React.Component {
  render() {
    return (
      <View
        style={{
          height: 50,
          width: 50,
          backgroundColor: this.props.color,
          marginHorizontal: 7,
          marginVertical: 10,
        }}
      />
    );
  }
}

export default PreviewColorBox;
