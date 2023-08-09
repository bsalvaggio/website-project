<template>
    <div class="welcome-container">
      <h1>Bill Salvaggio</h1>
      <p>Cloud Engineer | Tech Writer & Enthusiast | Physiologist </p>
      <div class="welcome-links">
        <a href="https://www.linkedin.com/in/billsalvaggio" target="_blank" rel="noopener">
          LinkedIn
        </a>
        <a href="https://medium.com/@bill.salvaggio" target="_blank" rel="noopener">
          Medium
        </a>
        <a href="https://github.com/bsalvaggio" target="_blank" rel="noopener">
          GitHub
        </a>
      </div>
      <p></p>
      <p>Welcome!</p>
        <p>On this page you can find some info about me as well as my articles & projects.</p>
        <p></p>

    </div>
</template>

<script>
export default {
    name: 'Welcome'
}
</script>

<style scoped>
.welcome-container {
    font-family: 'Source Code Pro', monospace; /* Updated the font-family */
    text-align: center;
    max-width: 800px;
    margin: 100px auto;
    padding: 20px;
    background-color: #1A1A1D;
    border-radius: 5px;
    box-shadow: 0 3px 10px rgba(0, 0, 0, 0.2);
    color: #EAEAEA;
}

h1 {
    font-size: 2.5em;
    margin-bottom: 20px;
    font-weight: 600;
}

p {
    font-size: 1.2em;
    margin-bottom: 30px;
}

.welcome-links a {
    color: #78C0E0;
    margin: 0 15px;
    text-decoration: none;
    font-size: 1.1em;
    transition: 0.3s;
}

.welcome-links a:hover {
    color: #ABDFFA;
    text-decoration: none;
}
</style>
