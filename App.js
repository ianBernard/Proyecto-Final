import { StatusBar } from 'expo-status-bar';
import { StyleSheet, Text, View, Image, TextInput, TouchableHighlight } from 'react-native';

export default function App() {
  return (
    <View style={styles.container}>
      <View 
        style={{
          backgroundColor: "white",
          width: 350,
          height: "100%",
          flex:1,
          position: 'absolute'
      }}
      />
      <View
        style={{
          backgroundColor:"#DA4343",
          width:350,
          height:300,
          position:'absolute'
        }}
      />
      
            <Text style={styles.titulo}>SlimFit</Text>
      <Image source={require('./assets/logo.jpg')} style={styles.logo}/>
      
      <TextInput
        style={{
          top:400,
          width:300,
          alignSelf:"center",
          textAlign:"center",
          position:'absolute',
          borderWidth: 3,
          height:50,
          fontWeight:"bold",
          borderColor: '#DA4343'
         }}
        placeholder="Username"
        placeholderTextColor="#DA4343"
        keyboardType="default"
      />
      <TextInput
        secureTextEntry={true}
        style={{
          top:500,
          width:300,
          textAlign:"center",
          position:'absolute',
          borderWidth: 3,
          height:50,
          fontWeight:"bold",
          borderColor:"#DA4343"
         }}
        placeholder="Password"
        placeholderTextColor="#DA4343"
        keyboardType="default"
      />
      <TouchableHighlight>
        <View style={{
            alignItems:"center",
            backgroundColor:"#43B6DA",
            top: 750,
            height: 50,
            alignSelf:"center",
            position:'absolute',
            width: 300,
        }}>
          <Text style={{
            fontSize:16,
            color:"white",
            top:"25%"
          }}>Iniciar Sesion</Text>
        </View>
      </TouchableHighlight>
      <TouchableHighlight>
        <View style={{
            alignItems:"center",
            backgroundColor:"#43B6DA",
            top: 670,
            position:'absolute',
            alignSelf:"center",
            height: 50,
            width: 300
        }}>
          <Text style={{
            fontSize:16,
            color:"white",
            top:"25%"
          }}>Registrarse</Text>
        </View>
      </TouchableHighlight>
      <StatusBar style="auto" />
    </View>
    
  );
}


const styles = StyleSheet.create({
  titulo: {
    position:'absolute',
    top:245,
    alignSelf:"center",
    color:"white",
    fontWeight:"bold",
    fontSize:40
  },
  container: {
    flex: 1,
    backgroundColor: '#c4c4c4',
    alignItems: 'center',
  },
  logo: {
    flex: 1,
    width: 220,
    height: 220,
    position:'absolute',
    top:30,
    left:70,
    resizeMode: 'contain'
 },
});
