<template>
    <div class="resume-container">
      
      <!-- Header -->
      <header class="resume-header">
        <h1>Bill Salvaggio | DevOps Engineer</h1>
        <p>516.808.6908 ▪ billy.salvaggio@gmail.com ▪ <a href="https://linkedin.com/in/billsalvaggio" target="_blank" rel="noopener">LinkedIn</a> ▪ <a href="https://medium.com/@bill.salvaggio" target="_blank" rel="noopener">Medium</a></p>
      </header>
  
      <!-- Summary -->
      <section class="resume-summary">
        <h2>Profile</h2>
        <p>AWS Certified Developer Associate with experience in automating and streamlining software development and infrastructure management through continuous integration and delivery. Over 15 cloud projects delivered with expertise in AWS, Terraform, Docker, and more. Proven background in project management and national account representation.</p>
      </section>
  
      <!-- Certifications -->
      <section class="resume-certifications">
        <h2>Certifications</h2>
        <ul>
          <li>AWS Certified Developer Associate</li>
          <li>Terraform Associate 002 - HashiCorp Certified</li>
          <li>LE-1 Linux Essentials - Linux Professional Institute</li>
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
        <strong>LEVEL UP IN TECH | DevOps Cloud Engineer Participant 11/2022 to 05/2023</strong>
        <p>24-week program focusing on real-world projects and mentorship.</p>
        <!-- List of projects -->
        <ul>
          <li>Terraforming AWS - Comprehensive guide and application of best practices for Infrastructure as Code.</li>
          <li>Kubernetes Deployments - Deployments using Minikube, ConfigMap, shared Services, and NGINX containers.</li>
          <li>Python & Lambda - Scripted automation for EC2 management, reducing errors and costs.</li>
          <li>Three-Tier Architecture - Implementation of Docker Swarm on AWS with Auto-Scaling groups.</li>
        </ul>
      </section>
  
      <!-- Professional Experience -->
      <section class="resume-experience">
        <h2>Professional Experience</h2>
        <div class="experience-item">
          <strong>NATIONAL ACCOUNTS REPRESENTATIVE | Jiffy Junk Inc. | Remote 12/2020 to Present</strong>
          <p>Managed national account operations, including bookkeeping, scheduling, and project management.</p>
        </div>
        <div class="experience-item">
          <strong>PROJECT MANAGER | Sir Speedy Print, Signs & Marketing | Westbury, NY 04/2016 to 06/2020</strong>
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
  export default {
    name: 'Resume'
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
  