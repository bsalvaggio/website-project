<template>
    <div class="articles-section">
      <h2>My Articles</h2>
      <div v-for="topic in topics" :key="topic.name" class="topic-section">
        <h3>{{ topic.name }}</h3>
        <ul>
          <li v-for="article in topic.articles" :key="article.id">
            <a :href="article.link" target="_blank" rel="noopener">{{ article.title }}</a>
          </li>
        </ul>
      </div>
    </div>
</template>
  
<script>
export default {
  name: 'ArticleLinks',
  data() {
    return {
      topics: [
        {
          name: "Terraform",
          articles: [
            { id: 1, title: "Terraforming AWS: The Art of Infrastructure Automation, Scaling, & Management", link: "https://towardsdev.com/terraforming-aws-a-comprehensive-guide-to-the-art-of-infrastructure-automation-scaling-74a94f4039bd" },
            { id: 2, title: "Automating Jenkins Deployment with Advanced Terraform Techniques", link: "https://towardsdev.com/automating-jenkins-deployment-with-advanced-terraform-techniques-c41007151e8d" },
          ]
        },
        {
          name: "Kubernetes",
          articles: [
            { id: 3, title: "Kubernetes: Deploying NGINX Servers with ConfigMaps & Shared Services with MiniKube", link: "https://towardsdev.com/kubernetes-deploying-nginx-servers-with-configmaps-shared-services-with-minikube-618aee9a8ff6" },
            { id: 4, title: "Using Minikube to Modify our Docker Stack", link: "https://towardsdev.com/using-minikube-to-modify-our-docker-stack-9254573674cc" },
          ]
        },
        {
          name: "Docker",
          articles: [] // You can add articles later if you want
        }
      ]
    }
  }
}
</script>
  
<style scoped>
.articles-section {
  margin: 20px 0;
}

.topic-section {
  margin-bottom: 20px;
}

.articles-section a {
  color: #dfd6d6;
  text-decoration: none;
}

.articles-section a:hover {
  text-decoration: underline;
}
</style>
