<template>
    <div class="contact-section">
      <h2>Contact Me</h2>
      <ContactLinks/>
      <p>If you have any questions or want to connect, you can reach me at:</p>
      <ul class="contact-list">
        <li>
          <a href="https://www.linkedin.com/in/billsalvaggio" target="_blank" rel="noopener" aria-label="Visit my LinkedIn profile">
            <i class="fab fa-linkedin"></i> LinkedIn
          </a>
        </li>
        <li>
          <a href="https://medium.com/@bill.salvaggio" target="_blank" rel="noopener" aria-label="Visit my Medium portfolio">
            <i class="fab fa-medium"></i> Medium Portfolio
          </a>
        </li>
        <li>
          <a :href="'mailto:' + emailAddress" target="_blank" rel="noopener" aria-label="Send me an email">
            <i class="fas fa-envelope"></i> Email: {{ emailAddress }}
          </a>
        </li>
        <li>
          <a href="https://github.com/bsalvaggio" target="_blank" rel="noopener" aria-label="Visit my GitHub repository">
            <i class="fab fa-github"></i> GitHub
          </a>
        </li>
      </ul>
    </div>
</template>

<script>
import ContactLinks from '@/components/ContactLinks.vue'

export default {

  name: 'Contact',
  computed: {
    emailAddress() {
      return 'billy.salvaggio' + '@' + 'gmail.com';
    }
  },

  components: {
    ContactLinks
  }
}
</script>

<style scoped>
.contact-section {
  margin: 20px 0;
  font-family: 'Source Code Pro', monospace; /* Updated the font-family */
}

.contact-list {
  list-style-type: none;
  padding: 0;
}

.contact-list li {
  margin: 15px 0;
  line-height: 1.5;
}

.contact-list a {
  color: #dfd6d6;
  text-decoration: none;
  font-size: 18px;
  display: flex;
  align-items: center;
}

.contact-list i {
  margin-right: 10px;
  font-size: 24px;
}

.contact-list a:hover {
  text-decoration: underline;
}

.contact-list a:hover i {
  transform: scale(1.05);
}

/* Sample hover color for LinkedIn icon */
.contact-list a[href*="linkedin"]:hover i {
  color: #0077b5;
}

/* Add further hover colors for other platforms if desired */
</style>