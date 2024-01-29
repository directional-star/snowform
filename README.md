# Snowform Asset

This Snowflake-Terraform based asset sets up Snowflake resources using infrastructure as code. Follow these steps to get started:

## Prerequisites

Before you begin, ensure you have the following prerequisites:

1. [Terraform](https://www.terraform.io/) installed on your local machine.
2. Access to a Snowflake account with necessary permissions to spin up resources within Snowflake.

## Setup `snowform_user`

1. Log in to your Snowflake console.
2. Create an RSA key pair for authentication following the provided instructions.
```bash
cd ~/.ssh
openssl genrsa -out snowform_rsa_private.pem 2048
openssl rsa -pubout -in snowform_rsa_private.pem -out snowform_rsa_public.pem
```

3. Copy the contents of the `~/.ssh/snowflake_tf_snow_key.pub` file.
4. In Snowflake, execute the following SQL commands, replacing `RSA_PUBLIC_KEY_HERE` with the copied key:

   ```sql
   CREATE USER "snowform_user" RSA_PUBLIC_KEY='RSA_PUBLIC_KEY_HERE' DEFAULT_ROLE=PUBLIC MUST_CHANGE_PASSWORD=FALSE;
   GRANT ROLE SYSADMIN TO USER "snowform_user";
   GRANT ROLE SECURITYADMIN TO USER "snowform_user";

5. Update snow.env File
Create a file named snow.env in your project directory.

Add the following environment variables to snow.env:

```bash
export SNOWFLAKE_USER="snowform_user"
export SNOWFLAKE_AUTHENTICATOR=JWT
export SNOWFLAKE_PRIVATE_KEY=`cat ~/.ssh/snowflake_tf_snow_key.p8`
export SNOWFLAKE_ACCOUNT="YOUR_ACCOUNT_LOCATOR"
```
Replace "YOUR_ACCOUNT_LOCATOR" with your Snowflake account locator.

## Important Terraform Commands
Use the following Terraform commands to manage your infrastructure:

### Initialize the project:

```bash
terraform init
```

### Plan and preview changes:

```bash
terraform plan
```

### Apply changes:

```bash
terraform apply
```

### Destroy resources:

```bash
terraform destroy
```

## About main.tf
The main.tf file defines the Terraform configuration for creating Snowflake resources. In the sample code provide, the main.tf creates

A database named "SNOWFORM_DEMO."
A warehouse named "SNOWFORM_DEMO" with small size and auto-suspend of 60 minutes.
A security role, schema, and user with necessary privileges for managing the database.
An RSA key pair for user authentication.
Feel free to customise the configuration as needed for your project.

For any issues or questions, refer to the official Terraform and Snowflake documentation. 