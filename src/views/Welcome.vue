<template>
    <div class="welcome-container">
        <h1>Bill Salvaggio</h1>
        <p>Cloud Engineer | Tech Writer & Enthusiast | Physiologist </p>
        <div class="welcome-links">
            <a href="https://www.linkedin.com/in/billsalvaggio" target="_blank" rel="noopener">LinkedIn</a>
            <a href="https://medium.com/@bill.salvaggio" target="_blank" rel="noopener">Medium</a>
            <a href="https://github.com/bsalvaggio" target="_blank" rel="noopener">GitHub</a>
        </div>
        
        <p> </p>
        <p>Welcome!</p>
        <p>On this page you can find some info about me as well as my articles, projects and other topics of interest.</p>
        <div class="articles-section">
            <h2>Published Articles</h2>
            <ul class="articles-list">
                <li v-for="article in articles" :key="article.id">
                    <a :href="article.link" target="_blank" rel="noopener noreferrer">
                        {{ article.title }}
                    </a>
                </li>
            </ul>
        </div>
    </div>
</template>

<script>
export default {
    name: 'Welcome',
    data() {
        return {
            articles: [
                {
                    id: 1,
                    title: 'Terraforming AWS: The Art of Infrastructure Automation, Scaling, & Management',
                    image: 'path_to_image1.jpg',
                    link: 'https://towardsdev.com/terraforming-aws-a-comprehensive-guide-to-the-art-of-infrastructure-automation-scaling-74a94f4039bd'
                },
                {
                    id: 2,
                    title: 'Automating Jenkins Deployment with Advanced Terraform Techniques',
                    image: 'path_to_image2.jpg',
                    link: 'https://towardsdev.com/automating-jenkins-deployment-with-advanced-terraform-techniques-c41007151e8d'
                },
                {
                    id: 3,
                    title: 'Kubernetes: Deploying Nginx Servers with ConfigMaps & Shared Services with Minikube',
                    image: 'path_to_image3.jpg',
                    link: 'https://towardsdev.com/kubernetes-deploying-nginx-servers-with-configmaps-shared-services-with-minikube-618aee9a8ff6'
                }, 
                {
                    id: 4,
                    title: 'Using Minikube to Modify our Docker Stack',
                    image: 'path_to_image2.jpg',
                    link: 'https://towardsdev.com/using-minikube-to-modify-our-docker-stack-9254573674cc'
                },
                {
                    id: 5,
                    title: 'Dive Deeper into Docker: Creating a Docker Stack',
                    image: 'path_to_image3.jpg',
                    link: 'https://towardsdev.com/dive-deeper-into-docker-creating-a-docker-stack-9589a435d806'
                }, 
                {
                    id: 6,
                    title: 'Building a Three Tier Architecture with Docker Swarm on AWS',
                    image: 'path_to_image2.jpg',
                    link: 'https://towardsdev.com/building-a-three-tier-architecture-with-docker-swarm-on-aws-2a267c1a73c'
                },
                {
                    id: 7,
                    title: 'Building a Boto3 Development Environment Using Docker',
                    image: 'path_to_image3.jpg',
                    link: 'https://towardsdev.com/building-a-boto3-development-environment-using-docker-42705731b10a'
                },
                {
                    id: 8,
                    title: 'Building an SQS Queue with AWS Lambda through Python',
                    image: 'path_to_image2.jpg',
                    link: 'https://towardsdev.com/building-sns-serverless-architecture-with-aws-through-python-5bf49522e6ba'
                },
                {
                    id: 9,
                    title: 'Create an Auto-Scaling Group of EC2 Instances for High Availability',
                    image: 'path_to_image3.jpg',
                    link: 'https://towardsdev.com/create-an-auto-scaling-group-of-ec2-instances-for-high-availability-a176d4ec0f60'
                },
                {
                    id: 10,
                    title: 'Stopping EC2 Instances Using Python & Boto3 in Cloud9',
                    image: 'path_to_image3.jpg',
                    link: 'https://towardsdev.com/stopping-ec2-instances-using-python-boto3-in-cloud9-def83e77cab4'
                },
                {
                    id: 11,
                    title: 'A DynamoDB Pokedex!',
                    image: 'path_to_image2.jpg',
                    link: 'https://medium.com/@bill.salvaggio/article2'
                },
                {
                    id: 12,
                    title: 'Create an EC2 instance with an automated install of NGINX',
                    image: 'path_to_image3.jpg',
                    link: 'https://towardsdev.com/create-an-ec2-instance-with-an-automated-install-of-nginx-ef0dfef3fecd'
                },
                {
                    id: 13,
                    title: 'Launch an AWS EC2 Instance & Install Apache using a BASH Script',
                    image: 'path_to_image3.jpg',
                    link: 'https://towardsdev.com/launch-an-aws-ec2-instance-install-apache-using-a-bash-script-984c797f1b88'
                },
                {
                    id: 14,
                    title: 'Quick Start to Git & GitHub',
                    image: 'path_to_image3.jpg',
                    link: 'https://towardsdev.com/quick-start-to-git-github-9956f8fa17c5'
                },
                {
                    id: 15,
                    title: 'Installing NGINX on CentOS 8',
                    date: 'Nov 20, 2022',
                    image: 'path_to_image3.jpg',
                    link: 'https://medium.com/@bill.salvaggio/installing-nginx-on-centos-8-4d5ff1b828cd'
                },
                // ... continue this pattern, updating IDs, titles, descriptions, etc.
            ]
        };
    }
}
</script>

<style scoped>
    .welcome-container {
        font-family: 'Source Code Pro', monospace;
        text-align: center;
        margin: 100px auto;
        padding: 10px;
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

    .articles-list {
        list-style-type: none;
        padding: 0;
    }

    .articles-list li {
        margin: 10px 0;
    }

    .articles-list a {
        color: #78C0E0;
        text-decoration: none;
        transition: 0.3s;
    }

    .articles-list a:hover {
        color: #ABDFFA;
        text-decoration: underline;
    }
</style>
