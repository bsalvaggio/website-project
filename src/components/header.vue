<template>
    <!-- Main header component wrapping everything -->
    <header class="header">
      <!-- Logo: Displayed on the left side of the header -->
      <img src="@/assets/face.jpg" alt="Logo" class="logo" />
      
      <!-- Navigation container to wrap all the navigation links -->
      <nav class="nav-container">
        <!-- Individual navigation links using vue-router for in-app navigation -->
        <router-link to="/" class="nav-link">Home</router-link>
        <router-link to="/resume" class="nav-link">Resume</router-link>
        <!-- <router-link to="/articles" class="nav-link">Articles</router-link> -->
        <router-link to="/about" class="nav-link">About</router-link> 
        <router-link to="/contact" class="nav-link">Contact</router-link>
      </nav>
    </header>
  </template>
  
  <script>
  export default {
    name: 'Header'  // Component name for referencing
  }
  </script>
  
  <style scoped>
    /* Styles for the main header */
    .header {
      display: flex;            /* Use flexbox for layout */
      justify-content: space-between; /* Align children with space in between */
      align-items: center;      /* Vertically center children */
      padding: 1rem 2rem;       /* Padding on all sides */
      background-color: #070707; /* Background color */
      flex-wrap: wrap;          /* Allow children to wrap to next line on small screens */
      align-content: center;    /* Center wrapped content */
    }
  
    /* Styles for the logo */
    .logo {
      width: 50px;              /* Set width */
      height: auto;             /* Auto height to maintain aspect ratio */
      margin-right: 1rem;       /* Right margin for spacing */
    }
  
    /* Styles for the navigation container */
    .nav-container {
      display: flex;            /* Use flexbox for layout */
      flex-wrap: wrap;          /* Allow links to wrap to next line on small screens */
    }
  
    /* Styles for individual navigation links */
    .nav-link {
      color: white;           /* Text color */
      margin-left: 1rem;        /* Left margin for spacing between links */
      text-decoration: none;    /* Remove default link underline */
      font-size: 1.2rem;        /* Set font size */
      padding: 0.2rem 0.5rem;   /* Padding for touch targets and spacing */
      transition: color 0.3s;   /* Smooth transition for hover effects */
    }
  
    /* Hover effect for navigation links */
    .nav-link:hover {
      color: #ffcc00;           /* Text color on hover */
    }
  
    /* Styles for the active route link (using vue-router's active class) */
    .nav-link.router-link-exact-active {
      font-weight: bold;        /* Bold text for the active link */
    }
  
    /* Media query for medium screens (like tablets) */
    @media (max-width: 992px) {
      .nav-link {
        font-size: 1rem;        /* Reduce font size for medium screens */
      }
      .logo {
        width: 45px;            /* Reduce logo size for medium screens */
      }
      .header {
        padding: 1rem 1.5rem;   /* Reduce padding for medium screens */
      }
    }
  
    /* Media query for small screens (like mobile phones) */
    @media (max-width: 768px) {
      .nav-link {
        font-size: 0.8rem;      /* Further reduce font size for small screens */
        margin-left: 0.5rem;    /* Reduce left margin for small screens */
      }
      .logo {
        width: 40px;            /* Further reduce logo size for small screens */
      }
      .header {
        padding: 1rem 1rem;     /* Further reduce padding for small screens */
      }
    }
  </style>
  