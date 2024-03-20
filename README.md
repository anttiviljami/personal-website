# [viljami.io](https://viljami.io)
![CI](https://github.com/anttiviljami/personal-website/workflows/CI/badge.svg)
[![License](http://img.shields.io/:license-mit-blue.svg)](https://github.com/anttiviljami/anttiviljami/blob/master/LICENSE)

My personal static home page. [https://viljami.io](https://viljami.io)

- Built using [Svelte](https://svelte.dev/)
- Hosted on AWS S3 + CloudFront, deployed with Terraform.

## Develop

```
npm install
npm run dev
```

## Deploy

```
terraform init
terraform apply
npm run deploy
```
