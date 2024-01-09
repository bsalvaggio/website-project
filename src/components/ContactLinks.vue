

    <template>
        <div class="welcome-links">
            <a :href="'mailto:billy.salvaggio@gmail.com'" target="_blank" rel="noopener" aria-label="Send me an email">
            <i class="fas fa-envelope"></i> billy.salvaggio@gmail.com</a> *
            <font-awesome-icon :icon="['fab', 'linkedin']" /><a href="https://linkedin.com/in/billsalvaggio" target="_blank" rel="noopener"> LinkedIn</a> * 
            <font-awesome-icon :icon="['fab', 'medium']" /><a href="https://medium.com/@bill.salvaggio" target="_blank" rel="noopener"> Medium</a> *
            <font-awesome-icon :icon="['fab', 'github']" /><a href="https://github.com/bsalvaggio" target="_blank" rel="noopener"> GitHub</a>
        </div>


    </template>

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
