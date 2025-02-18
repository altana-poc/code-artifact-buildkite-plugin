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
          account_id: "AWS_ID_ACCOUNT"
          region: "us-east-1"
```

## Options

### `account-id` (required)

A string with AWS account ID that correspond to the Amazon CodeArtifact registry that you want to log in to. Make sure to quote these if they start with a 0.

### `region` (required)

Set a specific region for ECR, defaults to `AWS_DEFAULT_REGION` on the agent, or `us-east-1` if none specified.

### `domain` (required)

Which domain to use

### `repository` (required)

Which repository to use

## License

MIT (see [LICENSE](LICENSE))
