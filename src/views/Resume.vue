<template>
  <div class="resume-container">
    <!-- Header -->
    <header class="resume-header">
      <h1>Bill Salvaggio | Cloud Engineer</h1>
      <p>
        <!-- <ContactLinks/> -->
      </p>
    </header>

    <!-- Summary -->
    <section class="resume-summary">
      <h2>Profile</h2>
      <p>AWS Certified Cloud Engineer currently working in Enterprise Data & Analytics at Delaware North, as part of the Data Engineering team. Designing, maintaining, and optimizing cloud infrastructure across the team’s 7 AWS accounts, maintaining resources including AWS S3, Lambda,  Elastic Beanstalk, EKS, ECS, EC2, Redshift & SQS. 15+ cloud projects documented and published. </p>
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

    <!-- Professional Experience -->
    <section class="resume-experience">
      <h2>Professional Experience</h2>
      <div class="experience-item">
        <strong class="highlight-title">SENIOR CLOUD ENGINEER | Delaware North | Buffalo, NY </strong><em>04/2024 - Present</em>
        <p>Sole Cloud Engineer in Enterprise Data & Analytics, as part of the Data Engineering team at Delaware North. Responsible for designing, maintaining, and optimizing cloud infrastructure across 7 AWS accounts, managing resources including S3, Lambda, Elastic Beanstalk, EKS, ECS, EC2, Redshift, and SQS. Data engineering tool stack includes Databricks, Airflow, and RDS.</p>
        <ul>
          <li>Troubleshoot and resolve cloud-related permissions, access, and design issues to reduce the workload of Data Engineers.</li>
          <li>Actively participate in Change Advisory Board meetings, successfully proposing, defending, and implementing 25+ infrastructure changes.</li>
          <li>Collaborate with Data Engineers at all levels and vendors on cross-account projects, assisting in design, troubleshooting, and implementation.</li>
          <li>Deploy new infrastructure and ensure access in both emergency and standard situations.</li>
          <li>Strengthen cross-account infrastructure through architecture and deployment of cross-account CloudWatch monitoring with Lambda and Kinesis streams.</li>
          <li>Identify, plan, and execute updates on AWS resources, notifying stakeholders and performing necessary changes.</li>
          <li>Review Terraform configurations to identify areas of improvement and develop best practices.</li>
        </ul>
      </div>
    </section>

    <!-- Professional Development & Featured DevOps Projects -->
    <section class="resume-projects">
      <h2>Professional Development & Featured DevOps Projects</h2>
      <strong class="highlight-title">LEVEL UP IN TECH | DevOps Cloud Engineer Graduate * 11/2022 to 05/2023</strong>
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

    <!-- Other Professional Experience -->
    <section class="resume-experience">
      <h2>Other Professional Experience</h2>
      <div class="experience-item">
        <strong class="highlight-title">NATIONAL ACCOUNTS REPRESENTATIVE | Jiffy Junk Inc. | Remote</strong> <em>12/2020 - 01/2024</em>
        <p>Managed national account operations, including bookkeeping, scheduling, and project management.</p>
      </div>

      <div class="experience-item">
        <strong class="highlight-title">PROJECT MANAGER | Sir Speedy Print, Signs & Marketing | Westbury, NY</strong> <em>04/2016 - 06/2020</em>
        <p>Oversaw production and installation of print, signage, and graphics projects. Increased business revenue from signage by over 30%.</p>
      </div>

      <div class="experience-item">
        <strong class="highlight-title">FRONT DESK MANAGER | Performance Factory Baseball | Farmingdale, NY</strong> <em>01/2011 - 03/2016</em>
        <p>Managed front desk operations, membership sales, and resolved conflicts between staff and customers.</p>
      </div>
    </section>
  </div>
</template>

<script>
import { topics } from '../components/ArticlesData.ts';
import ContactLinks from '@/components/ContactLinks.vue';
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome';
import { library } from '@fortawesome/fontawesome-svg-core';
import { fab } from '@fortawesome/free-brands-svg-icons';

library.add(fab);

export default {
  name: 'Resume',
  components: {
    ContactLinks,
    FontAwesomeIcon
  },
  data() {
    return {
      topics: topics
    };
  }
};
</script>

<style scoped>
.resume-container {
  font-family: 'Ubuntu', sans-serif;
  margin: 20px auto;
  max-width: 1000px;
  color: #EAEAEA;
  background-color: #1A1A1D;
  padding: 30px;
  border-radius: 5px;
}

/* Spacing for sections */
.resume-header,
.resume-summary,
.resume-certifications,
.resume-education,
.resume-projects,
.resume-experience {
  margin-bottom: 1rem; /* Adjust as needed */
}

/* Header styles */
h1 {
  font-size: 2em;
  margin-bottom: 0.5rem; /* Closer to the text below */
}

h2 {
  font-size: 1.6em;
  margin-top: 1rem; /* Space above the header */
  margin-bottom: 0.5rem; /* Space below the header */
}

/* Link styles */
a {
  color: #78C0E0;
  text-decoration: none;
  transition: 0.3s;
}

a:hover {
  color: #ABDFFA;
}

/* List styles */
ul {
  padding-left: 20px;
  margin-bottom: 1rem; /* Space below the list */
}

/* Experience item spacing */
.experience-item:not(:last-of-type) {
  margin-bottom: 1rem; /* Consistent spacing between items */
}

/* Highlight title styles */
.highlight-title {
  color: #78C0E0;
}

/* Additional stylings and adjustments can be added based on requirements */
</style>
