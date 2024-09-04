# snatch.sh

Snatch.sh is a set of shell scripts designed to easily clone all repositories from a GitHub organization or a Gitea instance. It provides a simple way to backup or mirror entire organizations with a single command.

## Scripts

- `snatch-gh.sh`: For cloning repositories from a GitHub organization
- `snatch-gt.sh`: For cloning repositories from a Gitea instance

## Prerequisites

- `bash` (version 4.0 or later recommended)
- `curl`
- `jq`
- `git`

To install the prerequisites on Ubuntu/Debian:

```
sudo apt-get update
sudo apt-get install curl jq git
```

On macOS with Homebrew:

```
brew install curl jq git
```

## Usage

### GitHub (snatch-gh.sh)

1. Open `snatch-gh.sh` in a text editor.
2. Set the `ORG_NAME` variable to your GitHub organization name.
3. (Optional) Set up a GitHub Personal Access Token for authentication:
   - Create a token at https://github.com/settings/tokens
   - Uncomment the `GITHUB_TOKEN` line in the script and replace `your_personal_access_token_here` with your actual token.
4. Run the script:

```
bash snatch-gh.sh
```

### Gitea (snatch-gt.sh)

1. Open `snatch-gt.sh` in a text editor.
2. Set the `API_URL` variable to your Gitea instance's API endpoint.
3. Run the script:

```
bash snatch-gt.sh
```

## Notes

- **Rate Limiting**: Both GitHub and Gitea implement rate limiting on their APIs. If you're cloning a large number of repositories or making frequent requests, you may encounter rate limits.
  - For GitHub, authenticated requests have a higher rate limit than unauthenticated ones. Using a Personal Access Token is recommended.
  - For Gitea, rate limits can vary depending on the instance configuration. If you encounter issues, try spacing out your requests or contact your Gitea administrator.

- The scripts will create a new directory named after the organization (for GitHub) or `sandw_repos` (for Gitea) in the current working directory and clone all repositories into it.

- For large organizations or instances with many repositories, the cloning process may take a significant amount of time and consume substantial bandwidth and storage.

## Troubleshooting

If you encounter any issues:

1. Ensure all prerequisites are correctly installed.
2. Check that you have the necessary permissions to access the repositories.
3. Verify your internet connection.
4. For authentication issues, double-check your Personal Access Token (for GitHub).

If problems persist, please open an issue in the project repository.

## Contributing

Contributions to improve snatch.sh are welcome! Please feel free to submit pull requests or open issues to suggest improvements or report bugs.

## License

This project is open source and available under the [MIT License](https://opensource.org/licenses/MIT).
