<template>
 <div>
    <Header />
    <router-view>
    </router-view>
    <Footer />
 
  </div>
</template>

<script>
import Header from '@/components/Header.vue';
import Footer from '@/components/Footer.vue';

export default {
  components: {
    Header,
    Footer,
  }
}
</script>

<!-- Add any global styles here. -->
<style scoped>
#ap3p {
  min-height: 30vh; /* Ensures the app container takes up full viewport height */
  display: flex;
  flex-direction: column;
}
  /* Styles specific to this component. */
</style>
