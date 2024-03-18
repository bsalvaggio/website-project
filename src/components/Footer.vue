<template>
    <footer class="footer">
      <p> anno domini 2023 * salvagg.io </p>
      <p>Visitor Count: {{ visitorCount }}</p> <!-- This line displays the visitor count at the bottom -->
    </footer>
  </template>
  
  <script lang="ts">
  export default {
      name: 'visitorCount',
      data() {
          return {
              visitorCount: 0  // Initialize the visitor count
          };
      },
      methods: {
          fetchVisitorCount() {
              const apiUrl = 'https://1wincht4l5.execute-api.us-east-1.amazonaws.com/prod/counter';
              fetch(apiUrl, {
                  method: 'POST',
                  headers: {
                      'Content-Type': 'application/json',
                      'Accept': 'application/json'
                  }
              })
              .then(response => {
                  if (!response.ok) {
                    // If the responsei is not ok, throw an error
                      return response.text().then(text => {
                          throw new Error(text || 'Network response was not ok');
                      });
                  }
                  return response.json(); // Parse the response as JSON
              })
              .then(data => {
                // Update the visitor count with the fetched data
                  this.visitorCount = parseInt(data.count, 10); // Parse the count as an integer
              })
  
              .catch(error => {
                // Catch and log any erros
                  console.error('Error fetching the visitor count:', error.message);
              });
          }
  
      },
      mounted() {
        // Fetch the visitor count when the component is mounted
        this.fetchVisitorCount();
      }
  }
  </script>
  

  <style scoped>
  .footer {
    padding: 1rem;
    text-align: center;
    background-color: #040404;
    color: white;
  }
  </style>
