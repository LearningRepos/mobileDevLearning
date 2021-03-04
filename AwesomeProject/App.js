import React from "react";
import "react-native-gesture-handler";
import { NavigationContainer } from "@react-navigation/native";
import { createStackNavigator } from "@react-navigation/stack";

import Home from "./screens/Home";
import ColorPalette from "./screens/ColorPalette";
import ColorPaletteModal from "./screens/ColorPaletteModal";

class App extends React.Component {
  render() {
    const RootStack = createStackNavigator();
    const MainStack = createStackNavigator();

    const MainStackScreen = () => {
      return (
        <MainStack.Navigator>
          <MainStack.Screen name="Home" component={Home} />
          <MainStack.Screen
            name="ColorPalette"
            component={ColorPalette}
            options={({ route }) => ({ title: route.params.paletteName })}
          />
        </MainStack.Navigator>
      );
    };

    return (
      <NavigationContainer>
        <RootStack.Navigator mode="modal">
          <RootStack.Screen
            name="Main"
            component={MainStackScreen}
            options={{ headerShown: false }}
          />
          <RootStack.Screen
            name="Add New Palette"
            component={ColorPaletteModal}
          />
        </RootStack.Navigator>
      </NavigationContainer>
    );
  }
}

export default App;
