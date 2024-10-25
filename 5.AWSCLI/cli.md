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

### AWS CLI:
