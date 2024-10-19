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

While this repository is a tutorial aimed at teaching Terraform, AWS setup can be arduous, and non-deterministic across audiences, especially if anyone chooses to use their _organizational_ credentials (Hello IAM!) and setup.

To avoid this, this tutorial uses the absolutely fantastic [LocalStack](https://www.localstack.cloud/) project to emulate the AWS API locally.
Not only does this make it easier to set up for the workshop, it a zero-cost solution for attendees, and eliminates the risk that they accidentally leave resources running in the cloud.

It also makes the setup trivial.
Please see the following sections:

## Installation

You will need the following installed

- [Terraform](https://learn.hashicorp.com/terraform/getting-started/install.html)
- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
- [Docker](https://www.docker.com/get-started/)
- A good text editor.
  I highly recommend [VS Code](https://code.visualstudio.com/).
- Clone this repository

## Set up

### Create a specific profile for LocalStack

1. Open a terminal window
2. Run the following command:
    ```bash
    aws configure --profile localstack
    ```
3. Enter the following details for the `localstack` profile:
   - AWS Access Key ID: Enter `test`
   - AWS Secret Access Key: Enter `test`
   - Default region name: Enter `us-east-1`
   - Default output format: Enter `json`

4. The AWS CLI will create a new profile named `localstack` in the AWS credentials file (located at `~/.aws/credentials` on Linux/Mac or `%USERPROFILE%\.aws\credentials` on Windows) as well as storing your profile preferences in `~/.aws/config`.

    **This is VERY IMPORTANT**.
    Edit the `localstack` profile in `~/.aws/config`, and the add the following line at the bottom of the `localstack` profile:

    ```ini
    [profile localstack]
    region=us-east-1
    output=json
    endpoint_url = http://localhost:4566 # <- ADD THIS LINE
    ```
5. Run the following:

    ```bash
    docker pull ubuntu:24.04
    docker pull ubuntu:23.10
    docker tag ubuntu:24.04 localstack-ec2/ubuntu-24-04-ami:ami-edbfe74c41f8
    docker tag ubuntu:23.10 localstack-ec2/ubuntu-23-10-ami:ami-77081d4f1e72
    ```


## Testing your setup

In the directory where you cloned this repository:

```bash
# cd /path/to/terraform-workshop
❯ docker compose up --build
# You should see ...
[+] Running 1/0
 ✔ Container localstack-main  Created 0.0s
Attaching to localstack-main
localstack-main  |
localstack-main  | LocalStack version: 3.7.1
localstack-main  | LocalStack build git hash: d4f2409a7
localstack-main  |
localstack-main  | Ready.
```

**In another terminal**, navigate, again, to the location where you cloned this repository:

```bash
# initialize terraform
terraform init
# see if terraform can perform it's duties
terraform apply -auto-approve

# if all goes well, you should something like
Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
```

If all that works, you are golden.
Go back to the first terminal

```bash
# Use `Ctrl-c` to stop compose
# Clean up afterwards
docker compose down -v
```

Woot!
You are all set.
See you soon.
