import { StatusBar } from 'expo-status-bar';
import { StyleSheet, Text, View, Image, TextInput, TouchableOpacity, onPress } from 'react-native';
import React, { useEffect, useState } from 'react'; 
import { ActivityIndicator } from 'react-native-web';
let [isloading, setIsLoading] = useState(true); 
let [error, setError] = useState();
let [response, setResponse] = useState();

useEffect (() => {
  fetch("localhost:3000/rutinas")
  .then(res => res.json)
  .then((result) => {
    setIsLoading(false);
    setResponse(result);
  }, (error => {
    setIsLoading(false);
    setError(error);
  })
  )
}, []);
useEffect (() => {
  fetch("localhost:3000/usuarios")
  .then(res => res.json)
  .then((result) => {
    setIsLoading(false);
    setResponse(result);
  }, (error => {
    setIsLoading(false);
    setError(error);
  })
  )
}, []);
const getUsuario = () => {
  if (isloading){
  return <ActivityIndicator size="large"/>
  }
  if (error){
    return <Text>(error)</Text>
  }
  console.log(response)
  return <View style={{
    alignSelf:'center',
    backgroundColor: '#DA4343',
    height:250,
    width:320,
    alignItems: 'center'
  }}
  >
    <Image source={require(response["url"])} style={{width: 200, height:100}}/>
    <Text style={{color:"#ffffff", size:"24"}}>{response["NombreEjercicio"]}</Text>
    <Text style={{color:"#ffffff", size:"15"}}>{response["Descripcion"]}</Text>
    <Text style={{color:"#ffffff", size:"10"}}>{response["Upvotes"]}</Text>
    <Image source={require('./assets/App/Upvote.png')} style={{height:20, width:20}}/>
    <Image source={require('./assets/App/Downvote.png')} style={{height:20, width:20}}/>
    <Image source={require('./assets/App/DefaultProfile.png')} style={{height:50, width:50}}/>
    <Text style={{color:"#ffffff", size:"15"}}>{response["usuario"]}</Text>
  </View>
}

export default function App() {
  const [current, setCurrent] = useState('Inicio');

  const InicioPag = (
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
      <Image source={require('./assets/App/logo.jpg')} style={styles.logo}/>
      
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
      <TouchableOpacity
        style={styles.button1}
        onPress={() => setCurrent(HomePag)}
      > 
        <Text style={{
            fontSize:16,
            color:"white",
            top:"25%"
          }}>Iniciar Sesion</Text>
      </TouchableOpacity>
      <TouchableOpacity
        style={styles.button2}
        onPress={onPress}
      >
        <Text style={{
            fontSize:16,
            color:"white",
            top:"25%"
          }}>Registrarse</Text>
      </TouchableOpacity>
      <StatusBar style="auto" />
    </View>
  );

  const HomePag = (
    <View styles="container">
      <View 
        style={{
          backgroundColor: "white",
          width: 350,
          height: "100%",
          flex:1,
          position: 'absolute'
      }}>
        {getUsuario()}
        <View style="barradebusqueda">
          <Image source={require('./assets/App/IconoHome.png')} style={styles.iconobarra}/>
          <Image source={require('./assets/App/IconoBuscar.png')} style={styles.iconobarra}/>
          <Image source={require('./assets/App/IconoCrear.png')} style={styles.iconobarra}/>
          <Image source={require('./assets/App/IconoUsuario.png')} style={styles.iconobarra}/>
          <Image source={require('./assets/App/IconoNotificacion.png')} style={styles.iconobarra}/>
        </View>
      </View>
    </View>
   )
       return current === 'Inicio' ? InicioPag : current;

  }

//Styles

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
  barradebusqueda:{
    backgroundColor: '#CFCFCF',
    height: 20,
    width:'100%',
    alignSelf: 'flex-end',
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
 iconobarra: {
  alignSelf: 'center',
  height:20,
  width:20,
  position:'relative'
 },
 button1: {
  alignItems: "center",
  backgroundColor: "#43B6DA",
  position:'absolute',
  height: 50,
  width: 300,
  top:750,
  alignSelf: 'center',
},
button2: {
  alignItems: "center",
  backgroundColor: "#43B6DA",
  position:'absolute',
  height: 50,
  width: 300,
  top: 670,
  alignSelf: 'center',
},
});