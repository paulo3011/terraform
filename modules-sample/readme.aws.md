# Security best practices

- AWS recommend that you __use managed policies instead of inline policies__. Inline policies are policies that exist only on an IAM identity (user, group, or role). Managed policies are separate IAM resources that you can attach to multiple identities.
- Start with a minimum set of permissions and grant additional permissions as necessary. Doing so is more secure than starting with permissions that are too lenient and then trying to tighten them later.
- [Use Policy Conditions for Extra Security](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_condition.html)
- Use Roles for Applications That Run on Amazon EC2 Instances
- Don't share security credentials between accounts to allow users __from another AWS account__ to access resources in your AWS account. __Instead, use IAM roles__.

- Instead of defining permissions for individual IAM users, it's usually more convenient to create groups that relate to job functions (administrators, developers, accounting, etc.). Next, define the relevant permissions for each group. Finally, assign IAM users to those groups. All the users in an IAM group inherit the permissions assigned to the group. That way, you can make changes for everyone in a group in just one place. As people move around in your company, you can simply change what IAM group their IAM user belongs to.
- Don't use your AWS account root user credentials to access AWS, and don't give your credentials to anyone else. Instead, create individual users for anyone who needs access to your AWS account. Create an IAM user for yourself as well, give that user administrative permissions, and use that IAM user for all your work.


# Glossary

- [Policy](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html):
You manage access in AWS by creating policies and attaching them to IAM identities (users, groups of users, or roles) or AWS resources. **A policy is an object in AWS that, when associated with an identity or resource, defines their permissions.**

- [Policy types](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_resource-based):
    - [Identity-based policies](#) – Attach managed and inline policies to IAM identities (users, groups to which users belong, or roles). Identity-based policies grant permissions to an identity.

    - [Resource-based policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_resource-based) – Attach inline policies to resources. The most common examples of resource-based policies are Amazon S3 bucket policies and IAM role trust policies. Resource-based policies grant permissions to the principal that is specified in the policy. Principals can be in the same account as the resource or in other accounts. To see what resource support resource-baset policy [click here](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-services-that-work-with-iam.html).

- [Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_principal.html):
The Principal element in managed policies specifies the user, account, service, or other entity that is allowed or denied access to a resource. _You cannot use the Principal element in an IAM identity-based policy_. You can use it in the trust policies for IAM roles and in resource-based policies.
    - You can specify any of the following principals in a policy:

        - AWS account and root user
        - IAM users
        - Federated users (using web identity or SAML federation)
        - IAM roles
        - Assumed-role sessions
        - AWS services
        - Anonymous users (not recommended)

- [Trust policy](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_terms-and-concepts.html): A JSON policy document in which you define the principals that you trust to assume the role. A role trust policy is a required resource-based policy that is attached to a role in IAM. The principals that you can specify in the trust policy include users, roles, accounts, and services.

- [ARN](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html#identifiers-arns): Amazon Resource Name (ARN)


# References

- https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html
- https://aws.amazon.com/pt/blogs/security/writing-iam-policies-grant-access-to-user-specific-folders-in-an-amazon-s3-bucket/
- https://docs.aws.amazon.com/AmazonS3/latest/dev/walkthrough1.html#walkthrough-secure-private-folder-explicit-deny
- https://policysim.aws.amazon.com/home/index.jsp
- https://www.terraform.io/docs/providers/aws/d/iam_policy_document.html
- https://www.terraform.io/docs/providers/aws/r/iam_policy.html
- https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html
- https://aws.amazon.com/pt/premiumsupport/knowledge-center/cross-account-access-s3/