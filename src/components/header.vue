<template>
    <header class="header">
      <img src="@/assets/face.jpg" alt="Logo" class="logo" />
      <nav class="nav-container">
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
  background-color: #070707;
  flex-wrap: wrap;
}

.logo {
  width: 50px;
  margin-right: 1rem;
}

.nav-container {
  display: flex;
  flex-wrap: wrap;
}

.nav-link {
  color: white;
  margin-left: 1rem;
  text-decoration: none;
  font-size: 1.2rem; /* Set an explicit font size for larger screens */
}

.nav-link.router-link-exact-active {
  font-weight: bold;
}

/* Media query for medium screens (tablets) */
@media (max-width: 992px) {
  .nav-link {
    font-size: 1rem; /* Adjust font size */
  }

  .logo {
    width: 45px; 
  }
}

/* Media query for mobile view */
@media (max-width: 768px) {
  .nav-link {
    font-size: 0.8rem; /* Further reduce font size for smaller screens */
    margin-left: 0.5rem;
  }

  .logo {
    width: 40px;
  }
}
</style>
