# Git Flow Guide

A standard Git Flow workflow for managing features, releases, and hotfixes in this project.

## Branch Structure

```
main                 # Production-ready code (stable releases)
├── develop         # Development branch (integration branch)
├── feature/*       # Feature branches (from develop)
├── release/*       # Release branches (from develop)
└── hotfix/*        # Hotfix branches (from main)
```

## Workflow

### 1. Starting a New Feature

```bash
# Update develop branch
git checkout develop
git pull origin develop

# Create feature branch
git checkout -b feature/feature-name

# Example:
git checkout -b feature/user-authentication
git checkout -b feature/add-api-endpoint
git checkout -b feature/improve-performance
```

**Branch naming conventions:**

- Use lowercase
- Use hyphens to separate words
- Be descriptive: `feature/user-profile-page`, `feature/dark-mode`

### 2. Working on a Feature

```bash
# Make changes and commit regularly
git add .
git commit -m "feat: add user authentication component"
git commit -m "feat: implement login form validation"

# Push feature branch to GitHub
git push -u origin feature/feature-name
```

**Commit message types:**

- `feat:` - New feature
- `fix:` - Bug fix
- `docs:` - Documentation
- `style:` - Code style (formatting, missing semicolons, etc.)
- `refactor:` - Code refactoring
- `perf:` - Performance improvement
- `test:` - Tests
- `chore:` - Build, dependencies, etc.

### 3. Create Pull Request (PR)

On GitHub:

1. Go to your repository
2. Click "New Pull Request"
3. Compare: `feature/feature-name` → `develop`
4. Add title and description
5. Request reviewers
6. Create PR

**PR Description Template:**

```
## Description
Brief description of what this feature does.

## Changes
- Change 1
- Change 2
- Change 3

## Testing
How to test these changes.

## Screenshots (if UI changes)
Add screenshots here.

## Related Issues
Closes #123
```

### 4. Code Review & Merge

```bash
# After approval, merge to develop
git checkout develop
git pull origin develop
git merge --no-ff feature/feature-name
git push origin develop

# Delete feature branch
git branch -d feature/feature-name
git push origin --delete feature/feature-name
```

### 5. Release Process

When ready to release:

```bash
# Create release branch
git checkout -b release/v1.0.0 develop

# Update version number (package.json, etc.)
# Test thoroughly
# Make final fixes

# Merge to main
git checkout main
git pull origin main
git merge --no-ff release/v1.0.0
git tag -a v1.0.0 -m "Release version 1.0.0"
git push origin main
git push origin v1.0.0

# Merge back to develop
git checkout develop
git pull origin develop
git merge --no-ff release/v1.0.0
git push origin develop

# Delete release branch
git branch -d release/v1.0.0
git push origin --delete release/v1.0.0
```

### 6. Hotfix Process

For urgent fixes to production:

```bash
# Create hotfix from main
git checkout -b hotfix/fix-critical-bug main

# Make fix and commit
git commit -m "fix: critical security issue"

# Merge to main
git checkout main
git merge --no-ff hotfix/fix-critical-bug
git tag -a v1.0.1 -m "Hotfix version 1.0.1"
git push origin main
git push origin v1.0.1

# Merge back to develop
git checkout develop
git merge --no-ff hotfix/fix-critical-bug
git push origin develop

# Delete hotfix branch
git branch -d hotfix/fix-critical-bug
git push origin --delete hotfix/fix-critical-bug
```

## Quick Reference

| Task              | Command                                                               |
| ----------------- | --------------------------------------------------------------------- |
| Create feature    | `git checkout -b feature/name develop`                                |
| Push feature      | `git push -u origin feature/name`                                     |
| Update develop    | `git checkout develop && git pull origin develop`                     |
| Merge feature     | `git checkout develop && git merge --no-ff feature/name`              |
| Delete feature    | `git branch -d feature/name && git push origin --delete feature/name` |
| Create release    | `git checkout -b release/v1.0.0 develop`                              |
| Create hotfix     | `git checkout -b hotfix/name main`                                    |
| View all branches | `git branch -a`                                                       |
| View branch graph | `git log --graph --oneline --all`                                     |

## Best Practices

✅ **DO:**

- Create a new branch for each feature
- Write meaningful commit messages
- Keep commits small and focused
- Push regularly to backup
- Create PRs for code review
- Test before merging
- Delete branches after merging
- Use `--no-ff` flag to preserve branch history

❌ **DON'T:**

- Commit directly to `main` or `develop`
- Make multiple unrelated changes in one branch
- Use generic branch names like `feature/update` or `bugfix/fix`
- Force push to shared branches
- Merge without review
- Leave stale branches

## Example Workflow

```bash
# 1. Start new feature
git checkout develop
git pull origin develop
git checkout -b feature/add-dark-mode

# 2. Make changes
echo "// Dark mode styles" >> src/app/globals.css
git add .
git commit -m "feat: add dark mode toggle button"

# 3. Push to GitHub
git push -u origin feature/add-dark-mode

# 4. Create PR on GitHub, get review

# 5. Merge to develop
git checkout develop
git pull origin develop
git merge --no-ff feature/add-dark-mode
git push origin develop
git branch -d feature/add-dark-mode
git push origin --delete feature/add-dark-mode

# 6. Feature merged! ✅
```

## Tools

- **GitLens** (VS Code) - View git history and blame
- **Git Graph** (VS Code) - Visualize git flow
- **GitHub CLI** - Manage PRs from terminal

```bash
# Using GitHub CLI
gh pr create --title "Add dark mode" --body "Adds dark mode toggle"
gh pr view
gh pr merge
```

---

Happy coding! 🚀
