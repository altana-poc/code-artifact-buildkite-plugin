# public-buildkite-hooks

# CodeArtifact Buildkite Plugin

A [Buildkite plugin](https://buildkite.com/docs/agent/v3/plugins) to login to an CodeArtifact repository before running a build step.

This will use standard AWS credentials available [in the environment](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html), or as an [instance role](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use_switch-role-ec2.html) or task role as available. These must be granted [appropriate permissions](https://docs.aws.amazon.com/AmazonECR/latest/userguide/security_iam_id-based-policy-examples.html) for login to succeed and for push and pull to operate.

## Example

This will export the environment variables to your CodeArtifact repository prior to running your script.

```yml
steps:
  - command: ./run_build.sh
    plugins:
      - altana-poc/code-artifact#v0.0.1:
          account_ids: "AWS_ID_ACCOUNT"
          region: "us-east-1"
```

If you need to assume a role to perform that login:

```yml
steps:
  - command: ./run_build.sh
    plugins:
      - altana-poc/code-artifact#v0.0.1:
          account-ids: "AWS_ID_ACCOUNT"
          region: "us-east-1"
          assume_role:
            role_arn: "arn:aws:iam::AWS_ID_ACCOUNT:role/demo"
```

## Options

### `login`

Whether to login to your account's ECR.

### `account-ids` (optional)

Either a string, or a list of strings with AWS account IDs that correspond to the Amazon CodeArtifact registries that you want to log in to. Make sure to quote these if they start with a 0.

### `region` (optional)

Set a specific region for ECR, defaults to `AWS_DEFAULT_REGION` on the agent, or `us-east-1` if none specified.


### `assume-role` (optional)

> Updates AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY and AWS_SESSION_TOKEN environment variables.

Assume an AWS IAM role before ECR login. Supports `role-arn` and `duration-seconds` (optional) per the [associated AWS CLI command.](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/sts/assume-role.html)

### `profile` (optional)

> Requires AWS CLI version 1.17.10 or greater.

Use a different AWS profile from the default during ECR login.

## License

MIT (see [LICENSE](LICENSE))
