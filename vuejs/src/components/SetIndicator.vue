<template>
    <div class="max-w-sm m-auto my-8">
        <div class="border p-18 border-grey-light shadow rounder">
            <h3 class="text-2xt mb-6 text-grey-darkest">Set indicators</h3>
              <div v-for="item in indics" :key="item.id">
                    {{ item.name }}  <button @click="setActive(item.id)" :value="`${item.active}`" :id="`${item.id}`">{{item.active}}</button>
              </div><br><br>
               <form @submit.prevent="addIndicator">
              <div class="mb-6">
                 <label for="newIndic" class="label">Add new : </label>
                 <input type="text" v-model="newIndic" id="newIndic">
               </div>
                <button type="submit" class="font-sans font-bold px-4 rounded cursor-pointer no-underline
                bg-green hover:bg-green-dark block w-full py-4 text-white items-center justify-center"> Add</button>
                </form>
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
      indics: [],
      error: ''
    }
  },
  mounted () {
    this.loadData()
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
      }
      else {
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
    }
  }

}

</script>
