<template>
    <div class="resume-container">
  
      <!-- Header -->
    <header class="resume-header">
        <h1>Bill Salvaggio | DevOps Engineer</h1>
        <p> billy.salvaggio@gmail.com *  
            <font-awesome-icon :icon="['fab', 'linkedin']" />
            <a href="https://linkedin.com/in/billsalvaggio" target="_blank" rel="noopener"> LinkedIn</a> * 
            <font-awesome-icon :icon="['fab', 'medium']" />
            <a href="https://medium.com/@bill.salvaggio" target="_blank" rel="noopener"> Medium</a>
        </p>
    </header>

  
      <!-- Summary -->
      <section class="resume-summary">
        <h2>Profile</h2>
        <p>AWS Certified cloud engineer with experience in automating and streamlining software development and infrastructure management through CI/CD and various DevOps practices and philosophies. Over 15 cloud projects delivered with expertise in AWS, Terraform, Docker, Kubernetes and more. Trained as an exercise physiologist with a years of experience in project management and national account representation.</p>
      </section>
  
      <!-- Certifications -->
      <section class="resume-certifications">
        <h2>Certifications</h2>
        <ul>
          <li>
            <a href="https://www.credly.com/badges/3967919a-d932-4e25-9e0d-acdd269c1cea" target="_blank" rel="noopener">AWS Certified Developer Associate</a>
          </li>
          <li>
            <a href="https://www.credly.com/badges/5379e83a-8bb9-4702-bb6c-09decd2f1284/public_url" target="_blank" rel="noopener">Terraform Associate 002 - HashiCorp Certified</a>
          </li>
          <li>
            <a href="https://cs.lpi.org/caf/Xamman/certification/verify/LPI000549066/dh96w95anf" target="_blank" rel="noopener"> LE-1 Linux Essentials - Linux Professional Institute</a>
          </li>
        </ul>
      </section>

      <!-- Education -->
      <section class="resume-education">
        <h2>Education</h2>
        <ul>
          <li>Master of Science - Adelphi University, Garden City, NY</li>
          <li>Bachelor of Science - University of Notre Dame, South Bend, IN</li>
        </ul>
      </section>
  
      <!-- Development & Projects -->
      <section class="resume-projects">
        <h2>Professional Development & Featured DevOps Projects</h2>
        <strong>LEVEL UP IN TECH | DevOps Cloud Engineer Graduate * 11/2022 to 05/2023</strong>
        <p>24-week cloud engineering program, during which I was trained in DevOps, Cloud Infrastructure, and Cloud Development. I built real-world projects, gaining hands-on experience utilizing many technologies and tools and developed a practical understanding of how these technologies are applied in real-world scenarios. </p>
        <!-- List of projects -->
        <div class="articles-section">
          <div v-for="topic in topics" :key="topic.name" class="topic-section">
            <h3>{{ topic.name }}</h3>
            <ul>
              <li v-for="article in topic.articles" :key="article.id">
                <a :href="article.link" target="_blank" rel="noopener">{{ article.title }}</a>
              </li>
            </ul>
          </div>
        </div>
      </section>
  
      <!-- Professional Experience -->
      <section class="resume-experience">
        <h2>Professional Experience</h2>
        <div class="experience-item">
          <strong>NATIONAL ACCOUNTS REPRESENTATIVE | Jiffy Junk Inc. | Remote * 12/2020 to Present</strong>
          <p>Managed national account operations, including bookkeeping, scheduling, and project management.</p>
        </div>
        <div class="experience-item">
          <strong>PROJECT MANAGER | Sir Speedy Print, Signs & Marketing | Westbury, NY * 04/2016 to 06/2020</strong>
          <p>Oversaw production and installation of print, signage, and graphics projects. Grew business revenue from signage by over 30%.</p>
        </div>
        <div class="experience-item">
          <strong>FRONT DESK MANAGER | Performance Factory Baseball | Farmingdale, NY 01/2011 to 03/2016</strong>
          <p>Managed front desk operations, membership sales, and resolved conflicts between staff and customers.</p>
        </div>
      </section>
  
    </div>
  </template>
  
  <script>

  import { topics } from '../components/ArticlesData.ts';
  
  import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome';
  import { library } from '@fortawesome/fontawesome-svg-core';
  import { fab } from '@fortawesome/free-brands-svg-icons';
  
  library.add(fab);
  
  export default {
    name: 'Resume',
    components: {
      FontAwesomeIcon
    },
    data() {
      return {
        topics: topics
      };
    }
  }
  
  </script>
  
  
  <style scoped>
  .resume-container {
    font-family: 'Source Code Pro', sans-serif;
    margin: 20px auto;
    max-width: 1000px;
    color: #EAEAEA;
    background-color: #1A1A1D;
    padding: 30px;
    border-radius: 5px;
  }
  
  .resume-header, .resume-summary, .resume-certifications, .resume-education, .resume-projects, .resume-experience {
    margin-bottom: 40px;
  }
  
  h1 {
    font-size: 2em;
    margin-bottom: 10px;
  }
  
  h2 {
    font-size: 1.6em;
    margin-top: 30px;
    margin-bottom: 20px;
  }
  
  a {
    color: #78C0E0;
    text-decoration: none;
    transition: 0.3s;
  }
  
  a:hover {
    color: #ABDFFA;
  }
  
  ul {
    padding-left: 20px;
  }
  
  .experience-item:not(:last-of-type) {
    margin-bottom: 20px;
  }
  
  /* Additional stylings and adjustments can be added based on requirements */
  </style>
  