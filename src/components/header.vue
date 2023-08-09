<template>
    <header class="header">
      <img src="@/assets/logo.png" alt="Logo" class="logo" />
      <nav>
        <router-link to="/" class="nav-link">Home</router-link>
        <router-link to="/resume" class="nav-link">Resume</router-link>
        <router-link to="/projects" class="nav-link">Projects</router-link>
        <router-link to="/articles" class="nav-link">Articles</router-link>
        <router-link to="/about" class="nav-link">About</router-link>
        <router-link to="/contact" class="nav-link">Contact</router-link>

      </nav>
    </header>
  </template>
  
  <script>
  export default {
    name: 'Header'
  }
  </script>
  
  <style scoped>
  .header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 1rem 2rem;
    background-color: #383737;
  }
  
  .logo {
    width: 50px;
  }
  
  .nav-link {
    color: white;
    margin-left: 1rem;
    text-decoration: none;
  }
  
  .nav-link.router-link-exact-active {
    font-weight: bold;  /* you can style the active link differently, e.g., with bold font */
  }
  </style>
  