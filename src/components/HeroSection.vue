<template>
    <div class="hero">
      <div class="hero-content">
        <h1>Bill Salvaggio</h1>
        <p>DevOps Specialist, Writer, & Technological Enthusiast</p>
        <div class="hero-actions">
          <a href="#articles-section" class="cta-button">Explore My Articles</a>
          <a href="#contact-section" class="cta-button secondary">Contact Me</a>
        </div>
        <div class="social-links">
          <a :href="socialLinks.medium" target="_blank"><font-awesome-icon :icon="['fab', 'medium']" /></a>
          <a :href="socialLinks.linkedin" target="_blank"><font-awesome-icon :icon="['fab', 'linkedin']" /></a>
          <a :href="socialLinks.github" target="_blank"><font-awesome-icon :icon="['fab', 'github']" /></a>
        </div>
      </div>
    </div>
  </template>
  
  <script>
  export default {
    data() {
      return {
        socialLinks: {
          medium: 'https://medium.com/@bill.salvaggio',
          linkedin: 'https://www.linkedin.com/in/billsalvaggio',
          github: 'https://github.com/bsalvaggio',
        }
      }
    }
  }
  </script>
  
  <style scoped>
  .hero {
    display: flex;
    align-items: center;
    justify-content: center;
    height: 80vh; /* Adjust this value as needed */
    background: url('path_to_your_background_image.jpg') no-repeat center center;
    background-size: cover;
    color: white; /* Adjust this based on your background image */
  }
  
  .hero-content {
    text-align: center;
  }
  
  .hero h1 {
    font-size: 2.5em;
    margin-bottom: 15px;
  }
  
  .hero p {
    font-size: 1.25em;
    margin-bottom: 20px;
  }
  
  .hero-actions {
    display: flex;
    justify-content: center;
    gap: 10px; /* Provides spacing between buttons */
  }
  
  .cta-button {
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    background-color: #007BFF; /* Change to preferred color */
    color: white;
    font-size: 1em;
    cursor: pointer;
    transition: background-color 0.3s;
  }
  
  .cta-button.secondary {
    background-color: transparent;
    border: 2px solid #007BFF; /* Border color same as primary button */
  }
  
  .cta-button:hover {
    background-color: #0056b3; /* Darkened version of primary color */
  }
  
  .social-links {
    margin-top: 20px;
    display: flex;
    justify-content: center;
    gap: 15px;
  }
  
  .social-links a {
    color: white; /* Adjust color if needed */
    font-size: 1.5em;
    transition: color 0.3s;
  }
  
  .social-links a:hover {
    color: #007BFF; /* Change to preferred color */
  }
  </style>
  