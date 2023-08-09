<template>
  <div>
    <Header />
    <router-view />
    <Footer />
  </div>
</template>

<script>
import Header from '@/components/Header.vue';
import Footer from '@/components/Footer.vue';

export default {
  components: {
    Header,
    Footer
  }
}
</script>

<!-- Add any global styles here. -->
<style scoped>
  /* Styles specific to this component. */
</style>
