<template>
  <Header />
  <div style="display:flex">
    <Aside/>
    <router-view/>
  </div>
</template>

<style scoped>

</style>

<script>
import Header from "@/components/Header.vue";
import Aside from "@/components/Aside.vue";

export default {
  name: ' Layout',
  components: {
    Header,
    Aside
  }
}
</script>
