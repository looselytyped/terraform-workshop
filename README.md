# Terraform Workshop

This is the code for my Terraform Workshop.

**Please note** that I routinely make destructive changes (a.k.a `git push -f`) to this repository.
If you wish to keep a copy around, I highly recommend you fork this, and `git pull upstream` judiciously.

## Agenda

- The place for, and benefits of "Everything as Code" alongside GitOps
- Terraform's architecture
- Terraform 101
  - Introduction to HCL
  - What are providers?
  - Initializing terraform and providers
- Dive right in! Creating your first resource in AWS using Terraform
- Understanding references, dependencies
- `apply`-ing terraform
- Using `output` and `data` in your terraform scripts
- Variables and the HCL type-system
- DRY with Terraform modules
- Understanding how Terraform manages state
- Using S3 as a backend
- Collaboration using Terraform
- Terraform ecosystem, testing, and GitOps
- Closing arguments, final Q/A, discussion

## Setup

### AWS Account Setup

- If you **don't** already have an AWS account, head over to https://aws.amazon.com/ and create an account
  - **NOTE** — This account will have `admin` privileges, and you **do not want** to use this on a day-to-day basis! Store these credentials securely.
  - Please look over [Security Best Practices in IAM](https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html) and make sure you are following best practices here (Be sure to set up MFA as well)
- Once you have done that (or if you already have an `admin` account), then you will need to create a special user that you will use for this workshop.
- Log into the AWS Console using your `admin` credentials and follow the steps [here](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_users_create.html#id_users_create_console)
  - **Be sure** to check the `Programmatic access` and `AWS Management Console access` boxes on the first screen
  - *For Step No.6* — Use the `Attach existing policies directly` tab and search for `AdministratorAccess` — Use that
  - (Optional) I generally `Tag` this user with something like Key = `bot-user`,  Value = `true`
- On the `Success` page *capture*
  - `User`
  - `Access key ID`
  - `Secret access key`
  - `Password`
  - AWS Management Console access URL (Looks something like https://641995674308.signin.aws.amazon.com/console)
  - Follow the AWS Management Console access URL and login — It will ask you to change your password. Do that.
  - Use your password manager, or wherever you store credentials, and tuck the `User`, `Access key ID`, `Secret access key` and `Password` away

<span style="color: #ec7211">**Once again, save ALL credentials SAFELY!**</span>

I **cannot** _emphasize_ this enough! Both the `admin` and the newly created user have the ability to create infrastructure on your behalf.
Treat these *with care*!

### Install Terraform

- Follow the steps [here](https://learn.hashicorp.com/terraform/getting-started/install.html)

### Clone this repository

- Go to the location where you cloned this repository
- Modify `0000-setup/main.tf` and modify the `provider` block with your `Access key ID` and `Secret access key` like so

```
# Be sure to use "double-quotes" around your keys
provider "aws" {
  access_key = "YOUR_AWS_KEY_ID_HERE"
  secret_key = "YOUR_SECRET_ACCESS_KEY_HERE"
  region     = "us-east-1"
}
```

- Go to the console, `cd` to `/path/where/you/cloned/this/repo/0000-setup`
- Run `terraform init`
- Run `terraform apply`
- Terraform will ask if you are sure. Type `yes`
- Go to https://console.aws.amazon.com/ec2/v2/home and you should see `Running Instances` `1`
- Go back to your console, and run `terraform destroy` — Again, at the prompt, type `yes`
- Go back to https://console.aws.amazon.com/ec2/v2/home and you should see `Running Instances` `0`
