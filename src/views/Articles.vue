<template>
    <div class="articles-section">
      <h2>Published DevOps Projects</h2>
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
          articles: [
            { id: 5, title: "Dive Deeper into Docker: Creating a Docker Stack", link: "https://towardsdev.com/dive-deeper-into-docker-creating-a-docker-stack-9589a435d806" },
            { id: 6, title: "Building a Three Tier Architecture with Docker Swarm on AWS", link: "https://towardsdev.com/building-a-three-tier-architecture-with-docker-swarm-on-aws-2a267c1a73c" },
            { id: 7, title: "Building a Boto3 Development Environment Using Docker", link: "https://towardsdev.com/building-a-boto3-development-environment-using-docker-42705731b10a" }
          ]
        },
        {
          name: "AWS",
          articles: [
            { id: 8, title: "Building an SQS Queue with AWS Lambda through Python", link: "https://towardsdev.com/building-sns-serverless-architecture-with-aws-through-python-5bf49522e6ba" },
            { id: 9, title: "Create an Auto-Scaling Group of EC2 Instances for High Availability", link: "https://towardsdev.com/create-an-auto-scaling-group-of-ec2-instances-for-high-availability-a176d4ec0f60" },
            { id: 10, title: "Stopping EC2 Instances Using Python & Boto3 in Cloud9", link: "https://towardsdev.com/stopping-ec2-instances-using-python-boto3-in-cloud9-def83e77cab4" },
            { id: 12, title: "Create an EC2 instance with an automated install of NGINX", link: "https://towardsdev.com/create-an-ec2-instance-with-an-automated-install-of-nginx-ef0dfef3fecd" },
            { id: 13, title: "Launch an AWS EC2 Instance & Install Apache using a BASH Script", link: "https://towardsdev.com/launch-an-aws-ec2-instance-install-apache-using-a-bash-script-984c797f1b88" }
          ]
        },
        {
          name: "Miscellaneous",
          articles: [
            { id: 11, title: "A DynamoDB Pokedex!", link: "https://medium.com/@bill.salvaggio/article2" },
            { id: 14, title: "Quick Start to Git & GitHub", link: "https://towardsdev.com/quick-start-to-git-github-9956f8fa17c5" },
            { id: 15, title: "Installing NGINX on CentOS 8", link: "https://medium.com/@bill.salvaggio/installing-nginx-on-centos-8-4d5ff1b828cd" }
          ]
        }
      ]
    };
  }
};
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
