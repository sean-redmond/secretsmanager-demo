**A Demo project to illustrate how secrets manager can populate Docker Environment variables.**

*Getting started*
Download the demo.yml file from the CFN folder, head over to the CloudFormation console and create a new stack using this file, you can name the stack anything you like e.g 'demo-stack'.
You don't need to change any of the parameters to get started, so just leave them as the defaults as long as the names don't clash with anything existing in your AWS account.

once created you should be able to browse to the public IP of the ECS Service Task, this will present a php info page, the section to check is called 'Environment' - in here you should see an environment viable called 'examplevar' that has been set from the KV's within your secrets manager secret.

*Test adding new parameters:*
- Browse to secrets managers in the AWS console
- Locate your secret (default name '[Demo-App-test](https://eu-west-1.console.aws.amazon.com/secretsmanager/home?region=eu-west-1#/secret?name=Demo-App-test)')
- Click Retrieve secret value
- Click Edit
- Click add Row, populate the KV with your variable and value
- Click Save
- Head to your ECS Tasks, and stop the task to trigger the container to be replaced
- Browser the public IP of the new ECS Task and check for your newly added environment variable
