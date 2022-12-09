<template>
  <div id="app">
    <router-view/>
    
  </div>
</template>

<script>
export default {
  name: 'App'
}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
#popop {
  position:fixed;
  top:0;
  bottom:0;
  left:0;
  right:0;
  background-color:rgb(33,33,33,0.5);
  z-index:100000;
  display:none;
}
</style>
