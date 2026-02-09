# salvagg.io

Personal website for Bill Salvaggio. Built as the [AWS Cloud Resume Challenge](https://cloudresumechallenge.dev/).

## Architecture

- **Frontend**: Static HTML, CSS, vanilla JS — no framework, no build step
- **Hosting**: AWS S3 + CloudFront CDN
- **DNS**: Route 53
- **Backend**: API Gateway + Lambda (Python) + DynamoDB (visitor counter)
- **CI/CD**: GitHub Actions — push to `main` deploys to production, push to `develop` deploys to test
- **IaC**: Terraform (S3, CloudFront, Route 53)

## Project Structure

```
├── index.html              # The entire website
├── website_diagram.png     # Architecture diagram
├── favicon.ico             # Site icon
├── gallery/                # Signage & graphics portfolio photos
├── lambda/                 # Visitor counter Lambda function
│   └── lambda_function.py
├── terraform/              # Infrastructure as Code (optional)
└── .github/workflows/
    └── deploy.yml          # CI/CD pipeline
```

## Deployment

Push to `main` — GitHub Actions syncs files to S3 and invalidates CloudFront. No build step needed.

### Manual deploy

```bash
aws s3 sync . s3://www.salvagg.io/ \
  --exact-timestamps \
  --exclude ".git/*" --exclude ".github/*" \
  --exclude "lambda/*" --exclude "terraform/*" \
  --exclude "README.md" --exclude ".gitignore"

aws cloudfront create-invalidation \
  --distribution-id EFJX169TXJMO5 --paths "/*"
```

## Adding Gallery Photos

Drop images into `gallery/` and update `index.html`:

```html
<div class="gallery-item">
  <img src="gallery/photo.jpg" alt="Description" onclick="openLightbox(this.src)">
</div>
```

## Previous Version

The original Vue.js version of this site is preserved in the `legacy` branch.
