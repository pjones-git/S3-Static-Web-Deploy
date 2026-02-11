# S3-Static-Web-Deploy
S3 Static Website Deployment via Terraform

README – Project Summary

This project provisions infrastructure in Amazon Web Services (AWS) to host a static website using infrastructure-as-code practices.

Deployment is automated with Terraform and executed through HCP Terraform (Terraform Cloud) using OpenID Connect (OIDC) federation to securely assume an AWS Identity and Access Management (IAM) role. No long-lived credentials are stored in the repository.

What this configuration creates

An Amazon S3 bucket with a globally unique name

Static website hosting configuration

Index and error document definitions

Public access configuration required for web delivery

A bucket policy allowing read access to website objects

Automated upload of HTML content from the html/ directory

Output values that display the website endpoint after deployment

Security model

Authentication to AWS is performed using short-lived credentials obtained at runtime via workload identity federation between HCP Terraform and AWS IAM. The repository contains no secrets.

How deployments run

Changes pushed to the repository trigger remote Terraform runs. The workflow performs:

Initialization of providers

Infrastructure planning

Approval (if manual apply is enabled)

Resource creation or update

Purpose

The goal of this project is to demonstrate repeatable, version-controlled cloud infrastructure deployment for a public static web application.
