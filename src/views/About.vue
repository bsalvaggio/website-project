<template>
    <div>
      <img src="@/assets/website_diagram.png" alt="'architecture diagram" />  
      
      <h1>About This AWS Cloud Resume Website Project</h1>
        <a href="https://medium.com/@bill.salvaggio/the-aws-cloud-resume-challenge-project-c5c0c6fe9593" 
           target="_blank" 
           rel="noopener"
           class="about-link"> The AWS Cloud Resume Challenge: Part I (Medium article)</a>
        
        <a href="https://medium.com/@bill.salvaggio/the-aws-cloud-resume-challenge-project-part-ii-5c36029dbc59" 
           target="_blank" 
           rel="noopener"
           class="about-link"> The AWS Cloud Resume Challenge: Part II - CI/CD Automation with Github Actions & Test Environment (Medium article)</a>

        <article>
            <h2>THE CHALLENGE: Part I </h2>
            <p>This challenge was completed primarily in AWS, using a combination of VSCode and vue to build my cloud resume website.</p>

            <h3>1. CERTIFICATION</h3>
            <p>First up was to obtain an AWS Certification. I completed this part prior to the resume challenge and began my learning of the AWS fundamentals through earning my AWS Certified Developer Associate Certification, which can be viewed at the following link:</p>
            <a href="https://www.credly.com/badges/3967919a-d932-4e25-9e0d-acdd269c1cea" target="_blank">AWS CDA VERIFICATION</a>
            <blockquote>
                <p>Earners of this certification have a comprehensive understanding of application life-cycle management. They demonstrated proficiency in writing applications with AWS service APIs, AWS CLI, and SDKs; using containers; and deploying with a CI/CD pipeline. Badge owners are able to develop, deploy, and debug cloud-based applications that follow AWS best practices.</p>
            </blockquote>
            <p>I have also obtained my Hashicorp Terraform Associate Certification. This provided the groundwork for my work in automation and my journey into Infrastructure as Code:</p>
            <a href="https://www.credly.com/badges/5379e83a-8bb9-4702-bb6c-09decd2f1284/public_url" target="_blank">HASHICORP TERRAFORM ASSOCIATE VERIFICATION</a>
            <blockquote>
                <p>Earners of the HashiCorp Certified: Terraform Associate certification know the basic concepts, skills, and use cases associated with open source HashiCorp Terraform. They understand and can utilize Terraform according to the certification objectives. Additionally, they understand why enterprises choose to extend Terraform Open Source with Terraform Enterprise to solve business critical objectives.</p>
            </blockquote>
            <p>Going forward, I am currently preparing for the AWS Solutions Architect Associate Certification to further develop my knowledge and skills in working with AWS cloud infrastructure and to learn how these technologies integrate on a deeper level.</p>

            <h3>2. HTML</h3>
            <p>Next, my resume was to be written in HTML. (Not a word doc, not a PDF). This was my first foray into HTML and after a bit of a learning curve.</p>

            <h3>3. CSS</h3>
            <p>The next step was to style the resume with CSS. This was also my first experience in using CSS. I have a background in general design and aesthetics through my years working in the print industry producing and installing large format signage, and vinyl graphics. It was a valuable experience to learn CSS and styling my resume website was the perfect introduction to this.</p>
            <p>The current website design and layout is a work in progress as I continue to refine it. I focused first on getting it functional with a simple design that can be modified.</p>

            <h3>4. STATIC WEBSITE</h3>
            <p>I deployed my HTML resume online as an <a href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/WebsiteHosting.html" target="_blank">AWS S3 static website</a>.</p>
            <p>Relevant helpful resources:</p>
            <ul>
                <li><a href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/HostingWebsiteOnS3Setup.html" target="_blank">Static site setup</a></li>
                <li><a href="https://repost.aws/knowledge-center/cloudfront-serve-static-website" target="_blank">Cloudfront setup</a></li>
                <li><a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/using-https-alternate-domain-names.html" target="_blank">Alternate domain names and HTTPS</a></li>
                <li><a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/using-https-viewers-to-cloudfront.html" target="_blank">HTTPS for Cloudfront</a></li>
            </ul>

            <h3>5. HTTPS</h3>
            <p>I then used <a href="https://aws.amazon.com/blogs/networking-and-content-delivery/amazon-s3-amazon-cloudfront-a-match-made-in-the-cloud/" target="_blank">Amazon Cloudfront</a> to use HTTPS for security.</p>

            <h3>6. DNS</h3>
            <p>I then pointed a custom DNS domain name to my cloudfront distribution. I utilized <a href="https://aws.amazon.com/route53/" target="_blank">Amazon Route 53</a> as my DNS provider.</p>
            <p>I chose as my domain <a href="http://www.salvagg.io/" target="_blank">salvagg.io</a> as I thought this was a memorable way to use my name as the full domain.</p>
            <p>I decided to build the front end using the Vue Javascript framework. This made it easier to build and maintain, as well as allowing myself a more manageable file to update in my S3 bucket instead of a giant HTML file.</p>

            <h3>7. JAVASCRIPT</h3>
            <p>The next addition to the website was a visitor counter that would display how many people have visited the site. This proved to be the biggest challenge of the entire process up to this point, as it involved the integration of several technologies which will be outlined below.</p>
            <p>I hit the most roadblocks during this section of the challenge and it required a great deal of troubleshooting. It took many nights to first identify and then sort out CORS issues and get the counter to properly update and display on the website. Once corrected though it was an incredibly rewarding feeling.</p>

            <h3>8. DATABASE</h3>
            <p>The visitor counter needed to retrieve and update its count in a database. I chose to use DynamoDB for this.</p>

            <h3>9. API — PYTHON & LAMBDA</h3>
            <p>I created a cloud based API that would accept requests from the web app and communicate with the database. I used AWS API Gateway and Lambda for this.</p>
            <p>I wrote the Lambda function in Python, as I had some experience using Python in Lambda functions in previous projects.</p>
            <p>First the Python Lambda function was set up using the AWS web console, and once successfully tested from the console I then triggered it externally from my terminal command line and then finally from my website.</p>
            <p>I built the API on the “AWS serverless stack” of Lambda, API Gateway, and DynamoDB for several reasons. The ease of use of a serverless API allows us to focus on writing the code and properly configuring the managed services. The cost efficiency of the lambda function allows us to be charged only during response to an event that triggers the function. This type of set up has wide ranging applications.</p>

            <h3>11. INFRASTRUCTURE AS CODE</h3>
            <p>I used Infrastructure as code to redefine my entire website in Terraform. This was a significant bit of work but I used the knowledge I gained from my Terraform Associate Certification preparation as well as previous Terraform projects.</p>
            <p>I converted my S3, Route53, and Cloudfront resources to Infrastructure as Code using Terraform. This was a challenging undertaking and a bit nerve wracking but once successful and I was able to fully break down and rebuild the infrastructure through Terraform it proved to be a very worthwhile endeavor.</p>
        </article>
        <article>
            <h2>The AWS Cloud Resume Challenge Project, Part II</h2>
            <p>In this continuation of our AWS Cloud Resume Challenge, we will explore automation through Github Actions. <a href="https://medium.com/@bill.salvaggio/the-aws-cloud-resume-challenge-project-c5c0c6fe9593" target="_blank">Click here to revisit part 1</a> for an overview of the project. We will look at automating the deployment of our website and explore some fundamentals of CI/CD (Continuous Integration and Continuous Delivery). This will help facilitate any changes we want to make to the website and allow us to do so more frequently, reliably, and efficiently. By automating this process, it should reduce further the chances of any manual errors and allow us to make and deploy smaller changes much more rapidly.</p>

            <p>Adding a test environment will allow us to test any changes before they reach production and add another layer of protection between our intended changes and the live product.</p>

            <h3>What is Github Actions?</h3>
            <p>GitHub Actions is a continuous integration and continuous delivery (CI/CD) platform that allows you to automate your build, test, and deployment pipeline. You can create workflows that build and test every pull request to your repository, or deploy merged pull requests to production. We will create workflows which will automate the deployment of our website when any changes are made. A workflow can be set up to build, test, release, deploy, or package any code.</p>

            <h3>Creating the workflow</h3>
            <p>Each workflow will be created as a .yml file, located in the .github/workflows directory in our repo. We will define the triggers, jobs, and steps. Our workflow is triggered by a push to my 'main' branch. Any changes merged into 'main' will automatically initiate the deployment process.</p>
            <img src="@/assets/articleimages/main.png" alt="'main' workflow" />
            <p>The first step, checking out the code, means that the code will be cloned from our Github repo to the virtual environment (runner) provided by Github Actions, where the workflow will be executed. This is a pre-built Github action provided by Github and will allow for other steps (such as npm run build) within this workflow to operate off of our code.</p>

            <p>The next steps will install dependencies and build the application: First it sets up a Node.js environment for the workflow and specifies the version. It then enables caching of the npm dependencies. If our package.json hasn't changed, Actions can reference the cached files instead of downloading them again. This can greatly speed up the build process and save bandwidth and resources.</p>

            <p>In step 5, the workflow will then deploy the built project to our specified S3 bucket hosting the website and invalidate the Cloudfront cache, making sure that users are served with the latest version of the site. The CloudFront invalidation is important because it forces CloudFront to fetch a fresh copy from the S3 bucket. We use the '-exact timestamps' flag so that we guarantee the deployed files are from the most recent build. It will ensure that even a small change which does not change the file size is updated to our S3. Note: We will also use Github secrets to ensure that none of our AWS credentials are exposed.</p>

            <h3>Creating a Test Environment</h3>
            <p>Once we confirmed that our Github Actions workflow ran successfully, I created a test environment in a new S3 bucket, at test.salvagg.io. The test environment will serve to test any new code changes before pushing to our production. We will use this environment to test any updates to the website code before deploying on the production branch.</p>
            <p>Normally, a test or stage environment would not be publicly accessible but as this is an educational project I will leave it public for the moment. As such, test.salvagg.io at any point may be under construction, and for the most stable website please visit my production environment at www.salvagg.io</p>
            <p>We will then create a new workflow, which will operate just like the first one, but will deploy changes to our test environment instead. This will be triggered upon a push to our "Develop" branch. </p>
            <img src="@/assets/articleimages/test.png" alt="'develop' workflow" />

            <p>Once both workflows are confirmed working, we can optimize this automation by combining both workflows into a single Github Actions workflow in order to reduce redundancy and improve our workflow efficiency. We now have conditional deployment steps which will enable specific actions based on the branch. This will lead to deployment to our production environment when a push is made to 'main' and to the test environment when pushed to 'Develop'.</p>
            <img src="@/assets/articleimages/combined.png" alt="'combined' workflow" />

            <h3>Confirming Successful Workflows</h3>
            <p>We can check our Github under the Actions tab in our repository to confirm that the workflow is successful: and a more detailed step by step check of the workflow if we click on the specific workflow run. This is very helpful while building the workflow, in order to see exactly where a problem arise if it was unsuccessful.</p>

            <h3>Conclusions</h3>
            <p>Enabling Github Actions has greatly improved my ability to deploy changes to my Cloud Resume website <a href="http://www.salvagg.io" target="_blank">www.salvagg.io</a>. Working with Github secrets was a valuable process in security and keeping important AWS information out of published code. Building out a simple Github Actions workflow has helped set me up to think about what else can be automated throughout the development process of this project, as well as other projects.</p>

            <h3>Helpful Resources:</h3>
            <ul>
                <li><a href="https://docs.github.com/en/actions/quickstart" target="_blank">Github Actions Quickstart</a></li>
                <li><a href="https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions" target="_blank">Workflow syntax for Github Actions</a></li>
                <li><a href="https://docs.github.com/en/actions/guides/caching-dependencies-to-speed-up-workflows" target="_blank">Caching Dependencies to speed up workflows</a></li>
                <li><a href="https://docs.github.com/en/actions/security-guides/encrypted-secrets" target="_blank">Using Secrets in Github Actions</a></li>
            </ul>

        </article>
    

    </div>
  
  </template>
  
  <script>
  export default {
    name: 'About'
  }
  </script>
  
  <style scoped>
    
  /* Add your specific styles for the About page here */
  
  article {
    line-height: 1.6; /* Adjusts the space between lines */
    padding: 1rem; /* Padding inside the article */
  }
  
  article h2, article h3 {
    margin-top: 1.5rem; /* Adds space above each header */
    margin-bottom: 1rem; /* Adds space below each header */
  }
  
  article p {
    margin-bottom: 1rem; /* Adds space below each paragraph */
    text-align: justify; /* Justifies the text for better readability */
    letter-spacing: 0.5px; /* Slightly increases space between characters */
  }
  
  article ul, article ol {
    margin-bottom: 1rem; /* Adds space below lists */
  }
  
  article a {
    margin-bottom: 1rem; /* Adds space below links */
    display: inline-block; /* Makes the link take up the whole line */
  }

  article a {
    color: #78C0E0; /* Sets the default color of links to blue */
    text-decoration: none; /* Removes underline from links */
    transition: 0.3s; /* Smooth transition for hover effects */
}

article a:hover {
    color: #ABDFFA; /* Changes color on hover */
    text-decoration: underline; /* Adds underline on hover */
}

h2 {
    margin-bottom: 1rem; /* Adds space below the header */
    /* Other h2 styles if needed */
}

.about-link {
    font-size: 1.2em; /* Makes the font larger */
    font-weight: bold; /* Makes the font bolder */
    margin-top: 1rem; /* Adds space above the link */
    display: inline-block; /* Treats the link as a block for margin to take effect */
    color: #78C0E0; /* Sets the color of the link */
    text-decoration: none; /* Removes underline from the link */
    transition: 0.3s; /* Smooth transition for hover effects */
}

.about-link:hover {
    color: #ABDFFA; /* Changes color on hover */
    text-decoration: underline; /* Adds underline on hover */
}

img {
    max-width: 50%;  /* Sets the maximum width to 50% of its container */
    height: auto;    /* Maintains the aspect ratio of the image */
}

  </style>
  