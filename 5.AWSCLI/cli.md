# AWS CLI Guide: Connect to EC2 via UI & Terminal | CloudFormation Walkthrough

### Making a VM using AWS Console :

1. Go to AWS EC2 Dashboard >> Click on the instance that is running.

2. Click on the Instance ID >> Click Connect >> Connect.

   > _This will open a EC2 cli or basically a VM._

**The above things is done using AWS Console but it's not convenient because as a Engineer you have to login to 100s of VM in a day so it will take a lot of time**.

## Efficient way of doing it :

Use some terminals for this purpose such as:

- `iTerm` : for Mac
- `MobaXterm`, `PuTTY`, `NoMachine` : for Windows

Now open the terminal and type:

```shell
ssh ubuntu@<public-ip-address>
```

> It will as you do you want to remember fingerprint type yes.

But here the connection will be denied bcz you have not provided the key-pair. So for that :

```shell
ssh -i /path-of-key-pair/<file_name>.pem ubuntu@<public-ip-address>
```

This things will fail again saying the permission you have provided `are too open`, bcz `.pem` file don't allow you to keep the permission open bcz it holds a secret. So you have to keep the permissions closed :

```shell
chmod 600 /path-of-key-pair/<file_name>.pem

ssh -i /path-of-key-pair/<file_name>.pem ubuntu@<public-ip-address>
```

Now you are successfully logged in to the aws instance.

## Practical ways of doing all these

### 1. AWS CLI :

1. Download AWS CLI binary. [AWS CLI](https://aws.amazon.com/cli/)

2. Check if your aws cli is installed or not by running 

```shell
    aws version
```
3. Now you have to authenticate this aws cli with your aws account. So for that :
    - Go to your aws console >> User option drop-down.
    - Click on Security credentials.
    - Go to Access Keys >> Create Access Keys
    > Don't share this info to anyone.

4. Now after you made you Access Key go back to console and type 

```shell
    aws configure
```
> *It will ask you to enter to enter the AWS Access Key ID and AWS Secret Access Key. Enter that, Then it will ask you the default region keep it as it is, default output format let it be json.* ***Now you are authenticated with aws.***

5. You can check if you are authenticated or not by , let's suppose you have some S3 buckets created in you aws, by running 

```shell
    aws s3 ls
```

you can check for it. You can also create a S3 bucket from the terminal now by :

```shell
    aws s3 mb <name>
```

> **Go to [AWS DOCS](https://docs.aws.amazon.com/cli/latest/userguide/cli-services-ec2-instances.html) to know more about the commands in AWS CLI.**

---
### 2. AWS CFT(AWS Cloud Formation Templates) :

1. For Reference go [here](https://github.com/aws-cloudformation/aws-cloudformation-templates) if you want to make a CFT.

2. Go to aws console and search for CFT >> Stacks.

3. Click on create Stack.

> If you already have the template ready form github repo select `template is ready`, and if not you can also `use a sample template`, or `create a template for designer`. You can upload either from a `Amazon S3 URL` or `Upload a template file`.

**NOTE:** ***The above things are not covered in detail here because it falls under different topic called IAC. So we will study these in future.***


---

### 3. AWS API :

