# Fix GitHub CI

Fix failing CI checks, address PR comments, and push fixes.

## Usage

```
/fix-ci [PR number]
```

If no PR number provided, uses the current branch's PR.

## Instructions

You are a CI fixing agent. Your job is to get a PR passing and address reviewer feedback.

### Step 1: Gather PR Context

First, get all relevant information about the PR:

```bash
# Get PR number from current branch if not provided
gh pr view --json number,headRefName,baseRefName,title,body

# Get all checks and their status
gh pr checks

# Get all reviews
gh pr view --json reviews

# Get all comments (review comments on code)
gh api repos/{owner}/{repo}/pulls/{pr_number}/comments

# Get conversation comments
gh pr view --json comments
```

### Step 2: Analyze Failures

For each failing check:
1. Get the detailed logs: `gh run view {run_id} --log-failed`
2. Identify the root cause (test failure, lint error, type error, build failure)
3. Locate the relevant files and code

For each unresolved review comment:
1. Read the comment and understand the feedback
2. Locate the code being discussed
3. Determine if a code change is needed or just a response

### Step 3: Fix Issues

**For CI failures:**
- Read the failing test/lint/type error output carefully
- Open the relevant files and understand the code
- Make the minimal fix needed to resolve the issue
- If a test is legitimately wrong, fix the test
- If the code has a bug, fix the bug

**For review comments:**
- If it's a question: respond with a clear answer
- If it's a suggestion you agree with: implement it and reply acknowledging
- If it's a suggestion you disagree with: reply explaining why (don't just ignore)
- If it requires discussion: reply asking for clarification

### Step 4: Commit and Push

After making fixes:

```bash
# Stage changes
git add -A

# Create a focused commit message
git commit -m "fix: [description of what was fixed]

- Fixed [specific issue 1]
- Fixed [specific issue 2]
- Addressed review comment from @reviewer about [topic]"

# Push to the branch
git push
```

### Step 5: Respond to Comments

For each review comment you addressed:

```bash
# Reply to a review comment
gh api repos/{owner}/{repo}/pulls/{pr_number}/comments/{comment_id}/replies \
  -f body="Fixed in [commit SHA]. [Brief explanation of the fix]"
```

If a comment thread is fully resolved:
```bash
# Resolve the thread (if you have permission and it's appropriate)
gh api graphql -f query='mutation { resolveReviewThread(input: {threadId: "THREAD_ID"}) { thread { isResolved } } }'
```

### Step 6: Verify

After pushing:
```bash
# Wait a moment for CI to start
sleep 5

# Check if new checks are running
gh pr checks
```

Report back what was fixed and what's still pending.

## Important Guidelines

1. **Don't blindly fix** - Understand the issue before changing code
2. **Minimal changes** - Only change what's necessary to fix the issue
3. **Respect reviewers** - Always respond to comments, even if just to acknowledge
4. **Don't force push** - Use regular commits so history is preserved
5. **Ask if unclear** - If you can't determine the right fix, ask the user
6. **One logical commit** - Group related fixes, but separate unrelated ones
