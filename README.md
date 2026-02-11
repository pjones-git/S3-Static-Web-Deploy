**S3 Static Website Deployment with Terraform**

This project shows how a static website can be deployed to Amazon Web Services (AWS) using modern Infrastructure as Code practices.

All services and infrastructure is built automatically through Terraform, with execution handled by HCP Terraform using secure OIDC-based role assumption.

No long-lived credentials live in this repository.

Terraform will build:

✅ A globally unique Amazon S3 bucket
✅ Static website hosting configuration
✅ index.html and error.html routing
✅ Public access settings required for web traffic
✅ A bucket policy allowing public read of site content
✅ Automatic upload of files from the /html directory
✅ Output values that display the live website URL

🔐 **Security Model**

**Authentication** is handled using short-lived, automatically generated credentials.

HCP Terraform federates with **AWS IAM through OIDC** to assume a role at runtime.

Every push to the repository can trigger a remote run.

The workflow typically follows:

**Initialize → Plan → (Optional Approval) → Apply**

During this process Terraform will:

Download providers

Calculate changes

Create or update resources

Output the website endpoint

🎯 **Project Goal**

This repository demonstrates how to build a repeatable, version-controlled, and automated cloud deployment for a public-facing static website.

