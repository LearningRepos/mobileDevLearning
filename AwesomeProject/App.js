import React from "react";
import {
  SafeAreaView,
  Text,
  StyleSheet,
  Platform,
  FlatList,
} from "react-native";
import ColorBox from "./components/ColorBox";

const COLORS = [
  { colorName: "Base03", hexCode: "#002b36" },
  { colorName: "Base02", hexCode: "#073642" },
  { colorName: "Base01", hexCode: "#586e75" },
  { colorName: "Base00", hexCode: "#657b83" },
  { colorName: "Base0", hexCode: "#839496" },
  { colorName: "Base1", hexCode: "#93a1a1" },
  { colorName: "Base2", hexCode: "#eee8d5" },
  { colorName: "Base3", hexCode: "#fdf6e3" },
  { colorName: "Yellow", hexCode: "#b58900" },
  { colorName: "Orange", hexCode: "#cb4b16" },
  { colorName: "Red", hexCode: "#dc322f" },
  { colorName: "Magenta", hexCode: "#d33682" },
  { colorName: "Violet", hexCode: "#6c71c4" },
  { colorName: "Blue", hexCode: "#268bd2" },
  { colorName: "Cyan", hexCode: "#2aa198" },
  { colorName: "Green", hexCode: "#859900" },
];

const styles = StyleSheet.create({
  droidSafeArea: {
    flex: 1,
    backgroundColor: "white",
    paddingTop: Platform.OS === "android" ? 30 : 0,
  },
  textHeader: {
    paddingTop: 25,
    fontWeight: "bold",
    fontSize: 20,
    textAlign: "center",
  },
});

class App extends React.Component {
  render() {
    return (
      <SafeAreaView style={styles.droidSafeArea}>
        <Text style={styles.textHeader}>Solarized</Text>
        <FlatList
          data={COLORS}
          keyExtractor={(items) => items.colorName}
          renderItem={({ item }) => (
            <ColorBox colorName={item.colorName} colorHex={item.hexCode} />
          )}
        />
      </SafeAreaView>
    );
  }
}

export default App;
