<template>
    <div class="max-w-sm m-auto my-8">
    <div id="popup">
    <div class="max-w-sm m-auto my-8">
        <div class="border p-18 border-grey-light shadow rounder"
        style="background-color:pink; margin-top:50%; margin-left:50%; height:400px; width:400px">
            <button v-on:click="modale" id="closeButton">X</button>
            <h3 class="text-2xt mb-6 text-grey-darkest">Set indicators</h3>
              <div v-for="item in indics" :key="item.id">
                    {{ item.name }}  <button @click="setActive(item.id)" :value="`${item.active}`" :id="`${item.id}`">{{item.active}}</button>
              </div><br><br>
               <form @submit.prevent="addIndicator">
              <div class="mb-6">
                 <label for="newIndic" class="label">Add new : </label>
                 <input type="text" v-model="newIndic" id="newIndic">
               </div>
                <button type="submit" class="justify-center"> Add</button>
                </form>
        </div><br><br>
    </div>
    </div>
        <div class="border p-18 border-grey-light shadow rounder">
            <h3 class="text-2xt mb-6 text-grey-darkest">All collects</h3>
            <button v-on:click="modale" value="false" id="modaleButton">Set indicators</button>
            <br><br>
              <div v-for="item in items" :key="item.id">
                  <div v-for="value in item" :key="`${item.id}`+`${value}`" :id="`${item.id}`+`${value}`">
                    {{ value }}
                  </div>
                <br>
              </div>
        </div><br><br>
        <a href="/">Acceuil</a><br>
        <a href="/AddCollect">Add a new collect</a><br>
    </div>
</template>

<script>
export default {
  name: 'SeeCollects',
  data () {
    return {
      items: [],
      indics: [],
      newIndic: '',
      error: ''
    }
  },
  mounted () {
    this.loadData()
    this.loadData2()
  },
  methods: {
    loadData2: async function () {
      await this.$axios.get('http://localhost:3000/indicators')
        .then(res => {
          this.indics = res.data
        })
    },
    setActive (id) {
      var el = document.getElementById(id)
      if (el.value === 'false') {
        this.$axios.put(`http://localhost:3000/indicators/${id}`, {
          active: true
        }).catch((error) => { console.log(error) })
        el.value = 'true'
        el.innerHTML = 'true'
      } else {
        this.$axios.put(`http://localhost:3000/indicators/${id}`, {
          active: false
        }).catch((error) => { console.log(error) })
        el.value = 'false'
        el.innerHTML = 'false'
      }
    },
    addIndicator () {
      this.$axios.post('http://localhost:3000/indicators',
        {
          name: this.newIndic
        },
        {
          headers: {
            'Access-Control-Allow-Origin': '*'
          }
        }).catch(error => {
        if (!error.response) {
          this.errorStatus = 'Error: Network Error'
        } else {
          this.errorStatus = error.response.data.message
        }
      })
      let poup = document.getElementById('popup')
      let m = document.getElementById('modaleButton')
      m.value = 'false'
      poup.style.display = 'none'
    },
    loadData: async function () {
      await this.$axios.get('http://localhost:3000/collects')
        .then(res => {
          for (let i of res.data) {
            let obj = JSON.parse(i.other)
            for (let j in obj) {
              i[j] = j + ' :  ' + obj[j]
            }
            delete i.updated_at
            delete i.created_at
            delete i.other
          }
          this.items = res.data
          console.log(this.items)
        })
    },
    modale () {
      let m = document.getElementById('modaleButton')
      let poup = document.getElementById('popup')
      if (m.value === 'false') {
        m.value = 'true'
        poup.style.display = 'flex'
      } else {
        m.value = 'false'
        poup.style.display = 'none'
      }
    }
  }

}
</script>

<style>
#popup {
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
