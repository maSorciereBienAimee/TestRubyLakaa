<template>
    <div class="max-w-sm m-auto my-8">
        <div class="border p-18 border-grey-light shadow rounder">
            <h3 class="text-2xt mb-6 text-grey-darkest">Add a new collect</h3>
                <form @submit.prevent="addCollect">
                    <div class="text-red" v-if="error">{{error}}</div>
                    <div class="mb-6">
                        <label for="date" class="label">Date of collect</label>
                        <input type="date" v-model="date" id="date">
                    </div>
                     <div class="mb-6">
                        <label for="association" class="label">Association name</label>
                        <input type="text" v-model="association" id="association">
                    </div>
                    <div v-for="item in items" :key="item.id">
                        <label :for="`${item.name}`" class="label">{{ item.name }}</label>
                        <span><input type="text" :v-model="`${item.name}`" :id="`${item.name}`"></span>
                    </div>
                    <button type="submit" class="font-sans font-bold px-4 rounded cursor-pointer no-underline
                    bg-green hover:bg-green-dark block w-full py-4 text-white items-center justify-center"> Add</button>
                </form>
        </div><br><br>
        <a href="/">Acceuil</a><br>
        <a href="/SeeCollects">See all collects</a>
    </div>
</template>

<script>
export default {
  name: 'AddCollect',
  data () {
    return {
      date: '',
      association: '',
      items: [],
      error: ''
    }
  },
  mounted () {
    this.loadData()
  },
  methods: {
    loadData: async function () {
      await this.$axios.get('http://localhost:3000/indicators?status=active')
        .then(res => {
          this.items = res.data
        })
    },
    addCollect () {
      let opt = '{'
      for (let i of this.items) {
        opt += '"' + i.name + '"' + ':' + '"' + document.getElementById(i.name).value + '"' + ','
      }
      if (opt[opt.length - 1] === ',') {
        opt = opt.slice(0, -1)
      }
      opt += '}'
      this.$axios.post('http://localhost:3000/collects',
        {
          at: this.date,
          asso: this.association,
          other: opt
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

<style>
.label
{
    color:pink
}
</style>
