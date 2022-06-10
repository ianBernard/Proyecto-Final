import { StatusBar } from 'expo-status-bar';
import { StyleSheet, Image, View } from 'react-native';

export default function App() {
  const DisplayAnImage = () => {
      return (
          <Image
            style={styles.tinyLogo}
            source={require('C:\Users\46364249\Desktop\MAMASA\SlimFit\Images\logo.jpg')}
          />
      );
    }
  return (
    <View style={styles.container}>
      <navbar>
      export default DisplayAnImage;
      <h1>SlimFit</h1>
      </navbar>
      <StatusBar style="auto" />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#C4C4C4',
    alignItems: 'center',
    justifyContent: 'center',
  },
});
