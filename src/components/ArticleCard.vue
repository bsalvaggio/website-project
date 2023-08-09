<template>
    <div class="article-card">
      <a :href="article.link" target="_blank" rel="noopener noreferrer">
        <img :src="article.image" :alt="article.title" />
        <h3>{{ article.title }}</h3>
        <p>{{ article.description }}</p>
      </a>
    </div>
  </template>
  
  <script>
  export default {
    props: ['article'],
    name: 'ArticleCard'
  }
  </script>
  
  <style scoped>
  .article-card {
    border: 1px solid #ccc;
    padding: 15px;
    margin: 15px 0;
    transition: 0.3s;
  }
  
  .article-card:hover {
    box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
  }
  
  .article-card img {
    width: 100%;
    height: auto;
  }
  
  .article-card h3 {
    margin: 10px 0;
  }
  </style>
  